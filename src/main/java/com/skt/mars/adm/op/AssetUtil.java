package com.skt.mars.adm.op;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import oracle.sql.TIMESTAMP;

import com.skt.mars.adm.cm.RecordInfo;

/*
	CREATE TABLE TB_UAST_USE_HS
(
	USE_HS_NMBR_ID VARCHAR(30) NOT NULL UNIQUE COMMENT 'USE_HS_NMBR_ID',
	-- STRT_TM
	STRT_TM VARCHAR(20) COMMENT '시작일시',
	-- END_TM
	END_TM VARCHAR(20) COMMENT '종료일시',
	-- CMPL_YN
	CMPL_YN VARCHAR(1) NOT NULL COMMENT '완료여부',
	PAY_KIND VARCHAR(5) COMMENT '납부구분',
	PRIC_TYPE VARCHAR(5) COMMENT '과금타입',
	PRIC_UNIT VARCHAR(5) COMMENT '과금단위구분',
	FLAT_RATE BIGINT COMMENT '정액요금',
	DEPOSIT_RATE BIGINT COMMENT '디파짓금액',
	-- As Rent : day, As Print : per page
	RENT_DAY VARCHAR(5) COMMENT '대여일수',
	USER_ID VARCHAR(30) NOT NULL COMMENT '사용자_ID',
	GODS_ID VARCHAR(30) NOT NULL COMMENT '상품 ID',
	ITEM_ID VARCHAR(30) COMMENT '아이템 ID',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (USE_HS_NMBR_ID)
) COMMENT = '사용자서비스이용이력';
 */
/*
	private String srvcID;
	private String srvcCtgrNM;
	private String itemNM;
	private String item5;
	private String assetID;
	
	private String godsID;
	private String itemID;
*/

public class AssetUtil extends RecordInfo implements JSONAware {
	
	private String srvcID; // 카테고리 아이디
	private String srvcCtgrNM; // 카테고리명
	private String itemNM; // 자산(아이템명)
	private String item05; // 자산(시리얼넘버)
	private String assetID; // 자산아이디
	private String depositRate;//디파짓금액
	private String itemID;//아이템아이디
	private String godsID;//상품아이디
	private String godsNM;//상품이름
	
	private String useHsNmbrID; //이용이력아이디
	private String startTm; // 시작일시
	private String endTm; //종료일시
	private String cmplYN; //완료여부
	private String payKind; //납부구분
	private String pricType; //과금타입
	private String pricUnit; //과금단위구분
	private String flatRate; //정액요금
	private String rentDay; //대여일수
	private String userID; //사용자아이디
	
	private String depositYN; // 디파짓 수납여부
	
	private String userName; // user name
	private String returnDay; // 대여일,반납일
	
	private String fine; // 연체요금
	
	private String CNTS_NAME;
	
	public String getCNTS_NAME() {
		return CNTS_NAME;
	}
	public void setCNTS_NAME(String cNTS_NAME) {
		CNTS_NAME = cNTS_NAME;
	}
	public String getFine() {
		return fine;
	}
	public void setFine(String fine) {
		this.fine = fine;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReturnDay() {
		return returnDay;
	}
	public void setReturnDay(String returnDay) {
		this.returnDay = returnDay;
	}
	public String getDepositYN() {
		return depositYN;
	}
	public void setDepositYN(String depositYN) {
		this.depositYN = depositYN;
	}
	public String getGodsNM() {
		return godsNM;
	}
	public void setGodsNM(String godsNM) {
		this.godsNM = godsNM;
	}
	public String getUseHsNmbrID() {
		return useHsNmbrID;
	}
	public void setUseHsNmbrID(String useHsNmbrID) {
		this.useHsNmbrID = useHsNmbrID;
	}
	public String getStartTm() {
		return startTm;
	}
	public void setStartTm(String startTm) {
		this.startTm = startTm;
	}
	public String getEndTm() {
		return endTm;
	}
	public void setEndTm(String endTm) {
		this.endTm = endTm;
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
	public String getPricType() {
		return pricType;
	}
	public void setPricType(String pricType) {
		this.pricType = pricType;
	}
	public String getPricUnit() {
		return pricUnit;
	}
	public void setPricUnit(String pricUnit) {
		this.pricUnit = pricUnit;
	}
	public String getFlatRate() {
		return flatRate;
	}
	public void setFlatRate(String flatRate) {
		this.flatRate = flatRate;
	}
	public String getRentDay() {
		return rentDay;
	}
	public void setRentDay(String rentDay) {
		this.rentDay = rentDay;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getDepositRate() {
		return depositRate;
	}
	public void setDepositRate(String depositRate) {
		this.depositRate = depositRate;
	}
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	public String getGodsID() {
		return godsID;
	}
	public void setGodsID(String godsID) {
		this.godsID = godsID;
	}
	public String getAssetID() {
		return assetID;
	}
	public void setAssetID(String assetID) {
		this.assetID = assetID;
	}
	public String getSrvcID() {
		return srvcID;
	}
	public void setSrvcID(String srvcID) {
		this.srvcID = srvcID;
	}
	public String getSrvcCtgrNM() {
		return srvcCtgrNM;
	}
	public void setSrvcCtgrNM(String srvcCtgrNM) {
		this.srvcCtgrNM = srvcCtgrNM;
	}
	public String getItemNM() {
		return itemNM;
	}
	public void setItemNM(String itemNM) {
		this.itemNM = itemNM;
	}
	public String getItem05() {
		return item05;
	}
	public void setItem05(String item05) {
		this.item05 = item05;
	}
	
	@Override
	public String toJSONString() {
		// TODO Auto-generated method stub
		
		JSONObject obj = new JSONObject();
		   
		obj.put("srvcCtgrNM", srvcCtgrNM);
	    obj.put("godsNM", godsNM);
	    obj.put("godsID", godsID);
	    obj.put("payKind", payKind);
	    obj.put("pricType", pricType);
	    obj.put("pricUnit", pricUnit);
	    obj.put("flatRate", flatRate);
	    
	    return obj.toJSONString();	
	
	}
	
	
	
	
}
