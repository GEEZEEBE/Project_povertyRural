<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="container" role="main">
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeSktintro">
        <h2 class="titleCommu"><img src="<spring:message code="img.sktintro_title" text=""/>" alt="Learning Service Introduction" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.sktintro_title,txt1" text=""/>" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox SKTINT">
        <h1><span><spring:message code="sktintro.h1_title" text=""/></span></h1>
        <p><spring:message code="sktintro.p_1" text=""/></p>
        <p><spring:message code="sktintro.p_2" text=""/></p>
        <h2><spring:message code="sktintro.h2_title,1" text=""/></h2>
        <p><spring:message code="sktintro.p_3" text=""/></p>
        <p><spring:message code="sktintro.p_4" text=""/></p>
        <h2><spring:message code="sktintro.h2_title,2" text=""/></h2>
        <p><spring:message code="sktintro.p_5" text=""/></p>
        <h2><spring:message code="sktintro.h2_title,3" text=""/></h2>
        <p><spring:message code="sktintro.p_6" text=""/></p>
        <p><spring:message code="sktintro.p_7" text=""/></p>
        <h2><spring:message code="sktintro.h2_title,4" text=""/></h2>
        <p><spring:message code="sktintro.p_8" text=""/></p>
      </div>
      <!--mypage end--> 
    </div>
  </div>
</div>
