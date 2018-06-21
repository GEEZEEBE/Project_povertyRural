<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9">
 
<meta http-equiv="Cash-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<title>SK CBC</title>
<link href="<c:url value="/resources/usr/css/basc.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/usr/css/global.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/usr/css/layout_learning.css" />"
	rel="stylesheet" type="text/css" />
<link href="<spring:message code='css.name_learning,my' text=''/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/inc/script.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/usr/js/jquery-1.6.1.min.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/jscommon.js" />"
	type="text/javascript"></script>
</head>

<body class="bgSmart">
	<header role="banner">
		<div class="topMenu">
            <div class="langSel">
                <a href="javascript:changeLang('${pageContext.request.contextPath }','my');" class="mal <spring:message code='label.lang,mal_langOn'/> fontT"><spring:message code="label.lang,malaysia" text="" /></a><a href="javascript:changeLang('${pageContext.request.contextPath }','en');" class="eng <spring:message code='label.lang,en_langOn'/> fontT"><spring:message code="label.lang,english" text="" /></a>
            </div>
            <nav class="naviTop fontT"><a href="${pageContext.request.contextPath }"><spring:message code="menu.cbchome" text="" /></a>|<a href="${pageContext.request.contextPath }/usr/smartmain" class="smart"><spring:message code="menu.sitemap_smart" text="" /></a>|<a href="${pageContext.request.contextPath }/usr/englishvi" class="eng"><spring:message code="menu.sitemap_envill" text="" /></a></nav>
            <div class="rightBtn"><c:choose><c:when test="${username != null && username != 'anonymousUser'}"><a href="<c:url value="/j_spring_security_logout" />" class="logoutBtn"><spring:message code="label.log_out" text="" /></a></c:when><c:otherwise><a href="<c:url value="/loginUser" />" class="logoutBtn"><spring:message code="label.log_in" text="" /></a></c:otherwise></c:choose><a href="${pageContext.request.contextPath }/sitemap/" class="sitemapBtn"><spring:message code="label.sitemap" text="" /></a>
            <div class="mypageFloat"><a href="${pageContext.request.contextPath }/usr/myPage/read?userID=${userID}" class="mypageBtn"><spring:message code="menu.sitemap_mypage" text="" /></a></div>
            </div>
        </div>
	</header>
    
	<div id="container" class="containerSmart">
		<div class="contSmart">
			<div class="smartMainimg">
				<h1>
					<a href="${pageContext.request.contextPath }/usr/smartmain"><img
						src="<spring:message code="img.smart_title,xl" text="" />"
						alt="Smart Class"></a>
				</h1>
				<nav role="navigation" class="smartNavi">
					<ul>
						<li
							class=<c:choose><c:when test="${srvcID eq '4' || srvcID eq '5' || srvcID eq '6' || srvcID eq '7' || srvcID eq '8'}" >smartMenu01On</c:when><c:otherwise>smartMenu01</c:otherwise></c:choose>><a
							href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','4')"><spring:message code="learningse.year_4" text=""/></a></li>
						<li
							class=<c:choose><c:when test="${srvcID eq '9' || srvcID eq '10' || srvcID eq '11' || srvcID eq '12' || srvcID eq '13'}" >smartMenu02On</c:when><c:otherwise>smartMenu02</c:otherwise></c:choose>><a
							href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','9')"><spring:message code="learningse.year_5" text=""/></a></li>
						<li
							class=<c:choose><c:when test="${srvcID eq '14' || srvcID eq '15' || srvcID eq '16' || srvcID eq '17' || srvcID eq '18'}" >smartMenu03On</c:when><c:otherwise>smartMenu03</c:otherwise></c:choose>><a
							href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','14')"><spring:message code="learningse.year_6" text=""/></a></li>
						<li
							class=<c:choose><c:when test="${srvcID eq '19' || srvcID eq '20' || srvcID eq '21' }" >smartMenu04On</c:when><c:otherwise>smartMenu04</c:otherwise></c:choose>><a
							href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','19')"><spring:message code="learningse.advanced_en" text=""/></a></li>
					</ul>
				</nav>
				<%-- <div class="btnRecord"><a href="${pageContext.request.contextPath }/usr/smartClass/lessonsList"><img src="<c:url value='/resources/usr/images/learning/btn_lesson.gif' />" alt="Lesson record" width="174" height="37"></a></div> --%>
				<div class="btnRecord">
					<a
						href="${pageContext.request.contextPath }/usr/smartClass/lessonsList"><img
						src="<spring:message code="img.smart_mypage_title" text=""/>"
						alt="My History"></a>
				</div>
			</div>
			<!-- body : str -->
			<tiles:insertAttribute name="body" />
			<!-- body : end -->
		</div>
	</div>
</body>
</html>