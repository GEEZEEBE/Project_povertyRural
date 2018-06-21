<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>

<%--
  - PROGRAM ID  : list.jsp
  - AUTHOR      : jsjeon
  - CREATED     : 2013.01.22
  - DESCRIPTION : 아이템관리>아이템 목록페이지
--%>
<script type="text/javascript">
	$(function() {

		$('input[name="allCheck"]').click(function() {
			if ($(this).is(":checked")) {
				$('input[type="checkbox"]').attr("checked", true);
			} else {
				$('input[type="checkbox"]').attr("checked", false);
			}
		});

	});
	
	function doSubmit(url,actionName,value) {
	    f = document.forms[0];
	    if ("item/read" == actionName) {
	        f.method="post";
	        var arrStr = value.split(':');
	        var itemId = arrStr[0];
	        var srvcId = arrStr[1];
	        
	        f.itemID.value = itemId;
	        f.srvcID.value = srvcId;
	        $('#categoryOne').val($('input[name=pageSrvcID]').val());
            $('#categoryTwo').val($('input[name=pageSrvcID2]').val());
            $('#categoryThree').val($('input[name=pageSrvcID3]').val());
	        
	    } else if("item/delete" == actionName) {
	        if ($('input:checkbox[name=selectCheck]:checked').length < 1){
	            
	            return;
	        } else{
	            var check = confirm("Are you sure you want to delete?");
	            if(check){
	                f.method="post";
	            }else{
	                return;
	            }
	        }
	    } else if("item/list" == actionName) {
	    	$('input[name=searchGodsName]').val($('input[name=pageProductName]').val());
            $('select[name=searchGodsDvsn]').val($('input[name=pageProductType]').val());
            $('input[name=searchAssetName]').val($('input[name=pageAssetName]').val());
            $('select[name=searchAssetType]').val($('input[name=pageAssetType]').val());
 
            $('#categoryOne').val($('input[name=pageSrvcID]').val());
            $('#categoryTwo').val($('input[name=pageSrvcID2]').val());
            $('#categoryThree').val($('input[name=pageSrvcID3]').val());
	    	
	    	f.method="post";
	    } else if("item/search" == actionName) {
	    	$('#currentPage').val("1");
	    	
	    	var one = $('#categoryOne').val();
	        var two = $('#categoryTwo').val();
	        var three = $('#categoryThree').val();
	        var node;
	        
	        if(one != "Select" || two !="Select" || three !="Select"){
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
	            depth = Number(depth)+1;
	            var lft = arrStr[1];     
	            var rgt = arrStr[2];    
	            var srvcId = arrStr[3];
	            
	            f.searchSrvcID.value = srvcId;
	        }
	        f.method="post";
        }  else if("item" == actionName) {
	    	f.method="post";
	    }
	    
	    f.action = url;
	    f.submit();
	}
	
	
</script>

<form>
	<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
    <input type="hidden" name="itemID" value="">
    <input type="hidden" name="srvcID" value="">
    <input type="hidden" name="selectCheck" value="">
    <input type="hidden" name="searchSrvcID" value="">
    
    <%-- <input type="hidden" name="requestMap" value="${requestMap}"> --%>
    
    <input type="hidden" name="pageProductName" value="${param.searchGodsName}"> 
    <input type="hidden" name="pageProductType" value="${param.searchGodsDvsn}">
    <input type="hidden" name="pageAssetName" value="${param.searchAssetName}"> 
    <input type="hidden" name="pageAssetType" value="${param.searchAssetType}">  
    
    <input type="hidden" name="pageSrvcID" value="${pageSrvcID }">
    <input type="hidden" name="pageSrvcID2" value="${pageSrvcID2 }">
    <input type="hidden" name="pageSrvcID3" value="${pageSrvcID3 }">
    
	<div class="board">
		<!-- 제목 : str -->
		<div class="subtitle">
			<hgroup>
				<h2>Item Management</h2>
				<h3>Map data registered as assets with products and services.</h3>
			</hgroup>
		</div>
		<!-- 제목 : end -->
		<!-- 검색조건 : srt -->
		<div class="searching">
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
				<td rowspan="3">
					<p class="btnSching2">
						<button type="button" onclick="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/list','item/search');">Search</button>
					</p>
				</td>
	        </tr>
			<tr>
				<th>Product Type</th>
				<td colspan="3" class="item"><select class="seltWeith1" style="height: 24px;"
					name="searchGodsDvsn">
						<option value="">All</option>
						<c:forEach var="godsDvsn" items="${godsDvsn}">
							<option value="<c:out value ='${godsDvsn.commonCodeID}'/>"
								<c:if test="${param.searchGodsDvsn eq godsDvsn.commonCodeID}"> <c:out value="selected" /></c:if>>${godsDvsn.codeName }</option>
						</c:forEach>
				</select> <input class="item" name="searchGodsName" type="text" title="Item" value="${param.searchGodsName}" /></td>
			</tr>
			<tr>
				<th>Asset Type</th>
				<td class="type">
				<select class="seltWeith1" style="height: 24px;" name="searchAssetType">
					<option value="">All</option>
					<c:forEach var="assetType" items="${assetType}">
						<option value="<c:out value ='${assetType.commonCodeID}'/>" <c:if test="${param.searchAssetType eq assetType.commonCodeID}"> <c:out value="selected" /></c:if>>${assetType.codeName }	</option>
					</c:forEach>
				</select>
				</td>
				<th>Item</th>
				<td>
					<p class="sch">
						<input type="text" name="searchAssetName" title="" value="${param.searchAssetName}" />
					</p>
				</td>
			</tr>
		</table>
		</div>
		<!-- 검색조건 : end -->
		<!-- 게시판 목록 : str -->
		<table class="boardList" summary="CBC members">
			<colgroup>
				<col width="8%" />
				<col width="8%" />
				<col width="18%" />
				<col width="13%" />
				<col width="*" />
				<col width="10%" />
				<col width="18%" />
			</colgroup>
			<thead>
				<tr>
					<th class="one"><input type="checkbox" name="allCheck" /></th>
					<th>No.</th>
					<th>Product</th>
					<th>Asset Type</th>
					<th>Item</th>
					<th>Price</th>
					<th class="end">Date</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${list == null || fn:length(list) == 0}">
					<tr>
						<td colspan="7">No search result obtained.</td>
					</tr>
				</c:if>
				<c:forEach var="item" items="${list}" varStatus="status"
					begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }"
					end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
					<tr>
						<td><input type="checkbox" name="selectCheck" value="${item.ITEM_ID }" /></td>
						<td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
						<td><c:out value="${item.GODS_NAME }" /></td>
						<td><c:out value="${item.CODE_NAME }" /></td>
						<td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/read','item/read','${item.ITEM_ID }:${item.SRVC_ID }');"><c:out value="${item.CNTS_NAME }" /></a></td>
						<td>${item.FLAT_RATE }</td>
						<td class="time"><c:out value="${item.FRST_RGST_DT }" /></td>
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
				<a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/delete','item/delete');">Delete</a>
			</div>
		</li>
		<li>
			<div class="button1 type2 write">
				<a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/','item');"><img
					src="<c:url value='/resources/images/btn_icon_write.gif' />"
					alt="icon" /><span>Register</span></a>
			</div>
		</li>
	</ul>
	<!-- 버튼 : end -->

	<!-- 페이지 넘버 : srt -->
	<div class="pageNum">
		<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/adm/item/list','item/list');" pageList="${list}" />
	</div>
	<!-- 페이지 넘버 : end -->
</form>