package com.skt.mars.adm.cm;

import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skt.mars.adm.cm.ut.DateFormatUtil;

public class CommonController {

	@Autowired
	private CommonCodeService commonCodeService;	// modify here

	/*
	 * 
	 */
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @RequestMapping("/restful/common/login/{divide}")
    public @ResponseBody Response  getGetCommon(@PathParam("divide") String divide,
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
        sqlMapId = "user.select.check";

        Map resultMap = (Map)commonCodeService.selectByObject(sqlMapId, requestMap);

        if (resultMap != null) {

            if ("301".equals(resultMap.get("macaddress"))) {
                responseCode = "301";
                responseDesc = "Error! Not match MacAddress.";
            } else if ("302".equals(resultMap.get("USER_ID"))) {
                responseCode = "302";
                responseDesc = "Error! Not match User ID.";

            } else if ("303".equals(resultMap.get("USERNAME"))) {
                responseCode = "303";
                responseDesc = "Error! Not match Password.";

            } else if ("303".equals(resultMap.get("USERNAME"))) {
                responseCode = "303";
                responseDesc = "Error! There is null Authority.";

            } else {
                if (divide.equalsIgnoreCase("ELWHITEBOARD")) {
                    requestMap.put("srvcID", 42); // category Using Interactive 이부분 체크
                                                  // White Board
                    sqlMapId = "using.insertBySrvID";

                } else if (divide.equalsIgnoreCase("PCAGENCY")) {
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

}
