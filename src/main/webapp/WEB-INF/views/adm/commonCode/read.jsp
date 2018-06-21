<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Read CommonCode</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/commonCode"> insert CommonCode </a>
<table>		
	<tr>
		<td>Thought Method</td>
		<td>${method}</td>
	</tr>
	<tr>
		<td>codeID</td>
		<td>${commonCode.codeID}</td>
	</tr>
	<tr>
		<td>codeValue</td>
		<td>${commonCode.codeValue}</td>
	</tr>
</table>
<img alt="" src="${pageContext.request.contextPath }/resources/images/essentialspring.png">

</body>
</html>