package com.skt.mars.adm.bm;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

@Controller
// modify here
public class UsingController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "using."; // modify here

    private static String INSERT = "insert";

    private static String READ = "read";

    private static String LIST = "list";

    private static String USINGLIST = "usingList";

    @Autowired
    private PaymentService defualtService; // modify here

    @RequestMapping(method = RequestMethod.GET)
    public String form(Model model) {
        return TARGET + INSERT;
    }

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Price();
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submit(@ModelAttribute("command") @Valid Price board,
                         Map<String, String> requestMap,
                         BindingResult result,
                         Model model) {
        // Check Validation
        if (result.hasErrors()) {
            return TARGET + INSERT;
        }
        String id = (String)defualtService.insert(TARGET + INSERT, requestMap);

        model.addAttribute("method", INSERT);
        model.addAttribute("requestMap", requestMap);
        model.addAttribute("cnt", id);
        return TARGET + READ;
    }

    @RequestMapping(value = "/adm/using/list")
    public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

    	// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//			requestMap.clear();
		}
        
        DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
        Date nowDate = new Date();
        
        String STRT_TM="";
        String END_TM="";
       
        //date setting
        if(requestMap.get("stDate")!=null){
        	STRT_TM=requestMap.get("stDate").replace(".", "");	
        }else{STRT_TM = sdFormat.format(nowDate);}
        if(requestMap.get("enDate")!=null){
        	END_TM=requestMap.get("enDate").replace(".", "");
        }else{END_TM = sdFormat.format(nowDate);}
        
        // hour setting
        if(requestMap.get("stHour")!=null && requestMap.get("stHour").length() != 0){
        	STRT_TM = STRT_TM+requestMap.get("stHour");
        }else{STRT_TM = STRT_TM+"00";}
        if(requestMap.get("enHour")!=null && requestMap.get("enHour").length() != 0){
        	END_TM = END_TM+requestMap.get("enHour");
        }else{END_TM = END_TM+"00";}
        
        // min setting
        if(requestMap.get("stMin")!=null && requestMap.get("stMin").length() != 0){
        	STRT_TM = STRT_TM+requestMap.get("stMin");
        }else{STRT_TM = STRT_TM+"00";}
        if(requestMap.get("enMin")!=null && requestMap.get("enMin").length() != 0){
        	END_TM = END_TM+requestMap.get("enMin");
        }else{END_TM = END_TM+"00";}
        
        
        // all value false
        //if(Long.parseLong(STRT_TM) <= 0){STRT_TM="";}
        //if(Long.parseLong(END_TM) <= 0){END_TM="";}
        
        
        requestMap.put("STRT_TM",STRT_TM);
        requestMap.put("END_TM",END_TM);
        
        List list = defualtService.selectList(TARGET + LIST, requestMap); // modify here

        
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}

		modelAndView.addObject(LIST, list);
		modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    @RequestMapping(value = "/adm/using/read")
    public ModelAndView read(HttpServletRequest request, Map<String, Object> requestMap, ModelAndView modelAndView) {

        DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
        Date nowDate = new Date();
        
        String STRT_TM="";
        String END_TM="";
       
        //date setting
        if(requestMap.get("stDate")!=null){
        	STRT_TM=((String) requestMap.get("stDate")).replace(".", "");	
        }else{STRT_TM = sdFormat.format(nowDate);}
        if(requestMap.get("enDate")!=null){
        	END_TM=((String) requestMap.get("enDate")).replace(".", "");
        }else{END_TM = sdFormat.format(nowDate);}
        
        // hour setting
        if(requestMap.get("stHour")!=null && ((String) requestMap.get("stHour")).length() != 0){
        	STRT_TM = STRT_TM+requestMap.get("stHour");
        }else{STRT_TM = STRT_TM+"00";}
        if(requestMap.get("enHour")!=null && ((String) requestMap.get("enHour")).length() != 0){
        	END_TM = END_TM+requestMap.get("enHour");
        }else{END_TM = END_TM+"00";}
        
        // min setting
        if(requestMap.get("stMin")!=null && ((String) requestMap.get("stMin")).length() != 0){
        	STRT_TM = STRT_TM+requestMap.get("stMin");
        }else{STRT_TM = STRT_TM+"00";}
        if(requestMap.get("enMin")!=null && ((String) requestMap.get("enMin")).length() != 0){
        	END_TM = END_TM+requestMap.get("enMin");
        }else{END_TM = END_TM+"00";}
        
        
        // all value false
        //if(Long.parseLong(STRT_TM) <= 0){STRT_TM="";}
        //if(Long.parseLong(END_TM) <= 0){END_TM="";}
        
        
        requestMap.put("STRT_TM",STRT_TM);
        requestMap.put("END_TM",END_TM);
    	
    	List list = new ArrayList();
    	String srvcID[] = new String[20];
    	
        // Health
    	list = null;
    	srvcID[0] = "37" ;
        requestMap.put("srvcID", srvcID);		// HealthPrint
        requestMap.put("itemUsingYN", null);		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("HealthPrint", list);

    	list = null;
    	srvcID[0] = "48" ;
        requestMap.put("srvcID", srvcID);		// SmartBeamUsing
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("SmartBeamUsing", list);

    	list = null;
    	srvcID[0] = "49" ;
        requestMap.put("srvcID", srvcID);		// BookRental
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("BookRental", list);

    	list = null;
    	srvcID[0] = "50" ;
        requestMap.put("srvcID", srvcID);		// DVDRental
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("DVDRental", list);

    	// CBC Basic
    	list = null;
    	srvcID[0] = "31" ;
        requestMap.put("srvcID", srvcID);		// UsingPC
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("UsingPC", list);

    	list = null;
    	srvcID[0] = "47" ;
        requestMap.put("srvcID", srvcID);		// TabletRental
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("TabletRental", list);

        // Learning (Smart Class)
    	list = null;
    	srvcID[0] = "42" ;
        requestMap.put("srvcID", srvcID);		// InteractiveWhiteBoard
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("InteractiveWhiteBoard", list);
        
    	list = null;
    	srvcID[0] = "32" ;
    	srvcID[1] = "53" ;
        requestMap.put("srvcID", srvcID);		// Print
        requestMap.put("itemUsingYN", null);		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("Print", list);

        // Learning (English Vilage)
    	list = null;
    	srvcID[0] = "23" ;
    	srvcID[1] = "24" ;
        requestMap.put("srvcID", srvcID);		// DVD, eBook
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("eBook", list);

        // Commerce
    	list = null;
    	srvcID[0] = "38" ;
    	srvcID[1] = "39" ;
        requestMap.put("srvcID", srvcID);		// Label Print
        requestMap.put("itemUsingYN", null);		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("LabelPrint", list);

    	list = null;
    	srvcID[0] = "40" ;
    	srvcID[1] = "41" ;
        requestMap.put("srvcID", srvcID);		// Brochure Print
        requestMap.put("itemUsingYN", null);		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("BrochurePrint", list);

    	list = null;
    	srvcID[0] = "44" ;
    	srvcID[1] = "45" ;
    	srvcID[2] = "46" ;
        requestMap.put("srvcID", srvcID);		// Promotion(Facebook, Blogspot ..)
        requestMap.put("itemUsingYN", null);		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("Promotion", list);

        // Learning (Smart Class)
    	list = null;
    	srvcID[0] = "4" ;
    	srvcID[1] = "5" ;
    	srvcID[2] = "6" ;
    	srvcID[3] = "7" ;
    	srvcID[4] = "8" ;
    	srvcID[5] = "9" ;
    	srvcID[6] = "10" ;
    	srvcID[7] = "11" ;
    	srvcID[8] = "12" ;
    	srvcID[9] = "13" ;
    	srvcID[10] = "14" ;
    	srvcID[11] = "15" ;
    	srvcID[12] = "16" ;
    	srvcID[13] = "17" ;
    	srvcID[14] = "18" ;
    	srvcID[15] = "19" ;
    	srvcID[16] = "20" ;
    	srvcID[17] = "21" ;
        requestMap.put("srvcID", srvcID);		// Smart Class
        requestMap.put("itemUsingYN", "Y");		// itemUsingYN nul : is null, Y: AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID)
        list = defualtService.selectListForNoPage(TARGET + USINGLIST, requestMap); // modify here
        modelAndView.addObject("SmartClass", list);

        modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }
    
    @RequestMapping(value="/adm/using/billSave")
	public @ResponseBody String replyDel(@RequestParam(value="strUserID", required=true) String strUserID ,Model mode) {
		
		Map requestMap = new HashMap();
		requestMap.put("strUserID", strUserID);
			
		defualtService.update("using.billSave", requestMap);
		
		return "1";
	}
}
