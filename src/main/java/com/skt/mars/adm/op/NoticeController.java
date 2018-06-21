package com.skt.mars.adm.op;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
@RequestMapping("/adm/notice")	// modify here
public class NoticeController extends DefaultController {
protected final Log logger = LogFactory.getLog(getClass());
	
	@Value("#{commonProperty['attach.file.path.root']}")
	private String attachFilePathRoot;

	// command words
	private static String TARGET = "notice.";	// modify here
	private static String READ = "ntRead";
	private static String LIST = "ntList";
	private static String EDIT = "ntEdit";
	private static String DEL = "ntDel";
	private static String INSERT = "ntInsert";
	private static String PREV = "prev";
	private static String NEXT = "next";
	
	@Autowired
	private NoticeService noticeService;	// modify here
	
	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Notice();	// modify here
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST)
	public String submit(HttpServletRequest request, Map requestFileMap,@ModelAttribute("command") @Valid Notice notice,
			BindingResult result, Model model) {	// modify here
//		requestMap = getParameterMap(request);
		notice.setFrstRgstUserID((String) requestFileMap.get("frstRgstUserID"));
		notice.setLatCrctUserID((String) requestFileMap.get("latCrctUserID"));
		
		// Check Validation
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

        String id=null;
		
		notice.setFrstRgstUserID((String) requestFileMap.get("frstRgstUserID"));
		if(requestFileMap.get("flag").equals("w")){
			id = DateFormatUtil.getRandomID();
			notice.setNoticeId(id);
			noticeService.insert(TARGET+INSERT, notice);
			requestFileMap.put("noticeId", id);
		}
		else if(requestFileMap.get("flag").equals("e")){
			int checkEdit = noticeService.update(TARGET+EDIT, notice);
			id = notice.getNoticeId();
			
			
		}

		// insert table with File upload information
        List fileUploadList = (ArrayList)requestFileMap.get("fileList");
        Map fileMap = null;

        if (fileUploadList != null && fileUploadList.size() > 0) {
            int listSize = fileUploadList.size();

            for (int count = 0; count < listSize; count++) {
                fileMap = (HashMap)fileUploadList.get(count);
                fileMap.put("targetID", id);	// Board ID after insert Record
//                requestFileMap.putAll(fileMap);
                noticeService.insert("usrFree.insert.fileinfor", fileMap);
            }
        }
		
        Notice readNotice = noticeService.select(TARGET+READ, requestFileMap);	// modify here
        
        requestFileMap.put("targetID",id);
        requestFileMap.put("fileType","notFile");
		List fieMap = (List)noticeService.selectFile("usrFree.select.fileinfor", requestFileMap);
		model.addAttribute("fileMap", fieMap);
		
        logger.info("submit user : "+readNotice);
		model.addAttribute("command", readNotice);
		model.addAttribute("requestMap", requestFileMap);

		return TARGET+READ;
	}
	//list
	@RequestMapping(value="/list")
	public ModelAndView list(HttpServletRequest request,Map<String, String> requestMap,ModelAndView modelAndView) {

		// reload page by page 1
		if("1".equals(requestMap.get("serTrue"))){
			requestMap.put("currentPage", null);
			requestMap.put("listSize", null);
//			requestMap.clear();
		}

		List<Notice> list = noticeService.selectList(TARGET+LIST, requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		modelAndView.addObject("list", list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		 
		return modelAndView;
	}
	//detail
	@RequestMapping(value="/read")
	public ModelAndView view(HttpServletRequest request,Map<String, String> requestMap,ModelAndView modelAndView) {
//		requestMap = getParameterMap(request);
		
		if(requestMap.get("strNoticeId") != null){
			requestMap.put("noticeId",requestMap.get("strNoticeId"));
		}
		
		Notice notice = noticeService.select(TARGET+READ, requestMap);	// modify here
		//int cnt = noticeService.update(TARGET+COUNT, notice);	// modify here
		//next/prev
		Notice prevMap = noticeService.select(TARGET+PREV, requestMap);
		Notice nextMap = noticeService.select(TARGET+NEXT, requestMap);
		
		
		requestMap.put("targetID",requestMap.get("noticeId"));
		requestMap.put("fileType","notFile");
		List fieMap = (List)noticeService.selectFile("usrFree.select.fileinfor", requestMap);
		
		modelAndView.addObject("prevMap", prevMap);
		modelAndView.addObject("nextMap", nextMap);
		modelAndView.addObject("command", notice);
		modelAndView.addObject("fileMap", fieMap);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+READ);
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="/insert")
	public ModelAndView insert(HttpServletRequest request,Map<String, String> requestMap,ModelAndView modelAndView) {
//		requestMap = getParameterMap(request);
		
		Notice notice = noticeService.select(TARGET+READ, requestMap);
		if(requestMap.get("flag").equals("w")){
			notice = null;
		}else if(requestMap.get("flag").equals("e")){			
			requestMap.put("targetID",requestMap.get("noticeId"));
			requestMap.put("fileType","notFile");
			List fieMap = (List)noticeService.selectFile("usrFree.select.fileinfor", requestMap);
			modelAndView.addObject("fileMap", fieMap);
		}
		
			// modify here
		modelAndView.addObject("command", notice);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+INSERT);
			
		return modelAndView;
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView delete(HttpServletRequest request,Map<String, String> requestMap,ModelAndView modelAndView) {
//		requestMap = getParameterMap(request);
		
		noticeService.delete(TARGET+DEL, requestMap);
		
		List<Notice> list = noticeService.selectList(TARGET+LIST, requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		modelAndView.addObject("list", list);
		modelAndView.addObject("requestMap", requestMap);
		modelAndView.setViewName(TARGET+LIST);		
		 
		return modelAndView;
	}
	
	@RequestMapping(value="/fileDown")
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
			String fn = attachFilePathRoot+Path+"\\"+PhyFname;

			File f = new File(fn);
			System.out.println("Loading file " + fn + "(" + f.getAbsolutePath()
					+ ")");

			if (f.exists()) {
				//res.setContentType("application/xls");
				res.setContentLength(new Long(f.length()).intValue());
				String encodeResult = URLEncoder.encode(LogFname,"UTF-8");
                encodeResult = encodeResult.replace("+", " ");/// url encode 
                res.setHeader("Content-Disposition", "attachment; filename="+encodeResult);
				FileCopyUtils.copy(new FileInputStream(f),
						res.getOutputStream());
			} else {
				System.out.println("File" + fn + "(" + f.getAbsolutePath()
						+ ") does not exist");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	@RequestMapping(value="/fileDel")
	public @ResponseBody String replyDel(Map<String, String> requestMap
			,Model mode) {
		noticeService.delete("usrFree.delete.fileinfor", requestMap);
		
		return "1";
	}
	
}
