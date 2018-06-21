<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript"
	src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<div class="subContentsArea">
	<div class="subContentsBox">
		<div class="subTitleBox">
			<h2 class="titleCommu">
				<img src="<spring:message code="img.free_title" text=""/>" alt="community" />
			</h2>
			<p class="subTitleCommu">
				<img src="<spring:message code="img.free_title,txt1" />"
					alt="CBC members are at liberty to talk and communicate on this board." />
			</p>
			<form action="${pageContext.request.contextPath }/usrFree/list"
				method="get">
				<input type="hidden" id="currentPage" name="currentPage"
					value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
				<input type="hidden" id="searchCheck" name="searchCheck" value="${requestMap.searchCheck == null ? N : requestMap.searchCheck }" />
				<input type="hidden" id="serTrue" name="serTrue" value="0" />
				<div role="search" class="subSearchArea">
					<input type="hidden" value="<c:out value="${serTxt}" />" title="Author, title, Search" name="serTxt" class="subSearch">
					<input type="text" value="<c:out value="${serTxt}" />" title="Author, title, Search" name="serTxt2" class="subSearch">
					<input type="submit" title="search" class="subSearchBtn" onclick="fncSearchCheck(); fncSerTxt(); doSubmit('${pageContext.request.contextPath }/usrFree/list', 'command', 'get');">
				</div>
			</form>
		</div>
		<!--게시판 영역 시작-->
		<div class="subConBox">
			<table summary="community board" class="boardTable01">
				<caption>community board</caption>
				<colgroup>
					<col width="10%">
					<col width="57%">
					<col width="15%">
					<col width="10%">
					<col width="8%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><spring:message code="board.column_number" text=""/></th>
						<th scope="col"><spring:message code="board.column_title" text=""/></th>
						<th scope="col"><spring:message code="board.column_author" text=""/></th>
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
					<c:forEach var="resultObject" items="${list}" varStatus="status"
						begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }"
						end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
						<tr>
							<td><nav:listNo pageList="${list}"
									statusIndex="${status.index}" /></td>
							<td class="alignL"><a
								href="${pageContext.request.contextPath }/usrFree/read?boardID=${resultObject.boardID}&serTxt=${requestMap.serTxt}"><span
									class="textLimit"><c:out value="${resultObject.boardSubj}" /></span>
									<c:if test="${resultObject.fileCnt > 0}">
									<span class="newPost"><img src="<c:url value='/resources/usr/images/ico_img.gif' />" alt="include image"></span>	
									</c:if>
								<c:if test="${resultObject.replyCnt != 0}">
										<span class="newPost">[${resultObject.replyCnt}]</span>
									</c:if></a></td>
							<td><c:out value="${resultObject.frstRgstName}" /></td>
							<td>${resultObject.frstRgstDT}</td>
							<td>${resultObject.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="boardBtnLine">
				<a
					href="${pageContext.request.contextPath }/usrFree/?flag=w&serTxt=${requestMap.serTxt}"
					class="rightBtn"><span class="btnBase iconPen"><spring:message code="board.btn_writing" text=""/></span></a>
			</div>
			<div class="pageNum">
				<nav:pageNavi
					doSubmit="doSubmit('${pageContext.request.contextPath }/usrFree/list', 'command', 'get');"
					pageList="${list}" sortOf="usr" />
			</div>
		</div>
	</div>
</div>