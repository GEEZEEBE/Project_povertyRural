<%@ page contentType="text/html; charset=UTF-8" 
	import = "java.util.List, com.skt.mars.adm.co.Guide" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>
<%
	List<Guide> resultObject = (List<Guide>)request.getAttribute("list");
%>
<link href="<c:url value='/resources/usr/css/uzen.css' />" rel="stylesheet" type="text/css" />
<form action="${pageContext.request.contextPath }/usr/Promote/list" method="get">
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />  
 <!-- div id="container" role="main"-->
  <div class="subContentsArea">
    <div class="subContentsBox"> 
      <div class="subTitleBox typeCommerce">
        <h2 class="titleCommu"><img src="<spring:message code="img.commerce.title" text=""/>" alt="Commerce Service" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.commerce.smmr1" text=""/>" alt=" CBC members are at notice on this board." /></p>
        <!-- 언어변경 <p class="subTitleCommu"><img src="<c:url value='/resources/images/txt_commerceservice2_mal.gif' />" alt=" CBC members are at notice on this board." /></p> -->
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox">
        <nav role="navigation" class="mypageTab">
	        <ul>
	          <li><a href="${pageContext.request.contextPath }/usr/Promote/list/" ><spring:message code="promote.tap_title1" text=""/></a></li>
	          <li><a href="${pageContext.request.contextPath }/Guide/list/" class="tabOn"><spring:message code="promote.tap_title2" text=""/></a></li>
	        </ul>
        </nav>
        <!--게시판 영역 시작-->
        <div>
          <table summary="notice" class="boardTable01">
            <caption>
            notice
            </caption>
            <colgroup>
              <col width="17%" />
              <col width="*" />
              <col width="15%" />
              <col width="15%" />
              <col width="12%" />
            <col>
            </colgroup>
            <thead>
              <tr>
                <th scope="col"><spring:message code="board.column_div" text=""/></th>
                <th scope="col"><spring:message code="guide.column_subject" text=""/></th>
                <th scope="col"><spring:message code="guide.column_language" text=""/></th>
                <th scope="col"><spring:message code="guide.column_format" text=""/></th>
                <th scope="col" class="nobar"><spring:message code="board.column_replay" text=""/></th>
              </tr>
            </thead>
            <tbody>
             <c:if test="${list == null || fn:length(list) == 0}">
						<tr>
						 	<td colspan="8">Not registered value.</td>
						</tr>
				</c:if>
				<c:forEach var="resultObject" items="${list}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
              <tr>
              	<td>
              		<c:choose>
				      <c:when test='${resultObject.guidType=="E"}'>E Commerce</c:when>
				      <c:when test='${resultObject.guidType=="T"}'>Tool</c:when>
				      <c:otherwise>기타</c:otherwise>
				     </c:choose>
				</td>
              	<td class="alignL"><a href="${pageContext.request.contextPath}/Guide/read/?guidId=${resultObject.guidId}&autoPlay=off"><span class="textLimit">${resultObject.guidTitl }</a></td>
              	<td>
                 	<c:choose>
				      <c:when test='${resultObject.guidLang=="E"}'>English</c:when>
				      <c:when test='${resultObject.guidLang=="M"}'>Malaysia</c:when>
				      <c:otherwise>기타</c:otherwise>
				     </c:choose>
              		<!-- a href="${pageContext.request.contextPath}/usr/Guide/read/?guidId=${resultObject.guidId}&autoPlay=off"><span class="textLimit">${resultObject.guidLang }</a-->
              	</td>
              	<td>VOD</td>
              	<td class="play"><a href="${pageContext.request.contextPath}/Guide/read/?guidId=${resultObject.guidId}&autoPlay=play"><img src="<c:url value='/resources/images/btn_play.gif' />" alt="play" /></a></td>
              </tr>
              </c:forEach>
              
            </tbody>
          </table>
          
	        <!-- 페이지 넘버 : srt -->
		    <div class="pageNum">
				<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/Guide/list', 'command', 'get');" pageList="${list}" />
   			</div>  
		    <!-- 페이지 넘버 : end -->
          
        </div>

      </div>
      <!--mypage end--> 
    </div>
  </div>
</div>
</form>

