<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
    <div class="board">
    <!-- 제목&검색 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>CBC Members</h2>
          <h3>Menu use site operating system</h3>
        </hgroup>
        <p class="sch">
        <form action="${pageContext.request.contextPath }/board/list" method="get">
          <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />         
          <select>
            <option>ID</option>
          </select>
          <input type="text" title="검색어 입력" />
          <button type="button"></button>
        </form>
        </p>
      </div>
    <!-- 제목&검색 : end -->

    <!-- 게시판 목록 : str -->
    <div>
      <table class="boardList" summary="CBC members">
        <colgroup>
          <col width="8%" />
          <col width="8%" />
          <col width="*" />
          <col width="15%" />
          <col width="15%" />
          <col width="15%" />
          <col width="15%" />
        </colgroup>
        <thead>
          <tr>
            <th class="one"><input type="checkbox" /></th>
            <th>No</th>
            <th>Name</th>
            <th>ID</th>
            <th>Store</th>
            <th>Member</th>
            <th class="end">Date</th>
          </tr>
        </thead>
        <tbody>
   		<c:forEach var="resultObject" items="${list}" varStatus="status" begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">	
          <tr>
            <td><input type="checkbox" /></td>
            <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
            <td><a href="#">${resultObject.boredID}</a></td>
            <td>${resultObject.boredSubj}</td>
            <td>${resultObject.boredCont}</td>
            <td>${resultObject.frstRgstUserID}</td>
            <td class="time">${resultObject.frstRgstDT}</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- 게시판 목록 : end -->

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li>
        <div class="button1">
          <a href="#">Delete</a>
        </div>
      </li>
      <li class="alignR">
        <div class="button1 type2">
          <img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><a href="<c:url value='/board/' />">Write</a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->

    <!-- 페이지 넘버 : srt -->
   <div class="pageNum">
		<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/board/list', 'command', 'get');" pageList="${list}" />
   </div>  
    <!-- 페이지 넘버 : end -->
 </div>   
