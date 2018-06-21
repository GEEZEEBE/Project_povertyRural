package com.skt.mars.adm.mi;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skt.mars.adm.cm.DefaultController;


@Controller
//@RequestMapping("/main")	// modify here
public class MainController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	/**
	 * Simply selects the test view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String test() {
		
		return "main.home";
	}
	

	
}
