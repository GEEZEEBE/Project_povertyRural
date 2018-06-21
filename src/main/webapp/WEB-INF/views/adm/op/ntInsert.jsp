<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<script>

$("document").ready(function() {
	  $('textarea[maxlength]').live('keyup change', function() {  
	   var str = $(this).val();
	   var mx = parseInt($(this).attr('maxlength')); 
	   if (str.length > mx) {  
	    $(this).val(str.substr(0, mx));
	     return false;  
	    }  
	  });
});

$(function() {
	$(".fDel").live("click",function(e){
		e.preventDefault();
		//alert($(this).attr("href"));	

		var $delEle = $(this).closest("label");
		var arkey = "key=0&key="+$(this).attr("href");
		//if(confirm("are you sure?")){
			$.ajax({
				url: '${pageContext.request.contextPath }/adm/notice/fileDel',
				type: 'post',
				data : arkey,
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
		//}

	});

});	

function nameLength(type){
    var  length;
    if("leng"==type){
        length = $('input[name=noticeSubj]').val().length;
        $('#subjectNm').text(length);
    }
}

	


</script>



<form id="command" enctype="multipart/form-data">
<c:if test="${requestMap.flag == 'w'}">
</c:if>
<c:if test="${requestMap.flag == 'e'}">
<input type="hidden" name="noticeId" value="${requestMap.noticeId}">
</c:if>
<input type="hidden" name="serSch" value="${requestMap.serSch}">
<input type="hidden" name="serTxt" value="${requestMap.serTxt}">
<input type="hidden" name="frstRgstUserID" value="kut0001" />
<input type="hidden" name="latCrctUserID" value="kut0001" />
<!-- ======================================================= -->
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>   
          <h2><c:if test="${requestMap.flag == 'w'}">Announcements Management</c:if><c:if test="${requestMap.flag == 'e'}">Announcements Management</c:if></h2>
          <h3>Post and manage announcements, such as training schedules & syllabus, here</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Required Fields
        </p>
      </div>

      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <table class="boardView write" summary="Write">
        <colgroup>
        <c:if test="${requestMap.flag == 'w'}">
        	<col width="18%" />
          	<col width="*" />
        </c:if>
        <c:if test="${requestMap.flag == 'e'}">
        	<col width="18%" />
	        <col width="*" />
	        <col width="18%" />
	        <col width="30%" />
        </c:if>
        </colgroup>
         <c:if test="${requestMap.flag == 'e'}">
        <tr>
          <th>Writer</th>
          <td>${command.frstRgstUserID}</td>
          <th>Date</th>
          <td>${command.frstRgstDT}</td>
        </tr>
        </c:if>
        <tr>
          <th>Title<em>*</em></th>
          <td <c:if test="${requestMap.flag == 'e'}">colspan="3"</c:if> class="title">
            <select name="noticeDvsn" style="height:24px;">
              <option value="NOTI" <c:if test="${command.noticeDvsn == 'NOTI'}">selected</c:if> >Notice</option>
              <option value="EVEN" <c:if test="${command.noticeDvsn == 'EVEN'}">selected</c:if> >Event</option>
            </select>
            <input type="text" class="noticeSubj require" name="noticeSubj" maxlength="100" onkeyup="javascript:nameLength('leng');" <c:if test="${requestMap.flag == 'w'}"></c:if><c:if test="${requestMap.flag == 'e'}">value="${command.noticeSubj}"</c:if> /><span><em id="subjectNm">0</em>/100</span>
          </td>
        </tr>
        <tr>
          <th>Contents<em>*</em></th>
          <td <c:if test="${requestMap.flag == 'e'}">colspan="3"</c:if> class="content"><textarea name="noticeCont" title="Content" class="require" maxlength="2000">${command.noticeCont}</textarea></td>
        </tr>
        <tr class="bottomLine">
          <th>Attach a File</th>
          <td <c:if test="${requestMap.flag == 'e'}">colspan="3"</c:if> class="filesch">
            <div class="filefakeDiv">
              <input type="text" id="fakeFileTxt" class="fakeFileTxt" maxlength="2000" readonly>
              <div class="fileDiv">
                <input type="button" class="buttonImg" />
                <input type="file" class="realFile" name="notFile0" onchange="javascript:document.getElementById('fakeFileTxt').value = this.value" />
              </div>
              <span>Capacity limit : 30MB</span>
            </div>
            <p class="fileDel">
            	<c:forEach var="resultObject" items="${fileMap}" varStatus="status">
            		<label>${resultObject.LOGICAL_FILE_NAME}<a href="${resultObject.UNIQUE_KEY}" class="fDel">(X)</a>,</label>
            	</c:forEach>
            </p>
          </td>
        </tr>
      </table>
      <!-- 게시판 목록 : end -->
    </div>
    <!-- ======================================================= -->

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <li class="type2">
          <div class="button1 type2 post">
            <a href="javascript:if(submitCheck()) doSubmit('${pageContext.request.contextPath }/adm/notice/?flag=<c:if test="${requestMap.flag == 'w'}">w</c:if><c:if test="${requestMap.flag == 'e'}">e</c:if>', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Post</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/notice/<c:if test="${requestMap.flag == 'w'}">list</c:if><c:if test="${requestMap.flag == 'e'}">read</c:if>', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
    
    
</form>
    
<c:if test="${error != null}">
	<script>
		alert('file size over');
	</script>
</c:if>
   
