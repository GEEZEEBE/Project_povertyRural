<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<script type="text/javascript">
function fileDown(logFname,phyFname){
	var path="default";
	var str = "";
	str += '${pageContext.request.contextPath }/adm/notice/fileDown?path='+path;
	str += '&logFname='+encodeURIComponent(logFname);
	str += '&phyFname='+encodeURIComponent(phyFname);
	location.href=str;
}

function imgView(logFname,phyFname){
	var path="default";
	var str = "";
	str += '<img src="';
	str += '${pageContext.request.contextPath }/adm/notice/fileDown?path='+path;
	str += '&logFname='+encodeURIComponent(logFname);
	str += '&phyFname='+encodeURIComponent(phyFname);
	str += '" style="max-width:650px;"/>';
	document.write(str);
	
}
</script>
    <!-- ======================================================= -->
 <form id="command">
 <input type="hidden" name="serSch" value="${requestMap.serSch}">
 <input type="hidden" name="serTxt" value="${requestMap.serTxt}">
 <input type="hidden" name="noticeId" value="${requestMap.noticeId}">
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Announcements Management</h2>
          <h3>Post and manage announcements, such as training schedules & syllabus, here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 공지사항상세 : str -->
      <article class="noticeView">
        <header>
          <h1><c:out value='['/><c:choose>
				  <c:when test="${command.noticeDvsn=='NOTI'}">Notice</c:when>
				  <c:when test="${command.noticeDvsn=='EVEN'}">Event</c:when>
			  	</c:choose><c:out value='] ${command.noticeSubj}'/></h1>
          <div class="details">
            <span><c:out value='${command.frstRgstUserID}'/></span>
            <time>${command.frstRgstDT}</time>
          </div>
        </header>
        <section class="textual">
          <p class="upfileList">
          	<c:forEach var="resultObject" items="${fileMap}" varStatus="status">
            <a href="javascript:fileDown('${resultObject.LOGICAL_FILE_NAME}','${resultObject.PHYSICAL_FILE_NAME}');"><img src="<c:url value='/resources/images/icon_file.gif' />" alt="Icon File" /><span><c:out value="${resultObject.LOGICAL_FILE_NAME}" /></span></a>
            </c:forEach>
          </p>
          <div>
            <c:forEach var="resultObject" items="${fileMap}" varStatus="status">
            <c:if test="${fn:indexOf(resultObject.FILE_CONTENTTYPE, 'image') != -1}">
            <script> imgView('${resultObject.LOGICAL_FILE_NAME}','${resultObject.PHYSICAL_FILE_NAME}'); </script>
            </c:if>
            </c:forEach>
            <br />
           <pre><c:out value='${command.noticeCont}'/></pre>
          </div>
        </section>
        <hgroup>
        <c:if test="${prevMap.noticeId != null}">
          <h1 class="prev">
            <div>
              <img src="<c:url value='/resources/images/icon_prev.png' />" alt="Icon Previous" />
              <a class="ntReplyTitle" href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/read?strNoticeId=${prevMap.noticeId}', 'command', 'post');"><span><strong>Previous</strong><em>:</em><c:out value='${prevMap.noticeSubj}'/></span></a>
            </div>
          </h1>
        </c:if>  
        <c:if test="${nextMap.noticeId != null}">
          <h1>
            <div>
              <img src="<c:url value='/resources/images/icon_next.png' />" alt="Icon Next" />
              <a class="ntReplyTitle" href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/read?strNoticeId=${nextMap.noticeId}', 'command', 'post');"><span><strong>Next</strong><em>:</em>${nextMap.noticeSubj}</span></a>
            </div>
          </h1>
        </c:if>  
        </hgroup>
      </article>
      <!-- 공지사항상세 : end -->
    </div>
    <!-- ======================================================= -->

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/insert?flag=e', 'command', 'post');">Edit</a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/list', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->    
 </form>   
 
