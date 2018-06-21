package com.skt.mars.adm.op;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.skt.mars.adm.bm.Payment;
import com.skt.mars.adm.bm.PaymentService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.sm.CategoryService;

@Controller
@RequestMapping("/adm/assetUtil")
// modify here
public class AssetUtilController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "assetUtil."; // modify here

    private static String RENTLIST = "rentList";

    private static String RENTINSERT = "rentInsert";

    private static String RETURNLIST = "returnList";

    private static String RENTDELETE = "rentdelete";

    private static String RETURNUPDATE = "returnUpdate";

    private static String PRINTLIST = "printList";

    private static String PRINTINSERT = "printInsert";

    private static String PRINTDELETE = "printDelete";

    private static String PRINTUPDATE = "printUpdate";

    private static String PRINTSELECT = "printSelect";

    private static String PRINTGODSLIST = "printGodsList";

    @Autowired
    private AssetUtilService assetUtilService; // modify here

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute("assetUtil")
    protected Object formBackingObject() throws Exception {
        return new AssetUtil(); // modify here
    }

    @Autowired
    private PaymentService paymentService; // modify here

    @RequestMapping(value = "/rentList/")
    public     ModelAndView
                assetUtil0(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        List<AssetUtil> list = assetUtilService.selectList(TARGET + RENTLIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }
        modelAndView.addObject("list", list);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + RENTLIST);

        return modelAndView;
    }

    @RequestMapping(value = "/rentInsert/")
    public String assetUtil3(HttpServletRequest request,
                             Map<String, String> requestMap,
                             @ModelAttribute("assetUtil") @Valid AssetUtil assetUtil,
                             BindingResult result,
                             Model model) {
        requestMap = getParameterMap(request);
        assetUtil.setStartTm(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        assetUtil.setEndTm(requestMap.get("endTm").replace(".", "") + "000000000");
        String suc = (String)assetUtilService.insert(TARGET + RENTINSERT, assetUtil); // modify here

        List<AssetUtil> list = assetUtilService.selectList(TARGET + RENTLIST, requestMap); // modify here
        if (requestMap.get("currentPage") == null) {
            model.addAttribute("currentPage", 1);
        } else {
            model.addAttribute("currentPage", requestMap.get("currentPage"));
        }
        model.addAttribute("list", list);
        model.addAttribute("suc", "0");
        model.addAttribute("param", requestMap);
        return TARGET + RENTLIST;

    }

    @RequestMapping(value = "/returnList/")
    public     ModelAndView
                assetUtil2(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        //    	requestMap = getParameterMap(request);
        List<AssetUtil> list = assetUtilService.selectList(TARGET + RETURNLIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("list", list);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + RETURNLIST);
        return modelAndView;
    }

    @RequestMapping(value = "/delete/", method = RequestMethod.POST)
    public ModelAndView delete(Map<String, String> requestMap, ModelAndView modelAndView) {

        requestMap.put("checkItem", requestMap.get("useHsNmbrID"));
        int deleteCount = assetUtilService.delete(TARGET + RENTDELETE, requestMap); // modify here

        List<AssetUtil> list = assetUtilService.selectList(TARGET + RETURNLIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("list", list);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + RETURNLIST);
        return modelAndView;
    }

    @RequestMapping(value = "/returnInsert/")
    public String assetUtil4(HttpServletRequest request,
                             Map<String, String> requestMap,
                             @ModelAttribute("assetUtil") @Valid AssetUtil assetUtil,
                             BindingResult result,
                             Model model) {
        requestMap = getParameterMap(request);

        //String suc = (String)assetUtilService.insert(TARGET + RETURNINSERT, assetUtil); // modify here
        String randomCategory = DateFormatUtil.getRandomID();
        Payment payment = new Payment();
        payment.setAcptID(randomCategory);
        payment.setDpstKind(requestMap.get("dpstKind"));
        payment.setDpstMthd(requestMap.get("dpstMthd"));

        payment.setDsptDT(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        payment.setDpstAmt(Long.parseLong(requestMap.get("dpstAmt")));
        payment.setReturnDT(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        payment.setReturnAmt(0);

        payment.setFrstRgstUserID(requestMap.get("frstRgstUserID"));
        payment.setLatCrctUserID(requestMap.get("latCrctUserID"));
        payment.setUseHsNmbrID(requestMap.get("useHsNmbrID"));
        payment.setPayKind(requestMap.get("payKind"));

        paymentService.insert("payment.insert", payment); // modify here

        assetUtilService.update(TARGET + RETURNUPDATE, assetUtil);

        List<AssetUtil> list = assetUtilService.selectList(TARGET + RETURNLIST, requestMap); // modify here
        if (requestMap.get("currentPage") == null) {
            model.addAttribute("currentPage", 1);
        } else {
            model.addAttribute("currentPage", requestMap.get("currentPage"));
        }
        model.addAttribute("list", list);
        model.addAttribute("suc", "0");
        model.addAttribute("param", requestMap);
        return TARGET + RETURNLIST;

    }

    @RequestMapping(value = "/printList/")
    public     ModelAndView
                assetUtil1(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        List<AssetUtil> list = assetUtilService.selectList(TARGET + PRINTLIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        requestMap.put("depth", "0");
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        modelAndView.addObject("list", list);
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + PRINTLIST);
        return modelAndView;
    }

    @RequestMapping(value = "/printGodsList/")
    public @ResponseBody
    String userList(@RequestParam(value = "srvcID", required = false) String srvcID, Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("srvcID", srvcID);

        List list = assetUtilService.selectList(TARGET + PRINTGODSLIST, requestMap); // modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("srvcID", srvcID);
        String retrunValue = obj.toJSONString();

        return retrunValue;
    }

    @RequestMapping(value = "/printInsert/")
    public String assetUtil5(HttpServletRequest request,
                             Map<String, String> requestMap,
                             @ModelAttribute("assetUtil") @Valid AssetUtil assetUtil,
                             BindingResult result,
                             Model model) {
        requestMap = getParameterMap(request);

        assetUtil.setStartTm(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        assetUtil.setEndTm(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        String suc = (String)assetUtilService.insert(TARGET + PRINTINSERT, assetUtil); // modify here

        assetUtil.setUseHsNmbrID(suc);
        int check = assetUtilService.update(TARGET + PRINTUPDATE, assetUtil);

        HashMap hmap = new HashMap();
        hmap.put("useHsNmbrID", suc);
        assetUtil = assetUtilService.select(TARGET + PRINTSELECT, hmap);

        String randomCategory = DateFormatUtil.getRandomID();
        Payment payment = new Payment();
        payment.setAcptID(randomCategory);
        payment.setDpstKind(requestMap.get("dpstKind"));
        payment.setDpstMthd(requestMap.get("dpstMthd"));
        payment.setPayKind(requestMap.get("payKind"));

        payment.setDsptDT(DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        payment.setDpstAmt(Long.parseLong(assetUtil.getRentDay()) * Long.parseLong(assetUtil.getFlatRate()));
        payment.setFrstRgstUserID(requestMap.get("frstRgstUserID"));
        payment.setLatCrctUserID(requestMap.get("latCrctUserID"));
        payment.setUseHsNmbrID(suc);
        paymentService.insert("payment.insert", payment); // modify here

        List<AssetUtil> list = assetUtilService.selectList(TARGET + PRINTLIST, requestMap); // modify here
        if (requestMap.get("currentPage") == null) {
            model.addAttribute("currentPage", 1);
        } else {
            model.addAttribute("currentPage", requestMap.get("currentPage"));
        }

        requestMap.put("depth", "0");
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        model.addAttribute("categoryList", categoryList);

        model.addAttribute("list", list);
        model.addAttribute("suc", "0");
        model.addAttribute("param", requestMap);
        return TARGET + PRINTLIST;

    }

    @RequestMapping(value = "/printDelete/", method = RequestMethod.POST)
    public ModelAndView printDelete(Map<String, String> requestMap, ModelAndView modelAndView) {
    	
    	int deleteCount2 = assetUtilService.delete(TARGET + "printDeletePayment", requestMap);
        int deleteCount = assetUtilService.delete(TARGET + PRINTDELETE, requestMap); // modify here

        List<AssetUtil> list = assetUtilService.selectList(TARGET + PRINTLIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        requestMap.put("depth", "0");
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        modelAndView.addObject("list", list);
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + PRINTLIST);
        return modelAndView;
    }

}
