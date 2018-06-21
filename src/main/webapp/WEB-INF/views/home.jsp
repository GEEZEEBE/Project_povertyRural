<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
	<title>Home</title>
</head>

<script type="text/javascript">
</script>		
<body>
	<h1>
		Hello world!  
	</h1>
	
	<h1>
		Fifth
	</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath}/ajax"> ajax with jquery using cfx </a></li>
	</ul>

	<h1>
		Fourth
	</h1>
	<ul>
		<li><a href="<c:url value='/board/' />">/board/form</a>
		 (BoardController)</li>
	</ul>
	<ul>
		<li><a href="<c:url value='/board/list' />">/board/list</a>
		 (BoardController)</li>
	</ul>
	<h1>
		<spring:message code="label.title"/> 
	</h1>
	 
	<p>
	   <spring:message code="label.lang"/> : <a href="?lang=en">english</a> | <a href="?lang=kr">kr</a>
	   <spring:message code="gboard.currentTime"/> <spring:message code="required.title"/> 
	</p>
	http://mvnrepository.com/artifact/org.codehaus.mojo/native2ascii-maven-plugin/1.0-beta-1
	<h1>
		First
	</h1>
	<P>  The time on the server is ${serverTime}. </P>
	<P><a href="${pageContext.request.contextPath}/commonCode"> insert CommonCode </a></P>
	<img alt="" src="${pageContext.request.contextPath }/resources/images/essentialspring.png">
	<img alt="" src="<c:url value='/resources/images/essentialspring.png' />">
</body>
</html>
