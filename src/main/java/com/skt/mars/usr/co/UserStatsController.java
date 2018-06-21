package com.skt.mars.usr.co;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.co.Commerce;
import com.skt.mars.adm.co.CommerceService;

@Controller
@RequestMapping("/commStats")	// modify here
public class UserStatsController extends DefaultController  {
	// command words
	private static String TARGET = "commStats.";	// modify here
	private static String LIST = "list";
	
	CommerceService commerceService;
	
	public UserStatsController(){
		//default constructor
	}
	
	//가이드 관리 리스트 검색
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
		//List<Commerce> list = commerceService.selectList("PGADM0E05_L_01", requestMap);	// modify here

		/*if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("param", requestMap);*/
		modelAndView.setViewName(TARGET+LIST);
		
		return modelAndView;
	}
	
}
