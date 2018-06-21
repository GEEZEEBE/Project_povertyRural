<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<script type="text/javascript"
	src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>

<div class="board">
	<!-- 제목 : str -->
	<div class="subtitle">
		<hgroup>
			<h2>Receivables Management</h2>
			<h3>Manage receivables generated from the services here</h3>
		</hgroup>
	</div>
	<!-- 제목 : end -->

	<!-- 탭============================================ : str -->
	<div id="tabs">
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/adm/payment/list">Receive</a></li>
			<li><a
				href="${pageContext.request.contextPath }/adm/refund/list"
				class="hover">Return</a></li>
		</ul>
		<form name="formID" id="formID">
			<input type="hidden" id="serTrue" name="serTrue" value="0" /> <input
				type="hidden" name="del" value="0" /> <input type="hidden"
				id="currentPage" name="currentPage"
				value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
			<div id="tabs-1">
				<!-- 검색조건 : srt -->
				<table class="boardSch" summary="search">
					<colgroup>
						<col width="22%" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>Product / Item</th>
						<td>
							<p class="sch">
								<input type="hidden" id="serTxt" name="serTxt" title="검색어 입력"
									value="<c:out value="${requestMap.serTxt }" />" />
								<input type="text" id="serTxt" name="serTxt2" title="검색어 입력"
									value="<c:out value="${requestMap.serTxt }" />" />	
								<button type="button"
									onClick="fncSearchCheck(); fncSerTxt(); doSubmit('${pageContext.request.contextPath }/adm/refund/list', 'command', 'post');"></button>
							</p>
						</td>
					</tr>
				</table>
				<!-- 검색조건 : end -->
				<!-- 수납목록 : str -->
				<table class="boardList" summary="Refund">
					<colgroup>
						<col width="8%" />
						<col width="8%" />
						<col width="*" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
					</colgroup>
					<thead>
						<tr>
							<th class="one"><input type="checkbox" name="allCheck" /></th>
							<th>No.</th>
							<th>Product / Item</th>
							<th>Method</th>
							<th>price</th>
							<th>Member</th>
							<th class="end">Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list == null || fn:length(list) == 0}">
							<tr>
								<td colspan="10">No registered result obtained.</td>
							</tr>
						</c:if>
						<c:forEach var="result" items="${list}" varStatus="status"
							begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }"
							end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
							<tr>
								<td><input type="checkbox" name="del"
									value="${result.ACPT_ID}" /></td>
								<td class="tdfontColor01"><nav:listNo pageList="${list}"
										statusIndex="${status.index}" /></td>
								<td class="alignL">${result.GODS_NAME}</td>
								<td>${result.MTHD_NAME}</td>
								<td class="alignR">${result.RETURN_AMT}</td>
								<td>${result.USER_ID}</td>
								<td class="time"><fmt:formatDate
										value="${result.FRST_RGST_DT}" pattern="yyyy.MM.dd" /></td>
								<!--<td class="time">${result.RETURN_DT}</td>-->
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 수납목록 : end -->
			</div>
		</form>
	</div>
	<!-- 탭=========================================== : end -->

</div>
<!-- 버튼 : srt -->
<ul class="listpageBtn price">
	<li>
		<div class="button1">
			<a
				href="javascript:doSubmit('${pageContext.request.contextPath }/adm/refund/delete', 'command', 'post');"
				class="delPop">Delete</a>
		</div>
	</li>
	<li class="alignR">
		<div class="button1 type2 write">
			<a href="#"
				onClick="doSubmit('${pageContext.request.contextPath }/adm/refund/', 'command', 'get');"><img
				src="<c:url value='/resources/images/btn_icon_write.gif' />"
				alt="icon" /><span>Register</span></a>
		</div>
	</li>
</ul>
<!-- 버튼 : end -->

<!-- 페이지 넘버 : srt -->
<div class="pageNum">
	<nav:pageNavi
		doSubmit="doSubmit('${pageContext.request.contextPath }/adm/refund/list', 'command', 'post');"
		pageList="${list}" />
</div>
<!-- 페이지 넘버 : end -->