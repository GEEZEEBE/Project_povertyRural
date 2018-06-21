package com.skt.mars.adm.st;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.iterators.ReverseListIterator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ExcelRevenueReportView;

@Controller
@RequestMapping("/adm/st")	// modify here
public class CoStatesController extends DefaultController {
	protected final Log logger = LogFactory.getLog(getClass());
	
    @Autowired
    ExcelRevenueReportView excelRevenueReportView;
	// command words
	private static String TARGET = "commerce.";	// modify here
	//private static String COMUL = "sumComul";
	//private static String WEEK = "sumWeek";
	//private static String DAY = "sumDay";
	
	
	@Autowired
	private CoStatesService coStatesService;	// modify here
	
	@RequestMapping(value="/coList")
	public ModelAndView list3(Map<String, String> requestMap) {
		System.out.println("################################################################################");
		String url = requestMap.get("url");
		List<Object> list = new ArrayList();		
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy");
		DateFormat monFormat = new SimpleDateFormat("MM");
		DateFormat dayFormat = new SimpleDateFormat("dd");
		
		Date nowDate = new Date();
		String nowYear="";
		String nowMonth="";

		if(requestMap.containsKey("strYear")==false){
			nowYear = sdFormat.format(nowDate);
			requestMap.put("strYear", nowYear);
		}else{
			nowYear = requestMap.get("strYear");
		}
		if(requestMap.containsKey("strMonth")==false){
			nowMonth = monFormat.format(nowDate);
			requestMap.put("strMonth", nowMonth);
		}else{
			nowMonth = requestMap.get("strMonth");
		}
		
		if(requestMap.containsKey("strSdate")==false){
			String strSdate = nowYear+nowMonth+dayFormat.format(nowDate);
			requestMap.put("strSdate", strSdate);
		}
		if(requestMap.containsKey("strEdate")==false){
			String strEdate = nowYear+nowMonth+dayFormat.format(nowDate);
			requestMap.put("strEdate", strEdate);
		}
		
		list = coStatesService.selectListForNoPage("ADMC_M070008_"+url, requestMap);
	
		ModelAndView modelAndView = null;
		
		if("Y".equals(requestMap.get("downExcel"))){	// Print Excel file
	        modelAndView = new ModelAndView(excelRevenueReportView);
	        
	        Map<Object,Object> revenueMap = new HashMap<Object,Object>();	// revenue Map 
	        String excelFileName = null;	// fileName	- required
	        String sheetName = null;		// Sheet Name	- required
	        String sheetTitleName = null;		// Sheet Title Name
			List<Object> titleNameList = new ArrayList<Object>();	// title column Name List in Excel file
			List<Object> columnNameList = new ArrayList<Object>();	// column Name List in Excel File	- required
			
			sheetName = "Commerce Statistics";
	        
	        if("commerceMonth".equals(url)){	// statetics
	        		        		           	       
	        	// in case a Sheet by a File
		        // sub Title List information		        
		        revenueMap.put("subTitleRowCnt", 3);	// Sub Title Row count
		        revenueMap.put("subTitleColCnt", 10);	// Sub Title Column count

	        	// sub Title List Data
		        // first row
		        titleNameList.add("SORT");
	        	titleNameList.add("SNS Promotion");
	        	titleNameList.add("3");	// merge column size
	        	titleNameList.add("0");	// merge column size
	        	titleNameList.add("Count of Print");
	        	titleNameList.add("2");	// merge column size	        	
	        	titleNameList.add("Number of Print");
	        	titleNameList.add("4");	// merge column size
	        	titleNameList.add("0");	// merge column size
	        	titleNameList.add("0");	// merge column size
	        	

		        // second row
	        	titleNameList.add("503");	// as row size as merge ( merge size + 500) 
	        	titleNameList.add("Facebook");	        	
	        	titleNameList.add("Blogspot");	        	
	        	titleNameList.add("Twitter");	        	
	        	titleNameList.add("Label");
	        	titleNameList.add("Brochure");
	        	titleNameList.add("Label");
	        	titleNameList.add("2");
	        	titleNameList.add("Brochure");
	        	titleNameList.add("2");
	        	
	        		        	
	        	titleNameList.add("0");	// as row size as merge ( merge size + 500) 
	        	titleNameList.add("502");
	        	titleNameList.add("502");
	        	titleNameList.add("502");
	        	titleNameList.add("502");
	        	titleNameList.add("502");	        	
	        	titleNameList.add("Color");
	        	titleNameList.add("B&W");
	        	titleNameList.add("Color");
	        	titleNameList.add("B&W");
	        	
	        	// Column List(Have to match column name of query)
	        	columnNameList.add("MONTH_NAME");
	        	columnNameList.add("FACEBOOK");
	        	columnNameList.add("BLOGSPOT");
	        	columnNameList.add("TWITTER");
	        	columnNameList.add("LABEL");
	        	columnNameList.add("BROCHURE");
	        	columnNameList.add("LABEL_COLOR");
	        	columnNameList.add("LABEL_BW");
	        	columnNameList.add("BROCHURE_COLOR");
	        	columnNameList.add("BROCHURE_BW");
	        	
	        	
	        	if(sheetName == null){
		        	sheetName = url;
		        }
		        revenueMap.put("sheetName", sheetName);
		        revenueMap.put("titleNameList", titleNameList);
		        revenueMap.put("list", list);
		        revenueMap.put("columnNameList", columnNameList);
				modelAndView.addObject("revenueMap0", revenueMap);
	        	
	        } else if("commerceDay".equals(url)){	
	        
	        	// in case a Sheet by a File
		        // sub Title List information		        
		        revenueMap.put("subTitleRowCnt", 3);	// Sub Title Row count
		        revenueMap.put("subTitleColCnt", 10);	// Sub Title Column count

	        	// sub Title List Data
		        // first row
		        titleNameList.add("SORT");
	        	titleNameList.add("SNS Promotion");
	        	titleNameList.add("3");	// merge column size
	        	titleNameList.add("0");	// merge column size
	        	titleNameList.add("Count of Print");
	        	titleNameList.add("2");	// merge column size	        	
	        	titleNameList.add("Number of Print");
	        	titleNameList.add("4");	// merge column size
	        	titleNameList.add("0");	// merge column size
	        	titleNameList.add("0");	// merge column size
	        	

		        // second row
	        	titleNameList.add("503");	// as row size as merge ( merge size + 500) 
	        	titleNameList.add("Facebook");	        	
	        	titleNameList.add("Blogspot");	        	
	        	titleNameList.add("Twitter");	        	
	        	titleNameList.add("Label");
	        	titleNameList.add("Brochure");
	        	titleNameList.add("Label");
	        	titleNameList.add("2");
	        	titleNameList.add("Brochure");
	        	titleNameList.add("2");
	        	
	        		        	
	        	titleNameList.add("0");	// as row size as merge ( merge size + 500) 
	        	titleNameList.add("502");
	        	titleNameList.add("502");
	        	titleNameList.add("502");
	        	titleNameList.add("502");
	        	titleNameList.add("502");	        	
	        	titleNameList.add("Color");
	        	titleNameList.add("B&W");
	        	titleNameList.add("Color");
	        	titleNameList.add("B&W");
	        	
	        	// Column List(Have to match column name of query)
	        	columnNameList.add("DAILY");
	        	columnNameList.add("FACEBOOK");
	        	columnNameList.add("BLOGSPOT");
	        	columnNameList.add("TWITTER");
	        	columnNameList.add("LABEL");
	        	columnNameList.add("BROCHURE");
	        	columnNameList.add("LABEL_COLOR");
	        	columnNameList.add("LABEL_BW");
	        	columnNameList.add("BROCHURE_COLOR");
	        	columnNameList.add("BROCHURE_BW");
	        	
	        	if(sheetName == null){
		        	sheetName = url;
		        }
		        revenueMap.put("sheetName", sheetName);
		        revenueMap.put("titleNameList", titleNameList);
		        revenueMap.put("list", list);
		        revenueMap.put("columnNameList", columnNameList);
				modelAndView.addObject("revenueMap0", revenueMap);
	        
	        }
	        // set Excel File name
	        if(excelFileName == null){
	        	excelFileName = url;
	        }
	        modelAndView.addObject("excelFileName", excelFileName);        	
	        
		} else {	// View Web page
	        modelAndView = new ModelAndView();
			modelAndView.setViewName(TARGET+url);

			modelAndView.addObject("list", list);
			modelAndView.addObject("requestMap", requestMap);
			
		}

		return modelAndView;
	}
	
}
