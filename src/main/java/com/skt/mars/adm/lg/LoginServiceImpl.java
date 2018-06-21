package com.skt.mars.adm.lg;

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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.skt.mars.adm.cm.Code;

@SuppressWarnings("unchecked")
@Service(value="loginService")
@Path(value="/login")
public class LoginServiceImpl {
	protected final Log logger = LogFactory.getLog(getClass());
	
	@GET
	@Produces({MediaType.APPLICATION_JSON})
	public Response getGetCommon(@FormParam("userid") String userid,
								 @FormParam("password") String password,
								 @FormParam("macaddress") String macaddress) throws Exception {
 	
		logger.info("getGetCommon() [userid :"+userid+"]");
		
		JSONObject obj = new JSONObject();
		obj.put("userid", userid);
		obj.put("password", password);
		obj.put("macaddress", macaddress);
 
//		JSONArray list = new JSONArray();
//		list.add("msg 1");
//		list.add("msg 2");
//		list.add("msg 3");
//	 
//		obj.put("itmes", list);
		
		return Response.status(200).entity(obj.toString()).build();
 
	}
	
	@POST
	@Produces("application/json")
	public Response getPostCommon() {
		logger.info("getPostCommon()");
		String json = "getUser is called";
		return Response.ok(json, MediaType.APPLICATION_JSON).build();
 
	}

	@GET
	@Produces("application/json")
	@Path("{divide}")
	public Response getGetCommonByName(@PathParam("divide") String divide, @FormParam("name") String name) {
 
		logger.info("getGetCommonByName() divide : "+divide+", name:"+name);
		JSONObject obj = new JSONObject();
		try {
			obj.put("divide", divide);
			obj.put("age", new Integer(90));
	 
			JSONArray list = new JSONArray();

			Code code = new Code();
			code.setCode("iPad 5");
			code.setLabel("Good");
			list.add(code);
			 			
			Code code1 = new Code();
			code1.setCode(name);
			code1.setLabel("bad");
			list.add(code1);
	
			obj.put("itmes", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return Response.status(200).entity(obj.toString()).build();
 
	}	

	@POST
	@Produces("application/json")
	@Path("{divide}")
	public Response getPostCommonByDivide(@PathParam("divide") String divide, @FormParam("name") String name) {
 
		logger.info("getPostCommonByDivide() divide : "+divide+", name:"+name);
		JSONObject obj = new JSONObject();
		try {
			obj.put("divide", divide);
			obj.put("age", new Integer(90));
	 
			JSONArray list = new JSONArray();

			Code code = new Code();
			code.setCode("iPad 5");
			code.setLabel("Good");
			list.add(code);
			 			
			Code code1 = new Code();
			code1.setCode(divide);
			code1.setLabel("bad");
			list.add(code1);
	
			obj.put("itmes", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return Response.status(200).entity(obj.toString()).build();
 
	}	
}
