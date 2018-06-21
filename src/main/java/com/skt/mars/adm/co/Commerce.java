package com.skt.mars.adm.co;

import java.sql.Date;

import org.json.simple.JSONAware;

/**
 * Commerce - 커머스 관리
 * 
 * @author Kim Do Youn
 * @version
 * @since
 * @created 2012. 01. 22.
 */


/*템플릿 관리 SQL
 * CREATE TABLE `tb_ruac_temp` (
  `TEMP_ID` varchar(20) NOT NULL,
  `TEMP_TYPE` varchar(2) DEFAULT NULL,
  `CTGR_TYPE` varchar(2) DEFAULT NULL,
  `TMEP_TITL` varchar(100) DEFAULT NULL,
  `TEMP_IMG` varchar(40) DEFAULT NULL,
  `TEMP_HTML` varchar(40) DEFAULT NULL,
  `TEXT_CNT` int(11) DEFAULT NULL,
  `IMG_CNT` int(11) DEFAULT NULL,
  `DFLT_YN` char(1) DEFAULT NULL,
  `DEL_YN` char(1) DEFAULT NULL,
  `FRST_RGST_DT` date DEFAULT NULL,
  `LAST_CRCT_DT` date DEFAULT NULL,
  PRIMARY KEY (`TEMP_ID`),
  UNIQUE KEY `XPKTB_RUAC_TEMP` (`TEMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 */
 
 
public class Commerce implements JSONAware{
	 
	//템플릿 관리 beans
	private String tempId;						//홍보템플릿 ID
	private String tempType;					//템플릿 구분
	private String tempTitl;					//제목
	private String tempLang;					//제목
	private String tempImg;					//템플릿 이미지 경로
	private String tempHtml;					//템플릿 html경로
	private int textCnt;						//텍스트 갯수
	private int imgCnt;							//사진 갯수
	private String img1WidtHeig;				//이미지1 가로세로
	private String img2WidtHeig;				//이미지2 가로세로
	private String img3WidtHeig;				//이미지3 가로세로
	private String dfltYn;						//디폴트 여부
	private String delYn;						//삭제 여부
	private Date frstRgstDt;					//최초등록일시
	private Date lastCrctDt;					//최종수정일시
	private String pageFlag;					//화면 판별 기준
	
	
	private String targetId;
	private String physicalFileName;
	private String logicalFileName;
	private String pfdImgPath;
	private String pfdHtmlPath;
	private String fileSize;
	private String fileType;
	private String fileContentType;
	private String ptfdImgPath;				//physicalThumbnailFileDirectory
	private String ptfdHtmlPath;
	private String ptfnImgPath;				//physicalThumbnailFileDirectory
	private String ptfnHtmlPath;
	private String pfnImgName;				//physicalFileName
	private String pfnHtmlName;
	private String pfnImgPath;				//physicalFileName
	private String pfnHtmlPath;
	private String uniqueKeyImg;	
	private String uniqueKeyHtml;
	
	/****************************템플릿 관리 getter/setter********************************/
	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
	public String getTempType() {
		return tempType;
	}
	public void setTempType(String tempType) {
		this.tempType = tempType;
	}
	public String getTempTitl() {
		return tempTitl;
	}
	public void setTempTitl(String tempTitl) {
		this.tempTitl = tempTitl;
	}
	
	public String getTempLang() {
		return tempLang;
	}
	public void setTempLang(String tempLang) {
		this.tempLang = tempLang;
	}
	public String getTempImg() {
		return tempImg;
	}
	public void setTempImg(String tempImg) {
		this.tempImg = tempImg;
	}
	public String getTempHtml() {
		return tempHtml;
	}
	public void setTempHtml(String tempHtml) {
		this.tempHtml = tempHtml;
	}
	public int getTextCnt() {
		return textCnt;
	}
	public void setTextCnt(int textCnt) {
		this.textCnt = textCnt;
	}
	public int getImgCnt() {
		return imgCnt;
	}
	public void setImgCnt(int imgCnt) {
		this.imgCnt = imgCnt;
	}
	public String getImg1WidtHeig() {
		return img1WidtHeig;
	}
	public void setImg1WidtHeig(String img1WidtHeig) {
		this.img1WidtHeig = img1WidtHeig;
	}
	public String getImg2WidtHeig() {
		return img2WidtHeig;
	}
	public void setImg2WidtHeig(String img2WidtHeig) {
		this.img2WidtHeig = img2WidtHeig;
	}
	public String getImg3WidtHeig() {
		return img3WidtHeig;
	}
	public void setImg3WidtHeig(String img3WidtHeig) {
		this.img3WidtHeig = img3WidtHeig;
	}
	public String getDfltYn() {
		return dfltYn;
	}
	public void setDfltYn(String dfltYn) {
		this.dfltYn = dfltYn;
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
	public Date getLastCrctDt() {
		return lastCrctDt;
	}
	public void setLastCrctDt(Date lastCrctDt) {
		this.lastCrctDt = lastCrctDt;
	}
	public String getPageFlag() {
		return pageFlag;
	}
	public void setPageFlag(String pageFlag) {
		this.pageFlag = pageFlag;
	}
	public String getTargetId() {
		return targetId;
	}
	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}
	public String getPhysicalFileName() {
		return physicalFileName;
	}
	public void setPhysicalFileName(String physicalFileName) {
		this.physicalFileName = physicalFileName;
	}
	public String getLogicalFileName() {
		return logicalFileName;
	}
	public void setLogicalFileName(String logicalFileName) {
		this.logicalFileName = logicalFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getPfdImgPath() {
		return pfdImgPath;
	}
	public void setPfdImgPath(String pfdImgPath) {
		this.pfdImgPath = pfdImgPath;
	}
	public String getPfdHtmlPath() {
		return pfdHtmlPath;
	}
	public void setPfdHtmlPath(String pfdHtmlPath) {
		this.pfdHtmlPath = pfdHtmlPath;
	}
	public String getPtfdImgPath() {
		return ptfdImgPath;
	}
	public void setPtfdImgPath(String ptfdImgPath) {
		this.ptfdImgPath = ptfdImgPath;
	}
	public String getPtfdHtmlPath() {
		return ptfdHtmlPath;
	}
	public void setPtfdHtmlPath(String ptfdHtmlPath) {
		this.ptfdHtmlPath = ptfdHtmlPath;
	}
	public String getPtfnImgPath() {
		return ptfnImgPath;
	}
	public void setPtfnImgPath(String ptfnImgPath) {
		this.ptfnImgPath = ptfnImgPath;
	}
	public String getPtfnHtmlPath() {
		return ptfnHtmlPath;
	}
	public void setPtfnHtmlPath(String ptfnHtmlPath) {
		this.ptfnHtmlPath = ptfnHtmlPath;
	}
	public String getPfnImgName() {
		return pfnImgName;
	}
	public void setPfnImgName(String pfnImgName) {
		this.pfnImgName = pfnImgName;
	}
	public String getPfnHtmlName() {
		return pfnHtmlName;
	}
	public void setPfnHtmlName(String pfnHtmlName) {
		this.pfnHtmlName = pfnHtmlName;
	}
	public String getUniqueKeyImg() {
		return uniqueKeyImg;
	}
	public void setUniqueKeyImg(String uniqueKeyImg) {
		this.uniqueKeyImg = uniqueKeyImg;
	}
	public String getUniqueKeyHtml() {
		return uniqueKeyHtml;
	}
	public void setUniqueKeyHtml(String uniqueKeyHtml) {
		this.uniqueKeyHtml = uniqueKeyHtml;
	}
	public String getPfnImgPath() {
		return pfnImgPath;
	}
	public void setPfnImgPath(String pfnImgPath) {
		this.pfnImgPath = pfnImgPath;
	}
	public String getPfnHtmlPath() {
		return pfnHtmlPath;
	}
	public void setPfnHtmlPath(String pfnHtmlPath) {
		this.pfnHtmlPath = pfnHtmlPath;
	}
	@Override
	public String toJSONString() {
		return null;
	}
	
	
	/****************************템플릿 관리 getter/setter********************************/
	
	
	
}
