package com.skt.mars.adm.op;

import oracle.sql.TIMESTAMP;

import com.skt.mars.adm.cm.RecordInfo;

/*
CREATE TABLE TB_UAST_COSTPRIC
(
	COSTPRIC_ID VARCHAR(20) NOT NULL UNIQUE COMMENT '원가_ID',
	COSTPRIC_NM VARCHAR(40) NOT NULL COMMENT '원가명',
	COSTPRIC_TYPE VARCHAR(20) NOT NULL COMMENT '요금구분',
	COSTPRIC BIGINT NOT NULL COMMENT '요금',
	PRFT_MRGIN BIGINT NOT NULL COMMENT '마진율',
	USER_MRGIN BIGINT NOT NULL COMMENT '회원마진율',
	FINE_MRGIN BIGINT NOT NULL COMMENT '패널티마진율',
	FINE BIGINT NOT NULL COMMENT '패널티요금',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (COSTPRIC_ID)
) COMMENT = '원가';
 */
/*
	COSTPRIC_ID VARCHAR(20) NOT NULL UNIQUE COMMENT '원가_ID',
	COSTPRIC_NM VARCHAR(40) NOT NULL COMMENT '원가명',
	COSTPRIC_TYPE VARCHAR(20) NOT NULL COMMENT '요금구분',
	COSTPRIC BIGINT NOT NULL COMMENT '요금',
	PRFT_MRGIN BIGINT NOT NULL COMMENT '마진율',
	USER_MRGIN BIGINT NOT NULL COMMENT '회원마진율',
	FINE_MRGIN BIGINT NOT NULL COMMENT '패널티마진율',
	FINE BIGINT NOT NULL COMMENT '패널티요금',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
*/

public class Cost extends RecordInfo {
	
	private int		rowNum;
	private String costpricID;
	private String costpricNM;
	private String costpricType;
	private String costpricTypeNM;
	private String assetTypeCD;
	private String assetTypeNM;
	private long	costpric;
	private long	prftMrgin;
	private long	userMrgin;
	private long	fineMrgin;
	private long	fine;
	
	
	public String getCostpricTypeNM() {
		return costpricTypeNM;
	}
	public void setCostpricTypeNM(String costpricTypeNM) {
		this.costpricTypeNM = costpricTypeNM;
	}
	public String getAssetTypeNM() {
		return assetTypeNM;
	}
	public void setAssetTypeNM(String assetTypeNM) {
		this.assetTypeNM = assetTypeNM;
	}
	public String getAssetTypeCD() {
		return assetTypeCD;
	}
	public void setAssetTypeCD(String assetTypeCD) {
		this.assetTypeCD = assetTypeCD;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getCostpricID() {
		return costpricID;
	}
	public void setCostpricID(String costpricID) {
		this.costpricID = costpricID;
	}
	public String getCostpricNM() {
		return costpricNM;
	}
	public void setCostpricNM(String costpricNM) {
		this.costpricNM = costpricNM;
	}
	public String getCostpricType() {
		return costpricType;
	}
	public void setCostpricType(String costpricType) {
		this.costpricType = costpricType;
	}
	public long getCostpric() {
		return costpric;
	}
	public void setCostpric(long costpric) {
		this.costpric = costpric;
	}
	public long getPrftMrgin() {
		return prftMrgin;
	}
	public void setPrftMrgin(long prftMrgin) {
		this.prftMrgin = prftMrgin;
	}
	public long getUserMrgin() {
		return userMrgin;
	}
	public void setUserMrgin(long userMrgin) {
		this.userMrgin = userMrgin;
	}
	public long getFineMrgin() {
		return fineMrgin;
	}
	public void setFineMrgin(long fineMrgin) {
		this.fineMrgin = fineMrgin;
	}
	public long getFine() {
		return fine;
	}
	public void setFine(long fine) {
		this.fine = fine;
	}
	
	

	
}
