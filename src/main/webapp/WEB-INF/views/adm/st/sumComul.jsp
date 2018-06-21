<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 

<section class="board">
<!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Statistics Summary</h2>
          <h3>Check the accumulated figures of the overall services here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
	
      <!-- 탭============================================ : str -->
      <form id="command">
      <section id="tab-container" class="stats">
   
        <section id="tabs-1" class="topLine">
          <!-- 누적 : srt -->
          <table class="boardSch" summary="search">
            <colgroup>
              <col width="230" />
              <col width="230" />
              <col width="*" />
            </colgroup>
            <thead>
              <tr>
                <th>Service</th>
                <th>Service Contents</th>
                <th class="end">Total</th>
              </tr>
            </thead>
            <tbody> 
            
            <c:forEach var="result2" items="${list}" varStatus="status2">
				<c:set var="checkCnt" value="0" />	
				<c:forEach var="result" items="${list}" varStatus="status">	
					<c:if test="${result2.SERVICE_TITLE == result.SERVICE_TITLE}">
						<c:set var="checkNum" value="${status.count}" />
						<c:set var="checkCnt" value="${checkCnt+1}" />
					</c:if>
				</c:forEach>
				<tr>
				<c:if test="${status2.count==(checkNum-checkCnt+1)}">
			       <th rowspan="${checkCnt}"><div><span>${result2.SERVICE_TITLE}</span><!--a href="#" class="details"><img src="<c:url value='/resources/images/btn_details.png' />" alt="Button: Details" /></a--></div></th>
			    </c:if>   
			       <td>${result2.SERVICE_NAME}</td>
			       <td class="end price"><fmt:formatNumber value="${result2.CNT}" type="number"/></td>
			     </tr>
			</c:forEach>             
            </tbody>
          </table>
          <div class="excelDown">
            <div class="alignCenter">
              <div class="button1 type2">
                <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=sumComul&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
              </div>
            </div>
          </div>
          <!-- 누적 : end -->
        </section>
      </section>
      </form>
      <!-- 탭=========================================== : end -->
</section>


<c:forEach var="result2" items="${list}" varStatus="status2">
	<c:set var="checkCnt" value="0" />	
	<c:forEach var="result" items="${list}" varStatus="status">	
		<c:if test="${result2.SERVICE_TITLE == result.SERVICE_TITLE}">
			<c:set var="checkNum" value="${status.count}" />
			<c:set var="checkCnt" value="${checkCnt+1}" />
		</c:if>
	</c:forEach>
	<!-- ${status2.count}--${checkNum-checkCnt+1 }--${checkCnt }=row->${checkCnt }<br /> -->
</c:forEach>
