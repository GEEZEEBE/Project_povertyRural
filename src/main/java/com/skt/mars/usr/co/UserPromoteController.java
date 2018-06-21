package com.skt.mars.usr.co;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.co.Promote;
import com.skt.mars.adm.co.PromoteService;

/**
 * CommerceController - 커머스 홍보 관리
 * 
 * @author Kim Do Youn
 * @version
 * @since
 * @created 2012. 02. 08.
 */

@Controller
@RequestMapping("/usr/Promote")	// modify here
public class UserPromoteController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "usrPromote.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	
	@Autowired
	private PromoteService promoteService;	// modify here
	
	public UserPromoteController(){
		//default constructor
	}
	
	
	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Promote();
	}
	
	//User 홍보글 리스트 검색
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		requestMap = getParameterMap(request);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = null;		 
		userId = auth.getName();
		
		requestMap.put("userId", userId);
		
		List<Promote> list = promoteService.selectList("PGADM0E10_L_01", requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);
		
		return modelAndView;
	}

	 //user 홍보글 상세페이지
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = null;		 
		userId = auth.getName();
		
		requestMap.put("userId", userId);

		Promote promote  = promoteService.select("PGADM0E12_V_01", requestMap);	// modify here
		
		List<Promote> snsList  = promoteService.selectList("PGADM0E12_V_02", requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("command2", snsList);
		modelAndView.addObject("command", promote);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);	
		
		return modelAndView;
	}
	
}
