package com.skt.mars.adm.bm;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import com.skt.mars.adm.cm.RecordInfo;

/* table TB_UAST_PAYMENT
, ACPT_ID
, DPST_KIND
, DPST_MTHD
, DPST_AMT
, RETURN_AMT
, DSPT_DT
, RETURN_DT
, RMRK
, GODS_PRIN_HS_NMBR_ID 
 */

public class Payment extends RecordInfo implements JSONAware {

	String acptID ;	// '수납_ID',
	String dpstKind ;	// '수납종류',
	String dpstMthd ;	// '수납방법',
	long dpstAmt ;	// '입금액',
	long returnAmt ;	// '반환액',
	String dsptDT ;	// '입금일시',
	String returnDT ; 	// '반환일시',
	String rmark ; 	// '비고',
	String useHsNmbrID ; 	// '상품구매이력_ID',
	String payKind; //납부구분
	
	
	
	public String getPayKind() {
		return payKind;
	}
	public void setPayKind(String payKind) {
		this.payKind = payKind;
	}
	public String getAcptID() {
		return acptID;
	}
	public void setAcptID(String acptID) {
		this.acptID = acptID;
	}
	public String getDpstKind() {
		return dpstKind;
	}
	public void setDpstKind(String dpstKind) {
		this.dpstKind = dpstKind;
	}
	public String getDpstMthd() {
		return dpstMthd;
	}
	public void setDpstMthd(String dpstMthd) {
		this.dpstMthd = dpstMthd;
	}
	public long getDpstAmt() {
		return dpstAmt;
	}
	public void setDpstAmt(long dpstAmt) {
		this.dpstAmt = dpstAmt;
	}
	public long getReturnAmt() {
		return returnAmt;
	}
	public void setReturnAmt(long returnAmt) {
		this.returnAmt = returnAmt;
	}
	public String getDsptDT() {
		return dsptDT;
	}
	public void setDsptDT(String dsptDT) {
		this.dsptDT = dsptDT;
	}
	public String getReturnDT() {
		return returnDT;
	}
	public void setReturnDT(String returnDT) {
		this.returnDT = returnDT;
	}
	public String getRmark() {
		return rmark;
	}
	public void setRmark(String rmark) {
		this.rmark = rmark;
	}
	public String getUseHsNmbrID() {
		return useHsNmbrID;
	}
	public void setUseHsNmbrID(String useHsNmbrID) {
		this.useHsNmbrID = useHsNmbrID;
	}
	public String toJSONString() {
	    JSONObject obj = new JSONObject();
	    return obj.toJSONString();	
	}	

}
