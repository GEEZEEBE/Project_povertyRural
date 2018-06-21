package com.skt.mars.usr.fb;

import java.sql.Date;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import com.skt.mars.adm.cm.RecordInfo;

/*
CREATE TABLE TB_UAST_BOARD
	(
		-- BOARD_ID
		BOARD_ID VARCHAR(20) NOT NULL UNIQUE COMMENT '게시판_ID',
		-- 제목
		BOARD_SUBJ VARCHAR(200) COMMENT '제목',
		BOARD_CONT VARCHAR(2000) COMMENT '내용',
		FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
		FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
		LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
		LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
		PRIMARY KEY (BOARD_ID)
	) COMMENT = '게시판';


	CREATE TABLE TB_UAST_BOARD_REPLY
	(
		-- REPLY_ID
		REPLY_ID VARCHAR(20) NOT NULL UNIQUE COMMENT 'REPLY_ID',
		-- REPLY_CONT
		REPLY_CONT VARCHAR(2000) COMMENT '내용',
		-- BOARD_ID
		BOARD_ID VARCHAR(20) NOT NULL COMMENT '게시판_ID',
		FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
		FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
		LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
		LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
		PRIMARY KEY (REPLY_ID)
	) COMMENT = '게시판 댓글';
 */
/*
	//Free board
	BOARD_ID
	BOARD_SUBJ
	BOARD_CONT
	FRST_RGST_DT
	FRST_RGST_USER_ID
	LAST_CRCT_DT
	LAST_CRCT_USER_ID
	
	//reply board
	REPLY_ID
	REPLY_CONT
	BOARD_ID
	FRST_RGST_DT
	FRST_RGST_USER_ID
	LAST_CRCT_DT
	LAST_CRCT_USER_ID 
*/

public class UserFree extends RecordInfo implements JSONAware  {
	
	private String boardID;
	private String boardKey;
	private String boardSubj;
	private String boardCont;
	
	private String replyID;
	private String replyKey;
	private String replyCont;
	
	private String replyCnt; //reply count
	private String viewCnt; //view count
	private String fileCnt; //file count
	private String rowNum; //reply count
	private String preID; // pre boardID
	private String nextID; // next boardID
	
	
	
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public String getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getReplyKey() {
		return replyKey;
	}
	public void setReplyKey(String replyKey) {
		this.replyKey = replyKey;
	}
	public String getBoardKey() {
		return boardKey;
	}
	public void setBoardKey(String boardKey) {
		this.boardKey = boardKey;
	}
	
	public String getRowNum() {
		return rowNum;
	}
	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
	public String getBoardSubj() {
		return boardSubj;
	}
	public void setBoardSubj(String boardSubj) {
		this.boardSubj = boardSubj;
	}
	public String getBoardCont() {
		return boardCont;
	}
	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont;
	}
	public String getReplyID() {
		return replyID;
	}
	public void setReplyID(String replyID) {
		this.replyID = replyID;
	}
	public String getReplyCont() {
		return replyCont;
	}
	public void setReplyCont(String replyCont) {
		this.replyCont = replyCont;
	}
	public String getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(String replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getPreID() {
		return preID;
	}
	public void setPreID(String preID) {
		this.preID = preID;
	}
	public String getNextID() {
		return nextID;
	}
	public void setNextID(String nextID) {
		this.nextID = nextID;
	}
	
	
	@Override
	public String toJSONString() {
		// TODO Auto-generated method stub
		JSONObject obj = new JSONObject();
			
		obj.put("boardID", boardID);
	    obj.put("replyID", replyID);
	    obj.put("replyCont", replyCont);
	    obj.put("frstRgstDT", getFrstRgstDT().toString());
	    obj.put("frstRgstUserID", getFrstRgstUserID().toString());
	    
	    return obj.toJSONString();
		
	}
	
	
	

	
	
}
