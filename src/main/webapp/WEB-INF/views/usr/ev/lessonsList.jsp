<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>


<script>
$(document).ready(function() {  

    //select all the a tag with name equal to modal
/*     $('a[name=modal]').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();
        
        //Get the A tag
        var id = $(this).attr('href');
        $('input[name=useHsID]').val($(this).attr('useID'));
    
        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
    
        //Set heigth and width to mask to fill up the whole screen
        $('#popMask').css({'width':maskWidth,'height':maskHeight});
        
        //transition effect     
        $('#popMask').fadeTo("fast",0.6);   
    
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
              
        //Set the popup window to center
        $(id).css('top',  winH/2-$(id).height()/2);
        $(id).css('left', winW/2-$(id).width()/2);
    
        //transition effect
        $(id).fadeIn(10); 
    
    }); */
    
    //if close button is clicked
    $('.recordPopup01 .close').click(function (e) {
        //Cancel the link behavior
        e.preventDefault();
        
        $('#popMask').hide();
        $('.recordPopup01').hide();
    });     
    
    //if mask is clicked
    $('#popMask').click(function () {
        $(this).hide();
        $('.recordPopup01').hide();
    });         

    $(window).resize(function () {
     
        var box = $('#boxes .recordPopup01');
 
        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
      
        //Set height and width to mask to fill up the whole screen
        $('#popMask').css({'width':maskWidth,'height':maskHeight});
               
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();

        //Set the popup window to center
        box.css('top',  winH/2 - box.height()/2);
        box.css('left', winW/2 - box.width()/2);
     
    });
    
});

</script>
<!--radio checked style-->
<script language="javascript">
$(function(){

    $("input:checked").next().addClass('chkselect');  
 
    $(":checkbox").click(function(){     
        if($(this).is(":checked")){  
            $(this).next().addClass('chkselect');   
        } else {
            $(this).next().removeClass('chkselect');      
        }
    });
  
    $(":radio").click(function(){ 
        $(":radio").each(function(){
            $(this).next().removeClass('chkselect'); 
        })
        $(this).next().addClass('chkselect');  
    });
});
</script>

<script type="text/javascript">

function updateUseHs(url,actionName){
	
	if($(':radio[name=popSelect]:checked').val() != $('input[name=cmplYn]').val()){
		$('input[name=updateCmplYn]').val($(':radio[name=popSelect]:checked').val());
		doSubmit(url,actionName);
	} else {
	    $('#popMask').hide();
	    $('.recordPopup01').hide();
	}
	
}


function selectTab(url,flag){
	if("progress" == flag){
		$('input[name=cmplYn]').val("S");
	} else if("completed") {
        $('input[name=cmplYn]').val("E");
	}
	
	doSubmit(url,"lessonsList");
	
	/*  $.ajax({
	      type    : "GET",
	      url     : "${pageContext.request.contextPath }/restful/smartClass/lessonsListCmplYn",
	      dataType: "json",
	      data: ({
	          userID : $("input[name=userID]").val(),
	          cmplYn : cmplYn
	      }),
	      success : function(data){
	    	  var str = "";
	          $.each(data.itmes, function(i,item){
	             str += "<tr>";
	             str += "<td class='subj'><a href='#dialog' name='modal'><img src='<c:url value='/resources/usr/images/learning/ico_star01.png' />' alt='Complete'></a></td>";
	             str += "<td><p class='conLine01'>["+item.PARENT_NAME+"]<span class='eng'>"+item.NAME+"</span></p>";
	             str += "<p class='conLine02'>"+item.CNTS_NAME+"</p></td>";
	             str += "<td class='date'>"+item.LAST_CRCT_DT+"</td>";
	             str += "<td class='subj'><a href='#'><img src='<c:url value='/resources/usr/images/learning/btn_play.png' />' alt='play'></a></td>";
	             str += "</tr>";
	             
	          });
	          $('#lessonsListTbody').html(str);
	      },
	      error : function(request,status,error){ 
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	     
	    }); */
}
    
function doSubmit(url,actionName,value,autoPlayFlag) {
    f = document.forms[0];
    if ("calendar" == actionName) {
        f.method="post";
    } else if ("lessonsList" == actionName) {
    	$('select[name=cSrvcID]').val($('input[name=pageCsrvcID]').val());
        f.method="post";
    } else if ("search" == actionName) {
    	$('#currentPage').val("1");
    	f.method="post";
    } else if ("read" == actionName) {
        f.method="post";
        $('input[name=currentPage]').val("1");
        $('input[name=itemID]').val(value);
        $('input[name=autoPlayFlag]').val(autoPlayFlag);
    } else if ("list" == actionName) {
        f.method="post";
        $('input[name=srvcID]').val(value);
    } else if ("update" == actionName) {
        f.method="post";
    } 
    f.action = url;
    f.submit();
}
    
</script>
<form method="post">
    <!--pop up start-->
    <div id="boxes">
      <div id="dialog" class="recordPopup01">
       <h2>Course status changes</h2>
       <div class="popCont">Are you sure you want to change the status of the course?</div>
       <div class="popSel">
         <input id="progressSel" name="popSelect" type="radio" value="S" <c:if test="${cmplYn eq 'S'}"> checked</c:if>><label class="pro" for="progressSel">PROGRESS</label>
         <input id="completeSel" name="popSelect" type="radio" value="E" class="pl10" <c:if test="${cmplYn eq 'E'}"> checked</c:if>><label class="com" for="completeSel">COMPLETE</label>
       </div>
       <div class="popupPage">
         <a href="javascript:updateUseHs('${pageContext.request.contextPath }/usr/englishVillage/update','update')" class="btnNumOn">OK</a>
         <a href="#" class="btnNum close">Close</a>
       </div>
      </div>
      <div id="popMask"></div>
    </div>
    <!--pop up end-->

<!-- ************************************************************ -->  
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
<input type="hidden" name="userID" value="${userID }" />  
<input type="hidden" name="itemID" value="" />
<input type="hidden" name="useHsID" value="" />
<input type="hidden" name="srvcID" value="${searchSrvcID }" />
<input type="hidden" name="cmplYn" value="${cmplYn }" />
<input type="hidden" name="updateCmplYn" value="" />
<input type="hidden" name="autoPlayFlag" value="" />
<input type="hidden" name="pageCsrvcID" value="${pageCsrvcID }" />
<input type="hidden" name="pageName" value="/usr/englishVillage/lessonsList" />
<input type="hidden" name="lang" value="${lang }" />
<input type="hidden" name="langType" value="${langType }" />
    <div class="engCont">
      <div class="recordTitle">
        <hgroup class="lessonRecH typeEv">
          <h2><spring:message code="englishvill.myhistory_title" text=""/></h2>
          <h3><spring:message code="englishvill.myhistory_text,p_1" text=""/></h3>
        </hgroup>
        <div class="btnView"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/calendar','calendar')"><img src="<spring:message code="img.smart_calendar_btn" text=""/>" alt="Calendar View"></a></div>
      </div>
      <div class="recordTabEv">
        <ul>
          <li><a href="#" class="tabOn typeOne"><span class="bLine"><spring:message code="englishvill.title_completed" text=""/></span></a></li>
          <!--<li><a href="#">Download Box</a></li>-->
        </ul>
      </div>

      <div class="recordCont">
        <div class="recSelect">
          <fieldset>
          <legend>Category,subject selcect</legend>
          
            <label for="select01"><spring:message code="englishvill.myhistory_category" text=""/></label>
            <select id="select01" name="cSrvcID" class="selBox1 wid170">
            <option value="22" <c:if test="${param.srvcID eq '22'}"> <c:out value="selected" /></c:if> >All</option>
            <c:forEach var="category" items="${categoryList}">
            <option value="<c:out value='${category.NODE_CATEGORY }'/>" <c:if test="${param.cSrvcID eq category.NODE_CATEGORY}"> <c:out value="selected" /></c:if> >${category.SRVC_CTGR_NM }</option>
            </c:forEach>
            </select>
            
            <input type="button" class="btnSearch" value="search" title="search" onclick="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/lessonsList','search')"/>
            
          </fieldset>
        </div>
        <div class="recInfo">
          <ul>
            <li><img src="<c:url value='/resources/usr/images/learning/ico_star01.png' />" alt="Completed icon"><spring:message code="englishvill.title_completed" text=""/></li>
          </ul>
          <p class="infoTxt"></p>
          <div class="boardTotal"><spring:message code="smart.total_btn_title" text=""/> : <span class="num">${fn:length(lessonsList) }</span></div>
        </div>
        <div class="recordList">
        <table summary="Lesson record list" class="smartBoard01">
		  <caption>
		    Lesson record list
		  </caption>
		  <colgroup>
		    <col>
		    <col style="width:490px">
		    <col style="width:75px">
		    <col style="width:110px">
		  </colgroup>
		  <thead>
		    <tr>
		      <th scope="col"><spring:message code="smart.column_state" text=""/></th>
		      <th scope="col"><spring:message code="smart.column_title" text=""/></th>
		      <th scope="col"><spring:message code="smart.column_date" text=""/></th>
		      <th scope="col" class="lastTh"><spring:message code="smart.column_play" text=""/></th>
		    </tr>
		  </thead>
		  <tbody id="lessonsListTbody">
		    <c:if test="${lessonsList == null || fn:length(lessonsList) == 0}">
		        <tr><td colspan="4" class="noPost"><spring:message code="learningse.p_3" text=""/></td></tr><!--말레이 Tiada sejarah.-->
		    </c:if>  
		  
		    <c:forEach var="lessons" items="${lessonsList}" varStatus="status"
		                        begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*5 -5 }"
		                        end="${currentPage == null ? 0 : currentPage*5 -1 }" step="1">
		    <tr>
		      <td class="subj">
		      <c:choose>
		        <c:when test="${lessons.CMPL_YN == 'E' }"><img src="<c:url value='/resources/usr/images/learning/ico_star01.png' />" alt="Complete" title="Complete"></c:when>
		      </c:choose>
		      </td>
		      <td><p class="conLine01">[${lessons.PARENT_NAME }]<span class="eng">${lessons.NAME }</span></p>
		        <p class="conLine02"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/read','read','${lessons.ITEM_ID }','false')"><c:out value="${lessons.CNTS_NAME }" /></a></p></td>
		      <td class="date"><c:out value="${lessons.LAST_CRCT_DT }" /></td>
		      <td class="subj"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/read','read','${lessons.ITEM_ID }','true')"><img src="<c:url value='/resources/usr/images/learning/btn_play.png' />" alt="play"></a></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
        <!--페이지 최대 갯수는 5개-->
        <div class="boardListPage">
                <nav:pageNavi
                    doSubmit="doSubmit('${pageContext.request.contextPath }/usr/englishVillage/lessonsList','lessonsList');"
                    pageList="${lessonsList}" tabSize="5" sortOf="smart" />
        </div>
      </div>
      </div>
    </div>
<!-- ************************************************************ -->
</form>