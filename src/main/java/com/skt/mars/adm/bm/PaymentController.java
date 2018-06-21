package com.skt.mars.adm.bm;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.ui.UserService;

@Controller
// modify here
public class PaymentController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "payment.";	// modify here
	private static String REFUND = "refund.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	private static String DELETE = "delete";
	private static String SELECT_ID = "select.ID";
	
	@Autowired
	private PaymentService defualtService;	// modify here
	
	@Autowired
	private UserService userService;	// modify here

	/**
     * 
     */
    public PaymentController() {
        // default constructor
    }

    @RequestMapping(value="/adm/payment", method = RequestMethod.GET)
	public String form(Model model) {
		return TARGET+INSERT;
	}

    @RequestMapping(value="/adm/refund", method = RequestMethod.GET)
	public String refundForm(Model model) {
		return REFUND+INSERT;
	}

    @ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Payment();	// modify here
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/adm/payment", method = RequestMethod.POST)
	public String submit(Map<String, String> requestMap,@ModelAttribute("command") @Valid Payment payment,
			BindingResult result, Model model) {	// modify here
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
		int count = 0;
		String id = null;
		String returnView = null;
		List<Object> list = new ArrayList();
		
		list.add("test");
		list.add(id);
		list.add(count);
		list.add(requestMap);
		
		if(requestMap.get("sortOf") != null && requestMap.get("sortOf").equals("refund")){
			id = requestMap.get("useHsNmbrID");	// payment.ACPT_ID actually
			payment.setAcptID(id);
			payment.setReturnDT(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
			defualtService.update(REFUND+EDIT, payment);
			
			list = defualtService.selectList(REFUND+LIST, requestMap);	// modify here

			returnView = REFUND+LIST;

		} else {
			id = DateFormatUtil.getRandomID();
			payment.setAcptID(id);
			payment.setDsptDT(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
	
			defualtService.insert(TARGET+INSERT, payment);

			list = defualtService.selectList(TARGET+LIST, requestMap);	// modify here

			returnView = TARGET+LIST;
		}
		// read to result
		
		
		if(requestMap.get("currentPage") == null){
			model.addAttribute("currentPage", 1);
		} else {
			model.addAttribute("currentPage", requestMap.get("currentPage"));
		}
		
		model.addAttribute(LIST, list);
		model.addAttribute("requestMap", requestMap);

		return returnView;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/adm/payment/list")
	public ModelAndView list(Map<String, String> requestMap, ModelAndView modelAndView) {
		
		// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//					requestMap.clear();
		}
				
		List list = defualtService.selectList(TARGET+LIST, requestMap);	// modify here

		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		return modelAndView;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/adm/refund/list")
	public ModelAndView refundList(Map<String, String> requestMap, ModelAndView modelAndView) {
		
		// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//							requestMap.clear();
		}
		
		List list = defualtService.selectList(REFUND+LIST, requestMap);	// modify here

		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(REFUND+LIST);		
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/adm/payment/delete", method = RequestMethod.POST)
	public ModelAndView delete(Map<String, String> requestMap, ModelAndView modelAndView) {

		int deleteCount = defualtService.delete(TARGET+DELETE, requestMap.get("del"));	// modify here

		List list = defualtService.selectList(TARGET+LIST, requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/adm/refund/delete", method = RequestMethod.POST)
	public ModelAndView deleteRefund(Map<String, String> requestMap, ModelAndView modelAndView) {

		int deleteCount = 0;
		
		deleteCount = userService.delete(REFUND+DELETE, requestMap);	// modify here

		List list = defualtService.selectList(REFUND+LIST, requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(REFUND+LIST);		
		
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/adm/payment/read", method = RequestMethod.GET)
	public ModelAndView view(Map<String, String> requestMap, ModelAndView modelAndView) {

		Payment object = (Payment) defualtService.select(TARGET+READ, requestMap);	// modify here

		modelAndView.addObject("command", object);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);		
		
		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/adm/payment/edit", method = RequestMethod.GET)
	public ModelAndView edit(Map<String, String> requestMap, ModelAndView modelAndView) {
		
		Payment object = (Payment) defualtService.select(TARGET+READ, requestMap);
        modelAndView.addObject("command", object);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+INSERT);		
		return modelAndView;
	}

	/**
	 * Simply selects the test view to render by returning its name.
	 */
	@RequestMapping(value = "/adm/payment/test", method = RequestMethod.GET)
	public String test() {
		
		return "payment.insert";
	}

	@RequestMapping(value="/restful/userList", method = RequestMethod.GET)
	public @ResponseBody String  userList(@RequestParam(value="searchColume", required=true) String searchColume, @RequestParam(value="serTxt", required=false) String serTxt, Model mode) {
		
		Map requestMap = new HashMap();
		try {
			requestMap.put("serCol", new String(searchColume.getBytes("ISO-8859-1"), "UTF-8"));
			requestMap.put("serTxt", new String(serTxt.getBytes("ISO-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		List list = userService.selectListForNoPage("user."+LIST+".popup2", requestMap);	// modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("serTxt", serTxt);
		
        String retrunValue = obj.toJSONString();
		return retrunValue;
	}
	
	@RequestMapping(value="/restful/productItemList", method = RequestMethod.GET)
	public @ResponseBody String  productItemList(@RequestParam(value="userID", required=true) String userID, @RequestParam(value="itemName", required=false) String itemName,@RequestParam(value="dpstKind", required=false) String dpstKind, Model mode) {
		
		Map requestMap = new HashMap();
		requestMap.put("userID", userID);
		requestMap.put("itemName", itemName);
		requestMap.put("dpstKind", dpstKind);
		
		List list = defualtService.selectListForNoPage(TARGET+"productItemList", requestMap);	// modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("userID", userID);
        obj.put("itemName", itemName);
        obj.put("dpstKind", dpstKind);
        
        String retrunValue = obj.toJSONString(); 
		return retrunValue;
	}
	
	@RequestMapping(value="/restful/refundProductItemList", method = RequestMethod.GET)
	public @ResponseBody String  refundProductItemList(@RequestParam(value="userID", required=true) String userID, @RequestParam(value="itemName", required=false) String itemName, Model mode) {
		
		Map requestMap = new HashMap();
		requestMap.put("userID", userID);
		requestMap.put("itemName", itemName);
		
		List list = defualtService.selectListForNoPage("refund.productItemList", requestMap);	// modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("userID", userID);
        obj.put("itemName", itemName);

        String retrunValue = obj.toJSONString(); 
		return retrunValue;
	}
	
}
