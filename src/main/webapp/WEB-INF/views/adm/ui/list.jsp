<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 

<form id="command">
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" /> 
<input type="hidden" name="del" value="0">
<input type="hidden" id="serTrue" name="serTrue" value="0" />
    <div class="board">
    <!-- 제목&검색 : str -->
     <div class="subtitle">
        <hgroup>
          <h2>Member Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
        <p class="sch">     
           <select name="serCol" style="height:24px;">
            <option value="USER_ID" <c:if test="${param.serCol == 'USER_ID'}">selected</c:if> >ID</option>
            <option value="NAME" <c:if test="${param.serCol == 'NAME'}">selected</c:if> >Name</option>
          </select>
          <input type="hidden" name="serTxt" value="<c:out value="${param.serTxt}" />" title="Insert search" />
          <input type="text" name="serTxt2" value="<c:out value="${param.serTxt}" />" title="Insert search" />
          <button type="button" onclick="javascript:fncSearchCheck(); fncSerTxt(); doSubmit('${pageContext.request.contextPath }/adm/user/list', 'command', 'post');"></button>
        </p>
      </div>
    <!-- 제목&검색 : end -->

    <!-- 게시판 목록 : str -->
      <table class="boardList" summary="CBC members">
        <colgroup>
          <col width="60" />
          <col width="80" />
          <col width="*" />
          <col width="120" />
          <col width="120" />
          <col width="100" />
        </colgroup>
        <thead>
          <tr>
            <th class="one"><input type="checkbox" name="allCheck"/></th>
            <th>No.</th>
            <th>Name</th>
            <th>Member ID</th>
            <th>Registered by</th>
            <th class="end">Date</th>
          </tr>
        </thead>
        <tbody>
			<c:if test="${list == null || fn:length(list) == 0}">
			<tr>
			 	<td colspan="7">No search result obtained.</td>
			</tr>
			</c:if>
   		<c:forEach var="resultObject" items="${list}" varStatus="status"  begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">	
          <tr>
            <td><input type="checkbox" name="del" value="${resultObject.userID}" /></td>
            <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
			  <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/user/read?userID=${resultObject.userID}', 'command', 'post');"><c:out value="${resultObject.name}" /></a></td>
			  <td>${resultObject.userID}</td>
			  <td>${resultObject.frstRgstUserID}</td>
			  <td class="time">${resultObject.frstRgstDT}</td>
			</tr>
			</c:forEach>
        </tbody>
      </table>
    </div>
    </form>
    <!-- 게시판 목록 : end -->
    
<!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li>
        <div class="button1">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/user/delete', 'command', 'post');" class="delPop">Delete</a>
        </div>
      </li>
      <li>
        <div class="button1 type2 write">
          <a href="${pageContext.request.contextPath }/adm/user/?serCol=${param.serCol}&serTxt=${param.serTxt}&flag=w"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Register</span></a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->

    <!-- 페이지 넘버 : srt -->
   <div class="pageNum">
		<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/adm/user/list', 'command', 'get');" pageList="${list}" />
   </div>  
