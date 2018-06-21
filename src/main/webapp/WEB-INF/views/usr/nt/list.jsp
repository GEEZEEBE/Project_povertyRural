<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<style type="text/css">
.ellipsis{
	white-space:nowrap;
	text-overflow:ellipsis;		/* IE, Safari */
	-o-text-overflow:ellipsis;		/* Opera under 10.7 */
	overflow:hidden;			/* "overflow" value must be different from "visible" */ 
	-moz-binding: url('ellipsis.xml#ellipsis');
}
</style>

 
<div class="subContentsArea">
    <div class="subContentsBox">
     <form id="command" method="post">
      <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
	  <input type="hidden" id="serTrue" name="serTrue" value="0" />
      <div class="subTitleBox typeNotice">
        <h2 class="titleCommu"><img src="<spring:message code="img.notice_title" text=""/>" alt="Notice" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.notice_title,txt1" text=""/>" alt="CBC members are at notice on this board." /></p>
        <div role="search" class="subSearchArea">
		  <input type="hidden" value="<c:out value="${serTxt}" />" title="title" name="serTxt" class="subSearch">
          <input type="text" value="<c:out value="${serTxt}" />" title="title" name="serTxt2" class="subSearch">
          <input type="button" class="subSearchBtn" onclick="fncSearchCheck(); fncSerTxt(); doSubmit('${pageContext.request.contextPath }/notice/list', 'command', 'get');">
        </div>
      </div>
    </form>
      <!--게시판 영역 시작-->
      <div class="subConBox">
        <table summary="notice" class="boardTable01">
          <caption>
          notice
          </caption>
          <colgroup>
          <col style="width:95px;">
          <col style="width:90px;">
          <col style="width:540px;">
          <col style="width:90px;">
          <col>
          </colgroup>
          <thead>
            <tr>
              <th scope="col"><spring:message code="board.column_number" text=""/></th>
              <th scope="col"><spring:message code="board.column_divide" text=""/></th>
              <th scope="col"><spring:message code="board.column_title" text=""/></th>
              <th scope="col"><spring:message code="board.column_date" text=""/></th>
              <th scope="col" class="nobar"><spring:message code="board.column_views" text=""/></th>
            </tr>
          </thead>
          <tbody>
           <c:if test="${list == null || fn:length(list) == 0}">
            <tr>
            	<td colspan="5">Not registered value.</td>
        	</tr>
		    </c:if>
	        <c:forEach var="resultObject" items="${list}" varStatus="status"  begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
	          <tr>
	              <td><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
	              <td>
	              	<c:choose>
					  <c:when test="${resultObject.noticeDvsn=='NOTI'}">notice</c:when>
					  <c:when test="${resultObject.noticeDvsn=='EVEN'}">event</c:when>
				  	</c:choose>
				  </td>
	              <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/read?noticeId=${resultObject.noticeId}', 'command', 'post');"><span class="textLimit ellipsis"><c:out value="${resultObject.noticeSubj}" /></span></a></td>
	              <td>${resultObject.frstRgstDT}</td>
	              <td>${resultObject.viewCount}</td>
	          </tr>
	         </c:forEach>
          </tbody>
        </table>
		
		<!-- 
        <div class="boardBtnLine">
          <a href="#" class="rightBtn"><span class="btnBase iconPen">Writing</span></a>
        </div>
        <div id="pageNum"><a href="#" class="btnImg"><img src="images/btn_pre01.gif" title="first" alt="first" /></a><a href="#" class="btnImg"><img src="images/btn_pre02.gif" title="prev" alt="prev" /></a><a href="#" class="pageNo">1</a><a href="#" class="pageNo">2</a><a href="#" class="pageOn">3</a><a href="#" class="pageNo">4</a><a href="#" class="pageNo lastNum">5</a><a href="#" class="btnImg"><img src="images/btn_nex01.gif" title="next" alt="next" /></a><a href="#" class="btnImg"><img src="images/btn_nex02.gif" title="end" alt="end" /></a></div>
         -->
		<div class="pageNum">       
			<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/notice/list', 'command', 'post');" pageList="${list}"  sortOf="usr" />
		</div>
      </div>
    </div>
    
  </div>