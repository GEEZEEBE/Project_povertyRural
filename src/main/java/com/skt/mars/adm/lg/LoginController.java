package com.skt.mars.adm.lg;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.bm.PaymentService;
import com.skt.mars.adm.cm.MailMail;

/*
 * 
 * error code 
 * 100 :  Success
 * 102 : error send mail
 * 202 : Not exist email
 * 301 : loginfailed
 * 302 : accessDenied
 * 
 */

@Controller
public class LoginController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private MailMail mailMail;	// modify here

    @Autowired
    private PaymentService defualtService; // modify here

	@Value("#{commonProperty['mail.sender.username']}")
	private String senderUsername;

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView printWelcome(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView,
			Principal principal) {
		logger.info("welcome method " + principal);

		String name = principal.getName();
		modelAndView.addObject("username", name);
		modelAndView.addObject("message", "Spring Security Custom Form example");

		modelAndView.setViewName("loginSuccess");
		
		return modelAndView;
	}

	 @RequestMapping(value = "/adm/accessDenied")
     public ModelAndView accessDenied(HttpServletRequest request,
 			Map<String, String> requestMap, ModelAndView modelAndView, Locale locale) {

		 // accessDenied
			modelAndView.addObject("error", "302");
/*
		 request.getSession().setAttribute("error",
					"You do not have permission to access this page!");
*/		 
		 modelAndView.setViewName("loginForm");
			
		return modelAndView;
      }
	 
	 @RequestMapping(value = "/adm/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView, Locale locale) {
		
/*	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      String name = auth.getName(); //get logged in username
	      
	      String uri = request.getRequestURI();

		int compareString = uri.compareTo(COMPARE_URI) ;
//		if(compareString)
*/		modelAndView.setViewName("loginForm");
		
		return modelAndView;
	}

	@RequestMapping(value = "/adm/loginfailed", method = RequestMethod.GET)
	public ModelAndView loginerror(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {

		modelAndView.addObject("error", "301");

		modelAndView.setViewName("loginForm");
		
		return modelAndView;

	}

	@RequestMapping(value = "/adm/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {

		String uri = request.getRequestURI();

		
		modelAndView.setViewName("main.home");
		
		return modelAndView;
	}

	@RequestMapping(value = "/usr/loginUser", method = RequestMethod.GET)
	public ModelAndView loginUser(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView, Locale locale) {
		
/*	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      String name = auth.getName(); //get logged in username
	      
	      String uri = request.getRequestURI();

		int compareString = uri.compareTo(COMPARE_URI) ;
//		if(compareString)
*/
		modelAndView.setViewName("loginUserForm");
		
		return modelAndView;
	}

	@RequestMapping(value = "/usr/loginUserFailed", method = RequestMethod.GET)
	public ModelAndView loginUserError(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {

		modelAndView.addObject("error", "301");

		modelAndView.setViewName("loginUserForm");
		
		return modelAndView;

	}

	@RequestMapping(value = "/usr/logoutUser", method = RequestMethod.GET)
	public ModelAndView logoutUser(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {

		String uri = request.getRequestURI();

		
		modelAndView.setViewName("usr.home");
		
		return modelAndView;
	}

	@RequestMapping(value = "/admForgatIdPw", method = RequestMethod.GET)
	public ModelAndView admForgatIdPw(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {

		requestMap.put("successYN", "N");

		// check to send email or not
		if (requestMap.get("emailAddress") != null) { // try to send

			List list = defualtService.selectListForNoPage("user.select.email",
					requestMap);

			String errorCode = null;
			// check to exist email
			if (list != null && list.size() > 0) {

				Iterator itr = list.iterator();

				Map dataMap = new HashMap();

				String nameUser = null;
				String userID = null;
				String eMail = null;
				String NewPassword = null;

				// as if up to two email
				while (itr.hasNext()) {
					dataMap = (Map) itr.next();

					nameUser = (String) dataMap.get("NAME");
					userID = (String) dataMap.get("USER_ID");
					eMail = (String) dataMap.get("EMAL");
					NewPassword = (String) dataMap.get("PW");
					// NewPassword = getRandomGenerat();

					errorCode = mailMail.sendMail("sktcbc@gmail.com", eMail,
							nameUser, NewPassword, userID);

					if ("100".equals(errorCode)) {
						dataMap.put("latCrctUserID",
								requestMap.get("latCrctUserID"));
						dataMap.put("pw", NewPassword);
						defualtService.update("user.update.NewPasswordByEmail",
								dataMap);
					}
				}

				requestMap.put("nameUser", nameUser);
				requestMap.put("userID", userID);
				requestMap.put("eMail", eMail);
				requestMap.put("error", errorCode); // not exist

				requestMap.put("successYN", "Y");
			} else {
				errorCode = "202"; // Not exist email
			}

			if (errorCode != null && !"100".equals(errorCode)) { // success Yor
																	// N by
																	// dependency
																	// errorCode
				requestMap.put("successYN", "N");
				requestMap.put("error", errorCode); // not exist
			}
		}

		// if(requestMap.get("resendYN") != null
		// &&requestMap.get("resendYN").equals("Y")){
		//
		// }

		modelAndView.addObject("requestMap", requestMap);

		modelAndView.setViewName("adm.forgatIdPw");

		return modelAndView;
	}
	@RequestMapping(value = "/usrForgatIdPw", method = RequestMethod.GET)
	public ModelAndView usrForgatIdPw(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {

		modelAndView.setViewName("usr.forgatIdPw");
		
		return modelAndView;
	}

	/*
	 * create Sequence ID
	 *  
	 */
	public String getRandomGenerat() {
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(999999);

		DecimalFormat df = new DecimalFormat("000000");
		return df.format(randomInt);
	}


}