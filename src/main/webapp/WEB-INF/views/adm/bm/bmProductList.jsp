<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 

	<div class="board using">
		<!-- 제목 : str -->
		<div class="subtitle">
			<hgroup>
				<h2>Price Look-up</h2>
				<h3>Look-up prices of items & products here.</h3>
			</hgroup>
		</div>
		<!-- 제목 : end -->
		
		<!-- 탭============================================ : str -->
		<div id="tabs">
			<ul>
				<li><a
					href='${pageContext.request.contextPath }/adm/billing/priceItemList'>Item</a></li>
				<li><a
					href='${pageContext.request.contextPath }/adm/billing/priceList'
					class=hover>Product</a></li>
			</ul>
			<div id="tabs-2">
				<!-- 검색조건 : srt -->
				<form name="command" id="command">
				<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
				<input type="hidden" name="categoryOne" value="${requestMap.categoryOne }" />
				<input type="hidden" name="categoryTwo" value="${requestMap.categoryTwo }" />
				<input type="hidden" name="categoryThree" value="${requestMap.categoryThree }" />
				<input type="hidden" name="searchGodsDvsn" value="${requestMap.searchGodsDvsn }" />
				<input type="hidden" name="searchGodsName" value="${requestMap.searchGodsName }" />
				</form>
				
				<form name="command2" id="command2">
				<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
				<input type="hidden" name="serTrue" value="0">
					<table class="boardSch" summary="search">
						<colgroup>
							<col width="135" />
							<col width="*" />
							<col width="100" />
							<col width="192" />
							<col width="82" />
						</colgroup>
						<tr>
							<th>Service Category</th>
							<td colspan="3" class="category"><select
								style="height: 24px;" id="categoryOne" name="categoryOne"
								onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryOne','categoryTwo','');">
									<option value="">Select</option>
									<c:forEach var="category" items="${DEPTH}">
										<option <c:set var="check" value="${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }" />
												<c:if test="${check==requestMap.categoryOne}"> selected </c:if>
											value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">
											${category.SRVC_CTGR_NM}</option>
									</c:forEach>
							</select><select style="height: 24px;" id="categoryTwo"
								name="categoryTwo"
								onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryTwo','categoryThree','');">
									<option value="">Select</option>
									<c:forEach var="category" items="${DEPTH1}">
										<option <c:set var="check" value="${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }" />
												<c:if test="${check==requestMap.categoryTwo}"> selected </c:if>
											value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
											}</option>
									</c:forEach>
							</select><select style="height: 24px;" id="categoryThree"
								name="categoryThree">
									<option value="">Select</option>
									<c:forEach var="category" items="${DEPTH2}">
										<option <c:set var="check" value="${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }" />
												<c:if test="${check==requestMap.categoryThree}"> selected </c:if>
											value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
											}</option>
									</c:forEach>
							</select></td>
							<td rowspan="2">
								<p class="btnSching">
									<button type="button"
										onClick="fncSerTxt(); doSubmit2('${pageContext.request.contextPath }/adm/billing/priceList', 'command2', 'post');">Search</button>
								</p>
							</td>
						</tr>
						<tr>
							<th>Asset Type</th>
							<td class="type">
								<select style="height: 24px;" name="searchGodsDvsn" id="searchGodsDvsn">
								<option value="">All</option>
								<c:forEach var="result" items="${godsDvsn}">
								<option value="${result.COMMON_CODE_ID }" <c:if test="${result.COMMON_CODE_ID==requestMap.searchGodsDvsn}"> selected </c:if> >${result.CODE_NAME }</option>
								</c:forEach>
								</select>
							</td>
							<th>Product</th>
							<td>
								<p class="sch">
									<input type="text" name="searchGodsName" title="Insert Search" value="${requestMap.searchGodsName }" />
								</p>
							</td>
						</tr>
					</table>
					<!-- 검색조건 : end -->
				</form>
				<!-- 상품 목록 : str -->
				<table class="boardList" summary="Product">
					<colgroup>
						<col width="8%" />
						<col width="8%" />
						<col width="12%" />
						<col width="*" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
						<col width="12%" />
					</colgroup>
					<thead>
						<tr>
							<th class="one">No.</th>
							<th>Service</th>
							<th>Product Type</th>
							<th>Product</th>
							<th>Changing</th>
							<th>Price Method</th>
							<!-- <th>Deposit</th> -->
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
								<td class="tdfontColor01"><nav:listNo pageList="${list}"
										statusIndex="${status.index}" /></td>
								<td>${result.SRVC_CTGR_NM }</td>
								<td>${result.GODS_DVSN_NM }</td>
								<td class="alignL">${result.GODS_NAME }</td>
								<td>${result.PRIC_TYPE_NM }</td>
								<td>${result.FLAT_RATE }</td>
								<!-- <td>${result.DEPOSIT_RATE }</td> -->
								<td class="time"><fmt:formatDate value="${result.FRST_RGST_DT }" type="both" pattern="yyyy.MM.dd"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 상품 목록 : end -->
			</div>
		</div>
		<!-- 탭=========================================== : end -->

	</div>

<!-- 페이지 넘버 : srt -->
<div class="pageNum">
	<nav:pageNavi
		doSubmit="doSubmit('${pageContext.request.contextPath }/adm/billing/priceList', 'command', 'post');"
		pageList="${list}" />
</div>
<!-- 페이지 넘버 : end -->

<script>
	//fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00100','searchGodsDvsn','${requestMap.searchGodsDvsn }','');
</script>
