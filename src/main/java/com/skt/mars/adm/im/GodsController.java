package com.skt.mars.adm.im;

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
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.bm.Price;
import com.skt.mars.adm.bm.PriceService;
import com.skt.mars.adm.cm.CommonCodeService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.sm.CategoryService;

/**
 * 상품관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 29.
 */

@Controller
// modify here
public class GodsController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "gods."; // modify here

    private static String PRICE = "price.";

    private static String INSERT = "insert";

    private static String READ = "read";

    private static String LIST = "list";

    private static String EDIT = "edit";

    private static String UPDATE = "update";

    private static String DELETE = "delete";

    private static String PRICELIST = "priceList";

    @Autowired
    private GodsService godsService; // modify here

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CommonCodeService commonCodeService;

    @Autowired
    private PriceService priceService;

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Gods();
    }

    @ModelAttribute("price")
    protected Object formBackingPrice() throws Exception {
        return new Price();
    }

    //상품 등록
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/gods", method = RequestMethod.POST)
    public String submit(HttpServletRequest request,
                         Map<String, String> requestMap,
                         @ModelAttribute("command") @Valid Gods gods,
                         @ModelAttribute("price") @Valid Price price,
                         BindingResult result,
                         Model model) {

        //        requestMap = getParameterMap(request);

        String godsId = null;
        String pricId = null;

        String flagMethod = requestMap.get("method");

        if (flagMethod.equals("insert")) {
            godsId = DateFormatUtil.getRandomID();
            requestMap.put("godsId", godsId);

            //상품정보 등록
            Map godsMap = (HashMap)godsService.insert(TARGET + INSERT, requestMap);

            /* godsId = (String)godsMap.get("godsId"); */

            //상품 가격 등록
            requestMap.put("tagetID", godsId);
            requestMap.put("managerKind", "GOOD");

            pricId = DateFormatUtil.getRandomID();
            requestMap.put("pricId", pricId);
            Map pricMap = (HashMap)priceService.insert(PRICE + INSERT, requestMap);

        } else if (flagMethod.equals("edit")) {

            godsId = requestMap.get("godsID");
            pricId = requestMap.get("pricID");

            //상품정보 등록
            godsService.update(TARGET + UPDATE, requestMap);

            //상품 가격 등록
            requestMap.put("tagetID", godsId);
            requestMap.put("managerKind", "GOOD");
            priceService.update(PRICE + UPDATE, requestMap);

        }

        //상품정보 조회
        Map pMap = new HashMap();
        pMap.put("godsID", godsId);
        gods = godsService.select(TARGET + READ, pMap);

        //상품가격 조회
        price.setPricID(pricId);
        price.setTagetID(godsId);
        price.setManagerKind("GOOD");
        price = priceService.select(PRICE + READ, price);

        //카테고리조회
        pMap = categoryService.select("category.read", requestMap);
        List categoryList = categoryService.selectCategoryList("category.node", pMap);

        model.addAttribute("GODS", gods);
        model.addAttribute("PRICE", price);
        model.addAttribute("CATEGORY", categoryList);
        model.addAttribute("method", INSERT);

        return TARGET + READ;
    }

    //상품 등록 페이지
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/adm/gods/insert")
    public ModelAndView insert(Map<String, String> requestMap, ModelAndView modelAndView) {

        requestMap.put("depth", "0");

        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        //상품구분목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        //상품상태목록 조회
        requestMap.put("keyID", "00200");
        List godsStts = commonCodeService.selectList("commonCode.list", requestMap);

        //납부구분목록 조회
        requestMap.put("keyID", "00300");
        List dpstType = commonCodeService.selectList("commonCode.list", requestMap);

        //과금방식목록 조회
        requestMap.put("keyID", "00400");
        List pricType = commonCodeService.selectList("commonCode.list", requestMap);

        //과금단위목록 조회
        requestMap.put("keyID", "00500");
        List pricUnit = commonCodeService.selectList("commonCode.list", requestMap);

        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject("godsStts", godsStts);
        modelAndView.addObject("dpstType", dpstType);
        modelAndView.addObject("pricType", pricType);
        modelAndView.addObject("pricUnit", pricUnit);

        modelAndView.addObject("DEPTH", categoryList);

        modelAndView.setViewName(TARGET + INSERT);

        return modelAndView;
    }

    //상품 수정 페이지
    @SuppressWarnings("rawtypes")
    @RequestMapping(value = "/adm/gods/edit")
    public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

        requestMap.put("depth", "0");

        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        //상품구분목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        //상품상태목록 조회
        requestMap.put("keyID", "00200");
        List godsStts = commonCodeService.selectList("commonCode.list", requestMap);

        //납부구분목록 조회
        requestMap.put("keyID", "00300");
        List dpstType = commonCodeService.selectList("commonCode.list", requestMap);

        //과금방식목록 조회
        requestMap.put("keyID", "00400");
        List pricType = commonCodeService.selectList("commonCode.list", requestMap);

        //과금단위목록 조회
        requestMap.put("keyID", "00500");
        List pricUnit = commonCodeService.selectList("commonCode.list", requestMap);

        //상품정보조회
        requestMap = getParameterMap(request);
        Gods gods = godsService.select(TARGET + READ, requestMap);
        modelAndView.addObject("GODS", gods);

        //가격조회 
        Price price = new Price();
        price.setTagetID(requestMap.get("godsID"));
        price.setManagerKind("GOOD");
        price = priceService.select(PRICE + READ, price);
        modelAndView.addObject("PRICE", price);

        //카테고리조회
        Map pMap = new HashMap();
        pMap = categoryService.select("category.read", requestMap);
        List selectCategory = categoryService.selectCategoryList("category.node", pMap);

        List DEPTH1 = new ArrayList();
        List DEPTH2 = new ArrayList();
        List DEPTH3 = new ArrayList();
        String check = "";
        String check1 = "";
        String check2 = "";
        String check3 = "";
        //////////////////////////////////////////////////////////////
        for (int i = 0; i < selectCategory.size(); i++) {

            Map cMap = new HashMap();
            cMap = (Map)selectCategory.get(i);
            String srvcID = cMap.get("NODE_CATEGORY").toString();
            cMap.put("srvcID", srvcID);
            if (i == 0) {
                check = cMap.get("NODE_CATEGORY").toString();
                DEPTH1 = categoryService.selectCategoryList("category.selectList", cMap);
            } else if (i == 1) {
                check1 = cMap.get("NODE_CATEGORY").toString();
                DEPTH2 = categoryService.selectCategoryList("category.selectList", cMap);
            } else if (i == 2) {
                check2 = cMap.get("NODE_CATEGORY").toString();
                DEPTH3 = categoryService.selectCategoryList("category.selectList", cMap);
            } else if (i == 3) {
                check3 = cMap.get("NODE_CATEGORY").toString();
            }

        }
        //////////////////////////////////////////////////////////////

        modelAndView.addObject("selectCategory", selectCategory);

        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject("godsStts", godsStts);
        modelAndView.addObject("dpstType", dpstType);
        modelAndView.addObject("pricType", pricType);
        modelAndView.addObject("pricUnit", pricUnit);

        modelAndView.addObject("DEPTH", categoryList);
        modelAndView.addObject("DEPTH1", DEPTH1);
        modelAndView.addObject("DEPTH2", DEPTH2);
        modelAndView.addObject("DEPTH3", DEPTH3);
        modelAndView.addObject("check", check);
        modelAndView.addObject("check1", check1);
        modelAndView.addObject("check2", check2);
        modelAndView.addObject("check3", check3);

        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + EDIT);

        return modelAndView;
    }

    //상품 목록 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/gods/list")
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

        //상품목록 조회
        List list = godsService.selectList(TARGET + LIST, requestMap);

        //상품구분 목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        requestMap = getParameterMap(request);
        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject("godsList", list);
        modelAndView.addObject("requestMap", requestMap);

        modelAndView.addObject("pageSrvcID", requestMap.get("categoryOne"));
        modelAndView.addObject("pageSrvcID2", requestMap.get("categoryTwo"));
        modelAndView.addObject("pageSrvcID3", requestMap.get("categoryThree"));

        modelAndView.addObject("DEPTH", categoryListOne);
        modelAndView.addObject("DEPTH1", categoryListTwo);
        modelAndView.addObject("DEPTH2", categoryListThree);

        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //상품 상세 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/gods/read")
    public ModelAndView read(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

        //상품정보조회
        requestMap = getParameterMap(request);
        Gods gods = godsService.select(TARGET + READ, requestMap);
        modelAndView.addObject("GODS", gods);

        //가격조회 
        Price price = new Price();
        price.setTagetID(requestMap.get("godsID"));
        price.setManagerKind("GOOD");
        price = priceService.select(PRICE + READ, price);
        modelAndView.addObject("PRICE", price);

        //카테고리조회
        Map pMap = new HashMap();
        pMap = categoryService.select("category.read", requestMap);
        List categoryList = categoryService.selectCategoryList("category.node", pMap);
        modelAndView.addObject("CATEGORY", categoryList);

        modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    //상품 삭제
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/gods/delete")
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

        /*
         * Map parameterMap = request.getParameterMap(); String[] value = (String[])parameterMap.get("selectCheck"); int
         * i = 0; for (i = 0; value.length > i; i++) { Gods gods = new Gods(); gods.setGodsID(value[i]);
         * godsService.delete(TARGET + DELETE, gods); }
         */
        int deleteCount = godsService.delete(TARGET + DELETE, requestMap.get("selectCheck"));

        //상품목록 조회
        requestMap.put("depth", "0");
        List list = godsService.selectList(TARGET + LIST, requestMap);

        //카테고리 리스트 조회
        List categoryList = categoryService.selectCategoryList("category.list", requestMap);

        //상품구분 목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list", requestMap);

        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject("godsList", list);
        modelAndView.addObject("DEPTH", categoryList);

        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //상품 목록 조회
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/billing/priceList")
    public ModelAndView priceList(Map<String, String> requestMap, ModelAndView modelAndView) {
        // reload page by page 1
        if ("1".equals(requestMap.get("serTrue"))) {
            requestMap.put("currentPage", null);
            requestMap.put("listSize", null);
            //    				requestMap.clear();
        }
        List categoryList = null;
        List categoryList1 = null;
        List categoryList2 = null;

        // get category value
        String categoryValue = "";

        //카테고리 리스트 조회
        requestMap.put("depth", "0");
        categoryList = categoryService.selectCategoryList("category.list", requestMap);

        if (requestMap.get("categoryOne") != null && requestMap.get("categoryOne").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryOne");
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("depth", (Integer.parseInt(cateSplit[0]) + 1) + "");
                requestMap.put("lft", cateSplit[1].toString());
                requestMap.put("rgt", cateSplit[2].toString());
                categoryList1 = categoryService.selectCategoryList("category.list", requestMap);
            }
        }
        if (requestMap.get("categoryTwo") != null && requestMap.get("categoryTwo").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryTwo");
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("depth", (Integer.parseInt(cateSplit[0]) + 1) + "");
                requestMap.put("lft", cateSplit[1].toString());
                requestMap.put("rgt", cateSplit[2].toString());
                categoryList2 = categoryService.selectCategoryList("category.list", requestMap);
            }
        }
        if (requestMap.get("categoryThree") != null && requestMap.get("categoryThree").indexOf(":") != -1) {
            categoryValue = requestMap.get("categoryThree");

        }

        //// 카테고리별 상품목록 조회 SRVC_ID
        if (categoryValue != "") {
            String[] cateSplit = categoryValue.split(":");
            if (cateSplit.length > 0) {
                requestMap.put("categoryValue", cateSplit[3].toString());
            }
        }

        //상품목록 조회
        List list = godsService.selectList(TARGET + PRICELIST, requestMap);

        //상품구분 목록 조회
        requestMap.put("keyID", "00100");
        List godsDvsn = commonCodeService.selectList("commonCode.list2", requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("godsDvsn", godsDvsn);
        modelAndView.addObject("list", list);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.addObject("DEPTH", categoryList);
        modelAndView.addObject("DEPTH1", categoryList1);
        modelAndView.addObject("DEPTH2", categoryList2);

        modelAndView.setViewName(TARGET + PRICELIST);

        return modelAndView;
    }

}
