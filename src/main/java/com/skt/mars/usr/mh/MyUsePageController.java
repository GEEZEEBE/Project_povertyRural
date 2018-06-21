package com.skt.mars.usr.mh;

import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;

@Controller
// modify here
public class MyUsePageController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "myUsePage."; // modify here

    private static String READ = "read";

    private static String LIST = "list";

    private static String CMLIST = "cmList";

    private static String CMDETAIL = "cmDetail";

    private static String UPDATE = "update";

    private static String USEDDETAIL = "usedDetail";

    @Autowired
    private MyUsePageService myUsePageService; // modify here

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new MyUsePage(); // modify here
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/myUsePage", method = RequestMethod.POST)
    public String submit(HttpServletRequest request,
                         Map<String, String> requestMap,
                         @ModelAttribute("command") @Valid MyUsePage myPage,
                         BindingResult result,
                         Model model) { // modify here
        requestMap = getParameterMap(request);

        int checkEdit = myUsePageService.update(TARGET + UPDATE, requestMap);

        Map pMap = new HashMap();
        pMap.put("userID", requestMap.get("userID"));

        myPage = myUsePageService.select(TARGET + READ, pMap);
        model.addAttribute("userInfo", myPage);

        model.addAttribute("param", requestMap);

        return TARGET + READ;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/myUsePage/list")
    public ModelAndView list(HttpServletRequest request, Map requestMap, ModelAndView modelAndView) {
        //        requestMap = getParameterMap(request);

        //        requestMap.put("userID", "Kut0001");

        requestMap.put("userID", requestMap.get("frstRgstUserID"));

        Calendar calendar = Calendar.getInstance();

        String year = "";
        String month = "";

        if (null == requestMap.get("year")) {
            year = Integer.toString(calendar.get(Calendar.YEAR));
        } else {
            year = (String)requestMap.get("year");
        }
        if (null == requestMap.get("month")) {
            month = Integer.toString(calendar.get(Calendar.MONTH) + 1);
            if (!"10".equals(month) && !"11".equals(month) && !"12".equals(month)) {
                month = "0" + month;
            }
        } else {
            month = (String)requestMap.get("month");
            if (!"10".equals(month) && !"11".equals(month) && !"12".equals(month)) {
                month = "0" + month;
            }
        }

        requestMap.put("year", year);
        requestMap.put("month", month);

        List cbcbasic = new ArrayList();
        cbcbasic.add("102");
        cbcbasic.add("103");
        cbcbasic.add("104");
        cbcbasic.add("105");

        List learning = new ArrayList();
        learning.add("106");
        learning.add("107");
        learning.add("108");
        learning.add("109");

        List smart = new ArrayList();
        smart.add("5");
        smart.add("6");
        smart.add("7");
        smart.add("8");
        smart.add("10");
        smart.add("11");
        smart.add("12");
        smart.add("13");
        smart.add("15");
        smart.add("16");
        smart.add("17");
        smart.add("18");
        smart.add("20");
        smart.add("21");

        List english = new ArrayList();
        english.add("23");

        List ebook = new ArrayList();
        ebook.add("24");

        List health = new ArrayList();
        health.add("401");

        requestMap.put("godsID", cbcbasic);
        List cbcBasicList = myUsePageService.selectList(TARGET + LIST, requestMap);

        requestMap.put("godsID", learning);
        List learningList = myUsePageService.selectList(TARGET + LIST, requestMap);

        requestMap.put("godsID", smart);
        List smartList = myUsePageService.selectList("myUsePage.srvcid.list", requestMap);
        int smartCount = 0;
        int smartPrice = 0;
        for (int i = 0; i < smartList.size(); i++) {
            Map smartMap = (Map)smartList.get(i);
            smartCount = smartCount + Integer.parseInt(smartMap.get("gods_count").toString());
            if (smartMap.get("flat_sum") != null) {
                smartPrice = smartPrice + Integer.parseInt(smartMap.get("flat_sum").toString());
            }
        }

        requestMap.put("godsID", english);
        List englishList = myUsePageService.selectList("myUsePage.srvcid.list", requestMap);
        int englishCount = 0;
        int englishPrice = 0;
        for (int i = 0; i < englishList.size(); i++) {
            Map englishMap = (Map)englishList.get(i);
            englishCount = englishCount + Integer.parseInt(englishMap.get("gods_count").toString());
            if (englishMap.get("flat_sum") != null) {
                englishPrice = englishPrice + Integer.parseInt(englishMap.get("flat_sum").toString());
            }
        }

        requestMap.put("godsID", ebook);
        List ebookList = myUsePageService.selectList("myUsePage.srvcid.list", requestMap);
        int ebookCount = 0;
        int ebookPrice = 0;
        for (int i = 0; i < ebookList.size(); i++) {
            Map ebookMap = (Map)ebookList.get(i);
            ebookCount = ebookCount + Integer.parseInt(ebookMap.get("gods_count").toString());
            if (ebookMap.get("flat_sum") != null) {
                ebookPrice = ebookPrice + Integer.parseInt(ebookMap.get("flat_sum").toString());
            }
        }

        List commerceList = myUsePageService.selectList(TARGET + CMLIST, requestMap);

        requestMap.put("godsID", health);
        List healthList = myUsePageService.selectList(TARGET + LIST, requestMap);

        /******************************************************************************/

        List usedPC = new ArrayList();
        usedPC.add("102");
        requestMap.put("godsID", usedPC);
        List usedPCList = myUsePageService.selectList(TARGET + USEDDETAIL, requestMap);

        List usedBoard = new ArrayList();
        usedBoard.add("106");
        requestMap.put("godsID", usedBoard);
        List usedBoardList = myUsePageService.selectList(TARGET + USEDDETAIL, requestMap);

        List rentTablet = new ArrayList();
        rentTablet.add("103");
        requestMap.put("godsID", rentTablet);
        List rentTabletList = myUsePageService.selectList("myUsePage.rentTabletList", requestMap);

        List rentSmartBeam = new ArrayList();
        rentTablet.add("107");
        requestMap.put("godsID", rentTablet);
        List rentSmartBeamList = myUsePageService.selectList("myUsePage.rentTabletList", requestMap);

        List rentBook = new ArrayList();
        rentTablet.add("108");
        requestMap.put("godsID", rentTablet);
        List rentBookList = myUsePageService.selectList("myUsePage.rentTabletList", requestMap);

        List rentDVD = new ArrayList();
        rentTablet.add("109");
        requestMap.put("godsID", rentTablet);
        List rentDVDList = myUsePageService.selectList("myUsePage.rentTabletList", requestMap);

        List year4 = new ArrayList();
        year4.add("5");
        year4.add("6");
        year4.add("7");
        year4.add("8");
        requestMap.put("godsID", year4);
        List year4Count = myUsePageService.selectList("myUsePage.srvcid.smartDetail", requestMap);
        List year5 = new ArrayList();
        year5.add("10");
        year5.add("11");
        year5.add("12");
        year5.add("13");
        requestMap.put("godsID", year5);
        List year5Count = myUsePageService.selectList("myUsePage.srvcid.smartDetail", requestMap);
        List year6 = new ArrayList();
        year6.add("15");
        year6.add("16");
        year6.add("17");
        year6.add("18");
        requestMap.put("godsID", year6);
        List year6Count = myUsePageService.selectList("myUsePage.srvcid.smartDetail", requestMap);
        List engAdv = new ArrayList();
        engAdv.add("20");
        engAdv.add("21");
        requestMap.put("godsID", engAdv);
        List engCount = myUsePageService.selectList("myUsePage.srvcid.smartDetail", requestMap);

        List commerceDetailList = myUsePageService.selectList(TARGET + CMDETAIL, requestMap);

        /******************************************************************************/

        modelAndView.addObject("cbcBasicList", cbcBasicList);
        modelAndView.addObject("learningList", learningList);
        modelAndView.addObject("smartList", smartList);
        modelAndView.addObject("smartCount", smartCount);
        modelAndView.addObject("smartPrice", smartPrice);
        modelAndView.addObject("englishList", englishList);
        modelAndView.addObject("englishCount", englishCount);
        modelAndView.addObject("englishPrice", englishPrice);

        modelAndView.addObject("ebookList", ebookList);
        modelAndView.addObject("ebookCount", ebookCount);
        modelAndView.addObject("ebookPrice", ebookPrice);

        modelAndView.addObject("commerceList", commerceList);
        modelAndView.addObject("commerceDetailList", commerceDetailList);
        modelAndView.addObject("healthList", healthList);
        modelAndView.addObject("year4Count", year4Count);
        modelAndView.addObject("year5Count", year5Count);
        modelAndView.addObject("year6Count", year6Count);
        modelAndView.addObject("engCount", engCount);
        modelAndView.addObject("usedPCList", usedPCList);
        modelAndView.addObject("usedBoardList", usedBoardList);
        modelAndView.addObject("rentTabletList", rentTabletList);
        modelAndView.addObject("rentSmartBeamList", rentSmartBeamList);
        modelAndView.addObject("rentBookList", rentBookList);
        modelAndView.addObject("rentDVDList", rentDVDList);

        modelAndView.addObject("year", year);
        modelAndView.addObject("month", month);

        modelAndView.addObject("userID", requestMap.get("frstRgstUserID"));
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/usr/myUsePage/read")
    public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);

        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }
}
