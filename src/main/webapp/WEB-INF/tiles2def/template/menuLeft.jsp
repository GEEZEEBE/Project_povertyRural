<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- User Management -->
	<c:if test="${controllerPath=='/adm/user' || controllerPath=='/operator'}" >
	<hgroup>
      <h2>User<br /><span>Management</span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/user/list" class=<c:if test="${controllerPath=='/adm/user'}" >hover</c:if>>Member Management</a></h3>
        <h3><a href="${pageContext.request.contextPath }/operator/list" class=<c:if test="${controllerPath=='/operator'}" >hover</c:if>>Administrator Management</a></h3>
      </nav>
    </hgroup>
    </c:if>
    
	<!-- Service Management -->
	<c:if test="${controllerPath=='/adm/item' || controllerPath=='/adm/commerce'|| controllerPath=='/adm/guide' || controllerPath=='/adm/promote'|| controllerPath=='/adm/category'}" >
    <hgroup>
      <h2>Service<br /><span>Management</span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/item/list" class=<c:if test="${controllerPath=='/adm/item'}" >hover</c:if>>Item Management</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/commerce/list" class=<c:if test="${controllerPath=='/adm/commerce' || controllerPath=='/adm/guide' || controllerPath=='/adm/promote'}" >hover</c:if>>Commerce Service Management</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/category/categoryList" class=<c:if test="${controllerPath=='/adm/category'}" >hover</c:if>>Sevice Category</a></h3>
      </nav>
    </hgroup>
    </c:if>
	
	<!-- Product Management -->
	<c:if test="${controllerPath=='/adm/gods'}" >
    <hgroup>
      <h2>Product<br /><span>Management</span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/gods/list" class=<c:if test="${controllerPath=='/adm/gods'}" >hover</c:if>>Product Management</a></h3>
      </nav>
    </hgroup>
    </c:if>
    
    <!-- Billing -->
	<c:if test="${controllerPath=='/adm/billing' || controllerPath=='/adm/using' || controllerPath=='/adm/payment' || controllerPath=='/adm/refund'}" >
    <hgroup>
      <h2>Usage<br /><span>Management</span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/billing/priceItemList" class=<c:if test="${controllerPath=='/adm/billing'}" >hover</c:if>>Price Look-up</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/using/list" class=<c:if test="${controllerPath=='/adm/using'}" >hover</c:if>>Usage Status</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/payment/list" class=<c:if test="${controllerPath=='/adm/payment' || controllerPath=='/adm/refund'}" >hover</c:if>>Receivables Management</a></h3>
      </nav>
    </hgroup>
    </c:if>
    <!-- Stats -->
   	<c:if test="${controllerPath=='/adm/st'}" >
    <hgroup>
      <h2>Statistics<br /><span></span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/st/list?url=sumComul" class=<c:if test="${requestMap.url=='sumComul'}" >hover</c:if>>Statistics Summary</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/st/list?url=operatorMonth" class=<c:if test="${requestMap.url=='operatorMonth' || requestMap.url=='operatorDay'}" >hover</c:if>>Administrator Access Status</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/st/list?url=trMonth" class=<c:if test="${requestMap.url=='trMonth' || requestMap.url=='trDay' || requestMap.url=='trTime' || requestMap.url=='spMonth' || requestMap.url=='spDay' || requestMap.url=='spTime' || requestMap.url=='acMonth' || requestMap.url=='acDay' || requestMap.url=='acTime'}" >hover</c:if> >Network Statistics</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth" class=<c:if test="${requestMap.url=='basicUseMonth' || requestMap.url=='basicUseDay' || requestMap.url=='basicPayMonth' || requestMap.url=='basicAsset'}" >hover</c:if>>CBC Basic Statistics</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/st/list?url=learnMonth" class=<c:if test="${requestMap.url=='learnMonth' || requestMap.url=='learnDay' || requestMap.url=='smartMonth' || requestMap.url=='smartDay' || requestMap.url=='engVillageMonth' || requestMap.url=='engVillageDay' || requestMap.url=='smartMonth.years' || requestMap.url=='smartDay.days'}" >hover</c:if>>Learning Statistics</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/st/coList?url=commerceMonth" class=<c:if test="${requestMap.url=='commerceMonth' || requestMap.url=='commerceDay'}" >hover</c:if>>Commerce Statistics</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/st/list?url=healthMonth" class=<c:if test="${requestMap.url=='healthMonth' || requestMap.url=='healthDay'}" >hover</c:if>>Health Statistics</a></h3>
      </nav>
    </hgroup>
 	</c:if>
    <!-- CBC Management -->
	<c:if test="${controllerPath=='/gods'  || controllerPath=='/adm/assetUtil/printDelete' || controllerPath=='/adm/assetUtil/printInsert' || controllerPath=='/adm/assetUtil/delete' || controllerPath=='/adm/assetUtil/returnInsert' || controllerPath=='/adm/assetUtil/rentInsert' || controllerPath=='/adm/assetUtil/rentList' || controllerPath=='/adm/assetUtil/returnList' || controllerPath=='/adm/assetUtil/printList' || controllerPath=='/adm/asset'|| controllerPath=='/adm/cost' || controllerPath=='/adm/notice' || controllerPath=='/adm/free'}" >
    <hgroup>
      <h2>CBC<br /><span>Management</span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/notice/list" class=<c:if test="${controllerPath=='/adm/notice'}" >hover</c:if>>Announcements Management</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/free/list" class=<c:if test="${controllerPath=='/adm/free'}" >hover</c:if>>Free Board Management</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/asset/list" class=<c:if test="${controllerPath=='/adm/asset' || controllerPath=='/adm/cost'}" >hover</c:if>>Asset Management</a></h3>
        <h3><a href="${pageContext.request.contextPath }/adm/assetUtil/rentList/" class=<c:if test="${controllerPath=='/adm/assetUtil/rentList' || controllerPath=='/adm/assetUtil/returnList' || controllerPath=='/adm/assetUtil/printList' || controllerPath=='/adm/assetUtil/delete' || controllerPath=='/adm/assetUtil/returnInsert' || controllerPath=='/adm/assetUtil/rentInsert'  || controllerPath=='/adm/assetUtil/printInsert' || controllerPath=='/adm/assetUtil/printDelete'}" >hover</c:if>>Asset Utilization Management</a></h3>
      </nav>
    </hgroup>
    </c:if>

    <!-- System Management -->
    <c:if test="${controllerPath=='/adm/pcMonitoring'}" >
	<hgroup>
      <h2>System<br /><span>Management</span></h2>
      <nav>
        <h3><a href="${pageContext.request.contextPath }/adm/pcMonitoring/list" class="hover"> PC Monitoring</a></h3>
      </nav>
    </hgroup>
    </c:if>
   