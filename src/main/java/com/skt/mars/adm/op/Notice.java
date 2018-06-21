package com.skt.mars.adm.op;

import oracle.sql.TIMESTAMP;

import com.skt.mars.adm.cm.RecordInfo;

/*
CREATE TABLE TB_UAST_NOTICE
(
	-- NOTI_ID
	NOTI_ID VARCHAR(40) NOT NULL UNIQUE COMMENT '공지사항_ID',
	NOTI_SUBJ VARCHAR(200) NOT NULL COMMENT '제목',
	NOTI_CONT VARCHAR(2000) COMMENT '내용',
	-- NOTI_DVSN
	NOTI_DVSN VARCHAR(5) COMMENT '공지구분',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT '등록일자',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT '등록자',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT '수정일자',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT '수정자',
	PRIMARY KEY (NOTI_ID)
) COMMENT = '공지사항';
 */
/*
	NOTI_ID
	NOTI_SUBJ
	NOTI_CONT
	NOTI_DVSN
	FRST_RGST_DT
	FRST_RGST_USER_ID
	LAST_CRCT_DT
	LAST_CRCT_USER_ID
*/

public class Notice extends RecordInfo {

	private String noticeId;
	private String noticeSubj;
	private String noticeCont;
	private String noticeDvsn;
	private String viewCount;

	public String getViewCount() {
		return viewCount;
	}
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeSubj() {
		return noticeSubj;
	}
	public void setNoticeSubj(String noticeSubj) {
		this.noticeSubj = noticeSubj;
	}
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	public String getNoticeDvsn() {
		return noticeDvsn;
	}
	public void setNoticeDvsn(String noticeDvsn) {
		this.noticeDvsn = noticeDvsn;
	}
	
	
	
	
	
}
