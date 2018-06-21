<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="logInfo">
	<c:choose>
		<c:when test="${username != null && username != 'anonymousUser'}">
			<a href="<c:url value="/adm/logout?p=adm" />"
				class="logoutBtn">Log-out</a>
		</c:when>
		<c:otherwise>
			<%-- <a href="<c:url value="/adm/login" />"
				class="logoutBtn">Log-in</a> --%>
			<a href="#"
				class="logoutBtn">Log-in</a>
		</c:otherwise>
	</c:choose>
	<p class="logDate">
		<span class="week">${serverTime }</span><span class="name">${username}</span>
	</p>
</div>
<nav>
	<h1>
		<a href="${pageContext.request.contextPath }/adm"><img
			src="<c:url value='/resources/images/logo.gif' />" alt="SK CBC Admin" /></a>
	</h1>
	<ul>
		<li><h2>
				<a href="${pageContext.request.contextPath }/adm/user/list"
					class=<c:if test="${controllerPath=='/adm/user' || controllerPath=='/operator'}" >hover</c:if>>User<br />Management
				</a>
			</h2></li>
		<li><h2>
				<a href="${pageContext.request.contextPath }/adm/item/list"
					class=<c:if test="${controllerPath=='/adm/item' || controllerPath=='/adm/category' || controllerPath=='/adm/commerce' || controllerPath=='/adm/guide' || controllerPath=='/adm/promote' }" >hover</c:if>>Service<br />Management
				</a>
			</h2></li>
		<li><h2>
				<a href="${pageContext.request.contextPath }/adm/gods/list"
					class=<c:if test="${controllerPath=='/adm/gods'}" >hover</c:if>>Product<br />Management
				</a>
			</h2></li>
		<li><h2>
				<a
					href="${pageContext.request.contextPath }/adm/billing/priceItemList"
					class=" <c:if test="${controllerPath=='/adm/using' || controllerPath=='/adm/billing' || controllerPath=='/adm/payment' || controllerPath=='/adm/refund'}" >hover</c:if>">Usage<br />Management
				</a>
			</h2></li>
		<li><h2>
				<a
					href="${pageContext.request.contextPath }/adm/st/list?url=sumComul"
					class="valign <c:if test="${controllerPath=='/adm/st'}" >hover</c:if>">Statistics</a>
			</h2></li>
		<li><h2>
				<a href="${pageContext.request.contextPath }/adm/notice/list"
					class="<c:if test="${controllerPath=='/adm/notice' || controllerPath=='/adm/free' || controllerPath=='/adm/asset' || controllerPath=='/adm/assetUtil' || controllerPath=='/adm/assetUtil/rentList' || controllerPath=='/adm/assetUtil/returnList' || controllerPath=='/adm/assetUtil/printList' || controllerPath=='/adm/assetUtil/returnInsert' || controllerPath=='/adm/assetUtil/rentInsert'|| controllerPath=='/adm/assetUtil/printDelete' || controllerPath=='/adm/assetUtil/printInsert' || controllerPath=='/adm/cost'}" >hover</c:if>">CBC<br />Management
				</a>
			</h2></li>
		<li><h2>
				<a href="${pageContext.request.contextPath }/adm/pcMonitoring/list"
					class="<c:if test="${controllerPath=='/adm/pcMonitoring'}" >hover</c:if>">System<br />Management
				</a>
			</h2></li>
	</ul>
</nav>
