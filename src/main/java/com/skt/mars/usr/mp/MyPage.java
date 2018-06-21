package com.skt.mars.usr.mp;

import com.skt.mars.adm.cm.RecordInfo;

public class MyPage extends RecordInfo {

    private String userID; //USER_ID 

    private String pw; //PW

    private String name; //NAME

    private String sex; //SEX

    private String birthDay; //BIRTHDAY

    private String tlNO; //TLNO

    private String eMail; //EMAL

    private String adrres; //ADRRESS

    private String delYN; //DEL_YN

    private String etc; //ETC

    private String authority; //AUTHORITY

    /**
     * @return
     */
    public String getUserID() {
        return userID;
    }

    /**
     * @param userID - the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }

    /**
     * @return
     */
    public String getPw() {
        return pw;
    }

    /**
     * @param pw - the pw to set
     */
    public void setPw(String pw) {
        this.pw = pw;
    }

    /**
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * @param name - the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex - the sex to set
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return
     */
    public String getBirthDay() {
        return birthDay;
    }

    /**
     * @param birthDay - the birthDay to set
     */
    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    /**
     * @return
     */
    public String getTlNO() {
        return tlNO;
    }

    /**
     * @param tlNO - the tlNO to set
     */
    public void setTlNO(String tlNO) {
        this.tlNO = tlNO;
    }

    /**
     * @return
     */
    public String geteMail() {
        return eMail;
    }

    /**
     * @param eMail - the eMail to set
     */
    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    /**
     * @return
     */
    public String getAdrres() {
        return adrres;
    }

    /**
     * @param adrres - the adrres to set
     */
    public void setAdrres(String adrres) {
        this.adrres = adrres;
    }

    /**
     * @return
     */
    public String getDelYN() {
        return delYN;
    }

    /**
     * @param delYN - the delYN to set
     */
    public void setDelYN(String delYN) {
        this.delYN = delYN;
    }

    /**
     * @return
     */
    public String getEtc() {
        return etc;
    }

    /**
     * @param etc - the etc to set
     */
    public void setEtc(String etc) {
        this.etc = etc;
    }

    /**
     * @return
     */
    public String getAuthority() {
        return authority;
    }

    /**
     * @param authority - the authority to set
     */
    public void setAuthority(String authority) {
        this.authority = authority;
    }

}
