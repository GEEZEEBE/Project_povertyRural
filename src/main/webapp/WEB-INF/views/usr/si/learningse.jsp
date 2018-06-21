<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<form>
<input type="hidden" name="lang" value="${lang }" >
<div id="container" role="main">
  <div class="contMain">
    <section class="secSmart">
      <h1><img src="<spring:message code="img.smart_title,l" text=""/>" alt="Smart Class"></h1>
      <div class="linkSmartBtn"><a href="${pageContext.request.contextPath }/usr/smartmain?lang=${lang }"><img src="<c:url value='/resources/usr/images/learning/bg_smart.png'/>" alt="Smart Class"></a></div>
      <ul>
        <li class="firstSmartLink"><spring:message code="learningse.year_4" text=""/></li>
        <li><spring:message code="learningse.year_5" text=""/></li>
        <li><spring:message code="learningse.year_6" text=""/></li>
        <li class="lastSmartLink"><spring:message code="learningse.advanced_en" text=""/></li>
      </ul>
      <p class="fontT"><spring:message code="learningse.p_1" text=""/></p>
    </section>
    <section class="secEnglish">
      <h1><img src="<spring:message code="img.englishvill_title,l" text=""/>" alt="English Village"></h1>
      <div class="linkEnglishBtn"><a href="${pageContext.request.contextPath }/usr/englishvi?lang=${lang }"><img src="<c:url value='/resources/usr/images/learning/bg_english.png'/>" alt="English Village"></a></div>
      <ul>
        <li class="firstSmartLink"><spring:message code="learningse.vod" text=""/></li>
        <li class="lastSmartLink"><spring:message code="learningse.ebook" text=""/></li>
      </ul>
      <p class="fontT"><spring:message code="learningse.p_2" text=""/></p>
    </section>
  </div>
</div>
</form>