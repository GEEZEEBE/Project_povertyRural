<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>   
   <div class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Bace Price</h2>
          <h3>Menu use site operating system</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
      <!-- 게시판 목록 : str -->
      <a href="${pageContext.request.contextPath }/adm/asset/list" class="assetList"><img src="<c:url value='/resources/images/btn_assetList.gif' />" alt="Assetlist button" /></a>
      <form id="command">
      <input type="hidden" name="del" value="0"/>
      <table class="boardList costList" summary="CBC members">
        <colgroup>
          <col width="60" />
          <col width="80" />
          <col width="70" />
          <col width="*" />
          <col width="80" />
          <col width="80" />
          <col width="70" />
          <!-- <col width="11%" />-->
          <col width="70" />
        </colgroup>
        <thead>
       	<tr>
            <th class="one"><input type="checkbox" name="allCheck" /></th>
            <th>No.</th>
            <th>Asset Type</th>
            <th>Name</th>
            <th>Pricing Unit</th>
            <th>Base Price</th>
            <th>Margin Rate</th>
            <!-- 
            <th>Penalty<br />margin rate</th>
             -->
            <th class="end">Late Fee</th>
         </tr>
        	
        </thead>
        <tbody>
          <c:if test="${list == null || fn:length(list) == 0}">
            <tr>
            	<td colspan="9">등록된값이 없습니다.</td>
        	</tr>
	      </c:if>
	 
	        <c:forEach var="resultObject" items="${list}">
          <tr class="listItem">
            <td><input type="checkbox" name="del" value="${resultObject.costpricID}"/></td>
            <td class="tdfontColor01">${resultObject.rowNum}</td>
            <td>${resultObject.assetTypeNM}</td>
            <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/cost/edit?flag=e&costpricID=${resultObject.costpricID}', 'command', 'post');"><c:out value='${resultObject.costpricNM}'/></a></td>
            <td>${resultObject.costpricTypeNM}</td>
            <td>${resultObject.costpric}</td>
            <td>${resultObject.prftMrgin}%</td>
            <!-- <td>${resultObject.fineMrgin}%</td> -->
            <td class="time">${resultObject.fine}</td>
          </tr>
          	</c:forEach>
        </tbody>
      </table>
      </form>
      <!-- 게시판 목록 : end -->
    </div>

    <!-- ============================================================================== -->

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li>
        <div class="button1">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/cost/del', 'command', 'post');" class="delPop">Delete</a>
        </div>
      </li>
      <li class="alignR">
        <div class="button1 type2 write">
          <a href="${pageContext.request.contextPath }/adm/cost/insert?flag=w"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Resister</span></a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->
