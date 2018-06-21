<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<script src="<c:url value="/resources/usr/js/jquery-1.6.1.min.js" />"
	type="text/javascript"></script>
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


<c:if test="${error != null}">
	<script type="text/javascript">
		alert('<spring:message code="login.not_idpw"/>');
	</script>
</c:if>

<div class="loginSec">
	<h1>
		<img src="<spring:message code="img.login_title"/>"
			alt="SK CBC Log-in" />
	</h1>
	<p>
		<img src="<spring:message code="img.login_text,1"/>"
			alt="Welcome to the CBC world" /><img
			src="<spring:message code="img.login_text,2" text=""/>"
			class="tit" alt="Log-in for the service" />
	</p>
	<p class="line01">
		<spring:message code="login.text_p1" text="" />
	</p>
	<form name='f' action="<c:url value='/usr/j_spring_security_check' />"
		method='POST' onsubmit="return loginck();">
		<fieldset>
			<legend>log-in</legend>
			<dl>
				<dt><img src="<c:url value='/resources/usr/images/txt_loginid.gif'  />" alt="ID" /></dt>
				<dd><input type="text" value="" class="textBox1 require id" maxlength="" name='j_username'></dd>
				<dt><img src="<c:url value='/resources/usr/images/txt_loginpw.gif'  />" alt="Password" /></dt>
				<dd><input type="password" value="" onclick="this.value=''" class="textBox1 require pw" maxlength="" name='j_password'></dd>
			</dl>
			<span><input name="submit" type="submit" value="" /></span>
		</fieldset>
	</form>
	<p class="infoTxt">
		<spring:message code="login.text_p2" text="" />
	</p>
</div>
</html>