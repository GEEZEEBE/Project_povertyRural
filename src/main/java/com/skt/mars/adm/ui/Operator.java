package com.skt.mars.adm.ui;

import javax.validation.constraints.Size;

import org.hibernate.validation.constraints.NotEmpty;

import com.skt.mars.adm.cm.RecordInfo;

/*
CREATE TABLE TB_UAST_USER
(
	-- USER_ID
	USER_ID VARCHAR(20) NOT NULL COMMENT 'USER_ID',
	-- PW
	PW VARCHAR(20) NOT NULL COMMENT 'PW',
	-- NAME
	NAME VARCHAR(20) NOT NULL COMMENT 'NAME',
	-- SEX
	SEX VARCHAR(20) NOT NULL COMMENT 'SEX',
	BIRTHDAY VARCHAR(10) COMMENT 'BIRTHDAY',
	-- TLNO
	TLNO VARCHAR(20) NOT NULL COMMENT 'TLNO',
	-- EMAL
	EMAL VARCHAR(60) NOT NULL COMMENT 'EMAL',
	ADRRESS VARCHAR(100) COMMENT 'ADRRESS',
	-- 탈퇴여부
	DEL_YN VARCHAR(1) DEFAULT 'N' NOT NULL COMMENT '삭제여부',
	ETC VARCHAR(100) COMMENT 'ETC',
	-- S : supervision, M : manager, U : user
	-- be Impossible to delete Supervision
	AUTHORITY VARCHAR(1) DEFAULT 'U' NOT NULL COMMENT 'AUTHORITY',
	FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
	FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
	LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
	LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
	PRIMARY KEY (USER_ID)
) COMMENT = '사용자정보';
 */
/*
USER_ID
PW
NAME
SEX
BIRTHDAY
TLNO
EMAL
ADRRESS
DEL_YN
ETC
AUTHORITY
*/

public class Operator extends RecordInfo {
	
	private String userID ;	//USER_ID 
	
	@NotEmpty(message="Requerid Field")
	@Size(min = 4, max = 10, message="Size is 4 ~ 10")
	private String pw ;	//PW

	@NotEmpty(message="Requerid Field")
	private String name ;	//NAME
	private String sex ;	//SEX
	private String birthDay ;	//BIRTHDAY

	private String tlNO ;	//TLNO
	private String eMail ;	//EMAL
	private String eMail00 ;	//EMAL
	private String eMail01 ;	//EMAL
	private String adrres ;	//ADRRESS
	private String delYN ;	//DEL_YN
	private String etc ;	//ETC
	private String authority="M" ;	//AUTHORITY

	private String checkPw ;	//doubleCheckPW
	
	public String geteMail00() {
		return eMail00;
	}
	public void seteMail00(String eMail00) {
		this.eMail00 = eMail00;
	}
	public String geteMail01() {
		return eMail01;
	}
	public void seteMail01(String eMail01) {
		this.eMail01 = eMail01;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getTlNO() {
		return tlNO;
	}
	public void setTlNO(String tlNO) {
		this.tlNO = tlNO;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getAdrres() {
		return adrres;
	}
	public void setAdrres(String adrres) {
		this.adrres = adrres;
	}
	public String getDelYN() {
		return delYN;
	}
	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getCheckPw() {
		return checkPw;
	}
	public void setCheckPw(String checkPw) {
		this.checkPw = checkPw;
	}	
}
