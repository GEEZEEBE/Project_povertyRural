package com.skt.mars.usr.nt;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.op.Notice;
import com.skt.mars.adm.op.NoticeService;

@Controller
@RequestMapping("/notice")
// modify here
public class UserNoticeController extends DefaultController {

    //	protected final Log logger = LogFactory.getLog(getClass());
    @Value("#{commonProperty['attach.file.path.root']}")
    private String attachFilePathRoot;

    // command words
    private static String TARGET = "notice."; // modify here

    private static String READ = "usrRead";

    private static String COUNT = "count";

    private static String LIST = "usrList";

    private static String PREV = "prev";

    private static String NEXT = "next";

    @Autowired
    private NoticeService noticeService; // modify here

    @ModelAttribute("command")
    protected Object formBackingObject() throws Exception {
        return new Notice(); // modify here
    }

    //list
    @RequestMapping(value = "/list")
    public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

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

        List<Notice> list = noticeService.selectList(TARGET + LIST, requestMap); // modify here

        if (requestMap.get("currentPage") == null) {
            modelAndView.addObject("currentPage", 1);
        } else {
            modelAndView.addObject("currentPage", requestMap.get("currentPage"));
        }

        modelAndView.addObject("serTxt", value);
        modelAndView.addObject("list", list);
        modelAndView.addObject("param", requestMap);
        modelAndView.setViewName(TARGET + LIST);

        return modelAndView;
    }

    //detail
    @RequestMapping(value = "/read")
    public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {

        requestMap = getParameterMap(request);
        Notice notice = noticeService.select(TARGET + READ, requestMap); // modify here
        int cnt = noticeService.update(TARGET + COUNT, notice); // modify here
        //next/prev
        Notice prevMap = noticeService.select(TARGET + PREV, requestMap);
        Notice nextMap = noticeService.select(TARGET + NEXT, requestMap);

        requestMap.put("targetID", requestMap.get("noticeId"));
        requestMap.put("fileType", "notFile");
        List fieMap = (List)noticeService.selectFile("usrFree.select.fileinfor", requestMap);
        modelAndView.addObject("fileMap", fieMap);

        modelAndView.addObject("prevMap", prevMap);
        modelAndView.addObject("nextMap", nextMap);
        modelAndView.addObject("command", notice);
        modelAndView.addObject("param", requestMap);
        modelAndView.addObject("requestMap", requestMap);
        modelAndView.setViewName(TARGET + READ);

        return modelAndView;
    }

    @RequestMapping(value = "/fileDown")
    public void handleFileDownload(HttpServletResponse res, Map<String, String> requestMap) {

        String Path = requestMap.get("path");
        String LogFname = "";
        String PhyFname = "";
        
        try {
            LogFname = new String(requestMap.get("logFname").getBytes("ISO-8859-1"), "UTF-8");
            PhyFname = new String(requestMap.get("phyFname").getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
	
        try {
            String fn = attachFilePathRoot + Path + "\\" + PhyFname;

            File f = new File(fn);
            System.out.println("Loading file " + fn + "(" + f.getAbsolutePath() + ")");

            if (f.exists()) {
                res.setContentLength(new Long(f.length()).intValue());
                String encodeResult = URLEncoder.encode(LogFname,"UTF-8");
                encodeResult = encodeResult.replace("+", " ");/// url encode 
                res.setHeader("Content-Disposition", "attachment; filename="+encodeResult);
                FileCopyUtils.copy(new FileInputStream(f), res.getOutputStream());
            } else {
                System.out.println("File" + fn + "(" + f.getAbsolutePath() + ") does not exist");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
