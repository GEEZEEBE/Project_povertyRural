<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9">

<meta http-equiv="Cash-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<title><tiles:insertAttribute name="title" /></title>
<link href="<spring:message code='css.name_basc' text='' />"
	rel="stylesheet" type="text/css" />
<link href="<spring:message code='css.name_global' text='' />"
	rel="stylesheet" type="text/css" />
<link href="<spring:message code='css.name_layout' text='' />"
	rel="stylesheet" type="text/css" />
<link href="<spring:message code='css.name_layout,my' text='' />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/inc/script.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/usr/js/jquery-1.6.1.min.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/jscommon.js" />"
	type="text/javascript"></script>

<script src="<c:url value="/resources/usr/js/jquery-1.6.1.min.js" />"
	type="text/javascript"></script>
<script type="text/javascript">
	
<script type="text/javascript">
function loginck(){

	if($(".id:eq(0)").val().trim().length != $(".id:eq(0)").val().length){
		alert('<spring:message code="login.not_idpw"/>');
		$(".id").focus();
		return false;
	}
	
	if($(".id:eq(0)").val().trim().length == 0 && $(".pw:eq(0)").val().trim().length == 0){
		alert('<spring:message code="login.null_idpw"/>');
		$(".id").focus();
		return false;
	}
	if(!$(".id:eq(0)").val() || $(".id:eq(0)").val().trim().length == 0){
		alert('<spring:message code="login.null_id"/>');
		$(".id").focus();
		return false;
	}
	if(!$(".pw:eq(0)").val() || $(".pw:eq(0)").val().trim().length == 0){
		alert('<spring:message code="login.null_pw"/>');
		$(".pw").focus();
		return false;
	}
	return true;
}

</script>
	
</head>

<body>
	<header role="banner">
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate var="year" value="${now}" type="date" dateStyle="long" />
		<div class="topMenu">
			<div class="langSel">
				<a
					href="?lang=my&boardID=${requestMap.boardID != null ? requestMap.boardID  : null}&noticeId=${requestMap.noticeId != null ? requestMap.noticeId  : null}&flag=${requestMap.flag != null ? requestMap.flag  : null}&strTxt=${requestMap.serTxt != null ? requestMap.serTxt  : null}"
					class="mal <spring:message code='label.lang,mal_langOn'/>  fontT"><spring:message
						code="label.lang,malaysia" text="" /></a><a
					href="?lang=en&boardID=${requestMap.boardID != null ? requestMap.boardID  : null}&noticeId=${requestMap.noticeId != null ? requestMap.noticeId  : null}&flag=${requestMap.flag != null ? requestMap.flag  : null}&strTxt=${requestMap.serTxt != null ? requestMap.serTxt  : null}"
					class="eng <spring:message code='label.lang,en_langOn'/> fontT"><spring:message
						code="label.lang,english" text="" /></a>
			</div>
			<nav class="naviTop fontT">
				<a href="${pageContext.request.contextPath }/usr/learningse"
					class="learning"><spring:message code='label.learning' /></a>| <a
					href="${pageContext.request.contextPath }/usr/Promote/list"
					class="commerce"><spring:message code='label.commerce' /></a>| <a
					href="${pageContext.request.contextPath }/healthse" class="health"><spring:message
						code='label.health' /></a>
			</nav>
			<div class="rightBtn">
				<c:choose>
					<c:when
						test="${pageContext.request.remoteUser != null && pageContext.request.remoteUser != 'anonymousUser'}">
						<a href="<c:url value="/j_spring_security_logout" />"
							class="logoutBtn"><spring:message code='label.log_out' /></a>
						<a href="${pageContext.request.contextPath }/sitemap/"
							class="sitemapBtn"><spring:message code='label.sitemap' /></a>
						<div class="mypageFloat">
							<a
								href="${pageContext.request.contextPath }/usr/myPage/read?userID=${userID}"
								class="mypageBtn"><spring:message code='lbael.mypage' /></a>
						</div>
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/usr/loginUser"/>" class="logoutBtn"><spring:message
								code='label.log_in' /></a>
						<a href="${pageContext.request.contextPath }/sitemap/"
							class="sitemapBtn"><spring:message code='label.sitemap' /></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="topNavArea">
			<nav role="navigation">
				<h1>
					<a href="${pageContext.request.contextPath }/"><img
						src="<c:url value="/resources/usr/images/logo.gif" />"
						alt="SK CBC" /></a>
				</h1>
				<ul>
					<li><a href="${pageContext.request.contextPath }/sktintro/"
						class="mMenu01<c:if test="${controllerPath=='/sktintro'}" >On</c:if>"><spring:message
								code='menu.skt' /></a></li>
					<li><a href="${pageContext.request.contextPath }/cbcintro/"
						class="mMenu02<c:if test="${controllerPath=='/cbcintro'}" >On</c:if>"><spring:message
								code='menu.cbc' /></a></li>
					<li><a href="${pageContext.request.contextPath }/usrFree/list"
						class="mMenu03<c:if test="${controllerPath=='/usrFree'}" >On</c:if>"><spring:message
								code='menu.free' /></a></li>
					<li><a href="${pageContext.request.contextPath }/notice/list"
						class="mMenu04<c:if test="${controllerPath=='/notice'}" >On</c:if>"><spring:message
								code='menu.notice' /></a></li>
				</ul>
			</nav>
			<div class="loginBox">
				<fieldset>
					<legend>log-in</legend>
					<c:choose>
						<c:when
							test="${pageContext.request.remoteUser != null && pageContext.request.remoteUser != 'anonymousUser'}">
							<div class="logonInfo">
								<span class="logonHi"><spring:message code='logo_text_hi' /></span>
								<span class="logonName">${pageContext.request.remoteUser}</span>
							</div>
							<div class="logonTime">${year}</div>
						</c:when>
						<c:otherwise>
							<form name='f'
								action="<c:url value='/usr/j_spring_security_check' />"
								method='POST' onsubmit="return loginck();">
								<dl>
									<dt>
										<!-- <img src="<c:url value="/resources/usr/images/txt_id.gif" />"
											alt="ID" /> -->
									</dt>
									<dd>
										<div class="loginID">
											<input type="text" class="textBox1 require id" value=""
												maxlength="" name='j_username' 
												onblur="if (this.value.length==0) {this.className='input_text'}else {this.className='input_text focusnot'}"
												onfocus="this.className='input_text focus'" />
										</div>
									</dd>
									<dt class="pwLine">
										<!-- <img src="<c:url value="/resources/usr/images/txt_pw.gif" />"
											alt="PW" /> -->
									</dt>
									<dd>
										<div class="loginPW">
											<input type="password" class="textBox1 require pw" maxlength=""
												name='j_password'  value=""
												onblur="if (this.value.length==0) {this.className='input_text'}else {this.className='input_text focusnot'}"
												onfocus="this.className='input_text focus'" />
										</div>
									</dd>
								</dl>
								<span class="loginBtn"> <input type="submit"
									value="login" title="login">
								</span>
							</form>
						</c:otherwise>
					</c:choose>
				</fieldset>
			</div>
		</div>
	</header>
	<div id="container" role="main">
		<!-- body : str -->
		<tiles:insertAttribute name="body" />
		<!-- body : end -->
	</div>
</body>
</html>