<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>

<c:choose>
	<c:when test="${requestMap.successYN == 'N'}">

		<div class="login idpwfind">
			<form>
				<fieldset>
					<legend>Log-in</legend>
					<h2>
						<img src="<c:url value='/resources/images/login_title_b.gif' />"
							alt="ID Password" />
					</h2>
					<p>
						<span class="forget">Did you forget your SKT CBC
							administrator<br />ID or Password?</span> <span>- Please enter e-mail
							address that you used to register as an administrator.</span> <span>-
							Your ID and Password will be sent to your e-mail address.</span>
					</p>
					<dl>
						<dt>
							<img
								src="<c:url value='/resources/images/login_title_email.png' />"
								alt="E-mail" />
						</dt>
						<dd>
							<input type="text" name="emailAddress"
								placeholder="kkk@hanmail.net" class="require" value="${requestMap.emailAddress}" /><a href="javascript:if(submitCheck()) doSubmit('${pageContext.request.contextPath }/admForgatIdPw', 'command', 'get');;"><img
								src="<c:url value='/resources/images/btn_send.png' />"
								alt="Send" /></a>
						</dd>
					</dl>
					<p class="goLogin"><span>Return to Login page</span><a href="<c:url value='/adm/login' />"><img src="<c:url value='/resources/images/btn_goLogin.png' />" alt="Login" /></a></p>
				</fieldset>
			</form>
		</div>
		
		<c:if test="${requestMap.error != null && requestMap.error == '201'}">
            <script>alert('It is an error that send email.');</script>
	    </c:if>
		<c:if test="${requestMap.error != null && requestMap.error == '202'}">
            <script>alert('It is an email that has not been registered');</script>
	    </c:if>
	</c:when>

	<c:when test="${requestMap.successYN != null && requestMap.successYN == 'Y'}">
		<div class="login success">
			<form>
				<input type="hidden" name="emailAddress" value="${requestMap.eMail }" />
				<input type="hidden" name="resendYN" value="Y" />
				<fieldset>
					<legend>Log-in</legend>
					<h2>
						<img src="<c:url value='/resources/images/login_title_b.gif' />"
							alt="ID Password" />
					</h2>
					<p>
						<span class="sendmail">Your ID and password were sent
							successfully.</span> <span class="email">${requestMap.eMail }</span> <span>-
							It may take up to five minutes to send an e-mail.</span> <span>-
							If you didn’t receive the e-mail, please check whether the mail
							was classified as spam or junk mail.</span>
					</p>
					<a href="#"
						onClick="doSubmit('${pageContext.request.contextPath }/admForgatIdPw', 'command', 'get');"><img
						src="<c:url value='/resources/images/btn_resend.png' />"
						alt="Resend" /></a>
					<p class="goLogin"><span>Return to Login page</span><a href="<c:url value='/adm/login' />"><img src="<c:url value='/resources/images/btn_goLogin.png' />" alt="Login" /></a></p>
				</fieldset>
			</form>
		</div>
		
		<c:if test="${requestMap.resendYN != null && requestMap.resendYN == 'Y'}">
            <script>alert('We sent you an email. Please check your inbox for a message.');</script>
	    </c:if>
	</c:when>
</c:choose>

<h3 class="sktelecom">
	<img src="<c:url value='/resources/images/logo_sktelecom.png' />"
		alt="SK Telecom" />
</h3>

