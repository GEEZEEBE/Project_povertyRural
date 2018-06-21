package com.skt.mars.adm.ui;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.CommonCodeService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Controller
@RequestMapping("/adm/user")	// modify here
public class UserController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "user.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	private static String DELETE = "delete";
	private static String SELECT_ID = "select.ID";
	
	@Autowired
	private UserService userService;	// modify here

	@Autowired
	private CommonCodeService commonCodeService;	// modify here

    /**
     * 
     */

    @RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return TARGET+INSERT;
	}

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new User();	// modify here
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/", method = RequestMethod.POST)
	public String submit(HttpServletRequest request, Map<String, Object> requestMap,@ModelAttribute("command") @Valid User user,
			BindingResult result, Model model) {	// modify here
//		requestMap = getParameterMap(request);
		user.setFrstRgstUserID((String) requestMap.get("frstRgstUserID"));
		user.setLatCrctUserID((String) requestMap.get("latCrctUserID"));
		
		// Check Validation
		/*
		if (result.hasErrors()) {
			//result.getAllErrors().get(0).getDefaultMessage();
			//String dd = result.getFieldError("pw").getDefaultMessage();
			//System.out.println(dd);
			//result.getAllErrors().
			model.addAttribute("errorMap", result.getAllErrors());
			model.addAttribute("requestMap", requestMap);
			return TARGET+INSERT;
		}
		*/
		String id=null;
		
		String birth = (String)requestMap.get("birthYear")+requestMap.get("birthMonth")+requestMap.get("birthDay");
		user.setBirthDay(birth);
		String email = (requestMap.get("emailFirst") != null ? requestMap.get("emailFirst"):"")+
				"@"+(requestMap.get("emailLast") != null ? requestMap.get("emailLast"):"");
		user.seteMail(email);
		
		if(requestMap.get("flag").equals("w")){
			id = (String)userService.insert(TARGET+INSERT, user);
			
			// count visiting
            String randomCategory = DateFormatUtil.getRandomID();
            requestMap.put("srvcID", 28); // category Using Interactive
            requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
            requestMap.put("userid", (String) requestMap.get("frstRgstUserID")); // use__id
            requestMap.put("endYN", "E"); // end Y or N
            requestMap.put("END_TM", randomCategory.substring(0, 17)); // end Y or N

            String sqlMapId = "using.insertBySrvID";

            commonCodeService.insert(sqlMapId, requestMap);
		}
		else if(requestMap.get("flag").equals("e")){
			int checkEdit = userService.update(TARGET+EDIT, user);
			id = user.getUserID();
		}

        Map pMap = new HashMap();
        pMap.put("userID", id);
        user = userService.select(TARGET+READ, pMap);
        
        
        String birthYear="";
		String birthMonth="";
		String birthDay="";
		String emailFirst="";
		String emailLast="";
		
		if(user.getBirthDay()!=null){
			birthYear = user.getBirthDay().substring(0, 4);
			birthMonth = user.getBirthDay().substring(4, 6);
			birthDay = user.getBirthDay().substring(6, 8);
		}
		if(user.geteMail()!=null){
			String[] arEmail = user.geteMail().split("@");
			if(arEmail.length!=0){
				emailFirst=arEmail[0];
				emailLast=arEmail[1];	
			}
		}
		
		model.addAttribute("birthYear",birthYear);
		model.addAttribute("birthMonth",birthMonth);
		model.addAttribute("birthDay",birthDay);
		model.addAttribute("emailFirst",emailFirst);
		model.addAttribute("emailLast",emailLast);
        logger.info("submit user : "+user);
		model.addAttribute("param", requestMap);
		model.addAttribute("command", user);
		model.addAttribute("method", INSERT);

		return TARGET+READ;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
//		requestMap = getParameterMap(request);

		// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//			requestMap.clear();	
		}
		
		/*
		if("0".equals(requestMap.get("checkSearch"))){
			requestMap.put("serTxt", "");
		}
		*/
		
		List list = userService.selectList(TARGET+LIST, requestMap);	// modify here
		//String dd = list.get(0).getAuthority();
		//System.out.println(dd);

//		requestMap = getParameterMap(request);
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
//		requestMap = getParameterMap(request);

		int deleteCount = userService.delete(TARGET+DELETE, requestMap);
		
		List<User> list = userService.selectList(TARGET+LIST, requestMap);	// modify here
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("currentPage", 1);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/read")
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);

		User command = userService.select(TARGET+READ, requestMap);	// modify here
		
		String birthYear="";
		String birthMonth="";
		String birthDay="";
		String emailFirst="";
		String emailLast="";
		
		if(command.getBirthDay()!=null){
			birthYear = command.getBirthDay().substring(0, 4);
			birthMonth = command.getBirthDay().substring(4, 6);
			birthDay = command.getBirthDay().substring(6, 8);
		}
		if(command.geteMail()!=null){
			String[] email = command.geteMail().split("@");
			if(email.length!=0){
				emailFirst=email[0];
				emailLast=email[1];	
			}
		}
		
		modelAndView.addObject("birthYear",birthYear);
		modelAndView.addObject("birthMonth",birthMonth);
		modelAndView.addObject("birthDay",birthDay);
		modelAndView.addObject("emailFirst",emailFirst);
		modelAndView.addObject("emailLast",emailLast);
		
		
		modelAndView.addObject("command", command);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);		
		
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/edit")
	public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
        User user = userService.select(TARGET+READ, requestMap);
        logger.info("submit user : "+user);
        
        String birthYear="";
		String birthMonth="";
		String birthDay="";
		String emailFirst="";
		String emailLast="";
		
		if(user.getBirthDay()!=null){
			birthYear = user.getBirthDay().substring(0, 4);
			birthMonth = user.getBirthDay().substring(4, 6);
			birthDay = user.getBirthDay().substring(6, 8);
		}
		if(user.geteMail()!=null){
			String[] email = user.geteMail().split("@");
			if(email.length!=0){
				emailFirst=email[0];
				emailLast=email[1];	
			}
		}
		
		modelAndView.addObject("birthYear",birthYear);
		modelAndView.addObject("birthMonth",birthMonth);
		modelAndView.addObject("birthDay",birthDay);
		modelAndView.addObject("emailFirst",emailFirst);
		modelAndView.addObject("emailLast",emailLast);
        
        modelAndView.addObject("command", user);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+INSERT);		
		return modelAndView;
	}


	
}
