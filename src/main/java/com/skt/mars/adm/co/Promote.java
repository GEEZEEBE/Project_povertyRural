package com.skt.mars.adm.co;

import java.sql.Date;

import com.skt.mars.adm.cm.RecordInfo;
 
public class Promote extends RecordInfo{
	private String prmtId;						//홍보물 id  
	private String userId;						//회원 id
	private String tempId;						//홍보템플릿 id
	private String prmtType;					//홍보구분(라벨,브로셔,홍보물)
	private String prmtLvlType;				//등록구분(숙련자, 초보자)
	private String prmtLvl;						//등록단계(홍보물 올리는 단계)
	private String prodTitl;						//상품명
	private String prodNm;						//제목
	private String prodSllr;						//판매자명
	private String prodPric;					//판매가격
	private String tlno;							//전화번호
	private String emal;							//e-mail주소
	private String prmtProdImg;				//홍보이미지 경로
	private String ThumImg;					//썸네일이미지 경로
	private String delYn;						//삭제여부
	private String frstRgstDt;					//최초등록일시
	private String lastCrctDt;					//최종수정일시 
	private String lastSaveYnTabletOnly;	//최종저장여부 tablet only
	
	private String snsHsId;						//홍보Sns계정이력Id
	private String snsId;						//SNS ID
	private String snsType;					//SNS 구분코드
	private String snsPw;						//SNS비밀번호
	private String cbcSnsYn;					//공용SNS계정여부
	private String prmtSnsUrl;					//SNS등록된 홍보글 URL
	private String prmtSnsId;					//SNS등록된 홍보글 ID
	private String snsStat;						//홍보상태
	private String syncYnServerOnly;		//동기화여부 server only
	private Date snsFrstRgstDt;					//SNS글 최초등록일시
	private Date snsLastCrctDt;					//SNS글 최종수정일시
	
	private String prevCon;						//이전글
	private String nextCon;						//다음글
	private String fbSnsType;						//페이스북 등록된 갯수
	private String bsSnsType;						//블로그 등록된 갯수
	private String twSnsType;					//트위터 등록된 갯수
	private String fbSnsInfo;						//페이스북 list 정보
	private String bsSnsInfo;						//블로그 list 정보
	private String twSnsInfo;						//트위터 list 정보
	
	
	/**********************Promote getter/setter************************************/
	public String getPrmtId() {
		return prmtId;
	}
	public void setPrmtId(String prmtId) {
		this.prmtId = prmtId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
	public String getPrmtType() {
		return prmtType;
	}
	public void setPrmtType(String prmtType) {
		this.prmtType = prmtType;
	}
	public String getPrmtLvlType() {
		return prmtLvlType;
	}
	public void setPrmtLvlType(String prmtLvlType) {
		this.prmtLvlType = prmtLvlType;
	}
	public String getPrmtLvl() {
		return prmtLvl;
	}
	public void setPrmtLvl(String prmtLvl) {
		this.prmtLvl = prmtLvl;
	}
	public String getProdTitl() {
		return prodTitl;
	}
	public void setProdTitl(String prodTitl) {
		this.prodTitl = prodTitl;
	}
	public String getProdNm() {
		return prodNm;
	}
	public void setProdNm(String prodNm) {
		this.prodNm = prodNm;
	}
	public String getProdSllr() {
		return prodSllr;
	}
	public void setProdSllr(String prodSllr) {
		this.prodSllr = prodSllr;
	}
	public String getProdPric() {
		return prodPric;
	}
	public void setProdPric(String prodPric) {
		this.prodPric = prodPric;
	}
	public String getTlno() {
		return tlno;
	}
	public void setTlno(String tlno) {
		this.tlno = tlno;
	}
	public String getEmal() {
		return emal;
	}
	public void setEmal(String emal) {
		this.emal = emal;
	}
	public String getPrmtProdImg() {
		return prmtProdImg;
	}
	public void setPrmtProdImg(String prmtProdImg) {
		this.prmtProdImg = prmtProdImg;
	}
	public String getThumImg() {
		return ThumImg;
	}
	public void setThumImg(String thumImg) {
		ThumImg = thumImg;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFrstRgstDt() {
		return frstRgstDt;
	}
	public void setFrstRgstDt(String frstRgstDt) {
		this.frstRgstDt = frstRgstDt;
	}
	public String getLastCrctDt() {
		return lastCrctDt;
	}
	public void setLastCrctDt(String lastCrctDt) {
		this.lastCrctDt = lastCrctDt;
	}
	public String getLastSaveYnTabletOnly() {
		return lastSaveYnTabletOnly;
	}
	public void setLastSaveYnTabletOnly(String lastSaveYnTabletOnly) {
		this.lastSaveYnTabletOnly = lastSaveYnTabletOnly;
	}
	public String getSnsHsId() {
		return snsHsId;
	}
	public void setSnsHsId(String snsHsId) {
		this.snsHsId = snsHsId;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSnsType() {
		return snsType;
	}
	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}
	public String getSnsPw() {
		return snsPw;
	}
	public void setSnsPw(String snsPw) {
		this.snsPw = snsPw;
	}
	public String getCbcSnsYn() {
		return cbcSnsYn;
	}
	public void setCbcSnsYn(String cbcSnsYn) {
		this.cbcSnsYn = cbcSnsYn;
	}
	public String getPrmtSnsUrl() {
		return prmtSnsUrl;
	}
	public void setPrmtSnsUrl(String prmtSnsUrl) {
		this.prmtSnsUrl = prmtSnsUrl;
	}
	public String getSnsStat() {
		return snsStat;
	}
	public void setSnsStat(String snsStat) {
		this.snsStat = snsStat;
	}
	public String getSyncYnServerOnly() {
		return syncYnServerOnly;
	}
	public void setSyncYnServerOnly(String syncYnServerOnly) {
		this.syncYnServerOnly = syncYnServerOnly;
	}
	public Date getSnsFrstRgstDt() {
		return snsFrstRgstDt;
	}
	public void setSnsFrstRgstDt(Date snsFrstRgstDt) {
		this.snsFrstRgstDt = snsFrstRgstDt;
	}
	public Date getSnsLastCrctDt() {
		return snsLastCrctDt;
	}
	public void setSnsLastCrctDt(Date snsLastCrctDt) {
		this.snsLastCrctDt = snsLastCrctDt;
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
	public String getPrmtSnsId() {
		return prmtSnsId;
	}
	public void setPrmtSnsId(String prmtSnsId) {
		this.prmtSnsId = prmtSnsId;
	}
	public String getFbSnsType() {
		return fbSnsType;
	}
	public void setFbSnsType(String fbSnsType) {
		this.fbSnsType = fbSnsType;
	}
	public String getBsSnsType() {
		return bsSnsType;
	}
	public void setBsSnsType(String bsSnsType) {
		this.bsSnsType = bsSnsType;
	}
	public String getTwSnsType() {
		return twSnsType;
	}
	public void setTwSnsType(String twSnsType) {
		this.twSnsType = twSnsType;
	}
	public String getFbSnsInfo() {
		return fbSnsInfo;
	}
	public void setFbSnsInfo(String fbSnsInfo) {
		this.fbSnsInfo = fbSnsInfo;
	}
	public String getBsSnsInfo() {
		return bsSnsInfo;
	}
	public void setBsSnsInfo(String bsSnsInfo) {
		this.bsSnsInfo = bsSnsInfo;
	}
	public String getTwSnsInfo() {
		return twSnsInfo;
	}
	public void setTwSnsInfo(String twSnsInfo) {
		this.twSnsInfo = twSnsInfo;
	}
	
	
	/**********************Promote getter/setter************************************/
	
	
	
	
	
}
