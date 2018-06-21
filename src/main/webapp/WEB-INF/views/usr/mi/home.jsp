<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value='/resources/usr/js/jquery.nivo.slider.pack.js' />" type="text/javascript"></script>
<script type="text/javascript">
$(window).load(function() {
	$('#slider').nivoSlider();
});
</script>


<div id="container" role="main">
  <div class="contentMain">
    <div class="mainArea">
      <div class="mainTxt">
        <h2><img src="<spring:message code="img.main_title" text=""/>" alt="Welcome to the CBC"></h2>
        <p class="fontT"><spring:message code="home.main.p_1" text=""/></p>
      </div>
	  <div id="slider">
		<img src="<c:url value='/resources/usr/images/img_main01.jpg' />" alt="" />
		<img src="<c:url value='/resources/usr/images/img_main02.jpg' />" alt="" />
		<img src="<c:url value='/resources/usr/images/img_main03.jpg' />" alt="" />
	  </div>
    </div>
  </div>
  <div class="contents">
    <div class="innerContents">
      <section class="secLearn">
        <h2><a href="${pageContext.request.contextPath }/usr/learningse"><img src="<spring:message code="img.learning_title,s" text=""/>" alt="Learning Service"></a></h2>
        <div class="imgLearn"><a href="${pageContext.request.contextPath }/usr/learningse"><img src="<c:url value='/resources/usr/images/img_intro01.gif' />" alt=""></a></div>
        <a href="${pageContext.request.contextPath }/learningsi" class="btnIntroLearn"><img src="<spring:message code="img.btn_intro,1" text=""/>" alt="Introduction"></a>
        <h3 class="learnStitle01"><img src="<spring:message code="img.smart_title,s" text=""/>" alt="Smart Class"></h3>
        <p class="learnCon01"><spring:message code="home.learning.p_1" text=""/></p>
        <h3 class="learnStitle02"><img src="<spring:message code="img.englishvill_title,s" text=""/>" alt="English Village"></h3>
        <p class="learnCon02"><spring:message code="home.learning.p_2" text=""/></p>
      </section>
      <section class="secCommerce">
        <h2><a href="${pageContext.request.contextPath }/usr/Promote/list/"><img src="<spring:message code="img.commerce_title,s" text=""/>" alt="Commerce Service"></a></h2>
        <div class="imgCommerce"><a href="${pageContext.request.contextPath }/usr/Promote/list/"><img src="<c:url value='/resources/usr/images/img_intro02.gif' />" alt=""></a></div>
        <a href="${pageContext.request.contextPath }/commercesi" class="btnIntroCommerce"><img src="<spring:message code="img.btn_intro,2" text=""/>" alt="Introduction"></a>
        <h3 class="commerceStitle01"><img src="<spring:message code="img.ezup_tool" text=""/>" alt="E-z Up Tool"></h3>
        <p class="commerceCon01"><spring:message code="home.Commerce.p_1" text=""/></p>
      </section>
      <section class="secHealth">
        <h2><a href="${pageContext.request.contextPath }/healthse"><img src="<spring:message code="img.health_title,s" text=""/>" alt="Health Service"></a></h2>
        <div class="imgHealth"><a href="${pageContext.request.contextPath }/healthse"><img src="<c:url value='/resources/usr/images/img_intro03.gif' />" alt=""></a></div>
        <a href="${pageContext.request.contextPath }/healthsi" class="btnIntroHealth"><img src="<spring:message code="img.btn_intro,3" text=""/>" alt="Introduction"></a>
        <h3 class="healthStitle01"><img src="<spring:message code="img.health_infor,s" text=""/>" alt="Health Information"></h3>
        <p class="healthCon01"><spring:message code="home.health.p_1" text=""/></p>
        <h3 class="healthStitle02"><img src="<spring:message code="img.health,output,s" text=""/>" alt="Measurement and output"></h3>
        <p class="healthCon02"><spring:message code="home.health.p_2" text=""/></p>
      </section>
    </div>
  </div>
</div>