package com.skt.mars.adm.bm;

import com.skt.mars.adm.cm.RecordInfo;

public class Price extends RecordInfo {

    private String pricID;

    private String payKind;

    private String pricType;

    private String pricUnit;

    private String payKindCd;

    private String pricTypeCd;

    private String pricUnitCd;

    private String flatRate;

    private String depositRate;

    private String rentDay;

    private String tagetID;

    private String managerKind;

    /**
     * @return
     */
    public String getPayKindCd() {
        return payKindCd;
    }

    /**
     * @param payKindCd - the payKindCd to set
     */
    public void setPayKindCd(String payKindCd) {
        this.payKindCd = payKindCd;
    }

    /**
     * @return
     */
    public String getPricTypeCd() {
        return pricTypeCd;
    }

    /**
     * @param pricTypeCd - the pricTypeCd to set
     */
    public void setPricTypeCd(String pricTypeCd) {
        this.pricTypeCd = pricTypeCd;
    }

    /**
     * @return
     */
    public String getPricUnitCd() {
        return pricUnitCd;
    }

    /**
     * @param pricUnitCd - the pricUnitCd to set
     */
    public void setPricUnitCd(String pricUnitCd) {
        this.pricUnitCd = pricUnitCd;
    }

    /**
     * @return
     */
    public String getPricID() {
        return pricID;
    }

    /**
     * @param pricID - the pricID to set
     */
    public void setPricID(String pricID) {
        this.pricID = pricID;
    }

    /**
     * @return
     */
    public String getPayKind() {
        return payKind;
    }

    /**
     * @param payKind - the payKind to set
     */
    public void setPayKind(String payKind) {
        this.payKind = payKind;
    }

    /**
     * @return
     */
    public String getPricType() {
        return pricType;
    }

    /**
     * @param pricType - the pricType to set
     */
    public void setPricType(String pricType) {
        this.pricType = pricType;
    }

    /**
     * @return
     */
    public String getPricUnit() {
        return pricUnit;
    }

    /**
     * @param pricUnit - the pricUnit to set
     */
    public void setPricUnit(String pricUnit) {
        this.pricUnit = pricUnit;
    }

    /**
     * @return
     */
    public String getFlatRate() {
        return flatRate;
    }

    /**
     * @param flatRate - the flatRate to set
     */
    public void setFlatRate(String flatRate) {
        this.flatRate = flatRate;
    }

    /**
     * @return
     */
    public String getDepositRate() {
        return depositRate;
    }

    /**
     * @param depositRate - the depositRate to set
     */
    public void setDepositRate(String depositRate) {
        this.depositRate = depositRate;
    }

    /**
     * @return
     */
    public String getRentDay() {
        return rentDay;
    }

    /**
     * @param rentDay - the rentDay to set
     */
    public void setRentDay(String rentDay) {
        this.rentDay = rentDay;
    }

    /**
     * @return
     */
    public String getTagetID() {
        return tagetID;
    }

    /**
     * @param tagetID - the tagetID to set
     */
    public void setTagetID(String tagetID) {
        this.tagetID = tagetID;
    }

    /**
     * @return
     */
    public String getManagerKind() {
        return managerKind;
    }

    /**
     * @param managerKind - the managerKind to set
     */
    public void setManagerKind(String managerKind) {
        this.managerKind = managerKind;
    }

}
