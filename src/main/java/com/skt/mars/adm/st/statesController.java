package com.skt.mars.adm.st;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skt.mars.adm.bm.PaymentService;
import com.skt.mars.adm.cm.DefaultController;
import com.skt.mars.adm.cm.ExcelRevenueReportView;
import com.skt.mars.usr.fb.UserFreeService;

@Controller
@RequestMapping("/adm/st")
// modify here
public class statesController extends DefaultController {

    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    ExcelRevenueReportView excelRevenueReportView;

    // command words
    private static String TARGET = "states."; // modify here

    //private static String COMUL = "sumComul";
    //private static String WEEK = "sumWeek";
    //private static String DAY = "sumDay";

    @Autowired
    private StatesService statesService; // modify here

    @RequestMapping(value = "/list")
    public ModelAndView list3(Map<String, String> requestMap) {
        String url = requestMap.get("url");
        List list = null;
        List list1 = null;
        List list2 = null;

        DateFormat sdFormat = new SimpleDateFormat("yyyy");
        DateFormat monFormat = new SimpleDateFormat("MM");
        DateFormat dayFormat = new SimpleDateFormat("dd");

        Date nowDate = new Date();
        String nowYear = "";
        String nowMonth = "";
        String nowDay = "";

        if (requestMap.containsKey("strYear") == false) {
            nowYear = sdFormat.format(nowDate);
            requestMap.put("strYear", nowYear);
        } else {
            nowYear = requestMap.get("strYear");
        }
        if (requestMap.containsKey("strMonth") == false) {
            nowMonth = monFormat.format(nowDate);
            requestMap.put("strMonth", nowMonth);
        } else {
            nowMonth = requestMap.get("strMonth");
        }
        if (requestMap.containsKey("strDay") == false) {
        	nowDay = dayFormat.format(nowDate);
            requestMap.put("strDay", nowDay);
        } else {
        	nowDay = requestMap.get("strDay");
        }

        if (requestMap.containsKey("strSdate") == false) {
            String strSdate = nowYear + nowMonth + nowDay;
            requestMap.put("strSdate", strSdate);
        } else {
            requestMap.put("strSdate", requestMap.get("strSdate").replace(".", ""));
        }
        if (requestMap.containsKey("strEdate") == false) {
            String strEdate = nowYear + nowMonth + nowDay;
            requestMap.put("strEdate", strEdate);
        } else {
            requestMap.put("strEdate", requestMap.get("strEdate").replace(".", ""));
        }

        if (requestMap.get("strAge") != null && requestMap.get("strAge").length() > 0) {
            String[] spAge = requestMap.get("strAge").split("~");
            requestMap.put("strAge1", spAge[0]);
            requestMap.put("strAge2", spAge[1]);
        }

        if ("operatorMonth".equals(url) || "operatorDay".equals(url)) {
        	if("operatorMonth".equals(url)){
        		requestMap.put("strMonth", null);
        	}
            list1 = statesService.selectListForNoPage("states.operatorUserList", requestMap);

            String strHeadUserIdList = "";
            String strMax = "";
            String strIfuserID = "";

            HashMap hashMap = null;
            
            for (int i = 0; i < list1.size(); i++) {
                hashMap = (HashMap)list1.get(i);
                
                strHeadUserIdList += ", " + hashMap.get("USER_ID");
                strMax += ", MAX(" + hashMap.get("USER_ID") + ") as " + hashMap.get("USER_ID");
                strIfuserID += ", IF(USE_HiS.USER_ID = '" + hashMap.get("USER_ID")
                               + "',count(*),0) as "
                               + hashMap.get("USER_ID");
            }

            requestMap.put("strHeadUserIdList", strHeadUserIdList);
            requestMap.put("strMax", strMax);
            requestMap.put("strIfuserID", strIfuserID);

            //System.out.println(strMax);
            //System.out.println(strIfuserID);
            
            if(list1.size()>0){
            	list = statesService.selectListForNoPage(TARGET + url, requestMap);
            }
        
        }else if("smartMonth.years".equals(url) && "19".equals(requestMap.get("strNum"))){ // smart class advance english   
        	list = statesService.selectListForNoPage(TARGET + "smartMonth.advancedEnglish", requestMap);
        }else if("smartDay.days".equals(url) && "19".equals(requestMap.get("strNum"))){ // smart class advance english   
        	list = statesService.selectListForNoPage(TARGET + "smartDay.advancedEnglish", requestMap);
        }else{
        	list = statesService.selectListForNoPage(TARGET + url, requestMap);
        }
        

        //list.iterator()

        ModelAndView modelAndView = null;

        if ("Y".equals(requestMap.get("downExcel"))) { // Print Excel file
            modelAndView = new ModelAndView(excelRevenueReportView);

            Map revenueMap = new HashMap(); // revenue Map 
            String excelFileName = null; // fileName	- required
            String sheetName = null; // Sheet Name	- required
            String displyUnit = null; // displyUnit	- 
            String searchCondition = null; // search Condition	- 
            String sheetTitleName = null; // Sheet Title Name
            List titleNameList = new ArrayList(); // title column Name List in Excel file
            List columnNameList = new ArrayList(); // column Name List in Excel File	- required

            if ("sumComul".equals(url)) { // statetics
                sheetName = "Statistics summary";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Service");
                titleNameList.add("Service content");
                titleNameList.add("Total");

                // Column List(Have to match column name of query)
                columnNameList.add("SERVICE_TITLE");
                columnNameList.add("SERVICE_NAME");
                columnNameList.add("CNT");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("operatorMonth".equals(url)) {

                sheetName = "Administrator access status";
                displyUnit = "Number of PC Access";
                searchCondition = "Year ("+nowYear+")"; // search Condition	- 
                excelFileName = sheetName+"_Monthly("+nowYear+")";

                // Title List
                titleNameList.add("Sort");
                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");

                HashMap hashMap = null;
                for (int i = 0; i < list1.size(); i++) {
                    hashMap = (HashMap)list1.get(i);
                    titleNameList.add(hashMap.get("NAME"));
                    columnNameList.add(hashMap.get("NAME"));
                }

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("displyUnit", displyUnit);
                revenueMap.put("searchCondition", searchCondition);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("operatorDay".equals(url)) {
            	
            	sheetName = "Administrator access status";
                displyUnit = "Number of PC Access";
                searchCondition = "Year/Month ("+nowYear+"/"+nowMonth+")"; // search Condition	- 
                excelFileName = sheetName+"_Daily("+nowYear+"."+nowMonth+")";
            	
            	// Title List
                titleNameList.add("Sort");
                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");

                HashMap hashMap = null;
                for (int i = 0; i < list1.size(); i++) {
                    hashMap = (HashMap)list1.get(i);
                    titleNameList.add(hashMap.get("NAME"));
                    columnNameList.add(hashMap.get("NAME"));
                }

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("displyUnit", displyUnit);
                revenueMap.put("searchCondition", searchCondition);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("trMonth".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File

                // sub Title List information
                revenueMap.put("subTitleRowCnt", 2); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 7); // Sub Title Column count

                // sub Title List Data
                // first row
                titleNameList.add("SORT");
                titleNameList.add("Total");
                titleNameList.add("2"); // merge column size
                titleNameList.add("GIGA Wifi");
                titleNameList.add("2"); // merge column size
                titleNameList.add("LAN");
                titleNameList.add("2"); // merge column size

                // second row
                titleNameList.add("502"); // as row size as merge ( merge size + 500) 
                titleNameList.add("UP");
                titleNameList.add("DOWN");
                titleNameList.add("UP");
                titleNameList.add("DOWN");
                titleNameList.add("UP");
                titleNameList.add("DOWN");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("TOT_UP");
                columnNameList.add("TOT_DOWN");
                columnNameList.add("WIFI_UP");
                columnNameList.add("WIFI_DOWN");
                columnNameList.add("LAN_UP");
                columnNameList.add("LAN_DOWN");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                // Title Name
                //		        revenueMap.put("titleName", sheetName);	// Sub Title Row count

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("trDay".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File

                revenueMap.put("subTitleRowCnt", 2); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 7); // Sub Title Column count

                titleNameList.add("SORT");
                titleNameList.add("Total");
                titleNameList.add("2"); // merge column size
                titleNameList.add("GIGA Wifi");
                titleNameList.add("2"); // merge column size
                titleNameList.add("LAN");
                titleNameList.add("2"); // merge column size

                // Title List
                titleNameList.add("502");
                titleNameList.add("UP");
                titleNameList.add("DOWN");
                titleNameList.add("UP");
                titleNameList.add("DOWN");
                titleNameList.add("UP");
                titleNameList.add("DOWN");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("TOT_UP");
                columnNameList.add("TOT_DOWN");
                columnNameList.add("WIFI_UP");
                columnNameList.add("WIFI_DOWN");
                columnNameList.add("LAN_UP");
                columnNameList.add("LAN_DOWN");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("trTime".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File

                revenueMap.put("subTitleRowCnt", 2); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 7); // Sub Title Column count

                titleNameList.add("SORT");
                titleNameList.add("Total");
                titleNameList.add("2"); // merge column size
                titleNameList.add("GIGA Wifi");
                titleNameList.add("2"); // merge column size
                titleNameList.add("LAN");
                titleNameList.add("2"); // merge column size

                // Title List
                titleNameList.add("502");
                titleNameList.add("UP");
                titleNameList.add("DOWN");
                titleNameList.add("UP");
                titleNameList.add("DOWN");
                titleNameList.add("UP");
                titleNameList.add("DOWN");

                // Column List(Have to match column name of query)
                columnNameList.add("END_HOUR");
                columnNameList.add("TOT_UP");
                columnNameList.add("TOT_DOWN");
                columnNameList.add("WIFI_UP");
                columnNameList.add("WIFI_DOWN");
                columnNameList.add("LAN_UP");
                columnNameList.add("LAN_DOWN");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("spMonth".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File
                // sub Title List information
                revenueMap.put("subTitleRowCnt", 3); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 13); // Sub Title Column count

                // Title List
                titleNameList.add("SORT");
                titleNameList.add("Total");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("GIGA Wifi");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("LAN");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 

                // second row
                titleNameList.add("503"); // as row size as merge ( merge size + 500) 
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size

                titleNameList.add("0"); // skip value '0' to match row span size 
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("TOT_UP_MIN");
                columnNameList.add("TOT_UP_MAX");
                columnNameList.add("TOT_DOWN_MIN");
                columnNameList.add("TOT_DOWN_MAX");
                columnNameList.add("WIFI_UP_MIN");
                columnNameList.add("WIFI_UP_MAX");
                columnNameList.add("WIFI_DOWN_MIN");
                columnNameList.add("WIFI_DOWN_MAX");
                columnNameList.add("LAN_UP_MIN");
                columnNameList.add("LAN_UP_MAX");
                columnNameList.add("LAN_DOWN_MIN");
                columnNameList.add("LAN_DOWN_MAX");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("spDay".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File
                revenueMap.put("subTitleRowCnt", 3); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 13); // Sub Title Column count

                // Title List
                titleNameList.add("SORT");
                titleNameList.add("Total");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("GIGA Wifi");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("LAN");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 

                // second row
                titleNameList.add("503"); // as row size as merge ( merge size + 500) 
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size

                titleNameList.add("0"); // skip value '0' to match row span size 
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("TOT_UP_MIN");
                columnNameList.add("TOT_UP_MAX");
                columnNameList.add("TOT_DOWN_MIN");
                columnNameList.add("TOT_DOWN_MAX");
                columnNameList.add("WIFI_UP_MIN");
                columnNameList.add("WIFI_UP_MAX");
                columnNameList.add("WIFI_DOWN_MIN");
                columnNameList.add("WIFI_DOWN_MAX");
                columnNameList.add("LAN_UP_MIN");
                columnNameList.add("LAN_UP_MAX");
                columnNameList.add("LAN_DOWN_MIN");
                columnNameList.add("LAN_DOWN_MAX");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("spTime".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File
                revenueMap.put("subTitleRowCnt", 3); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 13); // Sub Title Column count

                // Title List
                titleNameList.add("SORT");
                titleNameList.add("Total");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("GIGA Wifi");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("LAN");
                titleNameList.add("4"); // merge column size
                titleNameList.add("0"); // skip value '0' to match column span size 
                titleNameList.add("0"); // skip value '0' to match column span size 

                // second row
                titleNameList.add("503"); // as row size as merge ( merge size + 500) 
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size
                titleNameList.add("UP");
                titleNameList.add("2"); // merge column size
                titleNameList.add("DOWN");
                titleNameList.add("2"); // merge column size

                titleNameList.add("0"); // skip value '0' to match row span size 
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");
                titleNameList.add("MIN");
                titleNameList.add("MAX");

                // Column List(Have to match column name of query)
                columnNameList.add("END_HOUR");
                columnNameList.add("TOT_UP_MIN");
                columnNameList.add("TOT_UP_MAX");
                columnNameList.add("TOT_DOWN_MIN");
                columnNameList.add("TOT_DOWN_MAX");
                columnNameList.add("WIFI_UP_MIN");
                columnNameList.add("WIFI_UP_MAX");
                columnNameList.add("WIFI_DOWN_MIN");
                columnNameList.add("WIFI_DOWN_MAX");
                columnNameList.add("LAN_UP_MIN");
                columnNameList.add("LAN_UP_MAX");
                columnNameList.add("LAN_DOWN_MIN");
                columnNameList.add("LAN_DOWN_MAX");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("acMonth".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File
                revenueMap.put("subTitleRowCnt", 2); // Sub Title Row count
                revenueMap.put("subTitleColCnt", 10);

                titleNameList.add("SORT");
                titleNameList.add("CPU");
                titleNameList.add("3");
                titleNameList.add("0");
                titleNameList.add("Memory");
                titleNameList.add("3");
                titleNameList.add("0");
                titleNameList.add("Disk");
                titleNameList.add("3");
                titleNameList.add("0");

                // Title List
                titleNameList.add("502");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("CPU_CRITICAL");
                columnNameList.add("CPU_MAJOR");
                columnNameList.add("CPU_MINOR");
                columnNameList.add("MEMORY_CRITICAL");
                columnNameList.add("MEMORY_MAJOR");
                columnNameList.add("MEMORY_MINOR");
                columnNameList.add("DISK_CRITICAL");
                columnNameList.add("DISK_MAJOR");
                columnNameList.add("DISK_MINOR");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("acDay".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File
                revenueMap.put("subTitleRowCnt", 2);
                revenueMap.put("subTitleColCnt", 10);

                titleNameList.add("SORT");
                titleNameList.add("CPU");
                titleNameList.add("3");
                titleNameList.add("0");
                titleNameList.add("Memory");
                titleNameList.add("3");
                titleNameList.add("0");
                titleNameList.add("Disk");
                titleNameList.add("3");
                titleNameList.add("0");

                // Title List
                titleNameList.add("502");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("CPU_CRITICAL");
                columnNameList.add("CPU_MAJOR");
                columnNameList.add("CPU_MINOR");
                columnNameList.add("MEMORY_CRITICAL");
                columnNameList.add("MEMORY_MAJOR");
                columnNameList.add("MEMORY_MINOR");
                columnNameList.add("DISK_CRITICAL");
                columnNameList.add("DISK_MAJOR");
                columnNameList.add("DISK_MINOR");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("acTime".equals(url)) {
                sheetName = "Network statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File
                revenueMap.put("subTitleRowCnt", 2);
                revenueMap.put("subTitleColCnt", 10);

                titleNameList.add("SORT");
                titleNameList.add("CPU");
                titleNameList.add("3");
                titleNameList.add("0");
                titleNameList.add("Memory");
                titleNameList.add("3");
                titleNameList.add("0");
                titleNameList.add("Disk");
                titleNameList.add("3");
                titleNameList.add("0");

                // Title List
                titleNameList.add("502");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");
                titleNameList.add("CRITICAL");
                titleNameList.add("MAJOR");
                titleNameList.add("MINOR");

                // Column List(Have to match column name of query)
                columnNameList.add("END_HOUR");
                columnNameList.add("CPU_CRITICAL");
                columnNameList.add("CPU_MAJOR");
                columnNameList.add("CPU_MINOR");
                columnNameList.add("MEMORY_CRITICAL");
                columnNameList.add("MEMORY_MAJOR");
                columnNameList.add("MEMORY_MINOR");
                columnNameList.add("DISK_CRITICAL");
                columnNameList.add("DISK_MAJOR");
                columnNameList.add("DISK_MINOR");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("basicUseMonth".equals(url)) {
                sheetName = "CBC Basic statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Number of members");
                titleNameList.add("Duration of PC usage");
                titleNameList.add("Number of PC users");
                titleNameList.add("User Portal Number of connections");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("NEW_CBC");
                columnNameList.add("USED_PC");
                columnNameList.add("USED_CNT_PC");
                columnNameList.add("USED_USER");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("basicUseDay".equals(url)) {
                sheetName = "CBC Basic statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Number of members");
                titleNameList.add("Duration of PC usage");
                titleNameList.add("Number of PC users");
                titleNameList.add("User Portal Number of connections");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("NEW_CBC");
                columnNameList.add("USED_PC");
                columnNameList.add("USED_CNT_PC");
                columnNameList.add("USED_USER");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("basicPayMonth".equals(url)) {
                sheetName = "CBC Basic statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Received amount");
                titleNameList.add("Returned amount");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("PAY_AMT");
                columnNameList.add("REFUND_AMT");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);
            } else if ("basicAsset".equals(url)) { // Netwrok stats > Month
                sheetName = "CBC Basic statistics";
                excelFileName = sheetName;
                // in case a Sheet by a File

                // Title List
                titleNameList.add("NUM");
                titleNameList.add("Asset Name");
                titleNameList.add("Serial Number");

                // Column List(Have to match column name of query)
                columnNameList.add("rownum");
                columnNameList.add("ITEM_NM");
                columnNameList.add("ITEM_05");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("learnMonth".equals(url)) {
                sheetName = "Learning statistics";
                excelFileName = sheetName;

                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Number of registered members");
                titleNameList.add("VOD views");
                titleNameList.add("e-Book views");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("basic");
                columnNameList.add("VOD");
                columnNameList.add("EBOOK");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);
            } else if ("learnDay".equals(url)) {
                sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Number of registered members");
                titleNameList.add("VOD views");
                titleNameList.add("e-Book views");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("basic");
                columnNameList.add("VOD");
                columnNameList.add("eBook");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);
            } else if ("smartMonth".equals(url)) {
                sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("YEAR4");
                titleNameList.add("YEAR5");
                titleNameList.add("YEAR6");
                titleNameList.add("Advance English");
                titleNameList.add("Usage of electronic board");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("YEAR4");
                columnNameList.add("YEAR5");
                columnNameList.add("YEAR6");
                columnNameList.add("AdvancedEnglish");
                columnNameList.add("InteractiveWhiteBoard");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);
            } else if ("smartDay".equals(url)) {
                sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("YEAR4");
                titleNameList.add("YEAR5");
                titleNameList.add("YEAR6");
                titleNameList.add("Advance English");
                titleNameList.add("Usage of electronic board");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("year4");
                columnNameList.add("year5");
                columnNameList.add("year6");
                columnNameList.add("advanceEnglish");
                columnNameList.add("electBoard");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);
            } else if ("engVillageMonth".equals(url)) {
                sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Search VOD");
                titleNameList.add("Search E-book");
                titleNameList.add("DVD rental");
                titleNameList.add("Book rental");
                titleNameList.add("SMARTBeam + Tablet rental");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                columnNameList.add("ViewVOD");
                columnNameList.add("VieweBook");
                columnNameList.add("rentDVD");
                columnNameList.add("rentBook");
                columnNameList.add("rentTablet");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("engVillageDay".equals(url)) {
                sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                titleNameList.add("Search VOD");
                titleNameList.add("Search E-book");
                titleNameList.add("DVD rental");
                titleNameList.add("Book rental");
                titleNameList.add("SMARTBeam + Tablet rental");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                columnNameList.add("vod");
                columnNameList.add("eBook");
                columnNameList.add("rentDVD");
                columnNameList.add("rentBook");
                columnNameList.add("rentTablet");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("healthMonth".equals(url)) {
                sheetName = "Health statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                //titleNameList.add("Number of Health Service Usage");
                titleNameList.add("Number of prints");

                // Column List(Have to match column name of query)
                columnNameList.add("MONTH_NAME");
                //columnNameList.add("TouchPrint");
                columnNameList.add("Print");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            } else if ("healthDay".equals(url)) {
                sheetName = "Health statistics";
                excelFileName = sheetName;
                // Title List
                titleNameList.add("Sort");
                //titleNameList.add("Number of Health Service Usage");
                titleNameList.add("Number of prints");

                // Column List(Have to match column name of query)
                columnNameList.add("END_DAILY");
                //columnNameList.add("TouchPrint");
                columnNameList.add("Print");

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);
                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);
                modelAndView.addObject("revenueMap0", revenueMap);

            }else if("smartMonth.years".equals(url)){
            	sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                String strNUM="4";
                if("4".equals(requestMap.get("strNum")) || "9".equals(requestMap.get("strNum")) || "14".equals(requestMap.get("strNum"))){
                	titleNameList.add("Sort");
                	if("9".equals(requestMap.get("strNum"))){
                		strNUM="5";
                	}else if("14".equals(requestMap.get("strNum"))){
                		strNUM="6";
                	}
                    titleNameList.add("Year "+strNUM+" English");
                    titleNameList.add("Year "+strNUM+" Mathematics");
                    titleNameList.add("Year "+strNUM+" Science");
                    titleNameList.add("Year "+strNUM+" Malay");

                    // Column List(Have to match column name of query)
                    columnNameList.add("MONTH_NAME");
                    columnNameList.add("YearsEnglish");
                    columnNameList.add("YearsMathematics");
                    columnNameList.add("YearsScience");
                    columnNameList.add("YearsMalay");
                }else{
                	titleNameList.add("Sort");
                    titleNameList.add("Bulats");
                    titleNameList.add("Bulats In Action");

                    // Column List(Have to match column name of query)
                    columnNameList.add("MONTH_NAME");
                    columnNameList.add("Bulats");
                    columnNameList.add("BulatsInAction");
                    
                }
                
                

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);
            }else if("smartDay.days".equals(url)){
            	sheetName = "Learning statistics";
                excelFileName = sheetName;
                // Title List
                String strNUM="4";
                if("4".equals(requestMap.get("strNum")) || "9".equals(requestMap.get("strNum")) || "14".equals(requestMap.get("strNum"))){
                	titleNameList.add("Sort");
                	if("9".equals(requestMap.get("strNum"))){
                		strNUM="5";
                	}else if("14".equals(requestMap.get("strNum"))){
                		strNUM="6";
                	}
                    titleNameList.add("Year "+strNUM+" English");
                    titleNameList.add("Year "+strNUM+" Mathematics");
                    titleNameList.add("Year "+strNUM+" Science");
                    titleNameList.add("Year "+strNUM+" Malay");

                    // Column List(Have to match column name of query)
                    columnNameList.add("END_DAILY");
                    columnNameList.add("YearsEnglish");
                    columnNameList.add("YearsMathematics");
                    columnNameList.add("YearsScience");
                    columnNameList.add("YearsMalay");
                }else{
                	titleNameList.add("Sort");
                    titleNameList.add("Bulats");
                    titleNameList.add("Bulats In Action");

                    // Column List(Have to match column name of query)
                    columnNameList.add("END_DAILY");
                    columnNameList.add("Bulats");
                    columnNameList.add("BulatsInAction");
                    
                }
                
                

                if (sheetName == null) {
                    sheetName = url;
                }
                revenueMap.put("sheetName", sheetName);

                revenueMap.put("titleNameList", titleNameList);
                revenueMap.put("list", list);
                revenueMap.put("columnNameList", columnNameList);

                modelAndView.addObject("revenueMap0", revenueMap);
            }
            
            /*else if("smartMonth.years".equals(url) && "19".equals(requestMap.get("strNum"))){ // smart class advance english   
            	list = statesService.selectListForNoPage(TARGET + "smartMonth.advancedEnglish", requestMap);
            }else if("smartMonth.days".equals(url) && "19".equals(requestMap.get("strNum"))){ // smart class advance english   
            	list = statesService.selectListForNoPage(TARGET + "smartDay.advancedEnglish", requestMap);
			*/
            // set Excel File name
            if (excelFileName == null) {
                excelFileName = url;
            }
            modelAndView.addObject("excelFileName", excelFileName);

        } else { // View Web page
            modelAndView = new ModelAndView();
            modelAndView.setViewName(TARGET + url);

            modelAndView.addObject("list", list);
            modelAndView.addObject("list1", list1);
            modelAndView.addObject("requestMap", requestMap);

        }

        return modelAndView;
    }

}
