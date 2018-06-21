package com.skt.mars.adm.co;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.sm.Item;

/**
 * CommerceController - 커머스 템플릿 관리
 * 
 * @author Kim Do Youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */

@Controller
public class CommerceController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());

	// command words
	private static String TARGET = "commerce.";	// modify here
	private static String INSERT = "insert";
	private static String READ = "read";
	private static String LIST = "list";
	private static String EDIT = "edit";
	
	//추후 경로 확정시 변경
	//private static String CO_FILE_PATH = "C:\\ftptemp\\";
	
	@Autowired
	private CommerceService commerceService;	// modify here
	
	/*public CommerceController(){
		//default constructor
	}
	*/
	/*@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		return INSERT;
	}*/

	@ModelAttribute("command")
	protected Object formBackingObject() throws Exception {
		return new Commerce();
	}
	
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/commerce", method = RequestMethod.POST)
	public String submit(Map requestFileMap,@ModelAttribute("command") @Valid Commerce commerce,
			BindingResult result, Model model){
		
		Commerce id = null;
		/*
		//defaultSetting 관련 'Y'일 경우 해당 tempType의 모든 default 'N' 로
		if(requestFileMap.get("dfltYn").equals("Y")){
			int dsupForNo = commerceService.update("PGADM0E04_U_02", commerce);
			int dsupForYes  = commerceService.update("PGADM0E04_U_01", commerce);
		} */
		
		//insert Ok
		String tempId = null;
		if(requestFileMap.get("insertFlag").equals("B")){
			//Template SEQ 생성
			long randomCategory_long = DateFormatUtil.getRandomCategoryID();
			tempId = String.valueOf(randomCategory_long);
			
			//file name setting
			String tempImg_tm = (String)requestFileMap.get("tempImg");
		    String tempImg = tempImg_tm.substring(tempImg_tm.lastIndexOf("\\")+1, tempImg_tm.length());
		    String tempHtml_tm = (String)requestFileMap.get("tempHtml");
		    String tempHtml = tempHtml_tm.substring(tempHtml_tm.lastIndexOf("\\")+1, tempHtml_tm.length());
		    
			commerce.setTempId(tempId);
			commerce.setTempImg(tempImg);
			commerce.setTempHtml(tempHtml);
			
			Integer val_chk = commerceService.select("PGADM0E04_V_02", commerce);
			
			if(val_chk > 0) {
				JOptionPane.showMessageDialog(null, "File name is Duplicate!!","alert", JOptionPane.ERROR_MESSAGE);
				return TARGET+INSERT;
				
			 } else {
				 		id = (Commerce)commerceService.insert("PGADM0E03_I_01", commerce);
			        }
			// insert table with File upload information
	        /*List fileUploadList = (ArrayList)requestFileMap.get("fileList");
	        Map fileMap = null;
	
	        if (fileUploadList != null && fileUploadList.size() > 0) {
	            int listSize = fileUploadList.size();
	
	            for (int count = 0; count < listSize; count++) {
	                fileMap = (HashMap)fileUploadList.get(count);
	                fileMap.put("targetID", id.getTempId());	// Board ID after insert Record
	
	                commerceService.insert("commerce.insert.fileinfor", fileMap); 
	            }
	        }*/
		}
		//edit Ok
		if(requestFileMap.get("insertFlag").equals("A")){
			
			String fileChangeImg = (String)requestFileMap.get("fileChangeImg");
			String fileChangeHtml = (String)requestFileMap.get("fileChangeHtml");
			
			//When file is not changed
			if(fileChangeImg.equals("Y")){
				
				String tempImg_tm = (String)requestFileMap.get("tempImg");
			    String tempImg = tempImg_tm.substring(tempImg_tm.lastIndexOf("\\")+1, tempImg_tm.length());
			    commerce.setTempImg(tempImg);
			}
			if(fileChangeHtml.equals("Y")){
				String tempHtml_tm = (String)requestFileMap.get("tempHtml");
				String tempHtml = tempHtml_tm.substring(tempHtml_tm.lastIndexOf("\\")+1, tempHtml_tm.length());
				commerce.setTempHtml(tempHtml);
			}
			
			int comUp = commerceService.update("PGADM0E04_U_04", commerce);
			 
			/*String fileChangeImg = (String)requestFileMap.get("fileChangeImg");
			String fileChangeHtml = (String)requestFileMap.get("fileChangeHtml");
			
			String filePathImg = CO_FILE_PATH + requestFileMap.get("oriImgPhysical");
			String filePathHtml = CO_FILE_PATH + requestFileMap.get("oriHtmlPhysical");
			
			//When file is not changed
			if(fileChangeImg.equals("Y")){
				
				String tempImg_tm = (String)requestFileMap.get("tempImg");
			    String tempImg = tempImg_tm.substring(tempImg_tm.lastIndexOf("\\")+1, tempImg_tm.length());
			    commerce.setTempImg(tempImg);
			    //기존 이미지 삭제
			    File f = new File(filePathImg);
				if(f.exists()){
					f.delete();
				}
				
				commerceService.delete("commerce.delete1.fileinfor", commerce);
				
				List fileUploadList = (ArrayList)requestFileMap.get("fileList");
		        Map fileMap = null;
		
		        if (fileUploadList != null && fileUploadList.size() > 0) {
	                fileMap = (HashMap)fileUploadList.get(0);
	                fileMap.put("targetID", requestFileMap.get("tempId"));	// Board ID after insert Record
	                
	                commerceService.insert("commerce.insert.fileinfor", fileMap); 
		           
		        }
			}
			if(fileChangeHtml.equals("Y")){
				String tempHtml_tm = (String)requestFileMap.get("tempHtml");
				String tempHtml = tempHtml_tm.substring(tempHtml_tm.lastIndexOf("\\")+1, tempHtml_tm.length());
				commerce.setTempHtml(tempHtml);
				//기존 이미지 삭제
				File f = new File(filePathHtml);
				if(f.exists()){
					f.delete();
				}
				
				commerceService.delete("commerce.delete2.fileinfor", commerce);
				
				List fileUploadList = (ArrayList)requestFileMap.get("fileList");
		        Map fileMap = null;
		
		        if (fileUploadList != null && fileUploadList.size() > 0) {
	                fileMap = (HashMap)fileUploadList.get(1);
	                fileMap.put("targetID", requestFileMap.get("tempId"));	// Board ID after insert Record
	
	                commerceService.insert("commerce.insert.fileinfor", fileMap); 
		           
	                
		        }
			}
			
			int comUp = commerceService.update("PGADM0E04_U_04", commerce);*/
			
		}
		
		Map pMap = new HashMap();
		if(requestFileMap.get("insertFlag").equals("B")){
			pMap.put("tempId", tempId);
			//pMap.put("tempId", id.getTempId());
		}else{
			pMap.put("tempId", requestFileMap.get("tempId"));
		}
		
		//defaultSetting 관련 'Y'일 경우 해당 tempType의 모든 default 'N' 로
		if(requestFileMap.get("dfltYn").equals("Y")){
			int dsupForNo = commerceService.update("PGADM0E04_U_02", commerce);
			int dsupForYes  = commerceService.update("PGADM0E04_U_01", commerce);
		} 
		
        commerce = commerceService.select("PGADM0E04_V_01", pMap);
		model.addAttribute("method", INSERT);
		
		model.addAttribute("command", commerce);
		
		return TARGET+READ;
	}
	
	
	//템플릿 관리 리스트 검색
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/commerce/list")
	public ModelAndView list(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		//HttpServletRequest request 형태로 인자값이 넘어오면 밑에 소스를 추가
		//2013.01.31 (공통에서 추가됨)
		requestMap = getParameterMap(request);
		
		List<Commerce> list = commerceService.selectList("PGADM0E01_L_01", requestMap);	// modify here
		
		//2013.02.06 (List paging 공통에서 추가됨)
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

	//템플릿 관리 삭제
	@RequestMapping(value="/adm/commerce/delete", method = RequestMethod.POST)
	public ModelAndView delete(Map<String, String> requestMap, Commerce commerce,@Valid HttpServletRequest req,  ModelAndView modelAndView) {
		requestMap = getParameterMap(req);
		String chkBoxes[] = req.getParameterValues("delChk");
		ArrayList<String> delChk = new ArrayList<String>();
		for(int i = 0; i < chkBoxes.length; i++){
			delChk.add(chkBoxes[i]);
		}
		
		int deleteCount = commerceService.delete("PGADM0E02_D_01", delChk);	// modify here
		
		List<Commerce> list = commerceService.selectList("PGADM0E01_L_01", requestMap);	// modify here
		
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName(TARGET+LIST);
		modelAndView.addObject("param", requestMap);
		return modelAndView;
		/*requestMap = getParameterMap(req);
		String chkBoxes[] = req.getParameterValues("delChk");
		ArrayList<String> delChk = new ArrayList<String>();
		for(int i = 0; i < chkBoxes.length; i++){
			delChk.add(chkBoxes[i]);
			//int result = commerceService.delete("PGADM0E02_D_01", commerce);
		}
		
		//공통 multiple delete 2013.02.07  - 안됨...nullpoint Exception 떨어짐.
		int deleteCount = commerceService.delete("PGADM0E02_D_01", delChk);	// modify here
		
		List<Commerce> list = commerceService.selectList("PGADM0E01_L_01", requestMap);	// modify here
		
		//2013.02.06 (List paging 공통에서 추가됨)
		if(requestMap.get("currentPage") == null){
			modelAndView.addObject("currentPage", 1);
		} else {
			modelAndView.addObject("currentPage", requestMap.get("currentPage"));
		}
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName(TARGET+LIST);
		modelAndView.addObject("param", requestMap);
		return modelAndView;*/
	}
	
	//템플릿 신규등록
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value = "/adm/commerce/insert")
	public ModelAndView insert(@Valid HttpServletRequest req, ModelAndView modelAndView) {
		
	    modelAndView.setViewName(TARGET+INSERT);
		
		return modelAndView;
	}
	
	//템플릿 상세페이지
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/commerce/read")
	public ModelAndView view(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);

		Commerce template  = commerceService.select("PGADM0E04_V_01", requestMap);	// modify here
		modelAndView.addObject("command", template);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);	
		
		return modelAndView;
	}
	
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/adm/commerce/update", method = RequestMethod.POST)
    public String update(HttpServletRequest request,
            Map<String, String> requestMap,
            @ModelAttribute("command") @Valid Commerce commerce,
            BindingResult result,
            Model model) {
		
        requestMap = getParameterMap(request);        
        int comUp = commerceService.update("PGADM0E04_U_04", commerce);
        commerce  = commerceService.select("PGADM0E04_U_03", requestMap);	// modify here
        

        model.addAttribute("param", requestMap);
		
		return TARGET + READ;

    }

    
	//템플릿 수정
    @SuppressWarnings({"unchecked", "rawtypes"})
	@RequestMapping(value="/adm/commerce/edit")
	public ModelAndView edit(HttpServletRequest request, Map<String, String> requestMap, ModelAndView modelAndView) {
		
		
		requestMap = getParameterMap(request);

		Commerce commerce  = commerceService.select("PGADM0E04_U_03", requestMap);	// modify here
		modelAndView.addObject("command", commerce);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+EDIT);	
		
		return modelAndView;
	}
	
	
	//템플릿 디폴트 셋팅 변경
	@RequestMapping(value="/adm/commerce/defaultSetting", method = RequestMethod.GET)
	public ModelAndView defaultSetting(HttpServletRequest request, Map<String, String> requestMap,Commerce commerce, ModelAndView modelAndView) {
		requestMap = getParameterMap(request);
		
		
		//디폴트셋팅은 해당 tempId 이외의 것을 dfltYn 을 'N'로 셋팅하고 tempId에 해당하는 것만 'Y'로 셋팅한다.
		int dsupForNo = commerceService.update("PGADM0E04_U_02", commerce);
		
		int dsupForYes  = commerceService.update("PGADM0E04_U_01", commerce);
		
		Commerce template  = commerceService.select("PGADM0E04_V_01", requestMap);	// modify here
		modelAndView.addObject("command", template);
		modelAndView.addObject("param", requestMap);
		modelAndView.setViewName(TARGET+READ);	
		
		return modelAndView;
	}
	
	
	//템플릿 디폴트 셋팅전 확인(이전에 default로 된것이 있는지 확인)
	@RequestMapping(value="/adm/commerce/defaultSettingAjax", method = RequestMethod.GET,headers="Accept=application/json")
	public void defaultSettingAjax(HttpServletRequest request, Map<String, String> requestMap,Commerce commerce, ModelAndView modelAndView, HttpServletResponse response) throws Exception {
		requestMap = getParameterMap(request);
		
		String tempType = commerce.getTempType();
		
		Integer defaultSettingCnt = commerceService.select("PGADM0E04_L_01", commerce);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("defaultSettingCnt", defaultSettingCnt);
		
		JSONArray arry = new JSONArray();
        JSONObject obj = new JSONObject();
        obj.put("defaultSettingCnt",defaultSettingCnt);
        arry.add(obj);

        request.setAttribute("result", arry);
        
        response.getWriter().write(arry.toJSONString());

       
		//modelAndView.addObject("defaultSettingCnt", map);
		//modelAndView.setViewName(TARGET+INSERT);
		
		//return arry;
	}
	

}
