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
	        <p class="subTitleCommu"><img src="<spring:message code="img.si_title,txt1" text=""/>" alt=" CBC members are at notice on this board." /></p>
	      </div>
	      <!--mypage start-->
	      <div role="main" class="subConBox">
	        <nav role="navigation" class="mypageTab">
	          <ul>
	            <li><a href="${pageContext.request.contextPath }/learningsi" class="tabOn"><spring:message code="learningsi.title" text=""/></a></li>
	            <li><a href="${pageContext.request.contextPath }/commercesi"><spring:message code="commercesi.title" text=""/></a></li>
	            <li><a href="${pageContext.request.contextPath }/healthsi"><spring:message code="healthsi.tilte" text=""/></a></li>
	          </ul>
	        </nav>
	        <section class="learnIntro">
	          <div class="tlt_leaSer">
	            <a href="${pageContext.request.contextPath }/usr/learningse"><img src="<spring:message code="img.learning_title,l" text=""/>" alt="Title Learning Service" /></a>
            	<p class="learnSer1"><spring:message code="learningsi.p_1" text=""/></p>
	          </div>
	          <div class="exp">
	            <section class="smaClas">
	              <img class="tlt" src="<spring:message code="img.smart_title,m" text=""/>" alt="Title smart class" />
	              <p class="txtCla"><spring:message code="learningsi.p_2" text=""/></p>
	            </section>
	            <section class="engVill">
	              <img class="tlt" src="<spring:message code="img.englishvill_title,m" text=""/>" alt="Title english village" />
	              <p class="txtVil"><spring:message code="learningsi.p_3" text=""/></p>
            	</section>
			  </div>
      		</section>
	      <!--mypage end--> 
		</div>
		</div>
	</div>
</div>