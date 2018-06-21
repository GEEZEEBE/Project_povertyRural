<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<script type="text/javascript" src="<c:url value="/resources/usr/js/all.js" />"></script>
<link href="<c:url value="/resources/usr/css/video.css" />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/usr/js/jquery-1.6.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/usr/js/jquery.jplayer.min.js" />"></script>
<script type="text/javascript">
document.oncontextmenu=new Function('return false');
//<![CDATA[
$(document).ready(function(){
	
    $("#jquery_jplayer_1").jPlayer({
        ready: function () {
            $(this).jPlayer("setMedia", {
                m4v: $('#videoFile').val(),
                poster: "${pageContext.request.contextPath }/resources/usr/images/learning/poster_sc.png"
            });
        },
        preload: "metadata",
        swfPath: "js",
        supplied: "ogv, m4v",
        size: {
            width: "640px",
            height: "360px",
            cssClass: "jp-video-360p"
        }
    });
    
    $('.jp-video-play-icon').click(function(){
    	
    	if(navigator.onLine == false){
    		if($('input[name=lang]').val()=='en'){
                alert("Lost Internet connection\nPlease check your network conditions");
            }else{
                alert("Sambungan Internet terputus\nSila semak tetapan rangkaian anda.");
            }
            return;
        }
    	
    	$('input[name=playFlag]').val("play");
    	inserUsrHS();
    });
    $('.jp-play').click(function(){
    	
    	if(navigator.onLine == false){
    		if($('input[name=lang]').val()=='en'){
                alert("Lost Internet connection\nPlease check your network conditions");
            }else{
                alert("Sambungan Internet terputus\nSila semak tetapan rangkaian anda.");
            }
            return;
        }
    	
    	if($('input[name=playFlag]').val()=="nonPlay"){
    		$('input[name=playFlag]').val("play");
            setTimeout("inserUsrHS()",500);
    	}
    	
    });
    
    if($("input[name=autoPlayFlag]").val() == "true"){
        $('.jp-play').click();
    }
    
    
});
//]]>
function inserUsrHS(){
 	$.ajax({
        type    : "GET",
        url     : "${pageContext.request.contextPath }/restful/smartClass/insertUseHS",
        dataType: "json",
        data: ({
            itemID : $('input[name=itemID]').val(),
            godsID : $('input[name=godsID]').val(),
            userID : $('input[name=userID]').val()
        }),
        success : function(data){
        	/* alert("OK"); */
        	if($('input[name=autoPlayFlag]').val() == 'true'){
        	 $("#jquery_jplayer_1").jPlayer("play",0);
        	}
        },
        error : function(request,status,error){ 
        	/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
        }
      }); 
}

function doSubmit(url,actionName,value) {
    f = document.forms[0];
    if ("list" == actionName) {
        f.method="post";
        
        if("3"!=$('input[name=pageSrvcID]').val()){
            $('input[name=srvcID]').val($('input[name=pageSrvcID]').val());
        }
        
    } else if ("read" == actionName) {
        f.method="post";
        $('input[name=assetID]').val(value);
    }
    f.action = url;
    f.submit();
}

function testClick(){
	$("#jquery_jplayer_1").jPlayer("play");
}

</script>

<form>
    <input type="hidden" id="currentPage" name="currentPage" value="${currentPage }" />
    <input type="hidden" id="videoFile" value="${video }" />
    <input type="hidden" name="pageSrvcID" value="${pageSrvcID }" /> 
    <input type="hidden" name="srvcID" value="${srvcID }" />  
    <input type="hidden" name="userID" value="${userID }" />   
    <input type="hidden" name="itemID" value="${asset.ITEM_ID}" />  
    <input type="hidden" name="godsID" value="${asset.GODS_ID}" />  
    <input type="hidden" name="playFlag" value="nonPlay" />
    <input type="hidden" name="autoPlayFlag" value="${autoPlayFlag}" />
    <input type="hidden" name="pageName" value="/usr/smartClass/read" />
    <input type="hidden" name="lang" value="${lang }" />
    <input type="hidden" name="langType" value="${langType }" />
    
    <div class="smartCont" role="main">
      <hgroup class="lessonH">
        <h2><c:out value="${asset.SRVC_CTGR_NM }" /></h2>
        <h3><c:if test="${langType eq '00033' }"> <c:out value="${asset.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"> <c:out value="${asset.ITEM_03 }" /></c:if></h3>
      </hgroup>
      <section class="lessonCont">
        <div class="lessonVideo">
        <!--video player start-->
        <div id="jp_container_1" class="jp-video jp-video-360p">
            <div class="jp-type-single">
                <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                <div class="jp-gui">
                    <div class="jp-video-play">
                        <a href="javascript:;" class="jp-video-play-icon" tabindex="1">play</a>
                    </div>
                    <div class="jp-interface">
                        <div class="jp-progress">
                            <div class="jp-seek-bar">
                                <div class="jp-play-bar"></div>
                            </div>
                        </div>
                        <div class="jp-controls-holder">
                            <ul class="jp-controls">
                                <li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
                                <li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
                                <li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
                                <li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li>
                                <li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
                            </ul>
                            <div class="jp-volume-bar">
                              <div class="jp-volume-bar-value">
                                <div class="volume-icon"></div>
                              </div>
                            </div>
                            <div class="jp-current-time"></div>
                            <ul class="jp-toggles">
                                <li><a href="javascript:;" class="jp-full-screen" tabindex="1" title="full screen">full screen</a></li>
                                <li><a href="javascript:;" class="jp-restore-screen" tabindex="1" title="restore screen">restore screen</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--video player end-->
        </div>
        <div class="lessonTab">
          <ul>
            <li><a id="eduTab01"><spring:message code="smart.less_intro" text=""/></a></li>
            <li><a id="eduTab02"><spring:message code="smart.less_teacher" text=""/></a></li>
          </ul>
          <div id="eduCon01" class="lessonIntro" style="display:none;">
            <div class="classInfo">
            <c:choose>
            <c:when test="${langType eq '00033' }">
            <pre>${asset.ITEM_08 }</pre>
            </c:when>
            <c:otherwise>
            <pre>${asset.ITEM_09 }</pre>
            </c:otherwise>
            </c:choose>
              <!-- <p>- Matching students gain 100 points, tell secrets to a lecture.</p>
              <p>- Lectures every point, giving lectures to organize important information.</p>
              <p>- Grasp the context of the article, and the lectures that can help a variety of accidents.</p>
              <p>- Like the sun warm and heartwarming lesson.</p> -->
            </div>
          </div>
          <div id="eduCon02" class="lessonIntro" style="display:none;">
            <div class="teacherPhoto">
            <c:choose>
	            <c:when test="${fn:length(fileList) ne 0 }">
		            <c:forEach var="file" items="${fileList }">
		            <c:choose>
			            <c:when test="${file.FILE_TYPE eq 'instructor' }">
				            <c:choose>
				            <c:when test="${file.PHYSICAL_FILE_NAME eq null}">
				            <img src="<c:url value='/resources/usr/images/learning/noimg03.gif' />" alt="">
				            </c:when>
				            <c:otherwise>
				            <img src="${pageContext.request.contextPath }/learning/getImagePath?logFname=${file.LOGICAL_FILE_NAME}&phyFname=${file.PHYSICAL_FILE_NAME}" alt="">
				            </c:otherwise>
				            </c:choose>
			            </c:when>
			            
			            <c:otherwise>
			                <img src="<c:url value='/resources/usr/images/learning/noimg03.gif' />" alt="">
			            </c:otherwise>
			            
		            </c:choose>
		            </c:forEach>
	            </c:when>
	            
	            <c:otherwise>
	                <img src="<c:url value='/resources/usr/images/learning/noimg03.gif' />" alt="">            
	            </c:otherwise>
            </c:choose>
            </div>
            <div class="teacherInfo"><p><b><spring:message code="smart.less_teacher,name" text=""/></b> :  <span class="name"><c:out value="${assetChild.INSTRUCTOR_NAME_FIRST }" /> <c:out value="${assetChild.INSTRUCTOR_NAME_LAST }" /></span></p>
              <p><b><spring:message code="smart.less_teacher,major" text=""/></b> :  <c:out value="${assetChild.MAJOR }" /></p>
              <p><b><spring:message code="smart.less_teacher,education" text=""/></b> :  <c:out value="${assetChild.EDUCATION_QUALIFICATION }" /></p>
              <p><b><spring:message code="smart.less_teacher,period" text=""/></b> :  <c:out value="${assetChild.WORKING_PERIOD }" /> </p> 
              <p><b><spring:message code="smart.less_teacher,awards" text=""/></b> :</p><pre>${assetChild.HONORS_AND_AWARDS}</pre>
              <p><b><spring:message code="smart.less_teacher,other" text=""/></b> : </p><pre>${assetChild.OTHER }</pre>
            </div>
          </div>
        <script type="text/javascript">new Tab([["eduTab01","eduCon01"],["eduTab02","eduCon02"]],"click","on",1);</script>
        </div>
        <div class="lessonBtn"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','${srvcID }')"><span><spring:message code="smart.less_viewlist" text=""/></span></a></div>
      </section>
    </div>
</form>