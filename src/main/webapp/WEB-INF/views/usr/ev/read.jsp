<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                poster: "${pageContext.request.contextPath }/resources/usr/images/learning/poster_ev.png"
            });
        },
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
        url     : "${pageContext.request.contextPath }/restful/englishVillage/insertUseHS",
        dataType: "json",
        data: ({
            itemID : $('input[name=itemID]').val(),
            godsID : $('input[name=godsID]').val(),
            userID : $('input[name=userID]').val()
        }),
        success : function(data){
            /* alert("OK"); */
            /* $("#jquery_jplayer_1").jPlayer("play",0); */
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
        $('input[name=srvcID]').val($('input[name=pageSrvcID]').val());
    } else if ("read" == actionName) {
        f.method="post";
        $('input[name=assetID]').val(value);
    }
    f.action = url;
    f.submit();
}
</script>

<form>
    <input type="hidden" id="currentPage" name="currentPage" value="${currentPage }" />
    <input type="hidden" id="videoFile" value="${video }" />
    <input type="hidden" name="srvcID" value="${srvcID }" />
    <input type="hidden" name="pageSrvcID" value="${pageSrvcID }" />  
    <input type="hidden" name="userID" value="${userID }" />  
    <input type="hidden" name="itemID" value="${asset.ITEM_ID}" />  
    <input type="hidden" name="godsID" value="${asset.GODS_ID}" />  
    <input type="hidden" name="playFlag" value="nonPlay" />
    <input type="hidden" name="autoPlayFlag" value="${autoPlayFlag}" />
    <input type="hidden" name="pageName" value="/usr/englishVillage/read" />
    <input type="hidden" name="lang" value="${lang }" />
    <input type="hidden" name="langType" value="${langType }" />
    
    <div class="engCont">
      <hgroup class="engViewH">
        <h2><c:out value="${asset.SRVC_CTGR_NM }" /></h2>
        <h3><c:if test="${langType eq '00033' }"> <c:out value="${asset.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"> <c:out value="${asset.ITEM_03 }" /></c:if></h3>
      </hgroup>
      <section class="vodViewCont">
        <div class="vodVideo"> 
          <!--video player start-->
          <div id="jp_container_1" class="jp-video jp-video-360p">
            <div class="jp-type-single">
              <div id="jquery_jplayer_1" class="jp-jplayer"></div>
              <div class="jp-gui">
                <div class="jp-video-play"> <a href="javascript:;" class="jp-video-play-icon" tabindex="1">play</a> </div>
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
        <div class="vodInfo">
          <div class="vodInfoBox">
            <div class="photo">
            <c:choose>
            <c:when test="${fn:length(fileList) ne 0 }">
            <c:forEach var="file" items="${fileList }">
            <c:choose>
            <c:when test="${file.FILE_TYPE eq 'cover' }">
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
            <div class="infoTxt">
              <p><strong>Title :</strong> <span class="title"><c:if test="${langType eq '00033' }"> <c:out value="${asset.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"> <c:out value="${asset.ITEM_03 }" /></c:if></span></p>
              <p class="headT"><strong>Run Time :</strong> <c:out value="${asset.ITEM_04 }" /> </p>
              <p><strong>Plot Summary :</strong></p>
              <pre><c:if test="${langType eq '00033' }"> <c:out value="${asset.ITEM_08 }" /></c:if><c:if test="${langType eq '00034' }"> <c:out value="${asset.ITEM_08 }" /></c:if></pre>
<!--                 Pride Lands peaceful kingdom of Africa.Simba is born here over the lion warrior son of the wave.<br>
                Mingle friend Nala and Simba wants to be a king like his father as soon as possible.<br>
                On the other hand, the king's half-brother, Scar, his warrior par in order to occupy the throne, my sins eyeing. Magazine Simba escaped death a...</p> -->
            </div>
          </div>
        </div>
        <div class="listBtn"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/list','list','${srvcID }')"><span>View List</span></a></div>
      </section>
    </div>
</form>