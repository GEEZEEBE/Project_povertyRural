<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
		<tiles:insertAttribute name="header" />
</head>
<body class="bgNone">
<header class="mainLogin">
  <nav class="mainNav">
    <h1><img src="<c:url value='/resources/images/logo_adminportal.gif' />" alt="SK CBC Admin Portal" /></h1>
  </nav>
</header>
<section class="container login">
	<tiles:insertAttribute name="body" />
</section>
</body>
</html>
