<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
    
	<div class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Asset Management</h2>
          <h3>Manage all assets (PCs, tablets, VODs and e-Books) managed by SKT CBC here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
      <!-- 검색조건 : srt -->
      <form id="command">
      <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
      <input type="hidden" name="frstRgstUserID" value="kut0001" />
	  <input type="hidden" name="latCrctUserID" value="kut0001" />
	  <input type="hidden" name="strAssetTypeCD" value="${requestMap.strAssetTypeCD}" />
	  <input type="hidden" name="strItemNM" value="<c:out value='${requestMap.strItemNM}'/>" />
      </form>
      
      <form id="command2">
      <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
      <input type="hidden" name="del" value="0" />
      <input type="hidden" name="frstRgstUserID" value="kut0001" />
	  <input type="hidden" name="latCrctUserID" value="kut0001" />
	  <input type="hidden" id="serTrue" name="serTrue" value="0" />
      <table class="boardSch" summary="search">
        <colgroup>
          <col width="18%" />
          <col width="*" />
          <col width="18%" />
          <col width="29%" />
        </colgroup>
        <tr>
          <th>Asset Type</th>
          <td class="type">
            <select id="strAssetTypeCD" name="strAssetTypeCD" style="height:24px;">
            	<option value="">All</option>
              </select>
          </td>
          <th>Asset</th>
          <td>
            <p class="sch">
              <input type="text" title="검색어 입력" name="strItemNM" value="<c:out value='${requestMap.strItemNM}'/>" />
              <button type="button" onclick="fncSerTxt(); doSubmit2('${pageContext.request.contextPath }/adm/asset/list', 'command2', 'post');"></button>
            </p>
          </td>
        </tr>
      </table>
      <!-- 검색조건 : end -->
      <!-- 게시판 목록 : str -->
      <table class="boardList" summary="CBC members">
        <colgroup>
          <col width="8%" />
          <col width="8%" />
          <col width="12%" />
          <col width="*" />
          <col width="12%" />
          <col width="15%" />
          <col width="15%" />
        </colgroup>
        <thead>
          <tr>
            <th class="one"><input type="checkbox" name="allCheck" /></th>
            <th>No.</th>
            <th>Asset Type</th>
            <th>Asset</th>
            <th>Price</th>
            <th>Registered by</th>
            <th class="end">Date</th>
          </tr>
        </thead>
        <tbody>
        <tr class="listItem">
        <c:if test="${list == null || fn:length(list) == 0}">
            <tr>
            	<td colspan="7">No registered result obtained.</td>
        	</tr>
	    </c:if>
        <c:forEach var="resultObject" items="${list}" varStatus="status"  begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
          <tr class="listItem">
            <td><input type="checkbox" name="del" value="${resultObject.assetID}"/></td>
            <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
            <td>${resultObject.assetTypeNM}</td>
            <td class="alignL"><a class="listAssetTitle" href="javascript:doSubmit('${pageContext.request.contextPath }/adm/asset/edit?flag=e&assetID=${resultObject.assetID}', 'command', 'post');">${resultObject.itemNM}</a></td>
            <td>${resultObject.costpric}</td>
            <td>${resultObject.frstRgstUserID}</td>
            <td class="time">${resultObject.frstRgstDT}</td>
          </tr>
         </c:forEach>
         
        </tbody>
      </table>
      </form>
      <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li>
        <div class="button1">
          <a href="javascript:doSubmit2('${pageContext.request.contextPath }/adm/asset/del', 'command2', 'post');" class="delPop" title="Are you sure you want to delete?">Delete</a>
        </div>
      </li>
      <li class="alignR">
        <div class="button1 type2 write">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/asset/insert?flag=w', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Register</span></a>
        </div>
        <div class="button1 type2 cost">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/cost/list', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Base Price</span></a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->
	
	<div class="pageNum">
		<nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/adm/asset/list', 'command', 'post');" pageList="${list}" />
   </div> 

    <script>
	fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00600','strAssetTypeCD','${requestMap.strAssetTypeCD }','');
</script>
    
    
    
   
