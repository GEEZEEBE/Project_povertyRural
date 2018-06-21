<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<script type="text/javascript">
function fileDown(logFname,phyFname){
	var path="default";
	var str = "";
	str += '${pageContext.request.contextPath }/notice/fileDown?path='+path;
	str += '&logFname='+encodeURIComponent(logFname);
	str += '&phyFname='+encodeURIComponent(phyFname);
	location.href=str;
}

function imgView(logFname,phyFname){
	var path="default";
	var str = "";
	str += '<img src="';
	str += '${pageContext.request.contextPath }/notice/fileDown?path='+path;
	str += '&logFname='+encodeURIComponent(logFname);
	str += '&phyFname='+encodeURIComponent(phyFname);
	str += '" />';
	document.write(str);
	
}
</script>
<div class="subContentsArea">
    <div class="subContentsBox">
      <form id="command">
      <input type="text" name="serTxt" value="<c:out value="${param.serTxt}" />" />
      <div class="subTitleBox typeNotice">
        <h2 class="titleCommu"><img src="<spring:message code="img.notice_title" text=""/>" alt="Notice" /></h2>
        <p class="subTitleCommu"><img src="<c:url value='/resources/usr/images/txt_notice.gif' />" alt="CBC members are at notice on this board." /></p>
        <!-- <div class="boardMainBtn">
        <a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/list', 'command', 'post');" class="rightBtn"><span class="btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
       	<c:if test="${nextMap.noticeId != null}">
         <a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/read?noticeId=${nextMap.noticeId}', 'command', 'post');" class="btnViewN"><img src="<c:url value='/resources/usr/images/btn_next.png' />" alt="next"></a>
       	</c:if>
       	<c:if test="${prevMap.noticeId != null}">
         <a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/read?noticeId=${prevMap.noticeId}', 'command', 'post');" class="btnViewP"><img src="<c:url value='/resources/usr/images/btn_prev.png' />" alt="prev"></a>
         </c:if>
         
        </div> -->
      </div>
      <!--게시판 영역 시작-->
      <div role="main" class="subConBox">
        <article class="boardView01">
          <header class="viewHeader"><h1><c:out value="${command.noticeSubj}" /></h1></header>
          <div class="viewInfo"><span class="date">${command.frstRgstDT}</span></div>
          <div class="viewFile">
          	<c:forEach var="resultObject" items="${fileMap}" varStatus="status">
            <a href="javascript:fileDown('${resultObject.LOGICAL_FILE_NAME}','${resultObject.PHYSICAL_FILE_NAME}');"><c:out value="${resultObject.LOGICAL_FILE_NAME}" /></a>
            </c:forEach>
          </div>
          <div class="viewPhoto">
          	<c:forEach var="resultObject" items="${fileMap}" varStatus="status">
          	<c:if test="${fn:indexOf(resultObject.FILE_CONTENTTYPE, 'image') != -1}">
            <script> imgView('${resultObject.LOGICAL_FILE_NAME}','${resultObject.PHYSICAL_FILE_NAME}'); </script>
            </c:if>
            </c:forEach>
          </div>
          <div class="viewCont">
            <c:out value="${command.noticeCont}" />
          </div>
        </article>
        <nav class="bottomNaviNtc">
          <ul>
          	<c:if test="${prevMap.noticeId != null}">
            <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/read?noticeId=${prevMap.noticeId}', 'command', 'post');"><span class="wayMarkP"><spring:message code="board.btn_previous" text=""/></span><span class="listTitle">: <c:out value="${prevMap.noticeSubj}" /></span></a></li>
            </c:if>
            <c:if test="${nextMap.noticeId != null}">
            <li class="noBb"><a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/read?noticeId=${nextMap.noticeId}', 'command', 'post');"><span class="wayMarkN"><spring:message code="board.btn_next" text=""/></span><span class="listTitle">: <c:out value="${nextMap.noticeSubj}" /></span></a></li>
          	</c:if>
          </ul>
        </nav>
        <div class="boardBtnNotice">
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/notice/list', 'command', 'post');" class="rightBtn"><span class="btnBase btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
        </div>
      </div>
      </form>
      
    </div>
  </div>