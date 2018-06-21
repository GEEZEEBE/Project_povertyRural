package com.skt.mars.adm.cm.tld;

import javax.servlet.jsp.tagext.TagSupport;

/**
 * BaseTagSupport
 * 
 * @author SK M&C
 * @created 2011. 12. 08.
 */
public class BaseTagSupport extends TagSupport {

    /**
     * 생성자
     */
    public BaseTagSupport() {
        // Default Constructor
    }

    /**
     * css class 속성
     */
    private String cssClass;

    /**
     * css style 속성
     */
    private String cssStyle;

    /**
     * name 속성
     */
    private String name;

    /**
     * onchange 이벤트 속성
     */
    private String onChange;

    /**
     * hidden type 여부
     */
    private boolean hidden;

    /**
     * select box 의 빈 option 의 text
     */
    private String optionTitle;

    /**
     * radio type 여부
     */
    private boolean radio;

    /**
     * onclick 이벤트 속성
     */
    private String onClick;

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public void setCssStyle(String cssStyle) {
        this.cssStyle = cssStyle;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setOnChange(String onChange) {
        this.onChange = onChange;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public void setOptionTitle(String optionTitle) {
        this.optionTitle = optionTitle;
    }

    public void setRadio(boolean radio) {
        this.radio = radio;
    }

    public void setOnClick(String onClick) {
        this.onClick = onClick;
    }

    protected String getName() {
        return name;
    }

    protected boolean getHidden() {
        return hidden;
    }

    protected String getOptionTitle() {
        return optionTitle;
    }

    protected boolean isRadio() {
        return radio;
    }

    protected String getOnClick() {
        return onClick;
    }

    /**
     * <pre>
     * HTML 태그의 속성을 구성하여 반환한다.
     * </pre>
     * 
     * @return
     */
    protected String getHtmlAttribute() {
        String attributes = "";

        if (name != null) {
            attributes += " id=\"" + name + "\"";
            attributes += " name=\"" + name + "\"";
        }

        if (cssStyle != null) {
            attributes += " style=\"" + cssStyle + "\"";
        }

        if (cssClass != null) {
            attributes += " class=\"" + cssClass + "\"";
        }

        if (cssClass != null) {
            attributes += " class=\"" + cssClass + "\"";
        }

        if (onChange != null) {
            attributes += " onChange=\"" + onChange + "\"";
        }

        return attributes;
    }
}
