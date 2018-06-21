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

	public class JsonCommerce extends RecordInfo{
		
		private String guidId;
		private String guidType;
		private String guidTitl;
		private String guidSmmr;
		private String guidCntsUrl;
		private String delYn;
		private Date   frstRgstDt;
		private String frstRgstMngrId;
		private Date lastCrctDt;
		private String lastCrctMngrId;
		private String guidLang;
		
//		private String prod;
//		
//		private String guid_id;
//		private String guid_type;
//		private String guid_titl;
//		private String guid_smmr;
//		private String guid_lang;
//		private String guid_cnts_url;
//		private String del_yn;
//		private String frst_rgst_mngr_id;
//		private String last_crct_mngr_id;	
//		
//		
//		private String prmt_txt_id;
//		private String prmt_id;
//		private String prod_titl;
//		private String sub_titl1;
//		private String sub_titl2;
//		private String sub_titl3;
//		private String prod_nm;
//		private String prod_pric;
//		private String prod_pack;
//		private String prod_orgn;
//		private String prod_sllr;
//		private String tlno;
//		private String emal;
//		private int txt_cnt;
//		private String txt_cnts1;
//		private String txt_cnts2;
//		private String txt_cnts3;
//		
//		
//		private String temp_id;
//		private String temp_type;
//		private String temp_titl;
//		private String temp_lang;
//		private String temp_img;
//		private String temp_html;
//		private int text_cnt;
//		private int img_cnt;
//		private String img1_widt_heig;
//		private String img2_widt_heig;
//		private String img3_widt_heig;
//		private String dflt_yn;
//		
//
//		private String prmt_img_id;
//		private String psit_info;
//		private String img_url;
//		
//		
//
//		private String sns_hs_id;
//		private String sns_id;
//		private String sns_type;
//		private String prmt_sns_url;
//		private String prmt_sns_id;
//		private String sns_stat;
//	
//		
//		
//
//		private String user_id;
//		private String prmt_type;
//		private String prmt_lvl_type;
//		private String prmt_lvl;
//		private String prmt_prod_img;
//		private String last_save_yn_tablet_only;
//		
//		
//		
//
//		private String prmt_hs_id;
//		private String perf_type;
		private String PROD;		                  
        
		private String GUID_ID;                   
		private String GUID_TYPE;                 
		private String GUID_TITL;                 
		private String GUID_SMMR;                 
		private String GUID_LANG;                 
		private String GUID_CNTS_URL;             
		private String DEL_YN;                    
		private String FRST_RGST_MNGR_ID;         
		private String LAST_CRCT_MNGR_ID;	       
		                                          		               
		private String PRMT_TXT_ID;                                        
		private String PRMT_ID;                   
		private String PROD_TITL;                 
		private String SUB_TITL1;                 
		private String SUB_TITL2;                 
		private String SUB_TITL3;                 
		private String PROD_NM;                   
		private String PROD_PRIC;                 
		private String PROD_PACK;                 
		private String PROD_ORGN;                 
		private String PROD_SLLR;                 
		private String TLNO;                      
		private String EMAL;                      
		private int    TXT_CNT;                   
		private String TXT_CNTS1;                 
		private String TXT_CNTS2;                 
		private String TXT_CNTS3;                 
		                                          		                                          
		private String TEMP_ID;                   
		private String TEMP_TYPE;                 
		private String TEMP_TITL;                 
		private String TEMP_LANG;                 
		private String TEMP_IMG;                  
		private String TEMP_HTML;                 
		private int    TEXT_CNT;                  
		private int    IMG_CNT;                   
		private String IMG1_WIDT_HEIG;            
		private String IMG2_WIDT_HEIG;            
		private String IMG3_WIDT_HEIG;            
		private String DFLT_YN;                   
		                                          		                                          
		private String PRMT_IMG_ID;               
		private String PSIT_INFO;                 
		private String IMG_URL;                   
		                                          		                                          		                                         
		private String SNS_HS_ID;                 
		private String SNS_ID;                    
		private String SNS_TYPE;                  
		private String PRMT_SNS_URL;              
		private String PRMT_SNS_ID;               
		private String SNS_STAT;                  
		                                          		                                          		                                          		                                        
		private String USER_ID;                   
		private String PRMT_TYPE;                 
		private String PRMT_LVL_TYPE;             
		private String PRMT_LVL;                  
		private String PRMT_PROD_IMG;             
		private String LAST_SAVE_YN_TABLET_ONLY;  
		               		               		               		             
		private String PRMT_HS_ID;
		private String PERF_TYPE;
				
		/******************************getter/setter***********************************/
		
		public String getPROD() {
			return PROD;
		}
		public void setPROD(String pROD) {
			PROD = pROD;
		}
		public String getGUID_ID() {
			return GUID_ID;
		}
		public void setGUID_ID(String gUID_ID) {
			GUID_ID = gUID_ID;
		}
		public String getGUID_TYPE() {
			return GUID_TYPE;
		}
		public void setGUID_TYPE(String gUID_TYPE) {
			GUID_TYPE = gUID_TYPE;
		}
		public String getGUID_TITL() {
			return GUID_TITL;
		}
		public void setGUID_TITL(String gUID_TITL) {
			GUID_TITL = gUID_TITL;
		}
		public String getGUID_SMMR() {
			return GUID_SMMR;
		}
		public void setGUID_SMMR(String gUID_SMMR) {
			GUID_SMMR = gUID_SMMR;
		}
		public String getGUID_LANG() {
			return GUID_LANG;
		}
		public void setGUID_LANG(String gUID_LANG) {
			GUID_LANG = gUID_LANG;
		}
		public String getGUID_CNTS_URL() {
			return GUID_CNTS_URL;
		}
		public void setGUID_CNTS_URL(String gUID_CNTS_URL) {
			GUID_CNTS_URL = gUID_CNTS_URL;
		}
		public String getDEL_YN() {
			return DEL_YN;
		}
		public void setDEL_YN(String dEL_YN) {
			DEL_YN = dEL_YN;
		}
		public String getFRST_RGST_MNGR_ID() {
			return FRST_RGST_MNGR_ID;
		}
		public void setFRST_RGST_MNGR_ID(String fRST_RGST_MNGR_ID) {
			FRST_RGST_MNGR_ID = fRST_RGST_MNGR_ID;
		}
		public String getLAST_CRCT_MNGR_ID() {
			return LAST_CRCT_MNGR_ID;
		}
		public void setLAST_CRCT_MNGR_ID(String lAST_CRCT_MNGR_ID) {
			LAST_CRCT_MNGR_ID = lAST_CRCT_MNGR_ID;
		}
		public String getPRMT_TXT_ID() {
			return PRMT_TXT_ID;
		}
		public void setPRMT_TXT_ID(String pRMT_TXT_ID) {
			PRMT_TXT_ID = pRMT_TXT_ID;
		}
		public String getPRMT_ID() {
			return PRMT_ID;
		}
		public void setPRMT_ID(String pRMT_ID) {
			PRMT_ID = pRMT_ID;
		}
		public String getPROD_TITL() {
			return PROD_TITL;
		}
		public void setPROD_TITL(String pROD_TITL) {
			PROD_TITL = pROD_TITL;
		}
		public String getSUB_TITL1() {
			return SUB_TITL1;
		}
		public void setSUB_TITL1(String sUB_TITL1) {
			SUB_TITL1 = sUB_TITL1;
		}
		public String getSUB_TITL2() {
			return SUB_TITL2;
		}
		public void setSUB_TITL2(String sUB_TITL2) {
			SUB_TITL2 = sUB_TITL2;
		}
		public String getSUB_TITL3() {
			return SUB_TITL3;
		}
		public void setSUB_TITL3(String sUB_TITL3) {
			SUB_TITL3 = sUB_TITL3;
		}
		public String getPROD_NM() {
			return PROD_NM;
		}
		public void setPROD_NM(String pROD_NM) {
			PROD_NM = pROD_NM;
		}
		public String getPROD_PRIC() {
			return PROD_PRIC;
		}
		public void setPROD_PRIC(String pROD_PRIC) {
			PROD_PRIC = pROD_PRIC;
		}
		public String getPROD_PACK() {
			return PROD_PACK;
		}
		public void setPROD_PACK(String pROD_PACK) {
			PROD_PACK = pROD_PACK;
		}
		public String getPROD_ORGN() {
			return PROD_ORGN;
		}
		public void setPROD_ORGN(String pROD_ORGN) {
			PROD_ORGN = pROD_ORGN;
		}
		public String getPROD_SLLR() {
			return PROD_SLLR;
		}
		public void setPROD_SLLR(String pROD_SLLR) {
			PROD_SLLR = pROD_SLLR;
		}
		public String getTLNO() {
			return TLNO;
		}
		public void setTLNO(String tLNO) {
			TLNO = tLNO;
		}
		public String getEMAL() {
			return EMAL;
		}
		public void setEMAL(String eMAL) {
			EMAL = eMAL;
		}
		public int getTXT_CNT() {
			return TXT_CNT;
		}
		public void setTXT_CNT(int txtTXT_CNT) {
			this.TXT_CNT = txtTXT_CNT;
		}
		public String getTXT_CNTS1() {
			return TXT_CNTS1;
		}
		public void setTXT_CNTS1(String tXT_CNTS1) {
			TXT_CNTS1 = tXT_CNTS1;
		}
		public String getTXT_CNTS2() {
			return TXT_CNTS2;
		}
		public void setTXT_CNTS2(String tXT_CNTS2) {
			TXT_CNTS2 = tXT_CNTS2;
		}
		public String getTXT_CNTS3() {
			return TXT_CNTS3;
		}
		public void setTXT_CNTS3(String tXT_CNTS3) {
			TXT_CNTS3 = tXT_CNTS3;
		}
		public String getTEMP_ID() {
			return TEMP_ID;
		}
		public void setTEMP_ID(String tEMP_ID) {
			TEMP_ID = tEMP_ID;
		}
		public String getTEMP_TYPE() {
			return TEMP_TYPE;
		}
		public void setTEMP_TYPE(String tEMP_TYPE) {
			TEMP_TYPE = tEMP_TYPE;
		}
		public String getTEMP_TITL() {
			return TEMP_TITL;
		}
		public void setTEMP_TITL(String tEMP_TITL) {
			TEMP_TITL = tEMP_TITL;
		}
		public String getTEMP_LANG() {
			return TEMP_LANG;
		}
		public void setTEMP_LANG(String tEMP_LANG) {
			TEMP_LANG = tEMP_LANG;
		}
		public String getTEMP_IMG() {
			return TEMP_IMG;
		}
		public void setTEMP_IMG(String tEMP_IMG) {
			TEMP_IMG = tEMP_IMG;
		}
		public String getTEMP_HTML() {
			return TEMP_HTML;
		}
		public void setTEMP_HTML(String tEMP_HTML) {
			TEMP_HTML = tEMP_HTML;
		}
		public int getTEXT_CNT() {
			return TEXT_CNT;
		}
		public void setTEXT_CNT(int texTEXT_CNT) {
			this.TEXT_CNT = texTEXT_CNT;
		}
		public int getImgIMG_CNT() {
			return IMG_CNT;
		}
		public void setImgIMG_CNT(int imgIMG_CNT) {
			this.IMG_CNT = imgIMG_CNT;
		}
		public String getIMG1_WIDT_HEIG() {
			return IMG1_WIDT_HEIG;
		}
		public void setIMG1_WIDT_HEIG(String iMG1_WIDT_HEIG) {
			IMG1_WIDT_HEIG = iMG1_WIDT_HEIG;
		}
		public String getIMG2_WIDT_HEIG() {
			return IMG2_WIDT_HEIG;
		}
		public void setIMG2_WIDT_HEIG(String iMG2_WIDT_HEIG) {
			IMG2_WIDT_HEIG = iMG2_WIDT_HEIG;
		}
		public String getIMG3_WIDT_HEIG() {
			return IMG3_WIDT_HEIG;
		}
		public void setIMG3_WIDT_HEIG(String iMG3_WIDT_HEIG) {
			IMG3_WIDT_HEIG = iMG3_WIDT_HEIG;
		}
		public String getDFLT_YN() {
			return DFLT_YN;
		}
		public void setDFLT_YN(String dFLT_YN) {
			DFLT_YN = dFLT_YN;
		}
		public String getPRMT_IMG_ID() {
			return PRMT_IMG_ID;
		}
		public void setPRMT_IMG_ID(String pRMT_IMG_ID) {
			PRMT_IMG_ID = pRMT_IMG_ID;
		}
		public String getPSIT_INFO() {
			return PSIT_INFO;
		}
		public void setPSIT_INFO(String pSIT_INFO) {
			PSIT_INFO = pSIT_INFO;
		}
		public String getIMG_URL() {
			return IMG_URL;
		}
		public void setIMG_URL(String iMG_URL) {
			IMG_URL = iMG_URL;
		}
		public String getSNS_HS_ID() {
			return SNS_HS_ID;
		}
		public void setSNS_HS_ID(String sNS_HS_ID) {
			SNS_HS_ID = sNS_HS_ID;
		}
		public String getSNS_ID() {
			return SNS_ID;
		}
		public void setSNS_ID(String sNS_ID) {
			SNS_ID = sNS_ID;
		}
		public String getSNS_TYPE() {
			return SNS_TYPE;
		}
		public void setSNS_TYPE(String sNS_TYPE) {
			SNS_TYPE = sNS_TYPE;
		}
		public String getPRMT_SNS_URL() {
			return PRMT_SNS_URL;
		}
		public void setPRMT_SNS_URL(String pRMT_SNS_URL) {
			PRMT_SNS_URL = pRMT_SNS_URL;
		}
		public String getPRMT_SNS_ID() {
			return PRMT_SNS_ID;
		}
		public void setPRMT_SNS_ID(String pRMT_SNS_ID) {
			PRMT_SNS_ID = pRMT_SNS_ID;
		}
		public String getSNS_STAT() {
			return SNS_STAT;
		}
		public void setSNS_STAT(String sNS_STAT) {
			SNS_STAT = sNS_STAT;
		}
		public String getUSER_ID() {
			return USER_ID;
		}
		public void setUSER_ID(String uSER_ID) {
			USER_ID = uSER_ID;
		}
		public String getPRMT_TYPE() {
			return PRMT_TYPE;
		}
		public void setPRMT_TYPE(String pRMT_TYPE) {
			PRMT_TYPE = pRMT_TYPE;
		}
		public String getPRMT_LVL_TYPE() {
			return PRMT_LVL_TYPE;
		}
		public void setPRMT_LVL_TYPE(String pRMT_LVL_TYPE) {
			PRMT_LVL_TYPE = pRMT_LVL_TYPE;
		}
		public String getPRMT_LVL() {
			return PRMT_LVL;
		}
		public void setPRMT_LVL(String pRMT_LVL) {
			PRMT_LVL = pRMT_LVL;
		}
		public String getPRMT_PROD_IMG() {
			return PRMT_PROD_IMG;
		}
		public void setPRMT_PROD_IMG(String pRMT_PROD_IMG) {
			PRMT_PROD_IMG = pRMT_PROD_IMG;
		}
		public String getLAST_SAVE_YN_TABLET_ONLY() {
			return LAST_SAVE_YN_TABLET_ONLY;
		}
		public void setLAST_SAVE_YN_TABLET_ONLY(String lAST_SAVE_YN_TABLET_ONLY) {
			LAST_SAVE_YN_TABLET_ONLY = lAST_SAVE_YN_TABLET_ONLY;
		}
		public String getPRMT_HS_ID() {
			return PRMT_HS_ID;
		}
		public void setPRMT_HS_ID(String pRMT_HS_ID) {
			PRMT_HS_ID = pRMT_HS_ID;
		}
		public String getPERF_TYPE() {
			return PERF_TYPE;
		}
		public void setPERF_TYPE(String pERF_TYPE) {
			PERF_TYPE = pERF_TYPE;
		}					
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
		/******************************getter/setter***********************************/
	}