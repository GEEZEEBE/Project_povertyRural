<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 

 <!-- ============================================================================== -->
	<form id="command">
	<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
	<input type="hidden" name="del" value="0"/>
	<input type="hidden" id="serTrue" name="serTrue" value="0" />
    <div class="board">
      <!-- 제목&검색 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Announcements Management</h2>
          <h3>Post and manage announcements, such as training schedules & syllabus, here</h3>
        </hgroup>
        <p class="sch">
          <select name="serSch" style="height:24px;">
          	<option value="ALL">All</option>
            <option value="NOTI_SUBJ" <c:if test="${requestMap.serSch=='NOTI_SUBJ'}">selected</c:if> >Title</option>
            <option value="NOTI_CONT" <c:if test="${requestMap.serSch=='NOTI_CONT'}">selected</c:if> >Content</option>
          </select>
          <input type="hidden" name="serTxt" value="<c:out value="${requestMap.serTxt}" />" title="검색어 입력" />
          <input type="text" name="serTxt2" value="<c:out value="${requestMap.serTxt}" />" title="검색어 입력" />
          <button type="button" onclick="javascript:fncSearchCheck(); fncSerTxt(); doSubmit('${pageContext.request.contextPath }/adm/notice/list', 'command', 'post');"></button>
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
          <col width="80" />
          <col width="100" />
        </colgroup>
        <thead>
          <tr>
            <th class="one"><input type="checkbox" name="allCheck"/></th>
            <th>No.</th>
            <th>Title</th>
            <th>Registered by</th>
            <th>Views</th>
            <th class="end">Date</th>
          </tr>
        </thead>
        <tbody>
        <c:if test="${list == null || fn:length(list) == 0}">
            <tr>
            	<td colspan="6">No registered result obtained.</td>
        	</tr>
		    </c:if>
        <c:forEach var="resultObject" items="${list}" varStatus="status"  begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
          <tr>
            <td><input type="checkbox" name="del" value="${resultObject.noticeId}"/></td>
            <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
            <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/read?noticeId=${resultObject.noticeId}', 'command', 'post');" class="listNtcTitle">
            <c:choose>
			  <c:when test="${resultObject.noticeDvsn=='NOTI'}">[Notice]</c:when>
			  <c:when test="${resultObject.noticeDvsn=='EVEN'}">[Event]</c:when>
		  	</c:choose>
            <c:out value='${resultObject.noticeSubj}'/></a></td>
            <td>${resultObject.frstRgstUserID}</td>
            <td>${resultObject.viewCount}</td>
            <td class="time">${resultObject.frstRgstDT}</td>
          </tr>
         </c:forEach> 
        </tbody>
      </table>
      <!-- 게시판 목록 : end -->
    </div>
	
    <!-- ============================================================================== -->

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li>
        <div class="button1">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/delete', 'command', 'post');" class="delPop">Delete</a>
        </div>
      </li>
      <li class="alignR">
        <div class="button1 type2">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/insert?flag=w', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Post</span></a>
        </div>
      </li>
    </ul>
    
    <!-- 버튼 : end -->
	
	<!-- 페이지 넘버 : srt -->
    <div class="pageNum">
      <nav:pageNavi
					doSubmit="doSubmit('${pageContext.request.contextPath }/adm/notice/list', 'command', 'post');"
					pageList="${list}" />
    </div>
    <!-- 페이지 넘버 : end -->
    </form>
    
    
   
