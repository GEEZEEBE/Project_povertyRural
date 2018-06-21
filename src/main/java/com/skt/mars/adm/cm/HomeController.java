package com.skt.mars.adm.cm;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.bm.PaymentService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private PaymentService defualtService;	// modify here
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/adm", method = RequestMethod.GET)
//	public String index_admin() {
//		
//		return "main.home";
//	}

	//list
	@RequestMapping(value="/adm", method = RequestMethod.GET)
	public ModelAndView adm(ModelAndView modelAndView) {
		
		Map<String, String> requestMap = null;

		List notice =  defualtService.selectListForNoPage("notice.select.limit", requestMap);

		List members =  defualtService.selectListForNoPage("user.select.limit", requestMap);

		List use =  defualtService.selectListForNoPage("states.sumComul", requestMap);

		List company =  defualtService.selectListForNoPage("assetUtil.returnRemainList", requestMap);
		
		List upDown =  defualtService.selectListForNoPage("traffic.today.load", requestMap);
		List vistor =  defualtService.selectListForNoPage("using.today.visitor", requestMap);
		
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("members", members);
		modelAndView.addObject("use", use);
		modelAndView.addObject("company", company);
		modelAndView.addObject("upDown", upDown);
		modelAndView.addObject("vistor", vistor);
		modelAndView.setViewName("main.home");		
		return modelAndView;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index_userportal(HttpServletRequest request,
			Map<String, String> requestMap, ModelAndView modelAndView) {
		
		return "usr.home";
	}

	@RequestMapping(value = "/usr", method = RequestMethod.GET)
	public String index_portal() {
		
		return "usr.home";
	}

	@RequestMapping(value = "/smart", method = RequestMethod.GET)
	public String index_smartclass() {
		
		return "smartClass.list";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) {
		logger.info("Welcome home! the client locale is "+ request.getRequestURI());
		
		String aa = request.getRequestURI();
		String bb = request.getParameter("homeid");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public String ajax() {
		
		List mycars = new ArrayList();
		
		mycars.add("Saab");
		mycars.add("Volvo");
		mycars.add("BMW");

/*		WebClient client = WebClient.create("http://localhost:18080/app_admin/ws/common/commerce/InPrmtList"); 
	    client.type("multipart/mixed").accept("application/json"); 
	    List<Attachment> atts = new LinkedList<Attachment>(); 
	    String t1 = "aaa";
	    atts.add(new Attachment("testItem1", "application/json", t1)); 
//	    atts.add(new Attachment("testItem2", "application/json", t2)); 
	    javax.ws.rs.core.Response s = client.postCollection(atts, Attachment.class); 
*/	    
		return "ajax";
	}

}
