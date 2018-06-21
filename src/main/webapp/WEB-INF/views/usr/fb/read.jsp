<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<script>
$(function() {
	$(".comDel").live("click",function(e){
		e.preventDefault();
		//alert($(this).attr("href"));	
		var $delEle = $(this).closest(".commentList");
		if(confirm("are you sure?")){
		$.ajax({
			url: '${pageContext.request.contextPath}/usrFree/replyDel',
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

	/// reply update
	$(".comSave").live("click",function(e){
		e.preventDefault();
		
		var $frm = $(this).closest("form");
		var $delEle = $(this).closest(".commentList");
		
		var $checkVal = $delEle.find(".require");
		if(!$checkVal.val() || $checkVal.val().trim().length == 0){
			alert("These are mandatory fields");
			$checkVal.focus();
			return false;
		}
		
		$.ajax({
			url: '${pageContext.request.contextPath}/usrFree/replyInsert',
			type: 'post',
			data : $frm.serialize(),
			dataType:"json",
			success: function(data) {
				var html = '';
				
					$.each(data.itmes, function(i,item){
						///html escape
						var frstRgstUserID = item.frstRgstUserID ;
						frstRgstUserID = frstRgstUserID.replace(/</gi,"&lt;");
						frstRgstUserID = frstRgstUserID.replace(/>/gi,"&gt;");
						var replyCont = item.replyCont;
						//html pre tab del
						replyCont = replyCont.replace("<pre>","");
						replyCont = replyCont.replace("</pre>","");
						replyCont = replyCont.replace(/</gi,"&lt;");
						replyCont = replyCont.replace(/>/gi,"&gt;");
						
						html = html+'      <header class="commentH"><span class="commName">'+frstRgstUserID+'</span><span class="commDate">'+item.frstRgstDT+'</span></header>';
						html = html+'      <div class="commentCont"><pre>'+replyCont+'</pre></div>';
						if(item.frstRgstUserID=='${requestMap.frstRgstUserID}'){
						html = html+'	   <div class="commentEdit"><a href="'+item.replyID+'" class="comEdit">'+'<img src="'+'<c:url value="/resources/usr/images/btn_edit.gif" />'+'" alt="modify">'+'</a></div>';
						html = html+'      <div class="commentDel"><a href="'+item.replyID+'" class="comDel">'+'<img src="'+'<c:url value="/resources/usr/images/btn_del.gif" />'+'" alt="delete">'+'</a></div>';
						}
						
			   		});
				
					$delEle.html(html); /// modify end
				},
				beforeSend : function() {
					//처리중 화면구성
				},
				error : function() {
					alert("update false!");
				} 					
		});	
		
	});
	
	var checkHtml = "";
	/// comment edit
	$(".comEdit").live("click",function(e){
		e.preventDefault();
		
		var $delEle = $(this).closest(".commentList");

		var editHtml = "";
		//html pre tab del
		var replyCont = $delEle.find(".commentCont").html()
		replyCont = replyCont.replace("<pre>","");
		replyCont = replyCont.replace("</pre>","");
		
		editHtml = editHtml+'<div class="commentContEdit">';
		editHtml = editHtml+'	<textarea name="comment" class="commentTboxEdit require" title="Please register to comment." maxlength="400">'+replyCont+'</textarea>';
		editHtml = editHtml+'	<div class="editBtn"><a href="#" class="comCancel">Cancel</a><a href="'+$delEle.find(".comEdit").attr("href")+'" class="secondBtn comSave">Save</a></div>';
		editHtml = editHtml+'</div>';
		
		$('input[name="replyID"]').val($delEle.find(".comEdit").attr("href"));
		checkHtml = $delEle.html(); //click시 기억하고 있음
		$delEle.html(editHtml);

	});
	//comment cancle
	$(".comCancel").live("click",function(e){
		e.preventDefault();
	
		var $delEle = $(this).closest(".commentList");
		$delEle.html(checkHtml);

	});

	$(".commentBtn").click(function(e){
		
		e.preventDefault();
		$('input[name="replyID"]').val(''); // replyID empty
		var $delEle = $(this).closest(".commentWrite");
		var $checkVal = $delEle.find(".require");
		if(!$checkVal.val() || $checkVal.val().trim().length == 0){
			alert("These are mandatory fields");
			$checkVal.focus();
			return false;
		}
		
		var $frm = $(this).closest("form");
		
		$.ajax({
			url: '${pageContext.request.contextPath}/usrFree/replyInsert',
			type: 'post',
			data : $frm.serialize(),
			dataType:"json",
			success: function(data) {
				var html = '';
				
					$.each(data.itmes, function(i,item){
							
						///html escape
						var frstRgstUserID = item.frstRgstUserID ;
						frstRgstUserID = frstRgstUserID.replace(/</gi,"&lt;");
						frstRgstUserID = frstRgstUserID.replace(/>/gi,"&gt;");
						var replyCont = item.replyCont;
						
						//html pre tab del
						replyCont = replyCont.replace("<pre>","");
						replyCont = replyCont.replace("</pre>","");
						replyCont = replyCont.replace(/</gi,"&lt;");
						replyCont = replyCont.replace(/>/gi,"&gt;");
						
						html = html+'<article class="commentList">';
						html = html+'      <header class="commentH"><span class="commName">'+frstRgstUserID+'</span><span class="commDate">'+item.frstRgstDT+'</span></header>';
						html = html+'      <div class="commentCont"><pre>'+replyCont+'</pre></div>';
						if(item.frstRgstUserID=='${requestMap.frstRgstUserID}'){
						html = html+'	   <div class="commentEdit"><a href="'+item.replyID+'" class="comEdit">'+'<img src="'+'<c:url value="/resources/usr/images/btn_edit.gif" />'+'" alt="modify">'+'</a></div>';
						html = html+'      <div class="commentDel"><a href="'+item.replyID+'" class="comDel">'+'<img src="'+'<c:url value="/resources/usr/images/btn_del.gif" />'+'" alt="delete">'+'</a></div>';
						}
						html = html+'</article>';
			   		});
					$(".commentBoxArea").append(html);
					$('textarea[name="replyCont"]').val('');
					
				},
				beforeSend : function() {
					//처리중 화면구성
				},
				error : function() {
					alert("insert false!");
				} 					
		});	

		
		
	});

});

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
	<form name="command" id="command">
	<input type="hidden" name="serTxt" value="${requestMap.serTxt}">
	<input type="hidden" name="replyID" value="">
	<input type="checkbox" name="del" value="0" checked style="display:none;">
 <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox">
        <h2 class="titleCommu"><img src="<spring:message code="img.free_title" text=""/>" alt="community" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.free_title,txt1" />" alt="CBC members are at liberty to talk and communicate on this board." /></p>
        <!-- div class="boardMainBtn"><a href="${pageContext.request.contextPath }/usrFree/list?serTxt=${requestMap.serTxt}" class="rightBtn  mt20"><span class="btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
        <c:if test="${nextMap.boardID != null}"> 
        	<a href="${pageContext.request.contextPath }/usrFree/read?boardID=${nextMap.boardID}&serTxt=${requestMap.serTxt}" class="btnViewN"><img src="<c:url value='/resources/usr/images/btn_next.png' />" alt="next"></a>
        </c:if>
        <c:if test="${prevMap.boardID != null}">
        	<a href="${pageContext.request.contextPath }/usrFree/read?boardID=${prevMap.boardID}&serTxt=${requestMap.serTxt}" class="btnViewP"><img src="<c:url value='/resources/usr/images/btn_prev.png' />" alt="prev"></a>
        </c:if>
        </div -->
      </div>
      <!--게시판 영역 시작-->
      <div role="main" class="subConBox">
        <article class="boardView01">
          <header class="viewHeader"><h1><c:out value="${command.boardSubj }" /></h1></header>
          <div class="viewInfo"><span class="name"><c:out value="${command.frstRgstName }" /></span><span class="date">${command.frstRgstDT }</span></div>
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
			<pre><c:out value="${command.boardCont }" /></pre>
          </div>
        </article>
        <section>
          <div class="commentTitle"><c:if test="${command.replyCnt != 0}"><h3><spring:message code="board.column_comment" text=""/></h3><span class="commentNum">[${command.replyCnt}]</span></c:if></a></div>
          <div class="commentBox">
          	<div class="commentBoxArea">
            <c:forEach var="resultObject" items="${replyList}">
	          	<article class="commentList">
	              <header class="commentH"><span class="commName"><c:out value="${resultObject.frstRgstUserID}" /></span><span class="commDate">${resultObject.frstRgstDT}</span></header>
	              <div class="commentCont"><pre><c:out value="${resultObject.replyCont}" /></pre></div>
	              <c:if test="${requestMap.frstRgstUserID != null && requestMap.frstRgstUserID==resultObject.frstRgstUserID }">
	              <div class="commentEdit"><a href="${resultObject.replyID}" class="comEdit"><img src="<c:url value='/resources/usr/images/btn_edit.gif' />" alt="modify"></a></div>
	              <div class="commentDel"><a href="${resultObject.replyID}" class="comDel"><img src="<c:url value='/resources/usr/images/btn_del.gif' />" alt="delete"></a></div>
            	  </c:if>
            	</article>
	        </c:forEach>
	        </div>
	        <!--댓글수정
            <article class="commentList">
              <div class="commentContEdit">
              	<textarea name="" class="commentTboxEdit" title="Please register to comment.">Too, congratulations.</textarea>
                <div class="editBtn"><a href="#" class="comCancel">Cancel</a><a href="#" class="secondBtn comSave">Save</a></div>
              </div>
            </article>
             start-->
            <!--댓글수정end-->
            <div class="commentWrite mt15">
            <textarea name="replyCont" class="commentTbox require" title="Please register to comment." maxlength="400"></textarea>
            <a href="#" class="commentBtn"><span class="btnBase iconCom"><spring:message code="board.btn_comments" text=""/></span></a>
            </div>
           
          </div>
        </section>
        <div class="boardBtnLine pb20">
          <a href="${pageContext.request.contextPath }/usrFree/?flag=w&serTxt=${requestMap.serTxt}" class="rightBtn"><span class="btnBase iconPen"><spring:message code="board.btn_writing" text=""/></span></a>
 		  <c:if test="${requestMap.frstRgstUserID != null && requestMap.frstRgstUserID==command.frstRgstUserID }">	
	      <a href="javascript:doSubmit('${pageContext.request.contextPath }/usrFree/delete?del=${command.boardID}', 'command', 'post');" class="rightBtn delPop"><span class="btnBase iconGar"><spring:message code="board.btn_delete" text=""/></span></a>
	      <a href="${pageContext.request.contextPath }/usrFree/edit?flag=e&serTxt=${requestMap.serTxt}&boardID=${command.boardID}" class="rightBtn"><span class="btnBase iconEra"><spring:message code="board.btn_adjust" text=""/></span></a>
          </c:if>
        </div>
        <nav class="bottomNavi">
          <ul>
          <c:if test="${prevMap.boardID != null}">
            <li><a href="${pageContext.request.contextPath }/usrFree/read?boardID=${prevMap.boardID}&serTxt=${requestMap.serTxt}"><span class="wayMarkP"><spring:message code="board.btn_previous" text=""/></span><span class="listTitle">${prevMap.boardSubj}</span><c:if test="${prevMap.replyCnt == null}"><span class="commNum">[${prevMap.replyCnt}]</span></c:if></a></li>
          </c:if>
          <c:if test="${nextMap.boardID != null}"> 
            <li><a href="${pageContext.request.contextPath }/usrFree/read?boardID=${nextMap.boardID}&serTxt=${requestMap.serTxt}"><span class="wayMarkN"><spring:message code="board.btn_next" text=""/></span><span class="listTitle">${nextMap.boardSubj}</span><c:if test="${nextMap.replyCnt == null}"><span class="commNum">[${nextMap.replyCnt}]</span></c:if></a></li>
          </c:if>
          </ul>
        </nav>
        
        <div class="boardBtnNotice">
          <a href="${pageContext.request.contextPath }/usrFree/list?serTxt=${requestMap.serTxt}" class="rightBtn"><span class="btnBase btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
        </div>
         
      </div>
    </div>
  </div>
  
   </form>
