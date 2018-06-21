package com.skt.mars.adm.sm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;

/**
 * CategoryConstroller - 서비스관리>서비스카테고리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

@Controller
public class CategoryController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "category.";

    private static String LIST = "list";

    private static String CATEGORYLIST = "categoryList";

    @Autowired
    private CategoryService categoryService; // modify here

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Category();
    }

    //카테고리 리스트 조회
    @RequestMapping(value = "/category/list", method = RequestMethod.GET)
    public ModelAndView searchDetCodeList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        //        List cList = categoryService.selectCategoryList(TARGET + CATEGORYLIST, pMap);

        //        mav.addObject("categoryList", cList);
        mav.setViewName(TARGET + LIST);

        return mav;
    }

    //카테고리 리스트 조회
    @RequestMapping(value = "/adm/category/categoryList", method = RequestMethod.GET)
    public ModelAndView selectCategoryList(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();

        Map pMap = new HashMap();
        //        Map pMap = getParameterMap(request);
        //        String depth = String.valueOf(pMap.get("depth"));
        //
        //        pMap.put("depth", "1");
        //        pMap.put("lft", "3");
        //        pMap.put("rgt", "36");

        List cList = categoryService.selectCategoryList("category.pageList", pMap);

        mav.addObject("categoryList", cList);
        mav.setViewName(TARGET + CATEGORYLIST);

        return mav;
    }

}
