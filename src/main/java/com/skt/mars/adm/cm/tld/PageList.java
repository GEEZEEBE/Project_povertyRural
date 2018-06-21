package com.skt.mars.adm.cm.tld;

import java.util.ArrayList;
import java.util.List;

/**
 * 리스트에서 페이징을 하기 위한 클래스이다.
 * 
 * @author SK M&C
 * @created 2011. 12. 08.
 */
public class PageList extends ArrayList {

    private final int totalCount;

    private final int pageNo;

    private final int listSize;

    private int totalPage;

    public PageList() {
        this.totalCount = 0;
        this.listSize = 10;
        this.totalPage = 0;
        this.pageNo = 1;
    }

    public PageList(List list, int totalCount, int pageNo, int listSize) {

        super(list);
        this.totalCount = totalCount;
        this.listSize = listSize;
        this.pageNo = pageNo;
        totalPage = totalCount / listSize;
        if (totalCount % listSize != 0) {
            totalPage++;
        }
    }

    public String getTest() {
        return "test";
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getPageNo() {
        return pageNo;
    }

    public int getListSize() {
        return listSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

}
