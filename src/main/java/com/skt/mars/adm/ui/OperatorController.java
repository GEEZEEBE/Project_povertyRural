package com.skt.mars.adm.ui;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
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

import com.skt.mars.adm.cm.CommonCodeService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.op.Notice;

@Controller
@RequestMapping("/operator")	// modify here
public class OperatorController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "operator.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	private static String DELETE = "delete";
	
	@Autowired
	private OperatorService operatorService;	// modify here

	@Autowired
	private CommonCodeService commonCodeService;	// modify here
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(Map<String, String> requestMap,Model model) {
		
		model.addAttribute("param", requestMap);
		return TARGET+INSERT;
	}

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Operator();	// modify here
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST)
	public String submit(HttpServletRequest request, Map<String, Object> requestMap,@ModelAttribute("command") @Valid Operator operator,
			BindingResult result, Model model) {	// modify here
//		requestMap = getParameterMap(request);
		operator.setFrstRgstUserID((String) requestMap.get("frstRgstUserID"));
		operator.setLatCrctUserID((String) requestMap.get("latCrctUserID"));
		
		// Check Validation
		/*
		if (result.hasErrors()) {
			//result.getAllErrors().get(0).getDefaultMessage();
			//String dd = result.getFieldError("pw").getDefaultMessage();
			//System.out.println(dd);
			//result.getAllErrors().
			model.addAttribute("errorMap", result.getAllErrors());
			model.addAttribute("requestMap", requestMap);
			return TARGET+INSERT;
		}
		*/
		String id=null;
		
		if(requestMap.get("flag").equals("w")){
			id = (String)operatorService.insert(TARGET+INSERT, operator);

			// count visiting
            String randomCategory = DateFormatUtil.getRandomID();
            requestMap.put("srvcID", 28); // category Using Interactive
            requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
            requestMap.put("userid", (String) requestMap.get("frstRgstUserID")); // use__id
            requestMap.put("endYN", "E"); // end Y or N
            requestMap.put("END_TM", randomCategory.substring(0, 17)); // end Y or N

            String sqlMapId = "using.insertBySrvID";

            commonCodeService.insert(sqlMapId, requestMap);
		}
		else if(requestMap.get("flag").equals("e")){
			int checkEdit = operatorService.update(TARGET+EDIT, operator);
			id = operator.getUserID();
		}

        Map pMap = new HashMap();
        pMap.put("userID", id);
        operator = operatorService.select(TARGET+READ, pMap);
        
        
        logger.info("submit user : "+operator);
		model.addAttribute("command", operator);
		model.addAttribute("param", requestMap);

		return TARGET+READ;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

		// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//			requestMap.clear();
		}

		
		List<Operator> list = operatorService.selectList(TARGET+LIST, requestMap);	// modify here
		//String dd = list.get(0).getAuthority();
		//System.out.println(dd);
		
		requestMap = getParameterMap(request);
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		if(requestMap.get("serTrue")!=null && requestMap.get("serTrue").equals("1")){
			modelAndView.addObject("currentPage", 1);
		}
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);

		int deleteCount = operatorService.delete(TARGET+DELETE, requestMap.get("del"));	// modify here
//		modelAndView.addObject("param", requestMap);
/*		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
*/		
		
		List<Operator> list = operatorService.selectList(TARGET+LIST, requestMap);
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("currentPage", 1);
		modelAndView.setViewName(TARGET+LIST);		
		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/read")
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);

		Operator command = operatorService.select(TARGET+READ, requestMap);	// modify here
		modelAndView.addObject("command", command);
		modelAndView.addObject("param", requestMap);
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}

		modelAndView.setViewName(TARGET+READ);		
		
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/edit")
	public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
		Operator operator = operatorService.select(TARGET+READ, requestMap);
        logger.info("submit user : "+operator);
        if(operator.geteMail()!=null){
        	String[] val = operator.geteMail().split("@");
        	if(val.length > 0){
	        	operator.seteMail00(val[0]);
	        	operator.seteMail01(val[1]);
        	}
        }
        modelAndView.addObject("command", operator);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+INSERT);		
		return modelAndView;
	}
	

	
}
