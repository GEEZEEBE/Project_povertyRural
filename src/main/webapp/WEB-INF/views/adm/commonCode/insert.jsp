<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert CommonCode Form</title>
</head>
<body>
<form:form commandName="command" >
<table>		
	<tr>
		<td><form:label path="codeID"><spring:message code="commonCode.label.codeID"/></form:label></td>
		<td><form:input path="codeID" /></td>
		<td><form:errors path="codeID" /></td>
	</tr>
	<tr>
		<td><form:label path="codeValue"><spring:message code="commonCode.label.codeValue"/></form:label></td>
		<td><form:input path="codeValue" /></td>
		<td><form:errors path="codeValue" /></td>
	</tr>
	<tr>
		<td><input type="submit" value="<spring:message code="commonCode.button.insert"/>"></td>
	</tr>
</table>
</form:form>
</body>
</html>