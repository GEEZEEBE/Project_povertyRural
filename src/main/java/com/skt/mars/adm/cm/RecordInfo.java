package com.skt.mars.adm.cm;

import java.sql.Date;

public class RecordInfo {
	private Date frstRgstDT ;
	private String frstRgstUserID ;
	private String frstRgstName ;
	private Date latCrctDT ;
	private String latCrctUserID ;	
	private String latCrctName ;	
	
	public Date getFrstRgstDT() {
		return frstRgstDT;
	}
	public void setFrstRgstDT(Date frstRgstDT) {
		this.frstRgstDT = frstRgstDT;
	}
	public String getFrstRgstUserID() {
		return frstRgstUserID;
	}
	public void setFrstRgstUserID(String frstRgstUserID) {
		this.frstRgstUserID = frstRgstUserID;
	}
	public Date getLatCrctDT() {
		return latCrctDT;
	}
	public void setLatCrctDT(Date latCrctDT) {
		this.latCrctDT = latCrctDT;
	}
	public String getLatCrctUserID() {
		return latCrctUserID;
	}
	public void setLatCrctUserID(String latCrctUserID) {
		this.latCrctUserID = latCrctUserID;
	}
	public String getFrstRgstName() {
		return frstRgstName;
	}
	public void setFrstRgstName(String frstRgstName) {
		this.frstRgstName = frstRgstName;
	}
	public String getLatCrctName() {
		return latCrctName;
	}
	public void setLatCrctName(String latCrctName) {
		this.latCrctName = latCrctName;
	}	
}
