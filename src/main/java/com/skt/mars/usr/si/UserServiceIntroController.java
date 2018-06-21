package com.skt.mars.usr.si;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.usr.ev.EnglishVillageService;

@Controller
//@RequestMapping("/usr")	// modify here
public class UserServiceIntroController extends DefaultController {
//	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private EnglishVillageService englishvillService;	// modify here
	
	//learning service infor
	@RequestMapping(value="/learningsi", method = RequestMethod.GET)
	public ModelAndView learningsi(ModelAndView modelAndView) {
		modelAndView.setViewName("learningsi");		
		return modelAndView;
	}
	//detail
	@RequestMapping(value="/commercesi", method = RequestMethod.GET)
	public ModelAndView si1(ModelAndView modelAndView) {
		modelAndView.setViewName("commercesi");		
		return modelAndView;
	}
	//list
	@RequestMapping(value="/healthsi", method = RequestMethod.GET)
	public ModelAndView healthsi(ModelAndView modelAndView) {
		modelAndView.setViewName("healthsi");		
		return modelAndView;
	}
	
	//list
	@RequestMapping(value="/healthse", method = RequestMethod.GET)
	public ModelAndView healthservice(ModelAndView modelAndView) {
		modelAndView.setViewName("healthse");		
		return modelAndView;
	}

}
