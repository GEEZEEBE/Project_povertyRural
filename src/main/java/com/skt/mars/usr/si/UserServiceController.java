package com.skt.mars.usr.si;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.usr.ev.EnglishVillageService;

@Controller
@RequestMapping("/usr")
// modify here
public class UserServiceController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    private EnglishVillageService englishvillService; // modify here

    //list
    @RequestMapping(value = "/learningse", method = RequestMethod.GET)
    public ModelAndView learningse(Map requestMap, Locale locale, ModelAndView modelAndView) {

        modelAndView.addObject("lang", locale.getLanguage());
        modelAndView.setViewName("learningse");
        return modelAndView;
    }

    //list
    @RequestMapping(value = "/smartmain")
    public     ModelAndView
                smartclass(HttpServletRequest request, Map requestMap, Locale locale, ModelAndView modelAndView) {

        String langType = "00033";
        if ("en".equals(locale.getLanguage())) {
            langType = "00033";
        } else if ("my".equals(locale.getLanguage())) {
            langType = "00034";
        }
        modelAndView.addObject("lang", locale.getLanguage());
        modelAndView.addObject("langType", langType);
        modelAndView.setViewName("smartmain");
        return modelAndView;
    }

    //list
    @RequestMapping(value = "/englishvi")
    public ModelAndView englishvi(HttpServletRequest request, Map requestMap, Locale locale, ModelAndView modelAndView) {

        requestMap.put("srvcID", 23);
        List vod = englishvillService.selectListNoPage("englishvillage.select.limit", requestMap);

        requestMap.put("srvcID", 24);
        List ebook = englishvillService.selectListNoPage("englishvillage.select.limit", requestMap);

        String langType = "00033";
        if ("en".equals(locale.getLanguage())) {
            langType = "00033";
        } else if ("my".equals(locale.getLanguage())) {
            langType = "00034";
        }

        modelAndView.addObject("lang", locale.getLanguage());
        modelAndView.addObject("langType", langType);

        modelAndView.addObject("vod", vod);
        modelAndView.addObject("ebook", ebook);
        modelAndView.setViewName("englishvi");
        return modelAndView;
    }

}
