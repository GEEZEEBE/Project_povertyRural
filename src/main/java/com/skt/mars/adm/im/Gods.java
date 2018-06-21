package com.skt.mars.adm.im;

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

/**
 * 상품
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

public class Gods extends RecordInfo {

    private String godsID;

    private String godsDvsn;

    private String godsStts;

    private String godsName;

    private String delYN;

    private String srvcID;

    private String description;

    /**
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description - the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return
     */
    public String getGodsID() {
        return godsID;
    }

    /**
     * @param godsID - the godsID to set
     */
    public void setGodsID(String godsID) {
        this.godsID = godsID;
    }

    /**
     * @return
     */
    public String getGodsDvsn() {
        return godsDvsn;
    }

    /**
     * @param godsDvsn - the godsDvsn to set
     */
    public void setGodsDvsn(String godsDvsn) {
        this.godsDvsn = godsDvsn;
    }

    /**
     * @return
     */
    public String getGodsStts() {
        return godsStts;
    }

    /**
     * @param godsStts - the godsStts to set
     */
    public void setGodsStts(String godsStts) {
        this.godsStts = godsStts;
    }

    /**
     * @return
     */
    public String getGodsName() {
        return godsName;
    }

    /**
     * @param godsName - the godsName to set
     */
    public void setGodsName(String godsName) {
        this.godsName = godsName;
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
    public String getSrvcID() {
        return srvcID;
    }

    /**
     * @param srvcID - the srvcID to set
     */
    public void setSrvcID(String srvcID) {
        this.srvcID = srvcID;
    }

}
