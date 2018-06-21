package com.skt.mars.adm.cm.tld;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * page navigation custom tag 를 정의
 * 
 * @author SK M&C
 * @created 2011. 12. 08.
 */

public class ListNoTag extends TagSupport {
	protected final Log logger = LogFactory.getLog(getClass());

    private int statusIndex = 0;

    private PageList pageList;

    public void setPageList(List pageList) {
        this.pageList = (PageList)pageList;
    }

    public void setStatusIndex(int statusIndex) {
        this.statusIndex = statusIndex;
    }

    /**
     * 생성자
     */
    public ListNoTag() {
        // default constructor
    }

    @Override
    public int doStartTag() throws JspException {

        JspWriter writer = pageContext.getOut();

        StringBuffer sb = new StringBuffer();
        String listNo = "";
        if (pageList != null && pageList.size() > 0) {

//            int index = pageList.getTotalCount() - ((pageList.getPageNo() - 2) * pageList.getListSize()) - statusIndex;	// error
            int index = pageList.getTotalCount() - statusIndex;
//            System.out.print(index+", total : "+pageList.getTotalCount()+", PageNo : "+pageList.getPageNo()+", ListSize : "+pageList.getListSize()+", statusIndex : "+statusIndex+"\n");
            listNo = Integer.toString(index);

        }

        try {
            writer.print(listNo);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return SKIP_BODY;
    }

    /**
     * 페이지별 Link URL
     * 
     * @param form
     * @param doSubmit
     * @param pageNo
     * @return
     */
    private String getLink(String form, String doSubmit, int pageNo) {
        return "<a href=\"javascript:document." + form + ".currentPage.value=" + pageNo + ";" + doSubmit + "\">";
    }
}
