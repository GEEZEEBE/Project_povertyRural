<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SK CBC</title>
<link href="<c:url value='/resources/usr/css/basc.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/usr/css/global.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/usr/css/layout.css' />" rel="stylesheet" type="text/css" />
</head>

<script type="text/javascript">
function backspace()
  {
	history.back();
  }
</script>


<body>
<section class="error">
  <img class="imgiconError" src="<c:url value='/resources/usr/images/img_404error.jpg' />" alt="Image icon : error" />
  <p>
    <img src="<c:url value='/resources/usr/images/txt_404error1.gif' />" alt="404 Error page not found." />
<!-- 403 / 402 / 401 / 400 error image
    <img src="images/txt_403error1.gif" alt="403 Error page not found." />
    <img src="images/txt_402error1.gif" alt="402 Error page not found." />
    <img src="images/txt_401error1.gif" alt="401 Error page not found." />
    <img src="images/txt_400error1.gif" alt="400 Error page not found." />
 -->
    <img src="<c:url value='/resources/usr/images/txt_error.gif' />" alt="please try this page." />
  </p>
  <a href="<c:url value='javascript:backspace();' />"><img src="<c:url value='/resources/usr/images/btn_home.png' />" alt="Button go home" /></a>
</section>
</body>
</html>
