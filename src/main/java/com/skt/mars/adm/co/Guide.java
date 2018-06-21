package com.skt.mars.adm.co;

import java.sql.Date;

import com.skt.mars.adm.cm.RecordInfo;


/**
 * CREATE TABLE `tb_ruac_guid` (
  `GUID_ID` varchar(20) NOT NULL COMMENT '커머스교육컨텐츠ID',
  `GUID_TYPE` varchar(2) DEFAULT NULL COMMENT '구분',
  `GUID_TITL` varchar(100) DEFAULT NULL COMMENT '제목',
  `GUID_SMMR` varchar(200) DEFAULT NULL COMMENT '내용',
  'GUID_LANG' varchar(2) DEFAULT NULL COMMENT '언어(영어,말레이어),
  `GUID_CNTS_URL` varchar(256) DEFAULT NULL COMMENT '교육컨텐츠경로',
  `DEL_YN` char(1) DEFAULT NULL COMMENT '삭제여부',
  `FRST_RGST_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '최초등록일시',
  `FRST_RGST_MNGR_ID` varchar(20) DEFAULT NULL COMMENT '최초등록운영자ID',
  `LAST_CRCT_DT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '최종수정일시',
  `LAST_CRCT_MNGR_ID` varchar(20) DEFAULT NULL COMMENT '최종수정운영자ID',
  PRIMARY KEY (`GUID_ID`),
  UNIQUE KEY `GUID_ID_PK_GUID` (`GUID_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='커머스 교육 컨텐츠';
 * 
 * **/


public class Guide extends RecordInfo{
	private String guidId;
	private String guidType;
	private String guidTitl;
	private String guidSmmr;
	private String guidCntsUrl;
	private String delYn;
	private Date frstRgstDt;
	private String frstRgstMngrId;
	private Date lastCrctDt;
	private String lastCrctMngrId;
	private String guidLang;
	private String prevCon;
	private String nextCon;
	
	
	
	/******************************getter/setter***********************************/
	public String getGuidId() {
		return guidId;
	}
	public void setGuidId(String guidId) {
		this.guidId = guidId;
	}
	public String getGuidType() {
		return guidType;
	}
	public void setGuidType(String guidType) {
		this.guidType = guidType;
	}
	public String getGuidTitl() {
		return guidTitl;
	}
	public void setGuidTitl(String guidTitl) {
		this.guidTitl = guidTitl;
	}
	public String getGuidSmmr() {
		return guidSmmr;
	}
	public void setGuidSmmr(String guidSmmr) {
		this.guidSmmr = guidSmmr;
	}
	public String getGuidCntsUrl() {
		return guidCntsUrl;
	}
	public void setGuidCntsUrl(String guidCntsUrl) {
		this.guidCntsUrl = guidCntsUrl;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public Date getFrstRgstDt() {
		return frstRgstDt;
	}
	public void setFrstRgstDt(Date frstRgstDt) {
		this.frstRgstDt = frstRgstDt;
	}
	public String getFrstRgstMngrId() {
		return frstRgstMngrId;
	}
	public void setFrstRgstMngrId(String frstRgstMngrId) {
		this.frstRgstMngrId = frstRgstMngrId;
	}
	public Date getLastCrctDt() {
		return lastCrctDt;
	}
	public void setLastCrctDt(Date lastCrctDt) {
		this.lastCrctDt = lastCrctDt;
	}
	public String getLastCrctMngrId() {
		return lastCrctMngrId;
	}
	public void setLastCrctMngrId(String lastCrctMngrId) {
		this.lastCrctMngrId = lastCrctMngrId;
	}
	public String getGuidLang() {
		return guidLang;
	}
	public void setGuidLang(String guidLang) {
		this.guidLang = guidLang;
	}
	public String getPrevCon() {
		return prevCon;
	}
	public void setPrevCon(String prevCon) {
		this.prevCon = prevCon;
	}
	public String getNextCon() {
		return nextCon;
	}
	public void setNextCon(String nextCon) {
		this.nextCon = nextCon;
	}
	
	/******************************getter/setter***********************************/
}
