<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="<c:url value="/resources/js/sample.js" />"></script> <!-- checked code to active  -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>

<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<table border='1'>
		<tr>
			<th>
				<tiles:insertAttribute name="header" />
			</th>
		</tr>
		<tr>
			<td>
				<tiles:insertAttribute name="body" />
			</td>
		</tr>
		<tr>
			<td>
				<tiles:insertAttribute name="footer" />
			</td>
		</tr>
	</table>
</body>
</html>
