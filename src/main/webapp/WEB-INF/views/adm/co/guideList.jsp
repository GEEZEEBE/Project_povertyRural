<%@ page contentType="text/html; charset=UTF-8" 
	import = "java.util.List, com.skt.mars.adm.co.Guide" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%
	List<Guide> resultObject = (List<Guide>)request.getAttribute("list");
%>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	
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
				alert("Select an Item!");
				return;
			}
			var con=confirm("Are you sure you want to delete the item chosen?");
			if(con == true){
				form.method="post";
				form.action=url;
				form.submit();
			}
		}else{
			alert("Do not have the item you want to delete.");
			return;
		}
	}
	
	function doSubmit(url,actionName,value) {
	    f = document.forms[0];
	    
	    if ("guide/read" == actionName) {
	    	f.method="post";
	    	var arrStr = value.split(':');
	    	var guidId = arrStr[0];
	    	
	        f.guidId.value = guidId;
	        
	    } else if("guide/insert" == actionName) {
	    	f.method="post";
	    	
	    } else if("guide/list" == actionName) {
	    	f.method="post";
	    	
	    } 
	    
	    f.action = url;
	    f.submit();
	}
</script>
<form name="guideList" id="guideList">
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
<input type="hidden" id="guidId" name="guidId" value=""/>
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
          <li><a href="${pageContext.request.contextPath }/adm/commerce/list" >Templates</a></li>
          <li><a href="#" class="hover">Guides</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/promote/list">PR Posts</a></li>
        </ul>
        <div id="tabs-1">
            <!-- 검색조건 : srt -->
            
            <!-- 검색조건 : end -->
            <!-- 템플릿 목록 : str -->
            <table class="boardList" summary="Templet list">
              <colgroup>
                <col width="9%" />
                <col width="9%" />
                <col width="*" />
                <col width="10%" />
                <col width="14%" />
                <col width="15%" />
              </colgroup>
              <thead>
                <tr>
                  <th class="one"><input type="checkbox" id="checkAll" name="checkAll" onclick="javascript:selectAll()" value="Y" /></th>
                  <th>No.</th>
                  <th>Guide Name</th>
                  <th>Language</th>
                  <th>Type</th>
                  <th class="end">Date</th>
                </tr>
              </thead> 
              <tbody>
              	<c:if test="${list == null || fn:length(list) == 0}">
					<tr>
					 	<td colspan="8">No search result obtained.</td>
					</tr>
				</c:if>
              <!--  form name="delForm" method="post"-->
   				<c:forEach var="resultObject" items="${list}" varStatus="status" begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
                <tr>
                  <td><input type="checkbox" name="delChk" id="delChk" value="${resultObject.guidId}" /></td>
                  <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
                  <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/guide/read','guide/read','${resultObject.guidId}:');">${resultObject.guidTitl}</a></td>
                  <td>
                  		<c:choose>
					      <c:when test='${resultObject.guidLang=="E"}'>English</c:when>
					      <c:when test='${resultObject.guidLang=="M"}'>Malaysia</c:when>
					      <c:otherwise>기타</c:otherwise>
					     </c:choose>
                  </td>
                  <td>
                  		<c:choose>
					      <c:when test='${resultObject.guidType=="E"}'>E Commerce</c:when>
					      <c:when test='${resultObject.guidType=="T"}'>Tool</c:when>
					      <c:otherwise>기타</c:otherwise>
					     </c:choose>
                  </td>
                  <td class="time">${resultObject.frstRgstDt}</td>
                </tr>
                 </c:forEach>
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
          <a href="javascript:del_check('${pageContext.request.contextPath }/adm/guide/delete')">Delete</a>
           <%-- <a href="#" onClick="doSubmit('${pageContext.request.contextPath }/commerce/delete/', 'delForm', 'post');">Delete</a> --%>
        </div>
      </li>
      <li class="alignR">
        <div class="button1 type2 write">
          <!-- img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><a href="${pageContext.request.contextPath}/guide/insert/">Register</a-->
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/guide/insert','guide/insert');"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Register</span></a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->
	
    <!-- 페이지 넘버 : srt -->
    <div class="pageNum">
        <nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/adm/guide/list','guide/list');" pageList="${list}" />
   </div>
    <!-- 페이지 넘버 : end -->
    
    </form>
