<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${menuList != null}">
	<dl class="linemap">
		<dt>current :</dt>
		<c:forEach var="result" items="${menuList}" varStatus="status">
			<dd>
				<c:choose>
					<%-- first uri --%>
					<c:when test="${status.index == 0}">
						<a href="/app_admin/adm">Home</a>
					 <c:if test="${controllerPath=='/operator'}">
						&gt; <a href="/app_admin/adm/user/list"> User Management </a> &gt; <a href="/app_admin/operator/list">Administrator Management</a>
					 </c:if>
					</c:when>
					<%-- second uri --%>
					<c:when test="${status.index == 1}">
					 <c:if test="${controllerPath=='/adm/user'}">
						&gt; <a href="/app_admin/adm/user/list"> User Management </a> &gt; <a href="/app_admin/adm/user/list">Member Management</a>
					 </c:if>
					 <!--
					 <c:if test="${controllerPath=='/operator'}">
						&gt; <em>List</em>
					 </c:if>
					 -->
					 <c:if test="${controllerPath=='/adm/item'}">
						&gt; <a href="/app_admin/adm/item/list"> Service Management </a> &gt; <a href="/app_admin/adm/item/list">Item Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/commerce'}">
						&gt; <a href="/app_admin/adm/item/list"> Service Management </a> &gt; <a href="/app_admin/adm/commerce/list">Commerce Service Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/guide'}">
						&gt; <a href="/app_admin/adm/item/list"> Service Management </a> &gt; <a href="/app_admin/adm/guide/list">Commerce Service Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/promote'}">
						&gt; <a href="/app_admin/adm/item/list"> Service Management </a> &gt; <a href="/app_admin/adm/promote/list">Commerce Service Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/category'}">
						&gt; <a href="/app_admin/adm/item/list"> Service Management </a> &gt; <a href="/app_admin/adm/category/categoryList">Service Category</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/gods'}">
						&gt; <a href="/app_admin/adm/gods/list"> Product Management </a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/billing'}">
						&gt; <a href="/app_admin/adm/billing/priceItemList"> Usage Management </a> &gt; <a href="/app_admin/adm/billing/priceItemList">Price Look-up</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/using'}">
						&gt; <a href="/app_admin/adm/billing/priceItemList"> Usage Management </a> &gt; <a href="/app_admin/adm/using/list">Usage Status</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/payment'}">
						&gt; <a href="/app_admin/adm/billing/priceItemList"> Usage Management </a> &gt; <a href="/app_admin/adm/payment/list">Receivables Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/refund'}">
						&gt; <a href="/app_admin/adm/billing/priceItemList"> Usage Management </a> &gt; <a href="/app_admin/adm/refund/list">Receivables Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/st'}">
					 	<c:if test="${requestMap.url=='sumComul'}" >
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=sumComul">Statistics Summary</a>
					 	</c:if>
						 <c:if test="${requestMap.url=='operatorMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=operatorMonth">Administrator Access Status</a>
						 </c:if>
						 <c:if test="${requestMap.url=='operatorDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=operatorDay">Administrator Access Status</a>
						 </c:if>
						 <c:if test="${requestMap.url=='trMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=trMonth">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='trDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=trDay">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='trTime'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=trTime">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='spMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=spMonth">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='spDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=spDay">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='spTime'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=spTime">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='acMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=acMonth">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='acDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=acDay">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='acTime'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=acTime">Network Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='basicUseMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=basicUseMonth">CBC Basic Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='basicUseDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=basicUseDay">CBC Basic Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='basicPayMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=basicPayMonth">CBC Basic Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='basicAsset'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=basicAsset">CBC Basic Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='learnMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=learnMonth">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='learnDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=learnDay">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='smartMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=smartMonth">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='smartMonth.years'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=smartDay">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='smartDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=smartDay">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='smartDay.days'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=smartDay">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='engVillageMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=engVillageMonth">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='engVillageDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=engVillageDay">Learning Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='commerceMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/coList?url=commerceMonth">Commerce Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='commerceDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/coList?url=commerceDay">Commerce Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='healthMonth'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=healthMonth">Health Statistics</a>
						 </c:if>
						 <c:if test="${requestMap.url=='healthDay'}">
							&gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=sumComul"> Statistics </a> &gt; <a href="/app_admin/adm/st/list?url=healthDay">Health Statistics</a>
						 </c:if>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/notice'}">
						&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/notice/list">Announcements Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/free'}">
						&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/free/list">Free Board Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/asset'}">
						&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/asset/list">Asset Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/cost'}">
						&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/cost/list">Asset Management</a>
					 </c:if>
					 <c:if test="${controllerPath=='/adm/pcMonitoring'}">
						&gt; <a href="/app_admin/adm/pcMonitoring/list"> System Management </a> &gt; <a href="/app_admin/adm/pcMonitoring/list">PC Monitoring</a>
					 </c:if>
					</c:when>
					<%-- third uri --%>
					<c:when test="${status.index == 2}">
						 <c:if test="${controllerPath=='/adm/assetUtil/rentList'}">					 	
							&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/assetUtil/rentList/">Asset utilization Management</a>
						 </c:if>		
						 <c:if test="${controllerPath=='/adm/assetUtil/rentInsert'}">					 	
							&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/assetUtil/rentList/">Asset utilization Management</a>
						 </c:if>						 
						 <c:if test="${controllerPath=='/adm/assetUtil/returnList'}">
							&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/assetUtil/returnList/">Asset utilization Management</a>
						 </c:if>						 
						 <c:if test="${controllerPath=='/adm/assetUtil/returnInsert'}">
							&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/assetUtil/returnList/">Asset utilization Management</a>
						 </c:if>
						 <c:if test="${controllerPath=='/adm/assetUtil/printList'}">
							&gt; <a href="/app_admin/adm/notice/list"> CBC Management </a> &gt; <a href="/app_admin/adm/assetUtil/printList/">Asset utilization Management</a>
						 </c:if>
						<!--&gt; <em>${result}</em> &gt; <em>${controllerPath}</em>-->
					</c:when>
					<%-- other uri --%>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</dd>
		</c:forEach>
	</dl>
</c:if>
