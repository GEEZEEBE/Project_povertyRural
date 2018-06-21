package com.skt.mars.usr.mp;

import java.util.HashMap;
import java.util.Locale;
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

@Controller
// modify here
public class MyPageController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "myPage."; // modify here

    private static String READ = "read";

    private static String UPDATE = "update";

    @Autowired
    private MyPageService myPageService; // modify here

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new MyPage(); // modify here
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/usr/myPage", method = RequestMethod.POST)
    public String submit(HttpServletRequest request,
                         Map<String, String> requestMap,
                         @ModelAttribute("command") @Valid MyPage myPage,
                         BindingResult result,
                         Model model) { // modify here
    //        requestMap = getParameterMap(request);

        int checkEdit = myPageService.update(TARGET + UPDATE, requestMap);

        Map pMap = new HashMap();
        pMap.put("userID", requestMap.get("userID"));

        myPage = myPageService.select(TARGET + READ, pMap);
        model.addAttribute("userInfo", myPage);

        model.addAttribute("param", requestMap);

        return TARGET + READ;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/usr/myPage/read")
    public ModelAndView view(HttpServletRequest request,
                             Map<String, String> requestMap,
                             Locale locale,
                             ModelAndView modelAndView) {
        //        requestMap = getParameterMap(request);

        //        requestMap.put("userID", "Kut0001"); //테스트용

        requestMap.put("userID", requestMap.get("frstRgstUserID"));
        MyPage command = myPageService.select(TARGET + READ, requestMap); // here

        modelAndView.addObject("userID", requestMap.get("frstRgstUserID"));
        modelAndView.addObject("userInfo", command);

        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/restful/myPage/changePwd", method = RequestMethod.GET)
    public @ResponseBody
    String changedPwd(@RequestParam(value = "userID", required = false) String userID,
                      @RequestParam(value = "pwd", required = false) String pwd,
                      Model mode) {
        Map requestMap = new HashMap();
        requestMap.put("userID", userID);
        requestMap.put("pwd", pwd);

        int checkEdit = myPageService.update(TARGET + UPDATE, requestMap);

        JSONObject obj = new JSONObject();
        obj.put("result", "seccess");

        String retrunValue = obj.toJSONString();
        return retrunValue;
    }
}
