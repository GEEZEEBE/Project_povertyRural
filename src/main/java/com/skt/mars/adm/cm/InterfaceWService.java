package com.skt.mars.adm.cm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.skt.mars.adm.bm.Price;
import com.skt.mars.adm.bm.PriceService;
import com.skt.mars.adm.cm.ut.DateFormatUtil;
import com.skt.mars.adm.co.CommerceService;
import com.skt.mars.adm.co.JsonCommerce;
import com.skt.mars.adm.co.JsonCommerceService;
import com.skt.mars.usr.ev.EnglishVillageService;
import com.skt.mars.usr.fb.UserFree;
import com.skt.mars.usr.fb.UserFreeService;
import com.skt.mars.usr.sc.SmartClassService;

//@SuppressWarnings("unchecked")
//@Service(value = "commonWSService")
@Service(value = "CommerceService")
@Path(value = "/common")
public class InterfaceWService {

    @Value("#{commonProperty['mar.app.url']}")
    private String fileUrl;

    @Value("#{commonProperty['mar.app.root']}")
    private String fileRoot;

    @Value("#{commonProperty['mar.vod.path']}")
    private String filePath;

    protected final Log logger = LogFactory.getLog(getClass());

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/login/{divide}")
    public Response getGetCommon(@PathParam("divide") String divide,
                                 @FormParam("USER_ID") String userid,
                                 @FormParam("PW") String password,
                                 @FormParam("MACADDRESS") String macaddress,
                                 @FormParam("USE_HS_NMBR_ID") String useHsNmbrID,
                                 @FormParam("END_YN") String endYN) throws Exception {

        Map requestMap = new HashMap();
        requestMap.put("userid", userid);
        requestMap.put("password", password);
        requestMap.put("macaddress", macaddress);
        requestMap.put("useHsNmbrID", useHsNmbrID);
        requestMap.put("endYN", endYN);

        String sqlMapId = null;
        JSONObject obj = new JSONObject();

        // get service Bean from ApplicationContext
        CommonCodeService commonCodeService = (CommonCodeService)SpringApplicationContext.getBean("commonCodeService");

        String responseCode = null;
        String responseDesc = null;
        String responseAuthority = null;
        String responseuseHsNmbrID = null;
        String responseuserName = null;
        String responseEmail = null;
        String responseTelno = null;

        // check to match user id, password with Macaddress
        if (divide.equalsIgnoreCase("ELWHITEBOARD")) {
        	sqlMapId = "user.select.white";
        } else {
        	sqlMapId = "user.select.check";
        }

        Map resultMap = (Map)commonCodeService.selectByObject(sqlMapId, requestMap);

        if (resultMap != null) {
        	if (divide.equalsIgnoreCase("ELWHITEBOARD")) {
        		if ("302".equals(resultMap.get("USER_ID"))) {
	                responseCode = "302";
	                responseDesc = "Invalid ID or ID/password is incorrect.";	
	            } else if ("303".equals(resultMap.get("USERNAME"))) {
	                responseCode = "303";
	                responseDesc = "Invalid ID or ID/password is incorrect.";	
	            } else {

                    requestMap.put("srvcID", 42); // category Using Interactive 이부분 체크
                                                  // White Board
                    sqlMapId = "using.insertBySrvID";
	
                    // check Insert or Update by SRV_ID
                    if (useHsNmbrID == null || useHsNmbrID.equals("") || useHsNmbrID.equals(null)) {
                        String randomCategory = DateFormatUtil.getRandomID();
                        requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id

                        commonCodeService.insert(sqlMapId, requestMap);

                    } else {
                        sqlMapId = "using.updateBySrvID";

                        commonCodeService.update(sqlMapId, requestMap);
                    }
	                
	                responseCode = "200";
	                responseDesc = "Success! You're RIGHT!";
	                responseuseHsNmbrID = (String)requestMap.get("useHsNmbrID");
	                responseAuthority = (String)resultMap.get("AUTHORITY");
	                responseuserName = (String)resultMap.get("USERNAME");
	                responseEmail = (String)resultMap.get("EMAL");;
	                responseTelno = (String)resultMap.get("TLNO");;
	
	            }
        	} else {        	
	            if ("301".equals(resultMap.get("macaddress"))) {
	                responseCode = "301";
	                responseDesc = "The MacAddress is not registered.";
	            } else if ("302".equals(resultMap.get("USER_ID"))) {
	                responseCode = "302";
	                responseDesc = "Invalid ID or ID/password is incorrect.";
	
	            } else if ("303".equals(resultMap.get("USERNAME"))) {
	                responseCode = "303";
	                responseDesc = "Invalid ID or ID/password is incorrect.";
	
	            } else if ("303".equals(resultMap.get("USERNAME"))) {
	                responseCode = "303";
	                responseDesc = "Error! There is null Authority.";
	
	            } else {
	                if (divide.equalsIgnoreCase("PCAGENCY")) {
	                    requestMap.put("srvcID", 31); // category Using PC
	                    sqlMapId = "using.insertPCusingBySrvID";
	                    
	                } else if (divide.equalsIgnoreCase("TABLET")) {
	                    //					requestMap.put("srvcID", ?); // category Using Interactive
	                    //					sqlMapId = "using.insertBySrvID";
	                }
	
	                if (!divide.equals("TABLET")) {
	                    // check Insert or Update by SRV_ID
	                    if (useHsNmbrID == null || useHsNmbrID.equals("") || useHsNmbrID.equals(null)) {
	                        String randomCategory = DateFormatUtil.getRandomID();
	                        requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
	
	                        commonCodeService.insert(sqlMapId, requestMap);
	
	                    } else {
	                        sqlMapId = "using.updateBySrvID";
	
	                        commonCodeService.update(sqlMapId, requestMap);
	                    }
	                }
	                responseCode = "200";
	                responseDesc = "Success! You're RIGHT!";
	                responseuseHsNmbrID = (String)requestMap.get("useHsNmbrID");
	                responseAuthority = (String)resultMap.get("AUTHORITY");
	                responseuserName = (String)resultMap.get("USERNAME");
	                responseEmail = (String)resultMap.get("EMAL");;
	                responseTelno = (String)resultMap.get("TLNO");;
	
	            }
        	}
        } else {

            responseCode = "401";
            responseDesc = "Error! We are sorry to do that";
            responseuseHsNmbrID = useHsNmbrID;

        }

        obj.put("CODE", responseCode); // response Code : Success - 200, Other -
                                       // *
        obj.put("DESC", responseDesc);
        obj.put("AUTHORITY", responseAuthority);
        obj.put("USERNAME", responseuserName);
        obj.put("USE_HS_NMBR_ID", responseuseHsNmbrID);
        
        //commerce
        obj.put("EMAL", responseEmail);
        obj.put("TLNO", responseTelno);
        

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/learning/list/{divide}")
    public Response getGetSmartClassList(@PathParam("divide") String divide,
                                         @FormParam("USER_ID") String userid,
                                         @FormParam("PW") String password,
                                         @FormParam("SVCID") String srvcID,
                                         @FormParam("currentPage") String currentPage) throws Exception {

        logger.info("getGetSmartClassList() [userid :" + userid + "]");

        Map requestMap = new HashMap();
        JSONObject obj = new JSONObject();
        if (divide.equalsIgnoreCase("smartclass")) {
            requestMap.put("userID", userid);
            requestMap.put("srvcID", srvcID);
            requestMap.put("listSize", "5");
            requestMap.put("currentPage", currentPage);
            requestMap.put("startRow", (Integer.parseInt(currentPage) - 1) * 5);

            SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
            List malayList = smartClassService.selectList("smartClass.list", requestMap);

            if (requestMap.get("currentPage") == null) {
                obj.put("currentPage", 1);
                obj.put("totalCount", requestMap.get("totalCount"));
            } else {
                obj.put("currentPage", requestMap.get("currentPage"));
                obj.put("totalCount", requestMap.get("totalCount"));
            }
            obj.put("CODE", "200");
            obj.put("DESC", "Success! You're RIGHT!");
            obj.put("malayList", malayList);

        } else if (divide.equalsIgnoreCase("englishvillage")) {
            requestMap.put("userID", userid);
            requestMap.put("srvcID", srvcID);
            requestMap.put("listSize", "40");
            //            requestMap.put("currentPage", currentPage);
            //            requestMap.put("startRow", (Integer.parseInt(currentPage) - 1) * 40);

            EnglishVillageService englishVillageService = (EnglishVillageService)SpringApplicationContext.getBean("englishVillageService");
            List malayList = englishVillageService.selectList("englishVillage.list", requestMap);

            if (requestMap.get("currentPage") == null) {
                obj.put("currentPage", 1);
                obj.put("totalCount", requestMap.get("totalCount"));
            } else {
                obj.put("currentPage", requestMap.get("currentPage"));
                obj.put("totalCount", requestMap.get("totalCount"));
            }
            obj.put("CODE", "200");
            obj.put("DESC", "Success! You're RIGHT!");
            obj.put("malayList", malayList);
        }

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/learning/read/{divide}")
    public Response getGetSmartClassRead(@PathParam("divide") String divide,
                                         @FormParam("USER_ID") String userid,
                                         @FormParam("PW") String password,
                                         @FormParam("itemID") String itemID,
                                         @FormParam("langType") String langType) throws Exception {

        logger.info("getGetSmartClassRead() [userid :" + userid + "]");

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("itemID", itemID);
        requestMap.put("langType", langType);

        String video = "";

        if (divide.equalsIgnoreCase("smartclass")) {
            SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
            Map asset = (Map)smartClassService.select("smartClass.asset", requestMap);
            Map assetChild = (Map)smartClassService.select("smartClass.assetChild", requestMap);
            List fileList = smartClassService.selectListNoPage("smartClass.fileRead", requestMap);

            video = fileUrl + fileRoot + filePath + asset.get("ITEM_01");
            obj.put("CODE", "200");
            obj.put("DESC", "Success");
            obj.put("asset", asset);
            obj.put("fileList", fileList);
            obj.put("assetChild", assetChild);
            obj.put("video", video);
        } else if (divide.equalsIgnoreCase("englishvillage")) {
            EnglishVillageService englishVillageService = (EnglishVillageService)SpringApplicationContext.getBean("englishVillageService");
            Map asset = (Map)englishVillageService.select("englishVillage.asset", requestMap);
            Map assetChild = (Map)englishVillageService.select("englishVillage.assetChild", requestMap);
            List fileList = englishVillageService.selectListNoPage("englishVillage.fileRead", requestMap);

            video = fileUrl + fileRoot + filePath + asset.get("ITEM_01");
            obj.put("CODE", "200");
            obj.put("DESC", "Success");
            obj.put("asset", asset);
            obj.put("fileList", fileList);
            obj.put("assetChild", assetChild);
            obj.put("video", video);
        }

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/learning/englishVillageMain")
    public     Response
                getEnglishVillageMain(@FormParam("userID") String userID, @FormParam("srvcID") String srvcID) throws Exception {

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();
        requestMap.put("srvcID", srvcID);

        SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
        List mainList = smartClassService.selectListNoPage("englishVillage.mainList", requestMap);

        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("malayList", mainList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/learning/mypage/list")
    public Response getGetMyPageList(@FormParam("USER_ID") String userid,
                                     @FormParam("PW") String password,
                                     @FormParam("srvcID") String srvcID,
                                     @FormParam("cmplYn") String cmplYn,
                                     @FormParam("currentPage") String currentPage) throws Exception {

        logger.info("getGetMyPageList() [userid :" + userid + "]");

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("userID", userid);
        requestMap.put("srvcID", srvcID);
        requestMap.put("cmplYn", cmplYn);
        requestMap.put("listSize", "5");
        requestMap.put("currentPage", currentPage);
        requestMap.put("startRow", (Integer.parseInt(currentPage) - 1) * 5);

        SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
        List malayList = smartClassService.selectList("smartClass.lessonsList", requestMap);

        if (requestMap.get("currentPage") == null) {
            obj.put("currentPage", 1);
        } else {
            obj.put("currentPage", requestMap.get("currentPage"));
        }
        obj.put("totalCount", requestMap.get("totalCount"));
        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("malayList", malayList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/learning/mypage/historyupdate")
    public Response setMyPageHistory(@FormParam("USER_ID") String userid,
                                     @FormParam("PW") String password,
                                     @FormParam("useHsID") String useHsID,
                                     @FormParam("cmplYn") String cmplYn) throws Exception {

        logger.info("setMyPageHistory() [userid :" + userid + "]");

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();
        requestMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        requestMap.put("cmplYN", cmplYn);
        requestMap.put("useHsID", useHsID);
        requestMap.put("latCrctUserID", userid);

        SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
        if (smartClassService.update("smartClass.updateUseHS", requestMap) == 1) {
            obj.put("CODE", "200");
            obj.put("DESC", "Success");
        } else {
            obj.put("CODE", "301");
            obj.put("DESC", "Fail");
        }

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/learning/useHsCmplList")
    public     Response
                getUseHsCmplList(@FormParam("userID") String userID, @FormParam("param") String param) throws Exception {

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("userID", userID);
        String[] itemID = param.split("\\|");

        requestMap.put("itemID", itemID);

        SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
        List useHsList = smartClassService.selectListNoPage("assetUtil.selectUseHsCmplList", requestMap);

        obj.put("totalCount", requestMap.get("totalCount"));
        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("malayList", useHsList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
    // commerce Guide 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutGuidList")
    public     Response
                getGuidList(@FormParam("syncDt") String syncDt) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();
        requestMap.put("syncDt", syncDt);

        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List GuidList = commerceService.selectListNoPage("commerce.GuideList", requestMap);
                
        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("GuidList", GuidList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    	@POST
        @Path("/commerce/InGuidList")    	
//	    @Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_FORM_URLENCODED})
    	@Produces({MediaType.APPLICATION_JSON})
	    public Response getSetgetGuidList(String keyList) {
    	
        JSONObject obj = new JSONObject();  
        Gson gson = new Gson();
        try {        	
        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();
        	JsonObject jsonObject = null;

    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");

        	JsonCommerce jsonCommerce = new JsonCommerce();

        	for(int i = 0 ; i < jArray.size(); i++){
        		jsonObject = jArray.get(i).getAsJsonObject();
//        		String name = jsonObject.get("prmt_id");
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);
        		jsoncommerceService.insert("commerce.GuideList.insert", jsonCommerce);
        	}
        } catch (Exception e) {
            e.printStackTrace();
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }
        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    // commerce Temp 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutTempList")
    public     Response
                getTempList(@FormParam("syncDt") String syncDt) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("syncDt", syncDt);

        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List TempList = commerceService.selectListNoPage("commerce.TempList", requestMap);

        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("TempList", TempList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
    
    @POST
//    @Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_FORM_URLENCODED})
    @Path("/commerce/InTempList")
    @Produces({MediaType.APPLICATION_JSON})
//    public Response getSetPostTempList(@FormParam("keyID") String keyID, @FormParam("keyList")List<Map> keyList) {
    public Response getSetPostTempList(String keyList) {
    	
        JSONObject obj = new JSONObject();
  
        Gson gson = new Gson();
        
        try {        	

        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();
        	JsonObject jsonObject = null;

    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");

        	JsonCommerce jsonCommerce = new JsonCommerce();

        	for(int i = 0 ; i < jArray.size(); i++){
        		jsonObject = jArray.get(i).getAsJsonObject();
//        		String name = jsonObject.get("prmt_id");
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);
        		jsoncommerceService.insert("commerce.TempList.insert", jsonCommerce);
        	
        	}
        } catch (Exception e) {
            e.printStackTrace();
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }
        
        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    // commerce PRMT_TXT 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutPrmttxtList")
    public     Response
                getPrmttxtList(@FormParam("syncDt") String syncDt, @FormParam("userId") String userId) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("syncDt", syncDt);
        requestMap.put("userId", userId);
        
        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List PrmttxtList = commerceService.selectListNoPage("commerce.PrmttxtList", requestMap);

        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("PrmttxtList", PrmttxtList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
    @POST
    @Path("/commerce/InPrmttxtList")  	
//    @Produces(MediaType.APPLICATION_FORM_URLENCODED)
//    @Consumes("application/x-www-form-urlencoded")
//    @Produces({application/json,MediaType.APPLICATION_FORM_URLENCODED})
//    @Produces("application/x-www-form-urlencoded")
    @Produces({MediaType.APPLICATION_JSON})
    public Response getSetgetPrmttxtList(String keyList) {    	
	   	
    	
        JSONObject obj = new JSONObject();
        Gson gson = new Gson();
        
        try {        	     	
        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();
        	JsonObject jsonObject = null;

    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");

        	JsonCommerce jsonCommerce = new JsonCommerce();

        	for(int i = 0 ; i < jArray.size(); i++){
        		jsonObject = jArray.get(i).getAsJsonObject();
//        		String name = jsonObject.get("prmt_id");
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);

        		jsoncommerceService.insert("commerce.PrmttxtList.insert", jsonCommerce);
        	}
        	
//        	Type collectionType = new TypeToken<Collection<String>>(){}.getType();
        	
//        	List<String> List =  gson.fromJson(jsonList, List.class);;
//        	key = keyList;
//        	if(keyList..size() == 0){
//        		obj.put("CODE", "406");
//            	obj.put("DESC", "Fail");
//                return Response.status(200).entity(obj.toJSONString()).build();
//        	}
//        	for(int i = 0; i < List.size(); i++) {
//
//        		key = List.get(i);        	
//        		jsonCommerce = gson.fromJson(key, JsonCommerce.class);
//        		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");
//        		jsoncommerceService.insert("commerce.PrmttxtList.insert", jsonCommerce);
//        	}
        } catch (Exception e) {
            e.printStackTrace();
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }
        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    // commerce PRMT_IMG 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutPrmtimgList")
    public     Response
                getPrmtimgList(@FormParam("syncDt") String syncDt, @FormParam("userId") String userId) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("syncDt", syncDt);
        requestMap.put("userId", userId);

        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List PrmtimgList = commerceService.selectListNoPage("commerce.PrmtimgList", requestMap);

        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("PrmtimgList", PrmtimgList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
    @POST
    @Path("/commerce/InPrmtimgList")	
//    @Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_FORM_URLENCODED})
    @Produces({MediaType.APPLICATION_JSON})
    public Response getSetgetPrmtimgList(String keyList) {
	   	
        JSONObject obj = new JSONObject();
        Gson gson = new Gson();
        
        try {        	

        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();
        	JsonObject jsonObject = null;

    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");

        	JsonCommerce jsonCommerce = new JsonCommerce();

        	for(int i = 0 ; i < jArray.size(); i++){
        		jsonObject = jArray.get(i).getAsJsonObject();
//        		String name = jsonObject.get("prmt_id");
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);
        		jsoncommerceService.insert("commerce.PrmtimgList.insert", jsonCommerce);
        	}
        } catch (Exception e) {
            e.printStackTrace();
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }
        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    // commerce SNS_HS 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutSnshsList")
    public     Response
                getSnshsList(@FormParam("syncDt") String syncDt, @FormParam("userId") String userId) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("syncDt", syncDt);
        requestMap.put("userId", userId);

        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List SnshsList = commerceService.selectListNoPage("commerce.SnshsList", requestMap);
        
        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("SnshsList", SnshsList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
    @POST
    @Path("/commerce/InSnshsList")
//    @Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_FORM_URLENCODED})
    @Produces({MediaType.APPLICATION_JSON})
    public Response getSetgetSnshsList(String keyList) {
    
	   	 String prod = null;
	   	 
        JSONObject obj = new JSONObject();
        Gson gson = new Gson();
        
        try {        	        	
        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();        	
        	JsonObject jsonObject = null;        	
    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");    		
        	JsonCommerce jsonCommerce = new JsonCommerce();
        	int icnt = 0;
        	int ucnt = 0;
        	System.out.println("jArray.size()" + jArray.size());
        	for(int i = 0 ; i < jArray.size(); i++){        		        		
        		jsonObject = jArray.get(i).getAsJsonObject();
        		System.out.println("jsonObject" + jsonObject);        		
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);        		
        		if(jsonCommerce.getPROD().toString().equals("I")){        			
            		jsoncommerceService.insert("commerce.SnshsList.insert", jsonCommerce);
            		icnt++;
                    System.out.println("icnt" + icnt);
//                    obj.put("SnshsList", SnshsList);	
                }else if(jsonCommerce.getPROD().toString().equals("U")){                	
                	jsoncommerceService.update("commerce.SnshsList.update", jsonCommerce);
//                    obj.put("SnshsList", SnshsList);
                	ucnt++;
              	    System.out.println("ucnt" + ucnt);
                }
        	}
        } catch (Exception e) {
            e.printStackTrace();            
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }        
        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    // commerce PRMT 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutPrmtList")
    public     Response
                getPrmtList(@FormParam("syncDt") String syncDt, @FormParam("userId") String userId) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("syncDt", syncDt);
        requestMap.put("userId", userId);

        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List PrmtList = commerceService.selectListNoPage("commerce.PrmtList", requestMap);
        
        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("PrmtList", PrmtList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
    @POST
    @Path("/commerce/InPrmtList")
    @Produces({MediaType.APPLICATION_JSON})
    public Response getSetgetPrmtList(String keyList) throws IOException {
    	
        JSONObject obj = new JSONObject();
        Gson gson = new Gson();
        
        try {        	
        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();        	
        	JsonObject jsonObject = null;        	
    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");    		
    		CommonCodeService commonCodeService = (CommonCodeService)SpringApplicationContext.getBean("commonCodeService");    		
        	JsonCommerce jsonCommerce = new JsonCommerce();        	
        	        	
        	Map requestMap = new HashMap();        	
        	int icnt = 0;
        	int ucnt = 0;
        	System.out.println("jArray.size()" + jArray.size());
        	for(int i = 0 ; i < jArray.size(); i++){
        		jsonObject = jArray.get(i).getAsJsonObject();
        		System.out.println("jsonObject" + jsonObject);        		
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);        		
                if(jsonCommerce.getPROD().toString().equals("I")){                	
                jsoncommerceService.insert("commerce.PrmtList.insert", jsonCommerce);                	                	            	
//                    pMap.put("PrmtList", PrmtList);
                      icnt++;
                      System.out.println("icnt" + icnt);
                } else if(jsonCommerce.getPROD().toString().equals("U")){                	
                jsoncommerceService.update("commerce.PrmtList.update", jsonCommerce);
//                    pMap.put("PrmtList", PrmtList);
                	  ucnt++;
                	  System.out.println("ucnt" + ucnt);
                }                   
                requestMap.put("userid", jsonCommerce.getUSER_ID()); // use__id
                requestMap.put("endYN", "E"); // end Y or N
                
                if(jsonCommerce.getSNS_TYPE().equals("F")){
                	requestMap.put("srvcID", "44"); // category Using Interactive
                	String randomCategory = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory.substring(0, 17)); // end Y or N
                    String sqlMapId = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId, requestMap);
                } 
                if(jsonCommerce.getSNS_TYPE().equals("B")){
                	requestMap.put("srvcID", "45"); // category Using Interactive
                	String randomCategory = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory.substring(0, 17)); // end Y or N
                    String sqlMapId = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId, requestMap);
                } 
                if(jsonCommerce.getSNS_TYPE().equals("T")){
                	requestMap.put("srvcID", "46"); // category Using Interactive
                	String randomCategory = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory.substring(0, 17)); // end Y or N
                    String sqlMapId = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId, requestMap);
                }
                if(jsonCommerce.getSNS_TYPE().equals("FB")){
                	requestMap.put("srvcID", "44"); // category Using Interactive
                	String randomCategory1 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory1); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory1.substring(0, 17)); // end Y or N
                    String sqlMapId1 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId1, requestMap);
                    
                    requestMap.put("srvcID", "45"); // category Using Interactive
                    String randomCategory2 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory2); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory2.substring(0, 17)); // end Y or N
                    String sqlMapId2 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId2, requestMap);
                }
                if(jsonCommerce.getSNS_TYPE().equals("FT")){
                	requestMap.put("srvcID", "44"); // category Using Interactive
                	String randomCategory1 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory1); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory1.substring(0, 17)); // end Y or N
                    String sqlMapId1 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId1, requestMap);
                    
                    requestMap.put("srvcID", "46"); // category Using Interactive
                    String randomCategory2 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory2); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory2.substring(0, 17)); // end Y or N
                    String sqlMapId2 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId2, requestMap);
                }
                if(jsonCommerce.getSNS_TYPE().equals("BF")){
                	requestMap.put("srvcID", "44"); // category Using Interactive
                	String randomCategory1 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory1); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory1.substring(0, 17)); // end Y or N
                    String sqlMapId1 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId1, requestMap);
                    
                    requestMap.put("srvcID", "45"); // category Using Interactive
                    String randomCategory2 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory2); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory2.substring(0, 17)); // end Y or N
                    String sqlMapId2 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId2, requestMap);
                }
                if(jsonCommerce.getSNS_TYPE().equals("BT")){
                	requestMap.put("srvcID", "45"); // category Using Interactive
                	String randomCategory1 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory1); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory1.substring(0, 17)); // end Y or N
                    String sqlMapId1 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId1, requestMap);
                    
                    requestMap.put("srvcID", "46"); // category Using Interactive
                    String randomCategory2 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory2); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory2.substring(0, 17)); // end Y or N
                    String sqlMapId2 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId2, requestMap);
                }
                if(jsonCommerce.getSNS_TYPE().equals("FBT")){
                	requestMap.put("srvcID", "44"); // category Using Interactive
                	String randomCategory1 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory1); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory1.substring(0, 17)); // end Y or N
                    String sqlMapId1 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId1, requestMap);
                    
                    requestMap.put("srvcID", "45"); // category Using Interactive
                    String randomCategory2 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory2); // use_hs_nmbr_id
                    requestMap.put("END_TM", randomCategory2.substring(0, 17)); // end Y or N
                    String sqlMapId2 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId2, requestMap);
                    
                    requestMap.put("srvcID", "46"); // category Using Interactive
                    String randomCategory3 = DateFormatUtil.getRandomID();
                    requestMap.put("useHsNmbrID", randomCategory3); // use_hs_nmbr_id
                	requestMap.put("END_TM", randomCategory3.substring(0, 17)); // end Y or N
                    String sqlMapId3 = "using.insertBySrvID";
                    commonCodeService.insert(sqlMapId3, requestMap);
                }                
        	}
        } catch (Exception e) {
            e.printStackTrace();            
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }        
        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    // commerce REG_HS 동기화
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/commerce/OutReghsList")
    public     Response
                getReghsList(@FormParam("syncDt") String syncDt, @FormParam("userId") String userId) throws Exception {
//    	, @FormParam("syncDt") String syncDt

        JSONObject obj = new JSONObject();
        Map requestMap = new HashMap();

        requestMap.put("syncDt", syncDt);
        requestMap.put("userId", userId);

        CommerceService commerceService = (CommerceService)SpringApplicationContext.getBean("commerceService");
        List ReghsList = commerceService.selectListNoPage("commerce.ReghsList", requestMap);

        obj.put("CODE", "200");
        obj.put("DESC", "Success");
        obj.put("ReghsList", ReghsList);

        return Response.status(200).entity(obj.toJSONString()).build();

    }
 
    /*
     *     WebClient client = WebClient.create("http://myserver/services/test/postdata3"); 
    client.type("multipart/mixed").accept("application/json"); 
    List<Attachment> atts = new LinkedList<Attachment>(); 
    atts.add(new Attachment("testItem1", "application/json", t1)); 
    atts.add(new Attachment("testItem2", "application/json", t2)); 
    javax.ws.rs.core.Response s = client.postCollection(atts, Attachment.class); 
    System.out.println(s.getStatus());
     * http://stackoverflow.com/questions/9623616/cxf-jaxrs-how-to-post-more-than-one-parameter
     * 
     */
    @POST
    @Path("/commerce/InReghsList")
//    @Produces({MediaType.APPLICATION_JSON,MediaType.APPLICATION_FORM_URLENCODED})
    @Produces({MediaType.APPLICATION_JSON})
    public Response getSetgetReghsList(String keyList) {
	  
	   	 
        JSONObject obj = new JSONObject();
        Gson gson = new Gson();
        
        try {        	

        	JsonArray jArray = new JsonParser().parse(keyList).getAsJsonArray();
        	JsonObject jsonObject = null;

    		JsonCommerceService jsoncommerceService = (JsonCommerceService)SpringApplicationContext.getBean("jsonCommerceService");

        	JsonCommerce jsonCommerce = new JsonCommerce();

        	for(int i = 0 ; i < jArray.size(); i++){
        		jsonObject = jArray.get(i).getAsJsonObject();        		
        		jsonCommerce = gson.fromJson(jsonObject, JsonCommerce.class);
        		jsoncommerceService.insert("commerce.ReghsList.insert", jsonCommerce);
        		
        	}
        } catch (Exception e) {
            e.printStackTrace();
            obj.put("CODE", "406");
        	obj.put("DESC", "Fail");
            return Response.status(200).entity(obj.toJSONString()).build();
        }

        obj.put("CODE", "200");
    	obj.put("DESC", "Success");
        String retrunValue = obj.toJSONString();
        return Response.status(200).entity(obj.toJSONString()).build();
    }
    
    @SuppressWarnings("unchecked")
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/health/insertPrintUseHs")
    public     Response
                insertPrintUseHs(@FormParam("USER_ID") String userID, @FormParam("PW") String password) throws Exception {

        JSONObject obj = new JSONObject();

        PriceService priceService = (PriceService)SpringApplicationContext.getBean("priceService");
        Price price = new Price();
        price.setTagetID("401");
        price = priceService.select("price.read", price);

        Map pMap = new HashMap();
        pMap.put("useHsNmbrID", DateFormatUtil.getRandomID());
        pMap.put("startTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        // pMap.put("endTm", DateFormatUtil.getDateFormat("yyyyMMddHHmmssSSS"));
        pMap.put("cmplYN", "E");
        pMap.put("payKind", price.getPayKindCd());
        pMap.put("pricType", price.getPricTypeCd());
        pMap.put("pricUnit", price.getPricUnitCd());
        pMap.put("flatRate", price.getFlatRate());
        pMap.put("depositRate", price.getDepositRate());
        pMap.put("rentDay", price.getRentDay());
        pMap.put("userID", userID);
        pMap.put("godsID", "401");
        pMap.put("itemID", "");
        pMap.put("frstRgstUserID", userID);
        pMap.put("latCrctUserID", userID);

        SmartClassService smartClassService = (SmartClassService)SpringApplicationContext.getBean("smartClassService");
        smartClassService.insert("smartClass.inserUseHS", pMap);
        obj.put("CODE", "200");
        obj.put("DESC", "Success");

        return Response.status(200).entity(obj.toJSONString()).build();

    }

    @SuppressWarnings("unchecked")
    @GET
    @Produces("application/json")
    @Path("{divide}")
    public Response getGetCommonByName(@PathParam("divide") String divide, @FormParam("keyID") String keyID) {

        logger.info("getGetCommonByName() divide : " + divide + ", keyID:" + keyID);

        JSONObject obj = new JSONObject();
        try {
            String sqlMapId = "commonCode.list";
            if (divide == "CommonCode") {

            } else {

            }

            Map pMap = new HashMap();
            pMap.put("keyID", keyID);

            List<CommonCode> CommonCodeList = new ArrayList<CommonCode>();

            // get service Bean from ApplicationContext
            CommonCodeService commonCodeService = (CommonCodeService)SpringApplicationContext.getBean("commonCodeService");

            CommonCodeList = commonCodeService.selectList(sqlMapId, pMap);

            obj.put("itmes", CommonCodeList);

            // test data
            obj.put("divide", divide);
            obj.put("age", new Integer(90));

        } catch (Exception e) {
            e.printStackTrace();
        }

        String retrunValue = obj.toJSONString();

        return Response.status(200).entity(obj.toJSONString()).build();
    }     
  
    // 카테고리 드롭박스 선택
    @SuppressWarnings("unchecked")
    @GET
    @Produces("application/json")
    @Path("/category")
    public Response getGetUsrFreeReply(@PathParam("divide") String divide,
                                       @FormParam("keyID") String keyID,
                                       @FormParam("depth") String depth,
                                       @FormParam("lft") String lft,
                                       @FormParam("rgt") String rgt) {

        logger.info("getGetCommonByName() divide : " + divide + ", keyID:" + keyID);

        JSONObject obj = new JSONObject();
        try {
            String sqlMapId = "category.list";

            Map pMap = new HashMap();
            pMap.put("depth", depth);
            pMap.put("lft", lft);
            pMap.put("rgt", rgt);

            List<CommonCode> categoryList = new ArrayList<CommonCode>();

            // get service Bean from ApplicationContext
            CommonCodeService commonCodeService = (CommonCodeService)SpringApplicationContext.getBean("commonCodeService");

            categoryList = commonCodeService.selectList(sqlMapId, pMap);

            obj.put("itmes", categoryList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return Response.status(200).entity(obj.toJSONString()).build();
    }

    // 카테고리 드롭박스 선택
    @SuppressWarnings("unchecked")
    @GET
    @Produces("application/json")
    @Path("/categoryList")
    public Response selectCategoryList(@PathParam("divide") String divide, @FormParam("srvcID") String srvcID) {

        JSONObject obj = new JSONObject();
        try {
            String sqlMapId = "category.selectList";

            Map pMap = new HashMap();
            pMap.put("srvcID", srvcID);

            List categoryList = new ArrayList();
            CommonCodeService commonCodeService = (CommonCodeService)SpringApplicationContext.getBean("commonCodeService");

            categoryList = commonCodeService.selectList(sqlMapId, pMap);

            obj.put("itmes", categoryList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return Response.status(200).entity(obj.toJSONString()).build();
    }

    @SuppressWarnings("unchecked")
    @POST
    @Produces("application/json")
    @Path("/usrFree")
    public Response getPostReply(@FormParam("flag") String flag,
                                 @FormParam("boardID") String boardID,
                                 @FormParam("replyID") String replyID,
                                 @FormParam("replyCont") String replyCont,
                                 @FormParam("frstRgstDT") String frstRgstDT,
                                 @FormParam("frstRgstUserID") String frstRgstUserID

    ) {

        logger.info("getGetCommonByName() divide :, boardID:" + boardID);

        JSONObject obj = new JSONObject();
        try {

            Map pMap = new HashMap();
            pMap.put("boardID", boardID);
            pMap.put("replyID", replyID);
            pMap.put("replyCont", replyCont);
            pMap.put("frstRgstDT", frstRgstDT);
            pMap.put("frstRgstUserID", frstRgstUserID);

            // get service Bean from ApplicationContext
            CommonCodeService commonCodeService = (CommonCodeService)SpringApplicationContext.getBean("commonCodeService");
            UserFreeService userFreeService = (UserFreeService)SpringApplicationContext.getBean("userFreeService");

            if (flag.equals("list")) {
                String sqlMapId = "usrFree.replylist";
                List<CommonCode> replylist = new ArrayList<CommonCode>();
                replylist = commonCodeService.selectList(sqlMapId, pMap);
                obj.put("replyItems", replylist);
            } else if (flag.equals("insert")) {
                String sqlMapId = "usrFree.replyinsert";
                UserFree user = new UserFree();
                user.setBoardID(boardID);
                // user.
                // userFreeService.insert(sqlMapId, user);
            } else if (flag.equals("del")) {

            } else {
                obj.put("retVal", "false");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return Response.status(200).entity(obj.toJSONString()).build();
    }

}
