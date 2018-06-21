package com.skt.mars.adm.cm.tld;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * page navigation custom tag 를 정의
 * 
 * @author
 * @created
 */

public class PageNavigationTag extends TagSupport {

    protected final Log logger = LogFactory.getLog(getClass());

    /**
     * 자바스크립트의 form 이름
     */
    private String form;

    /**
     * 자바스크립트의 doSubmit 메소드 이름
     */
    private String doSubmit;

    /**
     * 한 block 당 페이지 수
     */
    private int tabSize;

    private PageList pageList;

    private String sortOf;

    public void setPageList(List pageList) {
        this.pageList = (PageList)pageList;
    }

    public void setTabSize(int tabSize) {
        this.tabSize = tabSize;
    }

    public void setSortOf(String sortOf) {
        this.sortOf = sortOf;
    }

    /**
     * 생성자
     */
    public PageNavigationTag() {
        // default constructor
    }

    /**
     * 자바스크립트의 form 이름 반환
     * 
     * @return 자바스크립트의 form 이름
     */
    public String getForm() {
        return form;
    }

    /**
     * 자바스크립트의 form 이름 설정
     * 
     * @param form - the form to set
     */
    public void setForm(String form) {
        this.form = form;
    }

    /**
     * 자바스크립트의 doSubmit 메소드 이름 반환
     * 
     * @return 자바스크립트의 doSubmit 메소드 이름
     */
    public String getDoSubmit() {
        return doSubmit;
    }

    /**
     * 자바스크립트의 doSubmit 메소드 이름 설정
     * 
     * @param doSubmit - the doSubmit to set
     */
    public void setDoSubmit(String doSubmit) {
        this.doSubmit = doSubmit;
    }

    //    @Value("#{commonProperty['page.tab.size']}") 
    //    private int pageTabSize; 

    @Override
    public int doStartTag() throws JspException {

        JspWriter writer = pageContext.getOut();

        StringBuffer sb = new StringBuffer();

        // get rootContextPath from HttpServletRequest
        String rootContextPath = ((HttpServletRequest)pageContext.getRequest()).getContextPath();

        if (pageList != null && pageList.size() > 0) {
            // tag attribute
            form = (form == null || form.isEmpty()) ? "forms[0]" : form;
            doSubmit = (doSubmit == null || doSubmit.isEmpty()) ? "doSubmit();" : doSubmit;

            logger.info("[totalCount, currentPage, listSize] " + pageList.getTotalCount()
                        + ", "
                        + pageList.getPageNo()
                        + ", "
                        + pageList.getListSize());

            if (tabSize == 0) {
                tabSize = 10;
                //                tabSize = pageTabSize;
            }

            if ("smart".equals(sortOf) || "english".equals(sortOf)) {
                sb = getLearningNavigation(rootContextPath);
            } else {
                sb = getDefaultNavigation(rootContextPath);
            }
        }

        try {
            writer.print(sb.toString());
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return SKIP_BODY;
    }

    private StringBuffer getLearningNavigation(String rootContextPath) {
        StringBuffer sb = new StringBuffer();

        String btn_image02 = null;
        String btn_image03 = null;
        String hoverCss = null;

        btn_image02 = "/resources/usr/images/learning/bg_pageicon01.gif";
        btn_image03 = "/resources/usr/images/learning/bg_pageicon02.gif";

        if ("smart".equals(sortOf)) {
            hoverCss = "hover";
        } else {
            hoverCss = "hoverEv";
        }

        // 첫 페이지
        int startPageNo = pageList.getPageNo() / tabSize;
        if ((pageList.getPageNo() % tabSize) > 0) {
            startPageNo++;
        }

        if (startPageNo == 0) {
            startPageNo = 1;
        }

        startPageNo = (startPageNo * tabSize) - (tabSize - 1);

        // 끝 페이지
        int endPageNo = startPageNo + (tabSize - 1);
        if (endPageNo > pageList.getTotalPage()) {
            endPageNo = pageList.getTotalPage();
        }

        //        sb.append("<div class=\"pageNum\">\n");

        // 이전
        if (startPageNo > 1) {
            sb.append("<a href=\"javascript:document." + form
                      + ".currentPage.value="
                      + (startPageNo - tabSize)
                      + ";"
                      + doSubmit
                      + "\"  class=\"pageBtn\">");
            sb.append("<img src='" + rootContextPath + btn_image02 + "' /></a>\n");
        } else {
            //            sb.append("<a href='#' class=\"pageBtn\">");
        }

        // page block
        for (int i = startPageNo; i <= endPageNo; i++) {
            if (i == pageList.getPageNo()) {
                sb.append("<a href='#' class=" + hoverCss + ">" + i + "</a>\n");
            } else {
                sb.append(getLink(form, doSubmit, i));
            }
        }

        // 다음
        if (pageList.getTotalPage() > endPageNo) {
            sb.append("<a href=\"javascript:document." + form
                      + ".currentPage.value="
                      + (startPageNo + tabSize)
                      + ";"
                      + doSubmit
                      + "\"  class=\"pageBtn\">");
            sb.append("<img src='" + rootContextPath + btn_image03 + "' /></a>\n");
        } else {
            //            sb.append("<a href='#' class=\"pageBtn\">");
        }

        //        sb.append("\n</div>\n");
        return sb;
    }

    private StringBuffer getDefaultNavigation(String rootContextPath) {
        StringBuffer sb = new StringBuffer();

        String btn_image01 = null;
        String btn_image02 = null;
        String btn_image03 = null;
        String btn_image04 = null;

        if ("usr".equals(sortOf)) {
            btn_image01 = "/resources/usr/images/btn_pre01.gif";
            btn_image02 = "/resources/usr/images/btn_pre02.gif";
            btn_image03 = "/resources/usr/images/btn_nex01.gif";
            btn_image04 = "/resources/usr/images/btn_nex02.gif";
        } else {
            btn_image01 = "/resources/images/btn_page01.gif";
            btn_image02 = "/resources/images/btn_page02.gif";
            btn_image03 = "/resources/images/btn_page03.gif";
            btn_image04 = "/resources/images/btn_page04.gif";
        }

        // 첫 페이지
        int startPageNo = pageList.getPageNo() / tabSize;
        if ((pageList.getPageNo() % tabSize) > 0) {
            startPageNo++;
        }

        if (startPageNo == 0) {
            startPageNo = 1;
        }

        startPageNo = (startPageNo * tabSize) - (tabSize - 1);

        // 끝 페이지
        int endPageNo = startPageNo + (tabSize - 1);
        if (endPageNo > pageList.getTotalPage()) {
            endPageNo = pageList.getTotalPage();
        }

        //        sb.append("<div class=\"pageNum\">\n");

        // 처음
        if (pageList.getTotalPage() > 1 && pageList.getPageNo() > 1 && tabSize < endPageNo) {
            sb.append("<a href=\"javascript:document." + form
                      + ".currentPage.value="
                      + "1"
                      + ";"
                      + doSubmit
                      + "\"  class=\"pageBtn\">");
            sb.append("<img src='" + rootContextPath + btn_image01 + "' /></a>\n");
        } else {
            //            sb.append("<a href='#' class=\"pageBtn\">");
        }

        // 이전
        if (startPageNo > 1) {
            sb.append("<a href=\"javascript:document." + form
                      + ".currentPage.value="
                      + (startPageNo - tabSize)
                      + ";"
                      + doSubmit
                      + "\"  class=\"pageBtn\">");
            sb.append("<img src='" + rootContextPath + btn_image02 + "' /></a>\n");
        } else {
            //            sb.append("<a href='#' class=\"pageBtn\">");
        }

        // page block
        for (int i = startPageNo; i <= endPageNo; i++) {
            if (i == pageList.getPageNo()) {
                sb.append("<a href='#' class=hover>" + i + "</a>\n");
            } else {
                if (i == endPageNo) {
                    sb.append(getLink(form, doSubmit, i, "last"));
                } else {
                    sb.append(getLink(form, doSubmit, i));

                }
            }
        }

        // 다음
        if (pageList.getTotalPage() > endPageNo) {
            sb.append("<a href=\"javascript:document." + form
                      + ".currentPage.value="
                      + (startPageNo + tabSize)
                      + ";"
                      + doSubmit
                      + "\"  class=\"pageBtn\">");
            sb.append("<img src='" + rootContextPath + btn_image03 + "' /></a>\n");
        } else {
            //            sb.append("<a href='#' class=\"pageBtn\">");
        }

        // 마지막
        if (pageList.getTotalPage() > endPageNo) {
//        if (pageList.getTotalPage() > endPageNo || (pageList.getTotalPage() > 1 && pageList.getPageNo() < pageList.getTotalPage() && tabSize < endPageNo)) {
            sb.append("<a href=\"javascript:document." + form
                      + ".currentPage.value="
                      + pageList.getTotalPage()
                      + ";"
                      + doSubmit
                      + "\"  class=\"pageBtn\">");
            sb.append("<img src='" + rootContextPath + btn_image04 + "' /></a>\n");
        } else {
            //            sb.append("<a href='#' class=\"pageBtn\">");
        }

        //        sb.append("\n</div>\n");

        return sb;
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
        return "<a href=\"javascript:document." + form
               + ".currentPage.value="
               + pageNo
               + ";"
               + doSubmit
               + "\">"
               + pageNo
               + "</a>\n";
    }

    private String getLink(String form, String doSubmit, int pageNo, String classStyle) {
        return "<a href=\"javascript:document." + form
               + ".currentPage.value="
               + pageNo
               + ";"
               + doSubmit
               + "\" class='"
               + classStyle
               + "'>"
               + pageNo
               + "</a>\n";
    }
}
