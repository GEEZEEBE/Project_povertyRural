<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>



<script>
$(document).ready(function() {  

    //select all the a tag with name equal to modal
    $('a[name=modal]').click(function(e) {
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
    
    });
    
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
    selectCategory();
    
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

function selectCategory(){

    var srvcId = $('select[name=pSrvcID]').val();
    var subSrvcId = $('input[name=subSrvcID]').val();
    
    $.ajax({
        type    : "GET",
        url     : "${pageContext.request.contextPath }/ws/common/categoryList",
        dataType: "json",
        data: ({
            srvcID : srvcId,
        }),
        success : function(data){
            var str = "<option value='"+srvcId+"'>All</option>";
            if("3"!=srvcId){
                $.each(data.itmes, function(i,item){
                    if(subSrvcId == item.NODE_CATEGORY){
                        str = str + "<option value='"+item.NODE_CATEGORY+"' selected='selected'>"+item.SRVC_CTGR_NM+"</option>";
                    }else{
                        str = str + "<option value='"+item.NODE_CATEGORY+"'>"+item.SRVC_CTGR_NM+"</option>";
                    }
                });
            }
            $('select[name=cSrvcID]').html(str);
            
        },
        error : function(request,status,error){ 
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
       
     });
}


    
function doSubmit(url,actionName,value,autoPlayFlag) {
    f = document.forms[0];
    if ("calendar" == actionName) {
        f.method="post";
    } else if ("lessonsList" == actionName) {
    	
        $('select[name=pSrvcID]').val($('input[name=pagePsrvcID]').val());
        $('select[name=cSrvcID]').val($('input[name=pageCsrvcID]').val());
    	
        f.method="post";
    } else if ("read" == actionName) {
        f.method="post";
        $('input[name=currentPage]').val("1");
        $('input[name=itemID]').val(value);
        $('input[name=autoPlayFlag]').val(autoPlayFlag);
        
    } else if ("list" == actionName) {
        f.method="post";
        $('input[name=srvcID]').val(value);
    } else if ("search" == actionName){
    	$('#currentPage').val("1");
    	f.method="post";
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
       <h2><spring:message code="smart.status_changes_title" text=""/></h2>
       <div class="popCont">Are you sure you want to change the status of the lesson?</div>
       <div class="popSel">
         <input id="progressSel" name="popSelect" type="radio" value="S" <c:if test="${cmplYn eq 'S'}"> checked</c:if>><label class="pro" for="progressSel"><spring:message code="smart.inprogress" text=""/></label>
         <input id="completeSel" name="popSelect" type="radio" value="E" class="pl10" <c:if test="${cmplYn eq 'E'}"> checked</c:if>><label class="com" for="completeSel"><spring:message code="smart.completed" text=""/></label>
       </div>
       <div class="popupPage">
         <a href="javascript:updateUseHs('${pageContext.request.contextPath }/usr/smartClass/update','update')" class="btnNumOn"><spring:message code="smart.status_pop_btn_ok" text=""/></a>
         <a href="#" class="btnNum close"><spring:message code="smart.status_pop_btn_close" text=""/></a>
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
<input type="hidden" name="subSrvcID" value="${param.cSrvcID }" />

<input type="hidden" name="srvcID" value="${searchSrvcID }" />
<input type="hidden" name="autoPlayFlag" value="" />
<input type="hidden" name="cmplYn" value="${cmplYn }" />
<input type="hidden" name="pagePsrvcID" value="${pagePsrvcID }" />
<input type="hidden" name="pageCsrvcID" value="${pageCsrvcID }" />
<input type="hidden" name="updateCmplYn" value="" />
<input type="hidden" name="pageName" value="/usr/smartClass/lessonsList" />
<input type="hidden" name="lang" value="${lang }" />
<input type="hidden" name="langType" value="${langType }" />

    <div class="smartCont" role="main">
      <div class="recordTitle">
        <hgroup class="lessonRecH">
          <h2><spring:message code="menu.sitemap_myhistory" text=""/></h2>
          <h3><spring:message code="smart.myhistory_text,p_1" text=""/></h3>
        </hgroup>
        <div class="btnView"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/calendar','calendar')"><img src="<spring:message code="img.smart_calendar_btn" text=""/>" alt="Calendar View"></a></div>
      </div>
      <div class="recordTab">
        <ul>
          <li><a id="progressTab" href="javascript:selectTab('${pageContext.request.contextPath }/usr/smartClass/lessonsList','progress');" <c:if test="${cmplYn eq 'S'}"> class="tabOn"</c:if>><spring:message code="smart.myhistory_teb1" text=""/></a></li>
          <li><a id="completedTab" href="javascript:selectTab('${pageContext.request.contextPath }/usr/smartClass/lessonsList','completed');" <c:if test="${cmplYn eq 'E'}"> class="tabOn"</c:if>><spring:message code="smart.myhistory_teb2" text=""/></a></li>
        </ul>
      </div>
      <div class="recordCont">
        <div class="recSelect">
          <fieldset>
          <legend>Category,subject selcect</legend>
          
            <label for="select01"><spring:message code="smart.myhistory_category" /></label>
            <select id="select01" name="pSrvcID" class="selBox1 wid170" onchange="javascript:selectCategory();">
            <option value="3" <c:if test="${param.pSrvcID eq '3'}"> <c:out value="selected" /></c:if> >All</option>
            <c:forEach var="category" items="${categoryList}">
            <option value="<c:out value='${category.NODE_CATEGORY }'/>" <c:if test="${param.pSrvcID eq category.NODE_CATEGORY}"> <c:out value="selected" /></c:if> >${category.SRVC_CTGR_NM }</option>
            </c:forEach>
            </select>
           
            <label for="select02" class="sel02"><spring:message code="smart.column_subject" /></label>
            <select id="select02" name="cSrvcID" class="selBox1 wid130">
              <option value="3">All</option>
              <!-- <option>all</option> -->
            </select>
            
            <input type="button" class="btnSearch" value="search" title="search" onclick="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/lessonsList','search')"/>
            
          </fieldset>
        </div>
        <div class="recInfo">
          <ul>
            <li><img src="<c:url value='/resources/usr/images/learning/ico_star02.png' />" alt="In progress icon"><spring:message code="smart.inprogress" text=""/></li>
            <li><img src="<c:url value='/resources/usr/images/learning/ico_star01.png' />" alt="Completed icon"><spring:message code="smart.completed" text=""/></li>
          </ul>
          <p class="infoTxt"><spring:message code="smart.change_lesson" text=""/></p>
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
    <%-- <tr>
      <td class="subj"><a href="#dialog" name="modal"><img src="<c:url value='/resources/usr/images/learning/ico_star01.png' />" alt="Complete"></a></td>
      <td><p class="conLine01">[YEAR 4]<span class="eng">English</span></p>
        <p class="conLine02">Lesson 1. How Are You? [STEP 1 - 1] expressed How Are Youressed Learn Lesson 1. How Are You? [STEP 1 - 1] expressed How Are Youressed Learn</p></td>
      <td class="date">13/01/14</td>
      <td class="subj"><a href="#"><img src="<c:url value='/resources/usr/images/learning/btn_play.png' />" alt="play"></a></td>
    </tr> --%>
    <c:if test="${lessonsList == null || fn:length(lessonsList) == 0}">
        <tr><td colspan="4" class="noPost"><spring:message code="learningse.p_3" text=""/></td></tr><!--말레이 Tiada sejarah.-->
    </c:if>
    
    <c:forEach var="lessons" items="${lessonsList}" varStatus="status"
                        begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*5 -5 }"
                        end="${currentPage == null ? 0 : currentPage*5 -1 }" step="1">
    <tr>
      <td class="subj">
      <c:choose>
        <c:when test="${lessons.CMPL_YN == 'E' }"><a href="#dialog" name="modal" useID="${lessons.USE_HS_NMBR_ID }"><img src="<c:url value='/resources/usr/images/learning/ico_star01.png' />" alt="Complete" title="Complete"></a></c:when>
        <c:when test="${lessons.CMPL_YN == 'S' }"><a href="#dialog" name="modal" useID="${lessons.USE_HS_NMBR_ID }"><img src="<c:url value='/resources/usr/images/learning/ico_star02.png' />" alt="In progress" title="In progress"></a></c:when>
        <c:when test="${empty lessons.CMPL_YN }"><a href="#dialog" name="modal" useID="${lessons.USE_HS_NMBR_ID }"><img src="<c:url value='/resources/usr/images/learning/ico_star03.png' />" alt="No state" title="No state"></a></c:when>
      </c:choose>
      </td>
      <td><p class="conLine01">[<c:out value="${lessons.PARENT_NAME }" />]<span class="eng"><c:out value="${lessons.NAME }" /></span></p>
        <p class="conLine02"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/read','read','${lessons.ITEM_ID }','false')"><c:if test="${langType eq '00033' }"><c:out value="${lessons.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"><c:out value="${lessons.ITEM_03 }" /></c:if></a></p></td>
      <td class="date"><c:out value="${lessons.LAST_CRCT_DT }" /></td>
      <td class="subj"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/read','read','${lessons.ITEM_ID }','true')"><img src="<c:url value='/resources/usr/images/learning/btn_play.png' />" alt="play"></a></td>
    </tr>
    </c:forEach>
    
<%--     <tr>
      <td class="subj"><a href="#dialog" name="modal"><img src="<c:url value='/resources/usr/images/learning/ico_star02.png' />" alt="Progress"></a></td>
      <td><p class="conLine01">[YEAR 4]<span class="eng">English</span></p>
        <p class="conLine02">Lesson 1. How Are You? [STEP 1 - 1] expressed How Are Youressed Learn Lesson 1. How Are You? [STEP 1 - 1] expressed How Are Youressed Learn</p></td>
      <td class="date">13/01/14</td>
      <td class="subj"><a href="#"><img src="<c:url value='/resources/usr/images/learning/btn_play.png' />" alt="play"></a></td>
    </tr>
    <tr>
      <td class="subj"><a href="#dialog" name="modal"><img src="<c:url value='/resources/usr/images/learning/ico_star03.png' />" alt="no state"></a></td>
      <td><p class="conLine01">[YEAR 4]<span class="sci">Science</span></p>
        <p class="conLine02">Lesson 1. How Are You? [STEP 1 - 1] expressed How Are Youressed Learn Lesson 1. How Are You? [STEP 1 - 1] expressed How Are Youressed Learn</p></td>
      <td class="date">13/01/14</td>
      <td class="subj"><a href="#"><img src="<c:url value='/resources/usr/images/learning/btn_play.png' />" alt="play"></a></td>
    </tr> --%>

  </tbody>
</table>
        <!--페이지 최대 갯수는 5개-->
        <div class="boardListPage">
                <nav:pageNavi
                    doSubmit="doSubmit('${pageContext.request.contextPath }/usr/smartClass/lessonsList','lessonsList');"
                    pageList="${lessonsList}" tabSize="5" sortOf="smart" />
        </div>
      </div>
      </div>
    </div>
<!-- ************************************************************ -->
</form>
