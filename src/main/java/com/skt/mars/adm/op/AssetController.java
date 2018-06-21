package com.skt.mars.adm.op;

import java.text.DecimalFormat;
import java.util.ArrayList;
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

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

@Controller
// modify here
public class AssetController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "asset."; // modify here

    private static String CTARGET = "assetChild.";

    private static String LIST = "list";

    private static String DEL = "del";

    private static String INSERT = "insert";

    private static String EDIT = "edit";

    private static String READ = "read";

    @Autowired
    private AssetService assetService; // modify here

    @Autowired
    private CostService costService; // modify here

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Asset(); // modify here
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/asset", method = RequestMethod.POST)
    public String submit(Map requestFileMap,
                         @ModelAttribute("command") @Valid Asset asset,
                         BindingResult result,
                         Model model) {

        // Check Validation
        //        if (result.hasErrors()) {
        //            return TARGET + INSERT;
        //        }
        /*
         * requestMap = getParameterMap(request); Map parameterMap = request.getParameterMap();
         */
        asset.setFrstRgstUserID((String)requestFileMap.get("frstRgstUserID"));
        asset.setLatCrctUserID((String)requestFileMap.get("latCrctUserID"));

        String type = requestFileMap.get("type").toString();
        String inputLangType = requestFileMap.get("langType").toString();

        if (type.equals("00601")) {
            String mac = requestFileMap.get("pcMacOne").toString() + ":"
                         + requestFileMap.get("pcMacTwo").toString()
                         + ":"
                         + requestFileMap.get("pcMacThree").toString()
                         + ":"
                         + requestFileMap.get("pcMacFour").toString()
                         + ":"
                         + requestFileMap.get("pcMacFive").toString()
                         + ":"
                         + requestFileMap.get("pcMacSix").toString();
            String ip = requestFileMap.get("pcIpOne").toString() + ":"
                        + requestFileMap.get("pcIpTwo").toString()
                        + ":"
                        + requestFileMap.get("pcIpThree").toString()
                        + ":"
                        + requestFileMap.get("pcIpFour").toString();

            //            asset.setAssetID("90");
            asset.setItemNM(requestFileMap.get("pcName").toString()); //이름
            asset.setItem01(mac); //Mac-address
            asset.setItem02(ip); //IP-address
            asset.setItem04(requestFileMap.get("pcSpec").toString()); //spec
            asset.setItem05(requestFileMap.get("pcSerial").toString()); //serial
            asset.setItem07(requestFileMap.get("pcEtc").toString()); //etc

        } else if (type.equals("00602")) {
            String mac = requestFileMap.get("tabletMacOne").toString() + ":"
                         + requestFileMap.get("tabletMacTwo").toString()
                         + ":"
                         + requestFileMap.get("tabletMacThree").toString()
                         + ":"
                         + requestFileMap.get("tabletMacFour").toString()
                         + ":"
                         + requestFileMap.get("tabletMacFive").toString()
                         + ":"
                         + requestFileMap.get("tabletMacSix").toString();
            //            asset.setAssetID("91");
            asset.setItemNM(requestFileMap.get("tabletName").toString()); //이름
            asset.setItem01(mac); //Mac-address
            asset.setItem04(requestFileMap.get("tabletSpec").toString()); //spec
            asset.setItem05(requestFileMap.get("tabletSerial").toString()); //serial
            asset.setItem07(requestFileMap.get("tabletEtc").toString()); //etc

        } else if (type.equals("00603")) {

            String hour = requestFileMap.get("runningTimeHour").toString();
            String min = requestFileMap.get("runningTimeMin").toString();
            String time = hour + ":" + min;

            asset.setItemNM(requestFileMap.get("vodNameEng").toString()); //이름

            asset.setItem01(requestFileMap.get("vodFile").toString()); //첨부파일경로

            asset.setItem04(time); //재생시간
            asset.setItem05(requestFileMap.get("dvdSerial").toString()); //serial
            asset.setItem07(requestFileMap.get("dvdEtc").toString()); //etc

            if (inputLangType.equals("00033")) {
                asset.setItem02(requestFileMap.get("vodNameEng").toString()); //자산명 eng
                asset.setItem03(requestFileMap.get("vodNameEng").toString()); //자산명 mal

                asset.setItem08(requestFileMap.get("dvdIntroEng").toString()); //Class introduce eng
                asset.setItem09(requestFileMap.get("dvdIntroEng").toString()); //Class introduce mal

            } else if (inputLangType.equals("00034")) {
                asset.setItem02(requestFileMap.get("vodNameMal").toString()); //자산명 eng
                asset.setItem03(requestFileMap.get("vodNameMal").toString()); //자산명 mal

                asset.setItem08(requestFileMap.get("dvdIntroMal").toString()); //Class introduce eng
                asset.setItem09(requestFileMap.get("dvdIntroMal").toString()); //Class introduce mal
            } else {
                asset.setItem02(requestFileMap.get("vodNameEng").toString()); //자산명 eng
                asset.setItem03(requestFileMap.get("vodNameMal").toString()); //자산명 mal

                asset.setItem08(requestFileMap.get("dvdIntroEng").toString()); //Class introduce eng
                asset.setItem09(requestFileMap.get("dvdIntroMal").toString()); //Class introduce mal
            }

        } else if (type.equals("00604")) {
            //            asset.setAssetID("93");
            asset.setItemNM(requestFileMap.get("eBookTitleEng").toString()); //제목
            asset.setItem01(requestFileMap.get("eBookFile").toString()); //eBookFile 
            asset.setItem05(requestFileMap.get("eBookSerial").toString()); //serial
            asset.setItem07(requestFileMap.get("eBookEtc").toString()); //etc

            String eBookLangType = requestFileMap.get("eBookLangType").toString();

            if (eBookLangType.equals("00033")) {
                asset.setItem02(requestFileMap.get("eBookTitleEng").toString()); //title_eng
                asset.setItem03(requestFileMap.get("eBookTitleEng").toString()); //title_mal
                asset.setItem08(requestFileMap.get("eBookSummaryEng").toString()); //sumary_eng
                asset.setItem09(requestFileMap.get("eBookSummaryEng").toString()); //sumary_mal

            } else if (eBookLangType.equals("00034")) {
                asset.setItem02(requestFileMap.get("eBookTitleMal").toString()); //title_eng
                asset.setItem03(requestFileMap.get("eBookTitleMal").toString()); //title_mal
                asset.setItem08(requestFileMap.get("eBookSummaryMal").toString()); //sumary_eng
                asset.setItem09(requestFileMap.get("eBookSummaryMal").toString()); //sumary_mal
            } else {
                asset.setItem02(requestFileMap.get("eBookTitleEng").toString()); //title_eng
                asset.setItem03(requestFileMap.get("eBookTitleMal").toString()); //title_mal
                asset.setItem08(requestFileMap.get("eBookSummaryEng").toString()); //sumary_eng
                asset.setItem09(requestFileMap.get("eBookSummaryMal").toString()); //sumary_mal
            }

        } else if (type.equals("00605")) {
            //            asset.setAssetID("94");
            asset.setItemNM(requestFileMap.get("etcName").toString()); //이름
            asset.setItem05(requestFileMap.get("etcSerial").toString()); //serial
            asset.setItem07(requestFileMap.get("etc").toString()); //etc
            //            asset.setItem08(requestFileMap.get("etcSummary").toString()); //Class introduce
        } else if (type.equals("00606")) {
            String mac = requestFileMap.get("outMacOne").toString() + ":"
                         + requestFileMap.get("outMacTwo").toString()
                         + ":"
                         + requestFileMap.get("outMacThree").toString()
                         + ":"
                         + requestFileMap.get("outMacFour").toString()
                         + ":"
                         + requestFileMap.get("outMacFive").toString()
                         + ":"
                         + requestFileMap.get("outMacSix").toString();
            //            asset.setAssetID("91");
            asset.setItemNM(requestFileMap.get("outName").toString()); //이름
            asset.setItem01(mac); //Mac-address
            asset.setItem04(requestFileMap.get("outSpec").toString()); //spec
            asset.setItem05(requestFileMap.get("outSerial").toString()); //serial
            asset.setItem07(requestFileMap.get("outEtc").toString()); //etc    
        }

        asset.setAssetTypeCD(requestFileMap.get("type").toString()); //타입
        asset.setCostpricID(requestFileMap.get("setCostpricID").toString());

        /*
         * asset.setFrstRgstUserID("admin"); asset.setLatCrctUserID("admin");
         */
        asset.setAssetYN("Y");

        String id = null;
        if (requestFileMap.get("flag").equals("w")) {
            id = DateFormatUtil.getRandomID();
            asset.setAssetID(id);
            assetService.insert(TARGET + INSERT, asset);
        } else if (requestFileMap.get("flag").equals("e")) {
            assetService.update(TARGET + EDIT, asset);
            id = asset.getAssetID();
        }

        if (type.equals("00603")) {
            Map engMap = new HashMap();
            Map malMap = new HashMap();
            engMap.put("assetID", id);
            malMap.put("assetID", id);

            assetService.delete(CTARGET + DEL, engMap);

            //ENG 입력
            engMap.put("langType", "00033");
            //            pMap.put("langType", requestFileMap.get("langType").toString());
            engMap.put("fristName", requestFileMap.get("fristNameEng").toString());
            engMap.put("lastName", requestFileMap.get("lastNameEng").toString());
            engMap.put("vodMajor", requestFileMap.get("vodMajorEng").toString());
            engMap.put("qualification", requestFileMap.get("qualificationEng").toString());
            engMap.put("period", requestFileMap.get("periodEng").toString());
            engMap.put("honors", requestFileMap.get("honorsEng").toString());
            engMap.put("other", requestFileMap.get("otherEng").toString());

            //MAL 입력
            malMap.put("langType", "00034");
            //            pMap.put("langType", requestFileMap.get("langType").toString());
            malMap.put("fristName", requestFileMap.get("fristNameMal").toString());
            malMap.put("lastName", requestFileMap.get("lastNameMal").toString());
            malMap.put("vodMajor", requestFileMap.get("vodMajorMal").toString());
            malMap.put("qualification", requestFileMap.get("qualificationMal").toString());
            malMap.put("period", requestFileMap.get("periodMal").toString());
            malMap.put("honors", requestFileMap.get("honorsMal").toString());
            malMap.put("other", requestFileMap.get("otherMal").toString());

            if (inputLangType.equals("00033")) {
                assetService.childInsert(CTARGET + INSERT, engMap);
                engMap.put("langType", "00034");
                assetService.childInsert(CTARGET + INSERT, engMap);
            } else if (inputLangType.equals("00034")) {
                assetService.childInsert(CTARGET + INSERT, malMap);
                malMap.put("langType", "00033");
                assetService.childInsert(CTARGET + INSERT, malMap);
            } else {
                assetService.childInsert(CTARGET + INSERT, engMap);
                assetService.childInsert(CTARGET + INSERT, malMap);
            }

            //MAL 입력 추가작업 필요

        }

        // insert table with File upload information
        List fileUploadList = (ArrayList)requestFileMap.get("fileList");
        Map fileMap = null;

        if (fileUploadList != null && fileUploadList.size() > 0) {
            int listSize = fileUploadList.size();

            for (int count = 0; count < listSize; count++) {
                fileMap = (HashMap)fileUploadList.get(count);
                //                String fileType = (String)fileMap.get("fileName");
                //                fileMap.put("fileType", fileType);
                //                requestFileMap.putAll(fileMap);
                if (requestFileMap.get("flag").equals("w")) {
                    fileMap.put("targetID", id); // Board ID after insert Record
                    assetService.insert("usrFree.insert.fileinfor", fileMap);
                } else if (requestFileMap.get("flag").equals("e")) {
                    fileMap.put("assetID", requestFileMap.get("assetID"));
                    assetService.update("asset.fileUpdate", fileMap);
                }
            }
        }

        List<Asset> list = assetService.selectList(TARGET + LIST, requestFileMap);

        if (requestFileMap.get("currentPage") == null) {
            model.addAttribute("currentPage", 1);
        } else {
            model.addAttribute("currentPage", requestFileMap.get("currentPage").toString());
        }
        model.addAttribute("requestMap", requestFileMap);
        model.addAttribute("list", list);
        return TARGET + LIST;
    }

    @RequestMapping(value = "/adm/asset/list")
    public ModelAndView asset0(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
    	requestMap = getParameterMap(request);
    	
    	// reload page by page 1
    			if("1".equals(requestMap.get("serTrue"))){
    				requestMap.put("currentPage", null);
    				requestMap.put("listSize", null);
//    				requestMap.clear();
    			}
    	
    	
        List<Asset> list = assetService.selectList(TARGET + LIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("list", list);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //Asset modify
    @RequestMapping(value = "/adm/asset/read")
    public     ModelAndView
                assetRead(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        Asset asset = assetService.select(TARGET + READ, requestMap); // modify here

        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("command", asset);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    //Asset del
    @RequestMapping(value = "/adm/asset/del", method = RequestMethod.POST)
    public ModelAndView asset1(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);

        int delete = assetService.update(TARGET + DEL, requestMap); // modify here

        List<Asset> list = assetService.selectList(TARGET + LIST, requestMap); // modify here
        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("list", list);
        modelAndView.setViewName(TARGET + LIST);
        return modelAndView;

    }

    //Asset delete(상세)
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/asset/delete", method = RequestMethod.POST)
    public String assetDelete(Map requestFileMap,
                              @ModelAttribute("command") @Valid Asset asset,
                              BindingResult result,
                              Model model) {

        int delete = assetService.update(TARGET + DEL, requestFileMap); // modify here

        Map pMap = new HashMap();
        List<Asset> list = assetService.selectList(TARGET + LIST, pMap); // modify here

        model.addAttribute("currentPage", 1);
        model.addAttribute("list", list);

        return TARGET + LIST;
    }

    //Asset insert
    @RequestMapping(value = "/adm/asset/insert")
    public ModelAndView asset2(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        modelAndView.addObject("requestMap", requestMap);

        Integer cnt = (Integer)assetService.selectByCategoryID(TARGET + "MaxCount", requestMap);
        String markString = "sn_kut_tb_";
        DecimalFormat df = new DecimalFormat("00000");
        markString = markString + df.format(cnt + 1);
        requestMap.put("creatSerial", markString);
        modelAndView.setViewName(TARGET + INSERT);
        return modelAndView;
    }

    //Asset modify
    @RequestMapping(value = "/adm/asset/edit")
    public ModelAndView asset3(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);
        Asset asset = assetService.select(TARGET + READ, requestMap); // modify here

        if ("00603".equals(asset.getAssetTypeCD())) {
            String runTime = asset.getItem04();
            if (runTime.equals(":")) {
                modelAndView.addObject("hour", "");
                modelAndView.addObject("min", "");
            } else {
                String[] time = runTime.split(":");
                modelAndView.addObject("hour", time[0]);
                modelAndView.addObject("min", time[1]);
            }
        } else if ("00601".equals(asset.getAssetTypeCD())) {
            String runTime = asset.getItem02();
            String[] time = runTime.split(":");
            modelAndView.addObject("ipOne", time[0]);
            modelAndView.addObject("ipTwo", time[1]);
            modelAndView.addObject("ipThree", time[2]);
            modelAndView.addObject("ipFour", time[3]);

        }

        requestMap.put("costpricID", asset.getCostpricID());
        Cost cost = costService.select("cost.read", requestMap);

        List assetChildList = assetService.selectListNoPage("assetChild.read", requestMap); // modify here

        List fileList = assetService.selectListNoPage("asset.fileList", requestMap);

        modelAndView.addObject("fileList", fileList);

        modelAndView.addObject("cost", cost);
        modelAndView.addObject("assetChildList", assetChildList);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("command", asset);
        modelAndView.setViewName(TARGET + INSERT);

        return modelAndView;
    }

    //Asset Insert 원가조회
    @RequestMapping(value = "/restful/asset/costList", method = RequestMethod.GET)
    public @ResponseBody
    String getCostList(@RequestParam(value = "assetTypeCD", required = false) String assetTypeCD, Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("assetTypeCD", assetTypeCD);

        List list = assetService.selectListNoPage("cost.allList", requestMap); // modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("assetTypeCD", assetTypeCD);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

}
