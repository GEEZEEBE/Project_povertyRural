<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>

<%--
  - PROGRAM ID  : list.jsp
  - AUTHOR      : jsjeon
  - CREATED     : 2013.01.29
  - DESCRIPTION : 상품관리 - 상품목록 페이지
--%>

<script type="text/javascript">
	$(function() {

		$('input[name="allCheck"]').click(function() {
			if ($(this).is(":checked")) {
				$('input[type="checkbox"]:enabled').attr("checked", true);
			} else {
				$('input[type="checkbox"]:enabled').attr("checked", false);
			}
		});

	});

	function doSubmit(url, actionName, value) {
		f = document.forms[0];

		if ("gods/read" == actionName) {
			f.method = "post";
			var arrStr = value.split(':');
			var godsId = arrStr[0];
			var srvcId = arrStr[1];

			f.godsID.value = godsId;
			f.srvcID.value = srvcId;
			
			$('#categoryOne').val($('input[name=pageSrvcID]').val());
            $('#categoryTwo').val($('input[name=pageSrvcID2]').val());
            $('#categoryThree').val($('input[name=pageSrvcID3]').val());

		} else if ("gods/insert" == actionName) {
			f.method = "post";
		 } else if("gods/list" == actionName) {
			   $('input[name=searchGodsName]').val($('input[name=pageProductName]').val());
			   $('select[name=searchGodsDvsn]').val($('input[name=pageProductType]').val());
	
			   $('#categoryOne').val($('input[name=pageSrvcID]').val());
			   $('#categoryTwo').val($('input[name=pageSrvcID2]').val());
			   $('#categoryThree').val($('input[name=pageSrvcID3]').val());
			   
	            f.method="post";
	            
	     } else if("gods/search" == actionName) {
	    	 $('#currentPage').val("1");
	    	 f.method = "post";    

			var one = $('#categoryOne').val();
			var two = $('#categoryTwo').val();
			var three = $('#categoryThree').val();
			var node;
			
			if (one != "Select" || two != "Select" || three != "Select") {
				if ("Select" != three) {
					node = three;
				} else if ("Select" != two) {
					node = two;
				} else if ("Select" != one) {
					node = one;
				} else {
					return false;
				}
				var arrStr = node.split(':');
				var depth = arrStr[0];
				depth = Number(depth) + 1;
				var lft = arrStr[1];
				var rgt = arrStr[2];
				var srvcId = arrStr[3];

				f.searchSrvcID.value = srvcId;
			}

			f.method = "post";

		} else if ("gods/delete" == actionName) {
			if ($('input:checkbox[name=selectCheck]:checked').length < 1) {

				return;
			} else {
				var check = confirm("Are you sure you want to delete?");
				if (check) {
					f.method = "post";
				} else {
					return;
				}
			}
		}

		f.action = url;
		f.submit();
	}
</script>

<form name="godsList" id="godsList">
	<div class="gods">

		<!-- hidden -->
		<input type="hidden" id="currentPage" name="currentPage"
			value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
		<input type="hidden" name="selectCheck" value=""> 
		<input type="hidden" name="godsID" value=""> 
		<input type="hidden" name="srvcID" value=""> 
		<input type="hidden" name="searchSrvcID" value="">
		
		<input type="hidden" name="pageProductName" value="${param.searchGodsName}"> 
        <input type="hidden" name="pageProductType" value="${param.searchGodsDvsn}"> 
        <input type="hidden" name="pageSrvcID" value="${pageSrvcID }">
        <input type="hidden" name="pageSrvcID2" value="${pageSrvcID2 }">
        <input type="hidden" name="pageSrvcID3" value="${pageSrvcID3 }">

		<!-- 제목 : str -->
		<div class="subtitle">
			<hgroup>
	          <h2>Product Management</h2>
          <h3>Register and manage product here.</h3>
			</hgroup>
		</div>
		<!-- 제목 : end -->

		<!-- 검색조건 : srt -->
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
				<td colspan="3" class="category"><select style="height: 24px;"
					id="categoryOne" name="categoryOne"
					onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryOne','categoryTwo','');">
						<option value="Select">Select</option>
						<c:forEach var="category" items="${DEPTH}">
							<option
								<c:set var="check" value="${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }" />
								<c:if test="${check==requestMap.categoryOne}"> selected </c:if>
								value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">
								${category.SRVC_CTGR_NM}</option>
						</c:forEach>
				</select> <select style="height: 24px;" id="categoryTwo" name="categoryTwo"
					onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryTwo','categoryThree','');">
						<option value="Select">Select</option>
						<c:forEach var="category" items="${DEPTH1}">
							<option
								<c:set var="check" value="${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }" />
								<c:if test="${check==requestMap.categoryTwo}"> selected </c:if>
								value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
								}</option>
						</c:forEach>
				</select> <select style="height: 24px;" id="categoryThree"
					name="categoryThree">
						<option value="Select">Select</option>
						<c:forEach var="category" items="${DEPTH2}">
							<option
								<c:set var="check" value="${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }" />
								<c:if test="${check==requestMap.categoryThree}"> selected </c:if>
								value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
								}</option>
						</c:forEach>
				</select></td>
				<td rowspan="2">
					<p class="btnSching">
						<button type="button"
							onclick="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/list','gods/search');">Search</button>
					</p>
				</td>
			</tr>
			<tr>
				<th>Product Type</th>
				<td class="type"><select style="height: 24px;"
					name="searchGodsDvsn">
						<option value="">All</option>
						<c:forEach var="godsDvsn" items="${godsDvsn}">
							<option value="<c:out value ='${godsDvsn.commonCodeID}'/>"
								<c:if test="${param.searchGodsDvsn eq godsDvsn.commonCodeID}"> <c:out value="selected" /></c:if>>${godsDvsn.codeName
								}</option>
						</c:forEach>
				</select></td>
				<th>Product</th>
				<td>
					<p class="sch">
						<input type="text" name="searchGodsName" style="ime-mode:Disabled"
							value="${param.searchGodsName}" title="" />
					</p>
				</td>
			</tr>
		</table>
		<!-- 검색조건 : end -->

		<!-- 게시판 목록 : str -->
		<table class="boardList" summary="CBC members">
			<colgroup>
				<col width="60" />
				<col width="80" />
				<col width="130" />
				<col width="130" />
				<col width="*" />
				<col width="100" />
				<col width="100" />
			</colgroup>
			<thead>
				<tr>
					<th class="one"><input type="checkbox" name="allCheck" /></th>
					<th>No.</th>
					<th>Service</th>
					<th>Product Type</th>
					<th>Product</th>
					<th>Registered by</th>
					<th class="end">Date</th>
				</tr>
			</thead>
			<tbody>
				<!--           <tr>
            <td><input type="checkbox" /></td>
            <td class="tdfontColor01">1</td>
            <td class="alignL">Learning</td>
            <td>Syahmi</td>
            <td class="alignL"><a href="javascript:doSubmit('gods/read','1');">UPSR 수학 VOD 재생</a></td>
            <td>Syahmi</td>
            <td class="time">2013.01.15</td>
          </tr> -->
				<c:if test="${godsList == null || fn:length(godsList) == 0}">
					<tr>
						<td colspan="7">No search result obtained.</td>
					</tr>
				</c:if>
				<c:forEach var="list" items="${godsList}" varStatus="status"
					begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }"
					end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
					<tr>
						<td><input type="checkbox" name="selectCheck"
							value="${list.GODS_ID }"
							<c:if test="${list.DEL_YN eq 'D'}"> disabled</c:if> /></td>
						<td class="tdfontColor01"><nav:listNo pageList="${godsList}"
								statusIndex="${status.index}" /></td>
						<td><c:out value="${list.SRVC_CTGR_NM }" /></td>
						<td><c:out value="${list.CODE_NAME }" /></td>
						<td class="alignL">
						<a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/read','gods/read','${list.GODS_ID }:${list.SRVC_ID }');"><c:out value="${list.GODS_NAME}" /></a></td>
						<td><c:out value="${list.FRST_RGST_USER_ID }" /></td>
						<td class="time"><c:out value="${list.LAST_CRCT_DT }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 게시판 목록 : end -->
	</div>

	<!-- 버튼 : srt -->
	<ul class="listpageBtn">
		<li>
			<div class="button1">
				<a
					href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/delete','gods/delete');">Delete</a>
			</div>
		</li>
		<li class="alignR">
			<div class="button1 type2 write">
				<a
					href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/insert','gods/insert');"><img
					src="<c:url value='/resources/images/btn_icon_write.gif' />"
					alt="icon" /><span>Register</span></a>
			</div>
		</li>
	</ul>
	<!-- 버튼 : end -->

	<!-- 페이지 넘버 : srt -->
	<div class="pageNum">
		<nav:pageNavi
			doSubmit="doSubmit('${pageContext.request.contextPath }/adm/gods/list','gods/list');"
			pageList="${godsList}" />
	</div>
	<!-- 페이지 넘버 : end -->
</form>