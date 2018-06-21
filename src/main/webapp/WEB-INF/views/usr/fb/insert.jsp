<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>

<div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox">
        <h2 class="titleCommu"><img src="<spring:message code="img.free_title" />" alt="community" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.free_title,txt1"/>" alt="CBC members are at liberty to talk and communicate on this board." /></p>
      </div>
      <!--게시판 영역 시작-->
      <form id="command" id="command" enctype="multipart/form-data">
      <c:choose>
		  <c:when test="${param.flag=='w'}"><input type="hidden" name="boardID" value="" /></c:when>
		  <c:when test="${param.flag=='e'}"><input type="hidden" name="boardID" value="${command.boardID}" /></c:when>
	  </c:choose>		  
      <input type="hidden" name="frstRgstUserID" value="${username}" />
      <input type="hidden" name="latCrctUserID" value="${username}" />
      <div role="main" class="subConBox">
        <table summary="community board write area" class="boardWrite01">
		  <c:choose>
		  <c:when test="${param.flag=='w'}">
			  <caption>
			    community board write
			  </caption>
			  <colgroup>
			    <col style="width:120px;">
			    <col>
			  </colgroup>
			  <tr>
			    <th scope="row"><spring:message code="board.column_title" text=""/></th>
			    <td><input type="text" value="" name="boardSubj" class="subTitle require" tabindex="1" maxlength="200"></td>
			  </tr>
			  <tr>
			    <th scope="row" class="icoFile"><spring:message code="board.column_file" text=""/></th>
			    <td>
			    	  <input type="text" id="fakeFileTxt" class="fakeFileTxt" readonly tabindex="2" />
			    	  <div class="fileDiv">
				        <input type="button" class="buttonImg" />
				        <input tabindex="-1" type="file" name="freeFile0" class="realFile" onchange="javascript:document.getElementById('fakeFileTxt').value = this.value" />
				      </div>
			    
			    <!--  / <input type="file" id="attachOrgFileName" name="attachOrgFileName2"  size = "50"/> -->
			    </td>
			  </tr>
			  <tr>
			    <th colspan="2" class="lastThLine"><textarea name="boardCont" class="subCont require" tabindex="3" maxlength="2000" onkeyup="return isMaxlength(this)"></textarea></th>
			  </tr>
		  </c:when>
		  <c:when test="${param.flag=='e'}">
			  <caption>
			    community board write
			  </caption>
			  <colgroup>
			    <col style="width:120px;">
			    <col>
			  </colgroup>
			  <tr>
			    <th scope="row"><spring:message code="board.column_title" text=""/></th>
			    <td><input type="text" value="${command.boardSubj}" name="boardSubj" class="subTitle require" tabindex="1" maxlength="200"></td>
			  </tr>
			  <tr>
			    <th scope="row" class="icoFile"><spring:message code="board.column_file" text=""/></th>
			    <td>
			      <input type="text" id="fakeFileTxt" class="fakeFileTxt" readonly tabindex="2" />
			    	  <div class="fileDiv">
				        <input type="button" class="buttonImg" />
				        <input type="file" name="freeFile0" class="realFile" onchange="javascript:document.getElementById('fakeFileTxt').value = this.value" />
				      </div>
			    </td>
			  </tr>
			  <tr>
			    <th colspan="2" class="lastThLine"><textarea name="boardCont" class="subCont require" maxlength="2000" tabindex="3" onkeyup="return isMaxlength(this)" >${command.boardCont}</textarea></th>
			  </tr>
		  </c:when>
		  </c:choose> 
		</table>
		<c:choose>
		  <c:when test="${param.flag=='w'}">
		  	<div class="boardBtnLine notBd">
	          <a href="${pageContext.request.contextPath }/usrFree/list?serTxt=${param.serTxt}" class="rightBtn"><span class="btnBase iconDel"><spring:message code="board.btn_cancel" text=""/></span></a><a href="javascript:if(submitCheck()) doSubmit('${pageContext.request.contextPath }/usrFree/?flag=w', 'command', 'post'); " class="rightBtn" ><span class="btnBase iconPen"><spring:message code="board.btn_register" text=""/></span></a>
	        </div>
		  </c:when>
		  <c:when test="${param.flag=='e'}">
		  	<div class="boardBtnLine notBd">
	          <a href="${pageContext.request.contextPath }/usrFree/read?boardID=${param.boardID}&serTxt=${param.serTxt}" class="rightBtn"><span class="btnBase iconDel"><spring:message code="board.btn_cancel" text=""/></span></a><a href="javascript:if(submitCheck()) doSubmit('${pageContext.request.contextPath }/usrFree/?serTxt=${param.serTxt}&flag=e', 'command', 'post');" class="rightBtn" ><span class="btnBase iconPen"><spring:message code="board.btn_register" text=""/></span></a>
	        </div>
		  </c:when>
		</c:choose>
        
      </div>
      </form>
    </div>
  </div>
  
<c:if test="${error != null}">
	<script>
		alert('file size over');
	</script>
</c:if>

  