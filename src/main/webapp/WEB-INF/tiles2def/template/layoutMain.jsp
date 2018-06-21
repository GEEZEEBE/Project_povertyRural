<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
				<tiles:insertAttribute name="header" />
</head>

<body>
<header class="main">
	<tiles:insertAttribute name="menuTop" />
</header>
<section class="container">
	<tiles:insertAttribute name="body" />
</section>

<footer>
	<tiles:insertAttribute name="footer" />
</footer>

</body>
</html>
