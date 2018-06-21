package com.skt.mars.usr.ci;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;

@Controller
//@RequestMapping("/usr")	// modify here
public class UserCBSIntroController extends DefaultController {
//	protected final Log logger = LogFactory.getLog(getClass());

	//CBS Information
	@RequestMapping(value="/cbcintro", method = RequestMethod.GET)
	public ModelAndView view0(ModelAndView modelAndView) {
		modelAndView.setViewName("cbcintro");		
		return modelAndView;
	}
}
