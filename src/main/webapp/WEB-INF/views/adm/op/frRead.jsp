<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<script>
$(function() {
	$(".comDel").live("click",function(e){
		e.preventDefault();
		
		var $delEle = $(this).closest(".commentList");
		if(confirm("Are you sure you want to delete?")){
			$.ajax({
				url: '${pageContext.request.contextPath}/adm/free/replyDel',
				type: 'post',
				data : {"boardID":"${command.boardID}","replyID":$(this).attr("href")},
				success: function(data) {
						//alert(data);
						$delEle.remove();
					},
					beforeSend : function() {
						//처리중 화면구성
					},
					error : function() {
						alert("정보를 가져오는데 실패하였습니다.");
					} 					
			});
		}
	});

	
});

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
      <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Free Board Management</h2>
          <h3>Manage the Free Board here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 공지사항상세 : str -->
      <article class="noticeView">
        <header>
          <h1><c:out value='${command.boardSubj }'/></h1>
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
            <c:out value='${command.boardCont}'/>
          </div>
        </section>
        <div class="replyList">
        <c:forEach var="resultObject" items="${replyList}">
          <div class="commentList">
            <span>${resultObject.frstRgstUserID}</span>
            <time>${resultObject.frstRgstDT}</time>
            <a href="${resultObject.replyID}" class="comDel"><img src="<c:url value='/resources/images/btn_delete.png' />" alt="Icon Delete" /></a>
            <p class="txtReply"><c:out value='${resultObject.replyCont}'/></p>
          </div>
         </c:forEach> 
        </div>
      </article>
      <!-- 공지사항상세 : end -->
    </div>
    <!-- ======================================================= -->

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
      <!-- 
        <li class="type2">
          <div class="button1 type2 enter">
            <a href="#"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Enter</span></a>
          </div>
        </li>
       -->  
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/free/list', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    </form>
    <!-- 페이지 넘버 : end -->