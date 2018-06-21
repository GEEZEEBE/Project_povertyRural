package com.skt.mars.adm.sm;

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

import com.skt.mars.adm.bm.Price;
import com.skt.mars.adm.bm.PriceService;
import com.skt.mars.adm.cm.CommonCodeService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.im.Gods;
import com.skt.mars.adm.im.GodsService;

/**
 * ItemConstroller - 서비스관리>아이템관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

@Controller
public class ItemController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "item.";

    private static String INSERT = "insert";

    private static String READ = "read";

    private static String DELETE = "delete";

    private static String LIST = "list";

    private static String EDIT = "edit";

    private static String UPDATE = "update";

    private static String PRICELIST = "priceList";

    @Autowired
    private ItemService itemService;

    @Autowired
    private GodsService godsService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CommonCodeService commonCodeService;

    @Autowired
    private PriceService priceService;

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Item();
    }

    //아이템 등록
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item/insert", method = RequestMethod.POST)
    public String submit(HttpServletRequest request,
                         Map<String, String> requestMap,
                         @ModelAttribute("command") @Valid Item item,
                         BindingResult result,
                         Model model) {
        // Check Validation
        if (result.hasErrors()) {
            return TARGET;
        }
        //        requestMap = getParameterMap(request);
        item.setFrstRgstUserID(requestMap.get("frstRgstUserID"));
        item.setLatCrctUserID(requestMap.get("latCrctUserID"));

        Price price = new Price();
        price.setTagetID(requestMap.get("godsID"));
        price = priceService.select("price.read", price);

        Map parameterMap = request.getParameterMap();
        String[] assetID = (String[])parameterMap.get("exceptAssetID");
        String[] cntsName = (String[])parameterMap.get("cntsName");
        String[] inputPrice = (String[])parameterMap.get("inputPrice");
        int i = 0;
        for (i = 0; assetID.length > i; i++) {

            String id = DateFormatUtil.getRandomID();
            item.setItemID(id);
            item.setAssetID(assetID[i]);
            item.setCntsName(cntsName[i]);
            item.setDelYN("N");
            itemService.insert(TARGET + INSERT, item);

            Map priceMap = new HashMap();
            priceMap.put("pricId", DateFormatUtil.getRandomID());
            priceMap.put("payKind", price.getPayKindCd());
            priceMap.put("pricType", price.getPricTypeCd());
            priceMap.put("pricUnit", price.getPricUnitCd());
            priceMap.put("depositRate", price.getDepositRate());
            priceMap.put("rentDay", price.getRentDay());
            priceMap.put("tagetID", id);
            priceMap.put("frstRgstUserID", price.getFrstRgstUserID());
            priceMap.put("latCrctUserID", price.getLatCrctUserID());
            priceMap.put("flatRate", inputPrice[i]);
            priceMap.put("managerKind", "ITEM");

            priceService.insert("price.insert", priceMap);

        }

        requestMap.put("depth", "0");
        requestMap.put("searchSrvcID", "");

        List list = itemService.selectList(TARGET + LIST, requestMap);
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        //상품구분 목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        //자산타입 목록 조회
        requestMap.put("keyID", "00600");
        List assetType = commonCodeService.selectList("commonCode.list", requestMap);

        if (requestMap.get("currentPage") == null) {
            model.addAttribute("currentPage", 1);
        } else {
            model.addAttribute("currentPage", requestMap.get("currentPage"));
        }

        model.addAttribute("assetType", assetType);
        model.addAttribute("godsDvsn", godsDvsn);
        model.addAttribute(LIST, list);
        model.addAttribute("DEPTH", categoryList);

        return TARGET + LIST;

    }

    //아이템 등록 페이지
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item")
    public ModelAndView insert(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request);

        requestMap.put("depth", "0");
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        //자산타입 조회
        requestMap.put("keyID", "00600");
        List assetType = commonCodeService.selectList("commonCode.list", requestMap);

        modelAndView.addObject("assetType", assetType);
        modelAndView.addObject("categoryList", categoryList);

        modelAndView.setViewName(TARGET + INSERT);

        return modelAndView;
    }

    //아이템 수정
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item/update", method = RequestMethod.POST)
    public String update(HttpServletRequest request,
                         Map<String, String> requestMap,
                         @ModelAttribute("command") @Valid Item item,
                         BindingResult result,
                         Model model) {
        // Check Validation
        if (result.hasErrors()) {
            return TARGET;
        }
        //        requestMap = getParameterMap(request);
        itemService.update(TARGET + UPDATE, requestMap);
        itemService.update("item.priceUpdate", requestMap);

        //아이템정보조회
        Map ritem = (Map)itemService.select(TARGET + READ, requestMap);

        //카테고리조회
        Map pMap = new HashMap();
        pMap = categoryService.select("category.read", requestMap);
        List categoryList = categoryService.selectCategoryList("category.node", pMap);

        model.addAttribute("currentPage", requestMap.get("currentPage"));
        model.addAttribute("ITEM", ritem);
        model.addAttribute("CATEGORY", categoryList);
        model.addAttribute("param", requestMap);

        return TARGET + READ;

    }

    //아이템 수정 페이지
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item/edit")
    public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request);

        //아이템정보조회
        Map item = (Map)itemService.select(TARGET + READ, requestMap);

        //카테고리조회
        Map pMap = new HashMap();
        pMap = categoryService.select("category.read", requestMap);
        List godsCategory = categoryService.selectCategoryList("category.node", pMap);

        requestMap.put("depth", "0");
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        modelAndView.addObject("ITEM", item);
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("godsCategory", godsCategory);

        modelAndView.addObject("param", requestMap);

        modelAndView.setViewName(TARGET + EDIT);

        return modelAndView;
    }

    //아이템 목록 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item/list")
    public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        List categoryListOne = null;
        List categoryListTwo = null;
        List categoryListThree = null;

        String categoryValue = "";
        //카테고리 리스트 조회
        requestMap.put("depth", "0");
        categoryListOne = categoryService.selectCategoryList("category.list", requestMap);
        // get category value
        if (requestMap.get("categoryOne") != null && requestMap.get("categoryOne").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryOne");
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("depth", (Integer.parseInt(cateSplit[0]) + 1) + "");
                requestMap.put("lft", cateSplit[1].toString());
                requestMap.put("rgt", cateSplit[2].toString());
                categoryListTwo = categoryService.selectCategoryList("category.list", requestMap);
            }
        }
        if (requestMap.get("categoryTwo") != null && requestMap.get("categoryTwo").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryTwo");
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("depth", (Integer.parseInt(cateSplit[0]) + 1) + "");
                requestMap.put("lft", cateSplit[1].toString());
                requestMap.put("rgt", cateSplit[2].toString());
                categoryListThree = categoryService.selectCategoryList("category.list", requestMap);
            }
        }
        if (requestMap.get("categoryThree") != null && requestMap.get("categoryThree").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryThree");
        }

        if (categoryValue != "") {
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("searchSrvcID", cateSplit[3].toString());
            }
        }

        List list = itemService.selectList(TARGET + LIST, requestMap);
        //상품구분 목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        //자산타입 목록 조회
        requestMap.put("keyID", "00600");
        List assetType = commonCodeService.selectList("commonCode.list", requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("pageSrvcID", requestMap.get("categoryOne"));
        modelAndView.addObject("pageSrvcID2", requestMap.get("categoryTwo"));
        modelAndView.addObject("pageSrvcID3", requestMap.get("categoryThree"));

        modelAndView.addObject("assetType", assetType);
        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject(LIST, list);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("DEPTH", categoryListOne);
        modelAndView.addObject("DEPTH1", categoryListTwo);
        modelAndView.addObject("DEPTH2", categoryListThree);

        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //아이템 상세정보 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item/read")
    public ModelAndView read(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

        //        requestMap = getParameterMap(request);

        //아이템정보조회
        Map item = (Map)itemService.select(TARGET + READ, requestMap);

        //카테고리조회
        Map pMap = new HashMap();
        pMap = categoryService.select("category.read", requestMap);
        List categoryList = categoryService.selectCategoryList("category.node", pMap);

        modelAndView.addObject("pageSrvcID", requestMap.get("categoryOne"));
        modelAndView.addObject("pageSrvcID2", requestMap.get("categoryTwo"));
        modelAndView.addObject("pageSrvcID3", requestMap.get("categoryThree"));

        modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        modelAndView.addObject("ITEM", item);
        modelAndView.addObject("CATEGORY", categoryList);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    //아이템 삭제
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/item/delete")
    public ModelAndView delete(HttpServletRequest request,
                               Map<String, String> requestMap,
                               ModelAndView modelAndView,
                               Model model) {

        requestMap = getParameterMap(request);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        int deleteCount = itemService.delete(TARGET + DELETE, requestMap.get("selectCheck"));

        requestMap.put("depth", "0");

        //상품목록 조회
        List list = itemService.selectList(TARGET + LIST, requestMap);

        //카테고리 리스트 조회
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        //상품구분 목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        //자산타입 목록 조회
        requestMap.put("keyID", "00600");
        List assetType = commonCodeService.selectList("commonCode.list", requestMap);

        modelAndView.addObject("assetType", assetType);
        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject(LIST, list);
        modelAndView.addObject("DEPTH", categoryList);

        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    @RequestMapping(value = "/adm/billing/priceItemList")
    public ModelAndView priceList(Map<String, String> requestMap, ModelAndView modelAndView) {
        // reload page by page 1
        if ("1".equals(requestMap.get("serTrue"))) {
            requestMap.put("currentPage", null);
            requestMap.put("listSize", null);
            //    				requestMap.clear();
        }

        List categoryListOne = null;
        List categoryListTwo = null;
        List categoryListThree = null;

        String categoryValue = "";
        //카테고리 리스트 조회
        requestMap.put("depth", "0");
        categoryListOne = categoryService.selectCategoryList("category.list", requestMap);
        // get category value
        if (requestMap.get("categoryOne") != null && requestMap.get("categoryOne").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryOne");
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("depth", (Integer.parseInt(cateSplit[0]) + 1) + "");
                requestMap.put("lft", cateSplit[1].toString());
                requestMap.put("rgt", cateSplit[2].toString());
                categoryListTwo = categoryService.selectCategoryList("category.list", requestMap);
            }
        }
        if (requestMap.get("categoryTwo") != null && requestMap.get("categoryTwo").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryTwo");
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("depth", (Integer.parseInt(cateSplit[0]) + 1) + "");
                requestMap.put("lft", cateSplit[1].toString());
                requestMap.put("rgt", cateSplit[2].toString());
                categoryListThree = categoryService.selectCategoryList("category.list", requestMap);
            }
        }
        if (requestMap.get("categoryThree") != null && requestMap.get("categoryThree").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryThree");
        }

        if (categoryValue != "") {
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("searchSrvcID", cateSplit[3].toString());
            }
        }
        //상품목록 조회
        List list = itemService.selectList(TARGET + "toalList", requestMap);

        requestMap.put("keyID", "00600");
        List godsDvsn = commonCodeService.selectList("commonCode.list2", requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject("list", list);

        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("DEPTH", categoryListOne);
        modelAndView.addObject("DEPTH1", categoryListTwo);
        modelAndView.addObject("DEPTH2", categoryListThree);

        modelAndView.setViewName(TARGET + PRICELIST);

        return modelAndView;
    }

    //아이템 등록시 상품 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/item/godsList", method = RequestMethod.GET)
    public @ResponseBody
    String getProductList(@RequestParam(value = "searchSrvcID", required = false) String searchSrvcID,
                          @RequestParam(value = "productType", required = false) String productType,
                          @RequestParam(value = "godsName", required = false) String godsName,
                          Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("searchSrvcID", searchSrvcID);
        requestMap.put("productType", productType);
        requestMap.put("searchGodsName", godsName);

        List list = itemService.selectListNoPage("gods.list", requestMap); // modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("searchSrvcID", searchSrvcID);
        obj.put("productType", productType);
        obj.put("godsName", godsName);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

    //아이템 등록시 상품 상세
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/item/godsInfo", method = RequestMethod.GET)
    public @ResponseBody
    String getGodsInfo(@RequestParam(value = "searchSrvcID", required = true) String searchSrvcID,
                       @RequestParam(value = "godsID", required = true) String godsID,
                       Model mode) {

        Map pMap = new HashMap();
        pMap.put("godsID", godsID);
        Map cMap = new HashMap();
        cMap.put("srvcID", searchSrvcID);

        cMap = categoryService.select("category.read", cMap);
        List categoryList = categoryService.selectCategoryList("category.node", cMap);

        Gods gods = new Gods();
        gods = godsService.select("gods.read", pMap);
        cMap.put("godsName", gods.getGodsName());
        cMap.put("godsID", gods.getGodsID());
        cMap.put("godsDvsn", gods.getGodsDvsn());
        cMap.put("description", gods.getDescription());
        cMap.put("srvcID", searchSrvcID);

        JSONObject obj = new JSONObject();
        obj.put("categoryList", categoryList);
        obj.put("godsInfo", cMap);

        obj.put("searchSrvcID", searchSrvcID);
        obj.put("godsID", godsID);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

    //아이템 등록시 자산 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/item/assetList", method = RequestMethod.GET)
    public @ResponseBody
    String getAssetList(@RequestParam(value = "assetType", required = false) String assetType,
                        @RequestParam(value = "assetName", required = false) String assetName,
                        @RequestParam(value = "exceptAssetID", required = false) String exceptAssetID,
                        Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("assetType", assetType);
        requestMap.put("assetName", assetName);

        String[] arr_assetID = exceptAssetID.split(":");
        requestMap.put("exceptAssetID", arr_assetID);

        List list = itemService.selectListNoPage("asset.popList", requestMap); // modify here

        JSONObject obj = new JSONObject();
        obj.put("itmes", list);
        obj.put("assetType", assetType);
        obj.put("assetName", assetName);

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }

}
