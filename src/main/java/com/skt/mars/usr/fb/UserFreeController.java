package com.skt.mars.usr.fb;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("/usrFree")
// modify here
public class UserFreeController extends DefaultController {

    //	protected final Log logger = LogFactory.getLog(getClass());

    // command words
    private static String TARGET = "usrFree."; // modify here

    private static String INSERT = "insert";

    private static String READ = "read";

    private static String LIST = "list";

    private static String EDIT = "edit";

    private static String DELETE = "delete";

    private static String PREV = "prev";

    private static String NEXT = "next";

    private static String REPLYLIST = "replylist";

    @Autowired
    private UserFreeService userFreeService; // modify here

    @RequestMapping(method = RequestMethod.GET)
    public String form(Model model) {
        return TARGET + INSERT;
    }

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new UserFree(); // modify here
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(method = RequestMethod.POST)
    public String submit(HttpServletRequest request,
                         Map requestFileMap,
                         @ModelAttribute("command") @Valid UserFree userFree,
                         BindingResult result,
                         Model model) { // modify here

        userFree.setFrstRgstUserID((String)requestFileMap.get("frstRgstUserID"));
        userFree.setLatCrctUserID((String)requestFileMap.get("latCrctUserID"));

        // Check Validation
        //		if (result.hasErrors() || requestFileMap.get("error") != null || requestFileMap.get("frstRgstUserID") == null) {
        // temporory 
        if (requestFileMap.get("frstRgstUserID") == null) {
        	
        	String returnURI = null;
        	
            Map tMap = new HashMap();
            tMap = getParameterMap(request);

            //result.getAllErrors().get(0).getDefaultMessage();
            //String dd = result.getFieldError("pw").getDefaultMessage();
            //System.out.println(dd);
            //result.getAllErrors().
            //			model.addAttribute("errorMap", result.getAllErrors());
            model.addAttribute("error", "Y");
            model.addAttribute("requestMap", tMap);

            if (tMap.get("flag").equals("w")) {
            	returnURI = TARGET + INSERT;
            } else if (tMap.get("flag").equals("e")) {
            	returnURI = TARGET + INSERT;
            }
            
            return returnURI;
        }

        String id = null;

        if (requestFileMap.get("flag").equals("w")) {
            id = DateFormatUtil.getRandomID();
            userFree.setBoardID(id);
            userFreeService.insert(TARGET + INSERT, userFree);
        } else if (requestFileMap.get("flag").equals("e")) {
            int checkEdit = userFreeService.update(TARGET + EDIT, userFree);
            id = userFree.getBoardID();
        }

        // insert table with File upload information
        List fileUploadList = (ArrayList)requestFileMap.get("fileList");
        Map fileMap = null;

        if (fileUploadList != null && fileUploadList.size() > 0) {
            int listSize = fileUploadList.size();

            for (int count = 0; count < listSize; count++) {
                fileMap = (HashMap)fileUploadList.get(count);
                fileMap.put("targetID", id); // Board ID after insert Record
                //                requestFileMap.putAll(fileMap);
                userFreeService.insert("usrFree.insert.fileinfor", fileMap);
            }
        }

        ////// reply list
        Map pMap = new HashMap();
        pMap.put("boardID", id);
        userFree = userFreeService.select(TARGET + READ, pMap);
        List<UserFree> replyList = userFreeService.selectList(TARGET + REPLYLIST, pMap);
        logger.info("submit user : " + userFree);

        ////// file list
        requestFileMap.put("targetID", userFree.getBoardID());
        requestFileMap.put("fileType", "freeFile");
        List fieMap = (List)userFreeService.selectFile("usrFree.select.fileinfor", requestFileMap);
        model.addAttribute("fileMap", fieMap);

        model.addAttribute("command", userFree);
        model.addAttribute("replyList", replyList);
        model.addAttribute("requestMap", requestFileMap);

        return TARGET + READ;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list(Map<String, String> requestMap, ModelAndView modelAndView) {

        // reload page by page 1
        if ("1".equals(requestMap.get("serTrue"))) {
            requestMap.put("currentPage", null);
            requestMap.put("listSize", null);
            //			requestMap.clear();
        }

        String value = "";
        if (requestMap.get("serTxt") == null || requestMap.get("serTxt").equals("")) {

        } else {
            try {
                value = new String(requestMap.get("serTxt").getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            requestMap.put("serTxt", value);
        }

        List<UserFree> list = userFreeService.selectList(TARGET + LIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("serTxt", value);
        modelAndView.addObject(LIST, list);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + LIST);
        return modelAndView;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/delete")
    public ModelAndView delete(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);

        userFreeService.delete(TARGET + "replyAlldelete", requestMap);
        userFreeService.delete(TARGET + DELETE, requestMap);

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        List<UserFree> list = userFreeService.selectList(TARGET + LIST, requestMap); // modify here
        modelAndView.addObject(LIST, list);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        /* requestMap = getParameterMap(request); */

        UserFree command = userFreeService.select(TARGET + READ, requestMap); // here
        userFreeService.update("usrFree.viewCnt", command);

        //comment list
        List<UserFree> replyList = userFreeService.selectList(TARGET + REPLYLIST, requestMap);
        //next/prev
        UserFree prevMap = userFreeService.select(TARGET + PREV, requestMap);
        UserFree nextMap = userFreeService.select(TARGET + NEXT, requestMap);

        requestMap.put("targetID", requestMap.get("boardID"));
        requestMap.put("fileType", "freeFile");
        List fieMap = (List)userFreeService.selectFile("usrFree.select.fileinfor", requestMap);
        modelAndView.addObject("fileMap", fieMap);

        modelAndView.addObject("command", command);
        modelAndView.addObject("replyList", replyList);
        modelAndView.addObject("prevMap", prevMap);
        modelAndView.addObject("nextMap", nextMap);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
        requestMap = getParameterMap(request);

        UserFree userFree = userFreeService.select(TARGET + READ, requestMap);
        logger.info("submit user : " + userFree);

        modelAndView.addObject("command", userFree);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + INSERT);
        return modelAndView;
    }

    @RequestMapping(value = "/replyInsert")
    public @ResponseBody
    ResponseEntity<String> replyInsert(@RequestParam(value = "boardID", required = true) String boardID,
                       @RequestParam(value = "replyCont", required = true) String replyCont,
                       @RequestParam(value = "frstRgstUserID", required = true) String frstRgstUserID,
                       Model mode,
                       Map<String, String> requestMap) {
    	
        Map requestMap2 = new HashMap();
        requestMap2.put("boardID", boardID);
        requestMap2.put("replyCont", replyCont);
        requestMap2.put("frstRgstUserID", requestMap.get("frstRgstUserID"));
        requestMap2.put("latCrctUserID", requestMap.get("frstRgstUserID"));

        //// modify
        if (requestMap.get("replyID") != null && requestMap.get("replyID").length() > 0) {
            requestMap2.put("comment", requestMap.get("comment"));
            requestMap2.put("replyID", requestMap.get("replyID"));
            userFreeService.replyupdate(TARGET + "replyupdate", requestMap2);
        } else { /// insert
            String id = null;
            id = DateFormatUtil.getRandomID();
            requestMap2.put("replyID", id);
            userFreeService.insert(TARGET + "replyinsert", requestMap2);
        }
         
        List<UserFree> replyList = userFreeService.selectList(TARGET + "replylist", requestMap2); // modify here
        
        JSONObject obj = new JSONObject();
        obj.put("itmes", replyList);
        //obj.put("serTxt", serTxt);
        String objString = obj.toJSONString();
        
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
        return new ResponseEntity<String>(objString, responseHeaders, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/replyDel")
    public @ResponseBody
    String replyDel(@RequestParam(value = "boardID", required = true) String boardID,
                    @RequestParam(value = "replyID", required = true) String replyID,
                    Model mode) {

        Map requestMap = new HashMap();
        requestMap.put("boardID", boardID);
        requestMap.put("replyID", replyID);

        userFreeService.delete(TARGET + "replydelete", requestMap);

        return "1";
    }

}
