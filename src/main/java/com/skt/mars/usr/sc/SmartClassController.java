package com.skt.mars.usr.sc;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.bm.Price;
import com.skt.mars.adm.bm.PriceService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
//import com.skt.mars.adm.drm.DrmManager;

@Controller
// modify here
public class SmartClassController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "smartClass."; // modify here

    private static String INSERT = "insert";

    private static String READ = "read";

    private static String LIST = "list";

    private static String LESSONSLIST = "lessonsList";

    private static String CALENDAR = "calendar";

    @Value("#{commonProperty['mar.app.url']}")
    private String appUrl;

    @Value("#{commonProperty['mar.app.root']}")
    private String appRoot;

    @Value("#{commonProperty['mar.vod.path']}")
    private String vodPath;

    @Autowired
    private SmartClassService smartClassService; // modify here

    @Autowired
    private PriceService priceService;

    @RequestMapping(method = RequestMethod.GET)
    public String form(Model model) {
        return TARGET + INSERT;
    }

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new SmartClass();
    }

    @RequestMapping(value = "/usr/smartClass", method = RequestMethod.POST)
    public String submit(@ModelAttribute("command") @Valid SmartClass board, BindingResult result, Model model) {
        // Check Validation
        if (result.hasErrors()) {
            return TARGET + INSERT;
        }

        return TARGET + READ;
    }

    //리스트 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/smartClass/list")
    public ModelAndView list(HttpServletRequest request, Map requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request);

        //        requestMap.put("userID", "Kut0001");

        String langType = "00034";
        if ("en".equals(requestMap.get("lang"))) {
            langType = "00033";
        } else if ("my".equals(requestMap.get("lang"))) {
            langType = "00034";
        }

        if (null == requestMap.get("srvcID")) {
            requestMap.put("srvcID", "4");
        }
        //        requestMap.put("srvcID", "8");

        requestMap.put("listSize", "5");

        List malayList = smartClassService.selectList(TARGET + LIST, requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("srvcID", requestMap.get("srvcID"));

        modelAndView.addObject("langType", langType);
        modelAndView.addObject("param", requestMap);
        modelAndView.addObject("malayList", malayList);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //수강
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/smartClass/read")
    public ModelAndView read(HttpServletRequest request, Map requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request);

        String langType = "00034";
        if ("en".equals(requestMap.get("lang"))) {
            langType = "00033";
        } else if ("my".equals(requestMap.get("lang"))) {
            langType = "00034";
        }
        requestMap.put("langType", langType);

        //requestMap.put("itemID", "201303051020444275");

        Map asset = (Map)smartClassService.select("smartClass.asset", requestMap);
        Map assetChild = (Map)smartClassService.select("smartClass.assetChild", requestMap);
        List fileList = smartClassService.selectListNoPage("smartClass.fileRead", requestMap);

        //String video = appUrl + appRoot + vodPath + "T6_MATH.mp4";
        String video = appUrl + appRoot + vodPath + asset.get("ITEM_01");

        modelAndView.addObject("langType", langType);
        modelAndView.addObject("asset", asset);
        modelAndView.addObject("assetChild", assetChild);
        modelAndView.addObject("fileList", fileList);
        modelAndView.addObject("video", video);

        modelAndView.addObject("srvcID", asset.get("SRVC_ID"));
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    //수강상태 변경
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/smartClass/update")
    public ModelAndView update(HttpServletRequest request, Map requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request);

        Map pMap = new HashMap();

        pMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        pMap.put("cmplYN", requestMap.get("updateCmplYn"));
        pMap.put("useHsID", requestMap.get("useHsID"));
        pMap.put("latCrctUserID", requestMap.get("userID"));

        smartClassService.update("smartClass.updateUseHS", pMap);

        requestMap.put("listSize", "5");

        List list = smartClassService.selectList(TARGET + LESSONSLIST, requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        String langType = "00034";
        if ("en".equals(requestMap.get("lang"))) {
            langType = "00033";
        } else if ("my".equals(requestMap.get("lang"))) {
            langType = "00034";
        }
        requestMap.put("langType", langType);

        modelAndView.addObject("langType", langType);
        modelAndView.addObject("lessonsList", list);
        modelAndView.addObject("searchSrvcID", requestMap.get("srvcID"));
        modelAndView.addObject("cmplYn", requestMap.get("cmplYn"));

        modelAndView.setViewName(TARGET + LESSONSLIST);

        return modelAndView;

    }

    //달력보기
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/smartClass/calendar")
    public ModelAndView calendar(HttpServletRequest request, Map requestMap, ModelAndView modelAndView) {

        modelAndView.setViewName(TARGET + CALENDAR);

        return modelAndView;
    }

    //달력 데이터
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/smartClass/calendarData", method = RequestMethod.GET)
    public @ResponseBody
    String calendarData(@RequestParam(value = "userID", required = false) String userID,
                        @RequestParam(value = "month", required = false) String month,
                        @RequestParam(value = "year", required = false) String year,
                        @RequestParam(value = "srvcID", required = false) String srvcID,
                        Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("userID", userID);
        requestMap.put("month", month);
        requestMap.put("year", year);
        requestMap.put("srvcID", srvcID);

        List list = smartClassService.selectListNoPage("smartClass.calendar", requestMap);

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("userID", userID);
        obj.put("month", month);
        obj.put("year", year);
        obj.put("srvcID", srvcID);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

    //수강내역
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/smartClass/lessonsList")
    public ModelAndView lessonsList(HttpServletRequest request, Map requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request); //srvcID, userID

        if (requestMap.get("cSrvcID") == null) {
            requestMap.put("srvcID", "3");
        } else {
            requestMap.put("srvcID", requestMap.get("cSrvcID"));
        }
        //        requestMap.put("userID", "kut0001");

        if (requestMap.get("cmplYn") == null) {
            requestMap.put("cmplYn", "N");
        }

        requestMap.put("listSize", "5");

        List list = smartClassService.selectList(TARGET + LESSONSLIST, requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        Map categoryMap = new HashMap();
        categoryMap.put("srvcID", "3");
        List categoryList = smartClassService.selectListNoPage("category.selectList", categoryMap);

        String langType = "00034";
        if ("en".equals(requestMap.get("lang"))) {
            langType = "00033";
        } else if ("my".equals(requestMap.get("lang"))) {
            langType = "00034";
        }
        requestMap.put("langType", langType);

        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("langType", langType);
        modelAndView.addObject("lessonsList", list);
        modelAndView.addObject("searchSrvcID", requestMap.get("srvcID"));
        modelAndView.addObject("cmplYn", requestMap.get("cmplYn"));
        modelAndView.addObject("param", requestMap);

        modelAndView.setViewName(TARGET + LESSONSLIST);

        return modelAndView;
    }

    //수강내역 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/smartClass/lessonsListCmplYn", method = RequestMethod.GET)
    public @ResponseBody
    String lessonsListCmplYn(@RequestParam(value = "userID", required = false) String userID,
                             @RequestParam(value = "cmplYn", required = false) String cmplYn,
                             Model mode) {

        Map requestMap = new HashMap();

        requestMap.put("srvcID", "3");
        requestMap.put("userID", userID);
        requestMap.put("cmplYn", cmplYn);

        requestMap.put("listSize", "5");

        List list = smartClassService.selectList(TARGET + LESSONSLIST, requestMap);

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("cmplYn", cmplYn);
        obj.put("userID", userID);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

    //VOD 다운로드_APP
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/smartClass/download")
    public void fileDownload(HttpServletRequest request,
                             @RequestParam(value = "itemID", required = false) String itemID,
                             @RequestParam(value = "userID", required = false) String userID,
                             @RequestParam(value = "macAddr", required = false) String macAddr,
                             @RequestParam(value = "godsID", required = false) String godsID,
                             @RequestParam(value = "learningType", required = false) String learningType,
                             HttpServletResponse response) throws Exception {

        Map pMap = getParameterMap(request);

        pMap.put("itemID", itemID);

        Map asset = (Map)smartClassService.select("smartClass.asset", pMap);
        String fileName = (String)asset.get("ITEM_01");
        String contentName = (String)asset.get("CNTS_NAME");

        String filePath = vodPath;
        //        String fileName = "T6_MATH.mp4";
        //        String contentName = "동영상 제목";

        Map fileMap = new HashMap();
        fileMap.put("macAddr", macAddr);
        fileMap.put("userID", userID);
        fileMap.put("contentName", contentName);

        fileMap.put("filePath", filePath);
        fileMap.put("fileName", fileName);

//        String dfile = DrmManager.drmdownload(fileMap);

//        File file = new File(dfile);
//        int fileSize = (int)file.length();
//        String dcfFile = file.getName();

        byte[] buffer = new byte[2048];

        response.setContentType("video/quicktime");
//        response.setHeader("Content-Disposition:", "attachment; filename=" + dcfFile);
//        response.setContentLength(fileSize);
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");

        BufferedInputStream fin = null;
        BufferedOutputStream outs = null;

        try {
//            fin = new BufferedInputStream(new FileInputStream(file));
            outs = new BufferedOutputStream(response.getOutputStream());
            int read = 0;

            while ((read = fin.read(buffer)) != -1) {
                outs.write(buffer, 0, read);
            }
        } finally {
            if (outs != null) {
                try {
                    outs.close();
                } catch (Exception ignore) {

                }
            }
            if (fin != null) {
                try {
                    fin.close();
                } catch (Exception ignore) {

                }
            }
        }

        Map requestMap = new HashMap();
        requestMap.put("itemID", itemID);
        requestMap.put("godsID", godsID);
        requestMap.put("userID", userID);

        Price price = new Price();
        price.setTagetID(itemID);
        price = priceService.select("price.read", price);

        pMap.put("useHsNmbrID", DateFormatUtil.getRandomID());
        pMap.put("startTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        //        pMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        if ("smartcalss".equals(learningType)) {
            pMap.put("cmplYN", "N");
        } else if ("englishvillage".equals(learningType)) {
            pMap.put("cmplYN", "Y");
        }
        pMap.put("payKind", price.getPayKindCd());
        pMap.put("pricType", price.getPricTypeCd());
        pMap.put("pricUnit", price.getPricUnitCd());
        pMap.put("flatRate", price.getFlatRate());
        pMap.put("depositRate", price.getDepositRate());
        pMap.put("rentDay", price.getRentDay());
        pMap.put("userID", userID);
        pMap.put("godsID", godsID);
        pMap.put("itemID", itemID);
        pMap.put("frstRgstUserID", userID);
        pMap.put("latCrctUserID", userID);

        Map checkMap = (Map)smartClassService.select("smartClass.checkUseHS", requestMap);

        if (checkMap == null) {
            smartClassService.insert("smartClass.inserUseHS", pMap);
        } else {
            smartClassService.update("smartClass.updateUseHS", pMap);
        }

    }

    //동영상 재생시 사용이력 기록
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/smartClass/insertUseHS", method = RequestMethod.GET)
    public @ResponseBody
    String updateUseHs(@RequestParam(value = "itemID", required = false) String itemID,
                       @RequestParam(value = "godsID", required = false) String godsID,
                       @RequestParam(value = "userID", required = false) String userID,
                       Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("itemID", itemID);
        requestMap.put("godsID", godsID);
        requestMap.put("userID", userID);

        Price price = new Price();
        price.setTagetID(itemID);
        price = priceService.select("price.read", price);

        Map pMap = new HashMap();
        pMap.put("useHsNmbrID", DateFormatUtil.getRandomID());
        pMap.put("startTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        //        pMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        pMap.put("cmplYN", "N");
        pMap.put("payKind", price.getPayKindCd());
        pMap.put("pricType", price.getPricTypeCd());
        pMap.put("pricUnit", price.getPricUnitCd());
        pMap.put("flatRate", price.getFlatRate());
        pMap.put("depositRate", price.getDepositRate());
        pMap.put("rentDay", price.getRentDay());
        pMap.put("userID", userID);
        pMap.put("godsID", godsID);
        pMap.put("itemID", itemID);
        pMap.put("frstRgstUserID", userID);
        pMap.put("latCrctUserID", userID);

        Map checkMap = (Map)smartClassService.select("smartClass.checkUseHS", requestMap);

        if (checkMap == null) {
            smartClassService.insert("smartClass.inserUseHS", pMap);
        } else {
            smartClassService.update("smartClass.updateUseHS", pMap);
        }

        JSONObject obj = new JSONObject();
        obj.put("itemID", itemID);
        obj.put("godsID", godsID);
        obj.put("userID", userID);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

    //수강상태 변경
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/smartClass/updateUseHS", method = RequestMethod.GET)
    public @ResponseBody
    String getAssetList(@RequestParam(value = "userID", required = false) String userID,
                        @RequestParam(value = "useHsID", required = false) String useHsID,
                        @RequestParam(value = "cmplYN", required = false) String cmplYN,
                        Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        requestMap.put("cmplYN", cmplYN);
        requestMap.put("useHsID", useHsID);
        requestMap.put("latCrctUserID", userID);

        smartClassService.update("smartClass.updateUseHS", requestMap);

        JSONObject obj = new JSONObject();
        obj.put("cmplYN", cmplYN);
        obj.put("useHsID", useHsID);
        obj.put("userID", userID);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/smartClass/getFilePath", method = RequestMethod.GET)
    public @ResponseBody
    String getProductList(@RequestParam(value = "itemID", required = false) String itemID,
                          @RequestParam(value = "USER_ID", required = false) String userID,
                          Model mode) {

        Map pMap = new HashMap();
        pMap.put("userID", userID);
        pMap.put("itemID", itemID);

        Map asset = (Map)smartClassService.select("smartClass.asset", pMap);

        String fileName = (String)asset.get("ITEM_01");

        String video = appUrl + appRoot + vodPath + fileName;

        JSONObject obj = new JSONObject();
        obj.put("filePath", video);

        Map requestMap = new HashMap();
        requestMap.put("itemID", itemID);
        requestMap.put("godsID", asset.get("GODS_ID"));
        requestMap.put("userID", userID);

        Price price = new Price();
        price.setTagetID(itemID);
        price = priceService.select("price.read", price);

        pMap.put("useHsNmbrID", DateFormatUtil.getRandomID());
        pMap.put("startTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        //        pMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        pMap.put("cmplYN", "N");
        pMap.put("payKind", price.getPayKindCd());
        pMap.put("pricType", price.getPricTypeCd());
        pMap.put("pricUnit", price.getPricUnitCd());
        pMap.put("flatRate", price.getFlatRate());
        pMap.put("depositRate", price.getDepositRate());
        pMap.put("rentDay", price.getRentDay());
        pMap.put("userID", userID);
        pMap.put("godsID", asset.get("GODS_ID"));
        pMap.put("itemID", itemID);
        pMap.put("frstRgstUserID", userID);
        pMap.put("latCrctUserID", userID);

        Map checkMap = (Map)smartClassService.select("smartClass.checkUseHS", requestMap);

        if (checkMap == null) {
            smartClassService.insert("smartClass.inserUseHS", pMap);
        } else {
            smartClassService.update("smartClass.updateUseHS", pMap);
        }

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }
}
