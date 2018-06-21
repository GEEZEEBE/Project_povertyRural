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

<title><tiles:insertAttribute name="title" /></title>
<link href="<c:url value="/resources/usr/css/basc.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/usr/css/global.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/usr/css/layout.css" />"
	rel="stylesheet" type="text/css" />
<link href="<spring:message code="css.name_layout,my"/>"
	rel="stylesheet" type="text/css" />
</head>

<body>
<header role="banner" class="login">
  <div class="topMenu">
	<div class="langSel">
		<a href="?lang=my" class="mal <spring:message code='label.lang,mal_langOn'/>  fontT">
			<spring:message code="label.lang,malaysia" text="" />
		</a>
		<a href="?lang=en" class="eng <spring:message code='label.lang,en_langOn'/> fontT">
			<spring:message code="label.lang,english" text="" />
		</a>
	</div>
  </div>
</header>
<section id="container" role="main">
<!-- body : str -->
				<tiles:insertAttribute name="body" />
<!-- body : end -->
</section>
</body>
</html>