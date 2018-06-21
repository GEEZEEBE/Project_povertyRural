package com.skt.mars.adm.bm;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import com.skt.mars.adm.cm.RecordInfo;

public class Using extends RecordInfo implements JSONAware{

	String useHsNmbrID;
	String strtTM;
	String endTM;
	String cmplYN;
	String payKind;
	String pricUnit;
	long depositRate;
	String mixedName;
	String serviceCatagory;
	String pkKeyID;
	
	public String getUseHsNmbrID() {
		return useHsNmbrID;
	}


	public void setUseHsNmbrID(String useHsNmbrID) {
		this.useHsNmbrID = useHsNmbrID;
	}


	public String getStrtTM() {
		return strtTM;
	}


	public void setStrtTM(String strtTM) {
		this.strtTM = strtTM;
	}


	public String getEndTM() {
		return endTM;
	}


	public void setEndTM(String endTM) {
		this.endTM = endTM;
	}


	public String getCmplYN() {
		return cmplYN;
	}


	public void setCmplYN(String cmplYN) {
		this.cmplYN = cmplYN;
	}


	public String getPayKind() {
		return payKind;
	}


	public void setPayKind(String payKind) {
		this.payKind = payKind;
	}


	public String getPricUnit() {
		return pricUnit;
	}


	public void setPricUnit(String pricUnit) {
		this.pricUnit = pricUnit;
	}


	public long getDepositRate() {
		return depositRate;
	}


	public void setDepositRate(long depositRate) {
		this.depositRate = depositRate;
	}


	public String getMixedName() {
		return mixedName;
	}


	public void setMixedName(String mixedName) {
		this.mixedName = mixedName;
	}


	public String getServiceCatagory() {
		return serviceCatagory;
	}


	public void setServiceCatagory(String serviceCatagory) {
		this.serviceCatagory = serviceCatagory;
	}


	public String getPkKeyID() {
		return pkKeyID;
	}


	public void setPkKeyID(String pkKeyID) {
		this.pkKeyID = pkKeyID;
	}


	@Override
	public String toJSONString() {
	    JSONObject obj = new JSONObject();
	    
	    obj.put("useHsNmbrID", useHsNmbrID);
	    obj.put("strtTM", strtTM);
	    obj.put("endTM", endTM);
	    obj.put("depositRate", depositRate);
	    obj.put("mixedName", mixedName);
	    obj.put("serviceCatagory", serviceCatagory);
	    obj.put("pkKeyID", pkKeyID);
	    return obj.toJSONString();	
	}	
}
