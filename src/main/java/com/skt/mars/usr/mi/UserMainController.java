package com.skt.mars.usr.mi;

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
@RequestMapping("/usr/home")	// modify here
public class UserMainController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	//user main
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public ModelAndView view0(ModelAndView modelAndView) {
		modelAndView.setViewName("usr.home");		
		return modelAndView;
	}
}
