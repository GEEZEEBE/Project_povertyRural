package com.skt.mars.adm.op;

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
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Controller
@RequestMapping("/adm/cost")
// modify here
public class CostController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "cost."; // modify here

    private static String LIST = "list";

    private static String DEL = "del";

    private static String INSERT = "insert";
    
    private static String EDIT = "edit";

    private static String READ = "read";

    @Autowired
    private CostService costService; // modify here

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Cost(); // modify here
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submit(HttpServletRequest request,
                         Map<String, String> requestMap,
                         @ModelAttribute("command") @Valid Cost cost,
                         BindingResult result,
                         Model model) { // modify here
        // Check Validation
        /*
         * if (result.hasErrors()) { return TARGET+INSERT; }
         */
    	if(requestMap.get("flag").equals("w")){
    		String id = (String)costService.insert(TARGET + INSERT, cost);
		}
		else if(requestMap.get("flag").equals("e")){
			int checkEdit = costService.update(TARGET+EDIT, cost);
		}

        List<Cost> list = costService.selectList(TARGET + LIST, requestMap); // modify here
        model.addAttribute("list", list);

        return TARGET + LIST;
    }

    @RequestMapping(value = "/list")
    public ModelAndView asset0(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        List<Cost> list = costService.selectList(TARGET + LIST, requestMap); // modify here
        modelAndView.addObject("list", list);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //Asset del
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public ModelAndView asset1(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);

        int delete = costService.update(TARGET + DEL, requestMap.get("del")); // modify here
        List<Cost> list = costService.selectList(TARGET + LIST, requestMap); // modify here
        modelAndView.addObject("list", list);
        modelAndView.setViewName(TARGET + LIST);
        return modelAndView;
    }

    //Asset insert
    @RequestMapping(value = "/insert")
    public ModelAndView asset2(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        modelAndView.setViewName(TARGET + INSERT);
        return modelAndView;
    }

    //Asset modify
    @RequestMapping(value = "/edit")
    public ModelAndView asset3(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        Cost cost = costService.select(TARGET + READ, requestMap); // modify here
        modelAndView.addObject("command", cost);
        modelAndView.setViewName(TARGET + INSERT);

        return modelAndView;
    }

}
