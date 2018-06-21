<%@ page contentType="text/html; charset=UTF-8" 
	import="com.skt.mars.adm.co.*"
%>
<%
	Promote pro = (Promote)request.getAttribute("command");	 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>
<link href="<c:url value='/resources/usr/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	
	$("#submiteBtn").click(function(){
		$("#searchFrm").submit();
		
	});
	
}); 
var snsPopClick = function(id, popId){
	//showLayer(id, popId);
	//alert("substring : " + popId.substring(6,8));
	$('#'+popId).show();	
};

var showHideLayers = function(popId, ord){
	$('#'+popId).hide();	
};
</script>
 <!-- div id="container" role="main"-->
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeCommerce">
        <h2 class="titleCommu"><img src="<spring:message code="img.commerce.title" text=""/>" alt="Commerce Service" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.commerce.smmr" text=""/>" alt=" CBC members are at notice on this board." /></p>
        <!-- 언어변경 <p class="subTitleCommu"><img src="<c:url value='/resources/images/txt_commerceservice_mal.gif' />" alt=" CBC members are at notice on this board." /></p> -->
        <div role="search" class="subSearchArea">
        	<form name="searchFrm" id="searchFrm" action="${pageContext.request.contextPath }/usr/Promote/list/" method="get">
        	<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
        	
	      <input type="text" name="searchTxtUser" id="searchTxtUser" value="${param.serTxt}" title="Title, Product, Name"  class="subSearch">	      
          <input type="button" value="search" title="search" name="submiteBtn" id="submiteBtn" class="subSearchBtn">
          </form>
        </div>
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox">
        <nav role="navigation" class="mypageTab">
          <ul>
            <li><a href="${pageContext.request.contextPath }/usr/Promote/list/" class="tabOn"><spring:message code="promote.tap_title1" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/Guide/list/"><spring:message code="promote.tap_title2" text=""/></a></li>
          </ul>
        </nav>
        <!--게시판 영역 시작-->
       
        <div>
          <table summary="notice" class="boardTable01">
            <caption>
            notice
            </caption>
            <colgroup>
              <col width="8%" />
              <col width="*" />
              <col width="11%" />
              <col width="11%" />
              <col width="11%" />
              <col width="11%" />
            <col>
            </colgroup>
           <thead>
              <tr>
                <th scope="col"><spring:message code="board.column_number" text=""/></th>
                <th scope="col"><spring:message code="promote.column_title" text=""/></th>
                <th scope="col"><spring:message code="promote.column_product" text=""/></th>
                <th scope="col"><spring:message code="promote.column_seller" text=""/></th>
                <th scope="col"><spring:message code="board.column_date" text=""/></th>
                <th scope="col" class="nobar"><spring:message code="board.column_sns" text=""/></th>
              </tr>
            </thead>
            <tbody>
	          <c:if test="${list == null || fn:length(list) == 0}">
				<tr>
					<td colspan="6">Not registered value.</td>
				</tr>
			  </c:if>
			  <c:forEach var="resultObject" items="${list}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
              <tr>
                <td><nav:listNo pageList="${list}"
									statusIndex="${status.index}" /></td>
                <td class="alignL"><a href="${pageContext.request.contextPath}/usr/Promote/read/?prmtId=${resultObject.prmtId}&searchTxtUser=${param.searchTxtUser}">${resultObject.prodTitl}</a></td>
                <td>${resultObject.prodNm}</td>
                <td>${resultObject.prodSllr}</td>
                <td>${resultObject.frstRgstDt}</td>
                <td class="sns" id="snsPop_${status.index}" onclick="javascript:snsPopClick(this.id, 'popupD_${status.index}')">
                  	<c:if test="${resultObject.fbSnsType == 1}" >
                  		<img src="<c:url value='/resources/images/ico_fb.gif' />" alt="fb type 1" />
                  	</c:if>
                  	<c:if test="${resultObject.bsSnsType == 1}" >
                  		<img src="<c:url value='/resources/images/ico_blg.gif' />" alt="blg type 1" />
                  	</c:if>
                  	<c:if test="${resultObject.twSnsType == 1}" >
                  		<img src="<c:url value='/resources/images/ico_tw.gif' />" alt="tw type 1" />
                  	</c:if>
                  </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
            
		<!-- 페이지 넘버 : srt -->		
		<div class="pageNum">
			<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/usr/Promote/list', 'command', 'get');" pageList="${list}" />
   	   </div>  
		<!-- 페이지 넘버 : end -->
              
        </div>

      </div>
      <!--mypage end--> 
  
      
    </div>
  </div>
<!-- /div-->


<c:forEach var="resultObject2" items="${list}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
	
<!-- popup start -->	
<div style="display:none">		<nav:listNo pageList="${list}" statusIndex="${status.index}" /></div>
	
	
 <div id="popupD_${status.index}" class="detailPopup type2" style="display:none;">
	  <h1><img src="<spring:message code="img.commerce.snsaddress" text=""/>" alt="SNS Promotion Registration Address" /></h1>
	  <div class="innerBox">
	    <ul class="box-type">
	      <c:if test="${resultObject2.fbSnsType == 1}" >
	      <li>
	        <dl class="fb">
	          <input type="hidden" name="snsHsId" id="snsHsId" value="${fn:split(resultObject2.fbSnsInfo,',')[2]}" />
	          <dt><a href="${fn:split(resultObject2.fbSnsInfo,',')[0]}" target="_blank">${fn:split(resultObject2.fbSnsInfo,',')[3]}</a></dt>
	          <dd>Registered at : ${fn:split(resultObject2.fbSnsInfo,',')[1]}</dd>
	        </dl>
	      </li>
	     </c:if>
	     <c:if test="${resultObject2.bsSnsType == 1}" >
	      <li>
	        <dl class="blg">
	          <dt><a href="${fn:split(resultObject2.bsSnsInfo,',')[0]}" target="_blank">${fn:split(resultObject2.bsSnsInfo,',')[3]}</a></dt>
	          <dd>Registered at : ${fn:split(resultObject2.bsSnsInfo,',')[1]}</dd>
	        </dl>
	      </li>
	      </c:if>
	      <c:if test="${resultObject2.twSnsType == 1}" >
	      <li>
	        <dl class="tw">
	          <dt><a href="${fn:split(resultObject2.twSnsInfo,',')[0]}" target="_blank">${fn:split(resultObject2.twSnsInfo,',')[3]}</a></dt>
	          <dd>Registered at : ${fn:split(resultObject2.twSnsInfo,',')[1]}</dd>
	        </dl>
	      </li>
	      </c:if>
	    </ul>
	    <div class="btnCloseTop"><a  onClick="showHideLayers('popupD_${status.index}','','hide')" style="cursor:hand;"><img src="<c:url value='/resources/images/btn_close.gif' />" alt="close"></a></div>
	  </div>
	  <div class="btnClose"><a class="rightBtn" style="cursor:hand;" onClick="showHideLayers('popupD_${status.index}','','hide')"><span class="btnBase iconX">Close</span></a></div>
	</div>
</c:forEach>	




