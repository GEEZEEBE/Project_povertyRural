package com.skt.mars.adm.cm;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CommonCode implements JSONAware{

	private String commonCodeID;
	private String codeID;
	private String subCodeID;
	private String codeName;
	
	public CommonCode() {
		this.codeID = null;
		this.codeName = null;
	}
	
	public CommonCode(String codeID, String codeValue) {
		this.codeID = codeID;
		this.codeName = codeValue;
	}
	
	public String getCommonCodeID() {
		return commonCodeID;
	}

	public void setCommonCodeID(String commonCodeID) {
		this.commonCodeID = commonCodeID;
	}

	public String getCodeID() {
		return codeID;
	}

	public void setCodeID(String codeID) {
		this.codeID = codeID;
	}

	public String getSubCodeID() {
		return subCodeID;
	}

	public void setSubCodeID(String subCodeID) {
		this.subCodeID = subCodeID;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    obj.put("commonCodeID", commonCodeID);
	    obj.put("codeID", codeID);
	    obj.put("subCodeID", subCodeID);
	    obj.put("codeName", codeName);
	    return obj.toJSONString();	
	}


}
