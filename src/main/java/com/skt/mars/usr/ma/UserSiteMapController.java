package com.skt.mars.usr.ma;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;

@Controller
//@RequestMapping("/usr")	// modify here
public class UserSiteMapController extends DefaultController {
//	protected final Log logger = LogFactory.getLog(getClass());

	//메인화면
	@RequestMapping(value="/sitemap", method = RequestMethod.GET)
	public ModelAndView view0(ModelAndView modelAndView) {
		modelAndView.setViewName("sitemap");		
		return modelAndView;
	}
	
}

