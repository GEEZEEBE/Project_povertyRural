<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
	
<div class="login">
	<form name='command'>
		<fieldset>
			<legend>Log-in</legend>
			<h2>
				<img src="<c:url value='/resources/images/login_logo.png' />"
					alt="Admin Login" />
			</h2>
			<dl>
				<dt>
					<img src="<c:url value='/resources/images/login_title_id.png' />"
						alt="ID" />
				</dt>
				<dd>
					<input type="text" name='j_username' class="require id" value=""
						onclick="this.value=''" onKeypress="javascript:if(event.keyCode==13) doSubmit('${pageContext.request.contextPath }/adm/j_spring_security_check', 'command', 'post');"  required />
				</dd>
				<dt>
					<img src="<c:url value='/resources/images/login_title_pw.png' />"
						alt="Password" />
				</dt>
				<dd>
					<input type="password" name='j_password' class="require pw" value=""
						onclick="this.value=''" onKeypress="javascript:if(event.keyCode==13) doSubmit('${pageContext.request.contextPath }/adm/j_spring_security_check', 'command', 'post');"  required />
				</dd>
				<dt class="findidpw">
					<a href="${pageContext.request.contextPath }/admForgatIdPw"> <img
						src="<c:url value='/resources/images/login_q1.png' />"
						alt="Find id&password" />
					</a>
				</dt>
				<dd class="btnlogin">
					<!-- input name="submit" type="submit" value="submit" / -->
					<a
						href="javascript:if(loginck()) doSubmit('${pageContext.request.contextPath }/adm/j_spring_security_check', 'command', 'post');">
						<img src="<c:url value='/resources/images/btn_login.png' />"
						alt="Log-in" />
					</a>
				</dd>
			</dl>
		</fieldset>
	</form>
</div>
<h3 class="sktelecom">
	<img src="<c:url value='/resources/images/logo_sktelecom.png' />"
		alt="SK Telecom" />
</h3>

<c:if test="${error != null && error == '301'}">
	<script type="text/javascript">
		alert('<spring:message code="login.not_idpw"/>');
	</script>
</c:if>
<c:if test="${error != null && error == '302'}">
	<script type="text/javascript">
		alert("You do not have permission to access this page!");
	</script>
</c:if>
<!-- <script type="text/javascript">
<c:if test="${error != null && error == '301'}">
		alert("Invalid ID or ID/Password is incorrect.");
</c:if>
<c:if test="${error != null && error == '302'}">
	alert("You do not have permission to access this page!");
</c:if>
</script>-->

