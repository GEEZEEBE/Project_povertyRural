package com.skt.mars.adm.co;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

/**
 * GuideController - 커머스 가이드 관리
 * 
 * @author Kim Do Youn
 * @version
 * @since
 * @created 2012. 02. 13.
 */

@Controller
public class GuideController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "guide.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	
	@Autowired
	private GuideService guideService;	// modify here
	
	/*public GuideController(){
		//default constructor
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return INSERT;
	}*/

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Guide();
	}

    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/guide", method = RequestMethod.POST)
	public String submit(Map requestFileMap,@ModelAttribute("commandGuide") @Valid Guide guide, 
			BindingResult result, Model model) throws Exception{
		
	    //입력자ID - 추후에 Log-in session 관리 추가 후 설정해주어야 함. 2013/02/15
	    //String adminId = "adminId001";
	    //guide.setFrstRgstMngrId(adminId);
//		requestMap = getParameterMap(request);
    	//guide.setFrstRgstUserID((String) requestFileMap.get("frstRgstUserID"));
    	//guide.setLatCrctUserID((String) requestFileMap.get("latCrctUserID"));
    	guide.setFrstRgstMngrId((String) requestFileMap.get("frstRgstUserID"));
    	guide.setLastCrctMngrId((String) requestFileMap.get("latCrctUserID"));
    	
    	System.out.println("############ f id : " + requestFileMap.get("frstRgstUserID"));
    	System.out.println("############ f id : " + requestFileMap.get("latCrctUserID"));
	    
	    Guide id = null;
	    String guidId = null;
	    if(requestFileMap.get("insertFlag").equals("B")){
		    //Guide SEQ 생성
			long randomCategory_long = DateFormatUtil.getRandomCategoryID();
			guidId = String.valueOf(randomCategory_long);
			
			String guidCntsUrl_tm = (String)requestFileMap.get("guidCntsUrl");
		    String guidCntsUrl = guidCntsUrl_tm.substring(guidCntsUrl_tm.lastIndexOf("\\")+1, guidCntsUrl_tm.length());
			guide.setGuidId(guidId);
			guide.setGuidCntsUrl(guidCntsUrl);
			
			id = (Guide)guideService.insert("PGADM0E07_I_01", guide);
	    }else{
	    	String fileChangeImg = (String)requestFileMap.get("fileChangeImg");
    		if(fileChangeImg.equals("Y")){
			
    			String guidCntsUrl_tm = (String)requestFileMap.get("guidCntsUrl");
    		    String guidCntsUrl = guidCntsUrl_tm.substring(guidCntsUrl_tm.lastIndexOf("\\")+1, guidCntsUrl_tm.length());
    		    guide.setGuidCntsUrl(guidCntsUrl);
		   
    		}
    		int checkEdit = guideService.update("PGADM0E08_U_01" , guide);
	    }
			    
	    
	    Map pMap = new HashMap();
	    
	    if(requestFileMap.get("insertFlag").equals("B")){
	        pMap.put("guidId", guidId);
	        //pMap.put("guidId", id.getGuidId());
	    }else{
	        pMap.put("guidId", requestFileMap.get("guidId"));
	    }
        
        guide = guideService.select("PGADM0E09_V_01", pMap);
        
		model.addAttribute("method", INSERT);
		model.addAttribute("command", guide);
		
		
		return TARGET+READ;
	}
	
	
	//가이드 관리 리스트 검색
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/guide/list")
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		requestMap = getParameterMap(request);
		
		List<Guide> list = guideService.selectList("PGADM0E05_L_01", requestMap);	// modify here

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
	
	//가이드 관리 상세페이지
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/guide/read")
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		

		Guide guide  = guideService.select("PGADM0E09_V_01", requestMap);	// modify here
		        
		modelAndView.addObject("command", guide);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);	
		
		return modelAndView;
	}
	
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/guide/update", method = RequestMethod.POST)
    public String update(HttpServletRequest request,
            Map<String, String> requestMap,
            @ModelAttribute("command") @Valid Guide guide,
            BindingResult result,
            Model model) {
		
        requestMap = getParameterMap(request);        
        int checkEdit = guideService.update("PGADM0E08_U_01" , guide);
        guide  = guideService.select("PGADM0E09_V_01", requestMap);        
        model.addAttribute("param", requestMap);
        model.addAttribute("command", guide);
		
		return TARGET + READ;

    }
    
	//가이드 관리 신규등록
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value = "/adm/guide/insert")
	public ModelAndView insert(@Valid HttpServletRequest req, ModelAndView modelAndView) {
		
	    modelAndView.setViewName(TARGET+INSERT);
		
		return modelAndView;
	}

	//가이드 관리 삭제
	@RequestMapping(value="/adm/guide/delete", method = RequestMethod.POST)
	public ModelAndView delete(Map<String, String> requestMap, Guide guide,@Valid HttpServletRequest req,  ModelAndView modelAndView) {
		requestMap = getParameterMap(req);
		String chkBoxes[] = req.getParameterValues("delChk");
		ArrayList<String> delChk = new ArrayList<String>();
		for(int i = 0; i < chkBoxes.length; i++){
			delChk.add(chkBoxes[i]);
		}
		
		int deleteCount = guideService.delete("PGADM0E06_D_01", delChk);	// modify here
		
		List<Guide> list = guideService.selectList("PGADM0E05_L_01", requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName(TARGET+LIST);
		modelAndView.addObject("param", requestMap);
		return modelAndView;
	}
	
	//가이드 관리 수정
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/guide/edit")
	public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);

		Guide guide  = guideService.select("PGADM0E09_V_01", requestMap);	// modify here
		modelAndView.addObject("command", guide);
		modelAndView.addObject("param", requestMap);		
		modelAndView.setViewName(TARGET+EDIT);	
		
		return modelAndView;
	}
}
