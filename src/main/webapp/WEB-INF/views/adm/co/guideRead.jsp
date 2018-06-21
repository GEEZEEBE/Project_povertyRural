<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />

<script>
 /*  $(function() {
    $( "#tabs" ).tabs();
  }); */
  
  function del(url){
	  var form = document.delForm;
	  var con = confirm("Are you sure you want to delete?");
	  if(con){
		  form.action=url;
		  form.submit();
	  }else{
		  return;
	  }
  }
  //$("a#defaultSetting").attr('href', '/abc/commerce/defaultSetting/');
  
  function doSubmit(url,actionName,value) {
    f = document.forms[0];
    f.action = url;
    
    if("gods/list" == actionName) 
    {
        f.method = "post";
        
    }else if("gods/delete" == actionName) {
       
        var check = confirm("삭제하시겠습니까?");
        if(check){
            f.method="post";
        }else{
            return;
        }

    }else if("gods/edit" == actionName) {
    	f.method="post";
    }
    
    f.submit();
}
</script>
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

       <!-- 탭============================================ : str -->
      <!-- div id="tabs"-->
        <!-- <ul>
          <li><a href="#tabs-1">Templet</a></li>
          <li><a href="#tabs-2">Guide</a></li>
          <li><a href="#tabs-3">PR Post</a></li>
        </ul> -->
        <!-- div id="tabs-1"-->
          <!-- 게시판 목록 : str -->
          <section class="itemSection">
            <table class="boardView item" summary="Templete Information">
              <colgroup>
                <col width="18%" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>Date</th>
                <td class="time">${command.frstRgstDt}</td>
                <th>Register</th>
                <td>${command.frstRgstMngrId}</td>
              </tr>
              <tr>
                <th>Title</th>
                <td colspan="3">${command.guidTitl}</td>
              </tr>
              <tr>
                <th>Type</th>
                <td colspan="3">
                	<c:choose>
                	  <c:when test='${command.guidType=="E"}'>E Commerce</c:when>
				      <c:when test='${command.guidType=="T"}'>Tool</c:when>
				      <c:otherwise>기타</c:otherwise>
				     </c:choose>
                </td>
              </tr>
              <tr>
                <th>Language</th>
                <td colspan="3">
                	<c:choose>
				      <c:when test='${command.guidLang=="M"}'>Malaysia</c:when>
                	  <c:when test='${command.guidLang=="E"}'>English</c:when>
				      <c:otherwise>etc</c:otherwise>
				     </c:choose>
                </td>
              </tr>
               <tr>
                <th>Content</th>
                <td colspan="3">${command.guidSmmr}</td>
              </tr>
              <tr>
                <th>file</th>
                <td colspan="3">${command.guidCntsUrl}</td>
              </tr>
            </table>
            
          </section>
         <!-- 게시판 목록 : end -->
        <!-- /div-->
      <!-- /div-->
      <!-- 탭=========================================== : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li> 
          <div class="button1">
		    <a href="${pageContext.request.contextPath }/adm/guide/edit?guidId=${command.guidId}&?currentPage=${param.currentPage == null ? 1 : param.currentPage}">Edit</a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:del('${pageContext.request.contextPath }/adm/guide/delete');">Delete</a>
            <form name="delForm" method="post">
            	<input type="hidden" name="delChk" value="${command.guidId}"/>
            </form>
          </div>
        </li>
        <li class="type2 list">
          <div class="button1 type2 list">
			<a href="${pageContext.request.contextPath }/adm/guide/list?currentPage=${param.currentPage == null ? 1 : param.currentPage}"><img src="<c:url value='/resources/images/btn_icon_list.gif'/>" alt="icon" /><span>List</span></a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
