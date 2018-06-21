package com.skt.mars.adm.sample;

import javax.validation.constraints.Size;

import org.hibernate.validation.constraints.NotEmpty;

import com.skt.mars.adm.cm.RecordInfo;

/*
CREATE TABLE TB_UAST_BOARD
(
	-- BOARD_ID
	BOARD_ID VARCHAR(20) NOT NULL COMMENT 'BOARD_ID',
	-- BOARD_SUBJ
	BOARD_SUBJ VARCHAR(100) COMMENT 'BOARD_SUBJ',
	-- BOARD_CONT
	BOARD_CONT VARCHAR(2000) COMMENT 'BOARD_CONT',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (BOARD_ID)
) COMMENT = 'TB_UAST_BOARD';

 */

public class Board extends RecordInfo{
	
	private String boredID ;

	@NotEmpty(message="Requerid Field")
	@Size(min = 1, max = 10, message="Size is 1 ~ 10")
	private String boredSubj ;
	private String boredCont ;

	
	public String getBoredID() {
		return boredID;
	}
	public void setBoredID(String boredID) {
		this.boredID = boredID;
	}
	public String getBoredSubj() {
		return boredSubj;
	}
	public void setBoredSubj(String boredSubj) {
		this.boredSubj = boredSubj;
	}
	public String getBoredCont() {
		return boredCont;
	}
	public void setBoredCont(String boredCont) {
		this.boredCont = boredCont;
	}
}
