package com.skt.mars.usr.co;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.co.Guide;
import com.skt.mars.adm.co.GuideService;

/**
 * GuideController - 커머스 User 가이드 
 * 
 * @author Kim Do Youn
 * @version 
 * @since
 * @created 2012. 02. 24.
 */
@Controller
@RequestMapping("/Guide")	// modify here
public class UserGuideController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());
	
    @Value("#{commonProperty['mar.app.url']}")
    private String appUrl;
    
    @Value("#{commonProperty['mar.cm.guide']}")
    private String guideUrl;
	
	// command words
	private static String TARGET = "usrGuide.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	
	@Autowired
	private GuideService guideService;	// modify here
	
	
	public UserGuideController(){
		//default constructor
	}
	
	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Guide();
	}
	
	
	//User 가이드 리스트 검색
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		//requestMap = getParameterMap(request);
		
		List<Guide> list = guideService.selectList("PGADM0E05_L_01", requestMap);	// modify here

		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+LIST);
		
		return modelAndView;
	}
	
	//User 가이드 상세페이지
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		//requestMap = getParameterMap(request);
		
		System.out.println("autplay : " + requestMap.get("autoPlay"));
		
		modelAndView.addObject("autoPlay", requestMap.get("autoPlay"));
        
		
		Guide guide  = guideService.select("PGADM0E09_V_01", requestMap);	// modify here
        //String video = appUrl + appRoot + vodPath + "T6_MATH.mp4";
        String video = appUrl + guideUrl + guide.getGuidCntsUrl();
        System.out.println("###############################" + video);
		modelAndView.addObject("command", guide);
		modelAndView.addObject("param", requestMap);
		modelAndView.addObject("video", video);
		modelAndView.setViewName(TARGET+READ);	
		
		return modelAndView;
	}
	
}
