package com.skt.mars.adm.rm;

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

/**
 * PC 모니터링
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 29.
 */

@Controller
@RequestMapping("/adm/pcMonitoring")	
public class PCMonitoringController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "pcMonitoring.";	
	private static String LIST = "list";
	
	@Autowired
	private PCMonitoringService pcMonitoringService;	
	
	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new PCMonitoring();
	}

	//PC 사용내역 조회
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView list(Map<String, String> requestMap, ModelAndView modelAndView) {
		List list = pcMonitoringService.selectList(TARGET+LIST, requestMap);	
		modelAndView.addObject(LIST, list);
		modelAndView.setViewName(TARGET+LIST);		
		
		return modelAndView;
	}
	
	
}
