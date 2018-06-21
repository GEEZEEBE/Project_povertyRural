package com.skt.mars.adm.co;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.simple.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
 * CommerceController - 커머스 템플릿 관리
 * 
 * @author Kim Do Youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */

@Controller
public class JsonCommerceController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "commerce.";	// modify here
	private static String VIEW = "jsonView";
	private static String ACTION = "jsonAction";
	private static String INSERTACTION = "jsonInsertAction";
	
	
	@Autowired
	private JsonCommerceService jsonCommerceService;	// modify here
	
	/*public CommerceController(){
		//default constructor
	}
	*/
	/*@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return INSERT;
	}*/

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new JsonCommerce();
	}
	
	//템플릿 신규등록
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value = "/adm/commerce/jsonView/")
	public ModelAndView read(@Valid HttpServletRequest req, ModelAndView modelAndView) {
		
	    modelAndView.setViewName(TARGET+VIEW);
		
		return modelAndView;
	}
	

	//템플릿 신규등록
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value = "/adm/commerce/jsonAction/")
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
    	requestMap = getParameterMap(request);
		
		List<JsonCommerce> list = jsonCommerceService.selectList("PGADM0E05_L_01_JSON", requestMap);	// modify here
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName(TARGET+ACTION);
		
		return modelAndView;
	}
    
  //템플릿 신규등록
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value = "/adm/commerce/jsonInsertAction/")
	public ModelAndView listInsert(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		System.out.println("===run listInsert===");
    	String jsonStr = request.getParameter("insertStr");
    	System.out.println("===jsonStr:"+jsonStr);
    	JSONArray jAry = (JSONArray)JSONValue.parse(jsonStr);
    	System.out.println("===jAry:"+jAry.size());
    	
    	for(int i=0;i<jAry.size();i++){
    		JSONObject jobj = (JSONObject) jAry.get(i);
    		Map pMap = new HashMap();
    		pMap.put("SK", "SUNKYONG");
    		pMap.put("ID", (String)jobj.get("ID"));
    		pMap.put("TITLE", (String)jobj.get("TITLE"));
    		System.out.println("========pMap["+i+"]:"+pMap.toString());
		}
    	
    	requestMap = getParameterMap(request);
		List<JsonCommerce> list = jsonCommerceService.selectList("PGADM0E05_L_01_JSON", requestMap);	// modify here
		List<JsonCommerce> list1 = jsonCommerceService.selectList("PGADM0E05_L_01_JSON", requestMap);	// modify here
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("list1", list1);
		modelAndView.setViewName(TARGET+INSERTACTION);
		
		return modelAndView;
	}
    

}
