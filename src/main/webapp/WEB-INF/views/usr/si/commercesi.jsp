<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<div id="container" role="main">
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeLearning">
        <h2 class="titleCommu"><img src="<spring:message code="img.si_title" text=""/>" alt="Learning Service Introduction" /></h2>
        <p class="subTitleCommu"><img src="<c:url value='/resources/usr/images/txt_learningIntro.gif'/>" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox">
        <nav role="navigation" class="mypageTab">
          <ul>
            <li><a href="${pageContext.request.contextPath }/learningsi"><spring:message code="learningsi.title" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/commercesi" class="tabOn"><spring:message code="commercesi.title" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/healthsi"><spring:message code="healthsi.tilte" text=""/></a></li>
          </ul>
        </nav>
        <section class="commerceIntro">
          <div class="tlt_comSer">
            <a href="${pageContext.request.contextPath }/usr/Promote/list"><img src="<spring:message code="img.commerce_title,l" text=""/>" alt="Title Learning Service" /></a>
            <p class="commSer1"><spring:message code="commercesi.p_1" text=""/></p>
            <a class="btnGuide" href="${pageContext.request.contextPath }/Guide/list"><img src="<spring:message code="img.commerce.guide,view" text=""/>" alt="Guide View" /></a>
          </div>
          <div class="exp">
            <section class="promotion">
              <img class="tlt" src="<spring:message code="img.commerce_promotion" text=""/>" alt="Title promotion" />
              <p class="txtPro"><spring:message code="commercesi.p_2" text=""/></p>
            </section>
            <section class="label">
              <img class="tlt" src="<spring:message code="img.commerce_label" text=""/>" alt="Title label" />
              <p class="txtLab"><spring:message code="commercesi.p_3" text=""/></p>
            </section>
            <section class="brochure">
              <img class="tlt" src="<spring:message code="img.commerce_brochure" text=""/>" alt="Title brochure" />
              <p class="txtBro"><spring:message code="commercesi.p_4" text=""/></p>
            </section>
          </div>
        </section>
      </div>
      <!--mypage end--> 
    </div>
  </div>
</div>