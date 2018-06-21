package com.skt.mars.adm.cm;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class Code implements JSONAware{

	private String code;
	private String label;
	
	public Code() {
	}
	
	public Code(String code, String value) {
		this.code = code;
		this.label = value;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String value) {
		this.label = value;
	}

	public String toJSONString(){
	    JSONObject obj = new JSONObject();
//	    obj.put("code", code);
//	    obj.put("label", label);
	    return obj.toString();	}

}
