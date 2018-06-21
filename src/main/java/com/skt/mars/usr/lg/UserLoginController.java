package com.skt.mars.usr.lg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.op.Notice;

@Controller
//@RequestMapping("/user")	// modify here
public class UserLoginController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());
	
	//login
	@RequestMapping(value="/PGUSR0002", method = RequestMethod.GET)
	public ModelAndView lg0(ModelAndView modelAndView) {
		modelAndView.setViewName("USRC_M100001");		
		return modelAndView;
	}
		
		
	//login
	@RequestMapping(value="/PGUSR0003", method = RequestMethod.GET)
	public ModelAndView lg1(ModelAndView modelAndView) {
		modelAndView.setViewName("USRC_M100001");		
		return modelAndView;
	}
	
	//id-pw
	@RequestMapping(value="/PGUSR0010", method = RequestMethod.GET)
	public ModelAndView lg2(ModelAndView modelAndView) {
		modelAndView.setViewName("USRC_M100020");		
		return modelAndView;
	}
	
}
