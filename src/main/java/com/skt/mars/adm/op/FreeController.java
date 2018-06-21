package com.skt.mars.adm.op;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.usr.fb.UserFree;
import com.skt.mars.usr.fb.UserFreeService;

@Controller
@RequestMapping("/adm/free")	// modify here
public class FreeController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "usrFree.";	// modify here
	private static String VIEWTARGET = "free.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	private static String DELETE = "delete";
	private static String PREV = "prev";
	private static String NEXT = "next";
	
	private static String REPLYINSERT = "replyinsert";
	private static String REPLYLIST = "replylist";
	private static String REPLYDELETE = "replydelete";
	
	@Autowired
	private UserFreeService userFreeService;	// modify here
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return TARGET+INSERT;
	}

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new UserFree();	// modify here
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/list")
	public ModelAndView list(Map<String, String> requestMap, ModelAndView modelAndView) {
		
		// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//			requestMap.clear();
		}

		List<UserFree> list = userFreeService.selectList(TARGET+LIST, requestMap);	// modify here

		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(VIEWTARGET+LIST);		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/delete")
	public ModelAndView delete(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
		userFreeService.delete(TARGET+"replyAlldelete", requestMap);
		userFreeService.delete(TARGET+DELETE, requestMap);
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		List<UserFree> list = userFreeService.selectList(TARGET+LIST, requestMap);	// modify here
		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(VIEWTARGET+LIST);		
		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/read")
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
		UserFree command = userFreeService.select(TARGET+READ, requestMap);	// here
		
		//comment list
		List<UserFree> replyList = userFreeService.selectList(TARGET+REPLYLIST, requestMap);
		//next/prev
		UserFree prevMap = userFreeService.select(TARGET+PREV, requestMap);
		UserFree nextMap = userFreeService.select(TARGET+NEXT, requestMap);
		
		requestMap.put("targetID",requestMap.get("boardID"));
		requestMap.put("fileType","freeFile");
		List fieMap = (List)userFreeService.selectFile("usrFree.select.fileinfor", requestMap);
		modelAndView.addObject("fileMap", fieMap);
		
		modelAndView.addObject("command", command);
		modelAndView.addObject("replyList", replyList);
		modelAndView.addObject("prevMap", prevMap);
		modelAndView.addObject("nextMap", nextMap);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(VIEWTARGET+READ);		
		
		return modelAndView;
	}

    @RequestMapping(value = "/replyDel")
    public @ResponseBody
    String replyDel(@RequestParam(value = "boardID", required = true) String boardID,
                    @RequestParam(value = "replyID", required = true) String replyID,
                    Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("boardID", boardID);
        requestMap.put("replyID", replyID);

        userFreeService.delete(TARGET + "replydelete", requestMap);

        return "1";
    }
	
}
