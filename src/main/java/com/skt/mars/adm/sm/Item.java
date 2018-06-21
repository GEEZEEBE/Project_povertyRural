package com.skt.mars.adm.sm;

import com.skt.mars.adm.cm.RecordInfo;

/**
 * Item - 서비스관리>아이템관리
 * 
 * @author jseon
 * @version
 * @since
 * @created 2012. 01. 22.
 */

public class Item extends RecordInfo {

    private String itemID; //ITEM_ID 아이템ID

    private String cntsName; //CNTS_NAME 컨텐츠명

    private String delYN; //DEL_YN 삭제여부

    private String assetID; //ASSET_ID 자산ID

    private String godsID; //GODS_ID 상품ID

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getGodsID() {
        return godsID;
    }

    public void setGodsID(String godsID) {
        this.godsID = godsID;
    }

    public String getAssetID() {
        return assetID;
    }

    public void setAssetID(String assetID) {
        this.assetID = assetID;
    }

    public String getCntsName() {
        return cntsName;
    }

    public void setCntsName(String cntsName) {
        this.cntsName = cntsName;
    }

    public String getDelYN() {
        return delYN;
    }

    public void setDelYN(String delYN) {
        this.delYN = delYN;
    }

}
