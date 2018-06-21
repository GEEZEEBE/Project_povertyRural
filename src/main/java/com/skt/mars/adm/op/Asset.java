package com.skt.mars.adm.op;

import com.skt.mars.adm.cm.RecordInfo;

/*
 CREATE TABLE TB_UAST_ASSETS
 (
 ASSET_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '자산_ID',
 -- - Device : DEV
 -- - eBook : EBK
 -- - VOD : VOD
 -- - ETC : ETC
 ASSET_TYPE_CD VARCHAR(4) NOT NULL COMMENT '자산종류구분',
 ITEM_NM VARCHAR(40) NOT NULL COMMENT 'ITEM명',
 -- ITEM_01
 ITEM_01 VARCHAR(40) COMMENT 'ITEM_01',
 -- ITEM_02
 ITEM_02 VARCHAR(40) COMMENT 'ITEM_02',
 -- ITEM_03
 ITEM_03 VARCHAR(40) COMMENT 'ITEM_03',
 -- ITEM_04
 ITEM_04 VARCHAR(60) COMMENT 'ITEM_04',
 -- ITEM_05
 ITEM_05 VARCHAR(60) COMMENT 'ITEM_05',
 -- ITEM_06
 ITEM_06 VARCHAR(100) COMMENT 'ITEM_06',
 -- 비고
 ITEM_07 VARCHAR(100) COMMENT 'ITEM_07',
 -- ITEM_08
 ITEM_08 VARCHAR(2000) COMMENT 'ITEM_08',
 ASSET_YN VARCHAR(4) NOT NULL COMMENT '자산상태구분',
 DEL_YN VARCHAR(1) DEFAULT 'N' NOT NULL COMMENT '삭제여부',
 COSTPRIC_ID VARCHAR(20) NOT NULL COMMENT '원가_ID',
 FRST_RGST_DT TIMESTAMP NOT NULL COMMENT 'FRST_RGST_DT',
 FRST_RGST_USER_ID VARCHAR(20) NOT NULL COMMENT 'FRST_RGST_USER_ID',
 LAST_CRCT_DT TIMESTAMP NOT NULL COMMENT 'LAST_CRCT_DT',
 LAST_CRCT_USER_ID VARCHAR(20) NOT NULL COMMENT 'LAST_CRCT_USER_ID',
 PRIMARY KEY (ASSET_ID)
 ) COMMENT = '자산';
 */
/*
 ASSET_ID VARCHAR(30) NOT NULL UNIQUE COMMENT '자산_ID',
 -- - Device : DEV
 -- - eBook : EBK
 -- - VOD : VOD
 -- - ETC : ETC
 ASSET_TYPE_CD VARCHAR(4) NOT NULL COMMENT '자산종류구분',
 ITEM_NM VARCHAR(40) NOT NULL COMMENT 'ITEM명',
 -- ITEM_01
 ITEM_01 VARCHAR(40) COMMENT 'ITEM_01',
 -- ITEM_02
 ITEM_02 VARCHAR(40) COMMENT 'ITEM_02',
 -- ITEM_03
 ITEM_03 VARCHAR(40) COMMENT 'ITEM_03',
 -- ITEM_04
 ITEM_04 VARCHAR(60) COMMENT 'ITEM_04',
 -- ITEM_05
 ITEM_05 VARCHAR(60) COMMENT 'ITEM_05',
 -- ITEM_06
 ITEM_06 VARCHAR(100) COMMENT 'ITEM_06',
 -- 비고
 ITEM_07 VARCHAR(100) COMMENT 'ITEM_07',
 -- ITEM_08
 ITEM_08 VARCHAR(2000) COMMENT 'ITEM_08',
 ASSET_YN VARCHAR(4) NOT NULL COMMENT '자산상태구분',
 DEL_YN VARCHAR(1) DEFAULT 'N' NOT NULL COMMENT '삭제여부',
 COSTPRIC_ID VARCHAR(20) NOT NULL COMMENT '원가_ID',
 */

public class Asset extends RecordInfo {

    private int rowNum;

    private String assetID;

    private String assetTypeCD;

    private String assetTypeNM;

    private String itemNM;

    private String item01;

    private String item02;

    private String item03;

    private String item04;

    private String item05;

    private String item06;

    private String item07;

    private String item08;

    private String item09;

    private String assetYN;

    private String delYN;

    private String costpric; //원가가격

    private String costpricID;

    private String costpricNM; // 

    private String langType; //
    
    private String fristName; //
    
    private String lastName; //
    
    private String vodMajor; //
    
    private String qualification; //
    
    private String period; //
    
    private String honors; //
    
    private String other; //

    private String arrAssetChild; // asset child list

    public String getArrAssetChild() {
		return arrAssetChild;
	}

	public void setArrAssetChild(String arrAssetChild) {
		this.arrAssetChild = arrAssetChild;
	}

	public String getLangType() {
		return langType;
	}

	public void setLangType(String langType) {
		this.langType = langType;
	}

	public String getFristName() {
		return fristName;
	}

	public void setFristName(String fristName) {
		this.fristName = fristName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getVodMajor() {
		return vodMajor;
	}

	public void setVodMajor(String vodMajor) {
		this.vodMajor = vodMajor;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getHonors() {
		return honors;
	}

	public void setHonors(String honors) {
		this.honors = honors;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getCostpric() {
        return costpric;
    }

    public void setCostpric(String costpric) {
        this.costpric = costpric;
    }

    public String getAssetTypeNM() {
        return assetTypeNM;
    }

    public void setAssetTypeNM(String assetTypeNM) {
        this.assetTypeNM = assetTypeNM;
    }

    public int getRowNum() {
        return rowNum;
    }

    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }

    public String getCostpricNM() {
        return costpricNM;
    }

    public void setCostpricNM(String costpricNM) {
        this.costpricNM = costpricNM;
    }

    public String getAssetID() {
        return assetID;
    }

    public void setAssetID(String assetID) {
        this.assetID = assetID;
    }

    public String getAssetTypeCD() {
        return assetTypeCD;
    }

    public void setAssetTypeCD(String assetTypeCD) {
        this.assetTypeCD = assetTypeCD;
    }

    public String getItemNM() {
        return itemNM;
    }

    public void setItemNM(String itemNM) {
        this.itemNM = itemNM;
    }

    public String getItem01() {
        return item01;
    }

    public void setItem01(String item01) {
        this.item01 = item01;
    }

    public String getItem02() {
        return item02;
    }

    public void setItem02(String item02) {
        this.item02 = item02;
    }

    public String getItem03() {
        return item03;
    }

    public void setItem03(String item03) {
        this.item03 = item03;
    }

    public String getItem04() {
        return item04;
    }

    public void setItem04(String item04) {
        this.item04 = item04;
    }

    public String getItem05() {
        return item05;
    }

    public void setItem05(String item05) {
        this.item05 = item05;
    }

    public String getItem06() {
        return item06;
    }

    public void setItem06(String item06) {
        this.item06 = item06;
    }

    public String getItem07() {
        return item07;
    }

    public void setItem07(String item07) {
        this.item07 = item07;
    }

    public String getItem08() {
        return item08;
    }

    public void setItem08(String item08) {
        this.item08 = item08;
    }

    public String getItem09() {
        return item09;
    }

    public void setItem09(String item09) {
        this.item09 = item09;
    }

    public String getAssetYN() {
        return assetYN;
    }

    public void setAssetYN(String assetYN) {
        this.assetYN = assetYN;
    }

    public String getDelYN() {
        return delYN;
    }

    public void setDelYN(String delYN) {
        this.delYN = delYN;
    }

    public String getCostpricID() {
        return costpricID;
    }

    public void setCostpricID(String costpricID) {
        this.costpricID = costpricID;
    }

}
