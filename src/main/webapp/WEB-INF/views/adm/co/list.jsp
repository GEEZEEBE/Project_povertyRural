<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	//multiple delete
	function del_check(url){
		var form = document.forms[0];
		var selOk = "N";
		if(form.delChk != null){
			for(var i=0; i < form.delChk.length; i++){
				if(form.delChk[i].checked == true){
					selOk = "Y";
				}
			}
			if(selOk == "N"){
				alert("Select an Template!");
				return;
			}
			var con=confirm("Are you sure you want to delete the Template chosen?");
			if(con == true){
				form.method="post";
				form.action=url;
				form.submit();
			}
		}else{
			alert("Do not have the Template you want to delete.");
			return;
		}
	}
	
	//checkBox all checked/unchecked
	$(document).ready(function() {
		 $("#checkAll").click(function(){
			 if($.trim($('input[name=checkAll]:checked').val()) == "Y"){
				 $("input[name=delChk]:checkbox").each(function() {
				      $(this).attr("checked", true);
			 	});
			 }else{
				 $("input[name=delChk]:checkbox").each(function() {
				      $(this).attr("checked", false);
				 });
			 }
		 });
	});
	

	function doSubmit(url,actionName,value) {
	    f = document.forms[0];
	    
	    if ("commerce/read" == actionName) {
	    	f.method="post";
	    	var arrStr = value.split(':');
	    	var tempId = arrStr[0];
	    	var searchSel = arrStr[1];
	    	
	        f.tempId.value = tempId;
	        f.searchSel.value = tempId;
	        
	    } else if("commerce/insert" == actionName) {
	    	f.method="post";
	    	
	    } else if("commerce/list" == actionName) {
	    	f.method="post";
	    	
	    } 
	    
	    f.action = url;
	    f.submit();
	}
</script>
<form name="templateList" id="templateList">
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
<input type="hidden" id="tempId" name="tempId" value=""/>
    <div class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

     <!-- 탭============================================ : str -->
      <div id="tabs">
        <ul>
          <li><a href="#" class="hover">Templates</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/guide/list">Guides</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/promote/list">PR Posts</a></li>
        </ul>
        <div id="tabs-1">
            <!-- 검색조건 : srt -->
            
            <table class="boardSch" summary="search">
              <colgroup>
                <col width="18%" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>Type</th>
                <td class="type">
                
                  <p class="sch type2">
                    <!--  form action="${pageContext.request.contextPath }/adm/commerce/list" method="get">
                    <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" /-->
                    <select name="searchSel" id="searchSel" style="width:170px;height:24px;" >
                      <option value="">All</option>
                      <option value="P" <c:if test="${param.searchSel=='P'}">selected</c:if> >Promotional Product</option>
                      <option value="L" <c:if test="${param.searchSel=='L'}">selected</c:if> >Label</option>
                      <option value="B" <c:if test="${param.searchSel=='B'}">selected</c:if> >Brochure</option>
                    </select>
                     <!-- button type="button" class="serSubmit"></button-->
                     <button type="button" onclick="javascript:doSubmit('${pageContext.request.contextPath }/adm/commerce/list', 'commerce/list');"></button>
                    <!-- /form-->
                  </p>
                </td>
              </tr>
            </table>
            
            <!-- 검색조건 : end -->
            <!-- 템플릿 목록 : str -->
            <table class="boardList" summary="Templet list">
              <colgroup>
                <col width="7%" />
                <col width="15%" />
                <col width="*" />
                <col width="14%" />
                <col width="15%" />
                <col width="15%" />
                <col width="15%" />
              </colgroup>
              <thead>
                <tr>
                  <th class="one"><input type="checkbox" id="checkAll" name="checkAll" onclick="javascript:selectAll()" value="Y" /></th>
                  <th>Image</th>
                  <th>Template Name</th>
                  <th>Type</th>
                  <th>No. of Texts</th>
                  <th>No. of Photo</th>
                  <th class="end">Last Updated</th>
                </tr>
              </thead> 
              <tbody>
              	<c:if test="${list == null || fn:length(list) == 0}">
					<tr>
					 	<td colspan="8">No search result obtained.</td>
					</tr>
				</c:if>
              <!-- form name="delForm" method="post"-->
   				<c:forEach var="resultObject" items="${list}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
                <tr>
                  <%-- <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td> --%>
                  <td><input type="checkbox" name="delChk" id="delChk" value="${resultObject.tempId}" <c:if test="${resultObject.dfltYn=='Y'}">disabled</c:if> /></td>
                  
                  <td class="thumb"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/commerce/read','commerce/read','${resultObject.tempId}:${param.searchSel}');">
                  <!-- <img src="C:\ftptemp/commerce/template/eng/${resultObject.tempImg}" width="80" height="80" alt="${resultObject.tempImg}" /> -->
                  <c:if test="${resultObject.tempLang=='E'}">
                  	<img src="${pageContext.request.contextPath}/resources/storage/commerce/template/eng/${resultObject.tempImg}" width="80" height="80" alt="${resultObject.tempImg}" /></a></td>
                  </c:if>
                  <c:if test="${resultObject.tempLang=='M'}">                 
                  <img src="${pageContext.request.contextPath}/resources/storage/commerce/template/mal/${resultObject.tempImg}" width="80" height="80" alt="${resultObject.tempImg}" />
                  </c:if>
                  <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/commerce/read','commerce/read','${resultObject.tempId}:${param.searchSel}');">${resultObject.tempTitl}<c:if test="${resultObject.dfltYn=='Y'}"><br><b>(Default)</b></c:if></a></td>
                  <td>
                  		<c:choose>
					      <c:when test='${resultObject.tempType=="P"}'>Promotional</c:when>
					      <c:when test='${resultObject.tempType=="L"}'>Label</c:when>
					      <c:when test='${resultObject.tempType=="B"}'>Brochure</c:when>
					      <c:otherwise>기타</c:otherwise>
					     </c:choose>
                  </td>
                  <td>${resultObject.textCnt}</td>
                  <td>${resultObject.imgCnt}</td>
                  <td class="time">${resultObject.frstRgstDt}</td>
                </tr>
                 </c:forEach>
          		<!-- /form-->
              </tbody>
            </table>
            <!-- 게시판 목록 : end -->
        </div>
      </div>
      <!-- 탭=========================================== : end -->
    </div>

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li>
        <div class="button1">
          <a href="javascript:del_check('${pageContext.request.contextPath }/adm/commerce/delete')">Delete</a>
           <%-- <a href="#" onClick="doSubmit('${pageContext.request.contextPath }/commerce/delete/', 'delForm', 'post');">Delete</a> --%>
        </div>
      </li>
      <li class="alignR">
        <div class="button1 type2 write">
          <!--img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><a href="${pageContext.request.contextPath}/commerce/insert/?searchSel${param.searchSel}">Register</a-->
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/commerce/insert','commerce/insert');"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Register</span></a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->
	
    <!-- 페이지 넘버 : srt -->
    <div class="pageNum">
		<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath}/adm/commerce/list', 'commerce/list');" pageList="${list}" />
    </div>
    <!-- 페이지 넘버 : end -->
</form>

 
