<%@ page contentType="text/html; charset=UTF-8" 
			import="com.skt.mars.adm.co.*, java.util.*"
%>
<%
	Guide guide = (Guide)request.getAttribute("command");	
	//Map requestMap = (Map)request.getAttribute("requestMap");
	//String autoplay = (String)requestMap.get("autoplay");
	
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>
<link href="<c:url value='/resources/usr/css/uzen.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/usr/css/video.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/resources/usr/js/jquery.jplayer.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>


<script type="text/javascript">
//<![CDATA[ 
$(document).ready(function(){

	$("#jquery_jplayer_1").jPlayer({
		ready: function () {
			$(this).jPlayer("setMedia", {
				m4v: "${video}",
				//ogv: "http://www.jplayer.org/video/ogv/Big_Buck_Bunny_Trailer.ogv",
				//webmv: "http://www.jplayer.org/video/webm/Big_Buck_Bunny_Trailer.webm",
				poster: ""
			}).jPlayer('${autoPlay}');

		},
		swfPath: "js",
		supplied: "webmv, ogv, m4v",
		size: {
			width: "457px",
			height: "259px",
			cssClass: "jp-mini"
		}
	});
	
});
//]]>
</script>
<!-- div id="container" role="main"-->
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeCommerce">
        <h2 class="titleCommu"><img src="<spring:message code="img.commerce.title" text=""/>" alt="Commerce Service" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.commerce.smmr1" text=""/>" alt=" CBC members are at notice on this board." /></p>
        <!-- 언어변경 <p class="subTitleCommu"><img src="<c:url value='/resources/images/txt_commerceservice2_mal.gif' />" alt=" CBC members are at notice on this board." /></p> -->
        
       <!--   <div class="boardMainBtn">
        <a href="${pageContext.request.contextPath }/usr/Guide/list" class="rightBtn"><span class="btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
       	<c:if test="${command.nextCon != null}" >
         <a href="${pageContext.request.contextPath}/usr/Guide/read?guidId=${fn:split(command.nextCon,',')[1]}" class="btnViewN"><img src="<c:url value='/resources/usr/images/btn_next.png' />" alt="next"></a>
       	</c:if>
       	<c:if test="${command.prevCon != null}" >
         <a href="${pageContext.request.contextPath}/usr/Guide/read?guidId=${fn:split(command.prevCon,',')[1]}" class="btnViewP"><img src="<c:url value='/resources/usr/images/btn_prev.png' />" alt="prev"></a>
         </c:if>
        </div> -->
      </div>
      <div role="main" class="subConBox">
      	<nav role="navigation" class="mypageTab">
          <ul>
            <li><a href="${pageContext.request.contextPath }/usr/Promote/list/"><spring:message code="promote.tap_title1" text=""/></a></li>
            <li><a href="#" class="tabOn"><spring:message code="promote.tap_title2" text=""/></a></li>
          </ul>
        </nav>
        <!--게시판 영역 시작-->
        <div role="main">
          <article class="boardView01">
            <header class="viewHeader"><h1>${command.guidTitl}</h1></header>
            <div class="viewVod">
            	<div class="vod-box">
            		
            		<!--video player start-->
								<div id="jp_container_1" class="jp-video jp-mini">
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
														<li>
															<a href="javascript:;" class="jp-play" tabindex="1">play</a>
														</li>
														<li>
															<a href="javascript:;" class="jp-pause" tabindex="1">pause</a>
														</li>
														<li>
															<a href="javascript:;" class="jp-stop" tabindex="1">stop</a>
														</li>
														<li>
															<a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a>
														</li>
														<li>
															<a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a>
														</li>
													</ul>
													<div class="jp-volume-bar">
														<div class="jp-volume-bar-value">
															<div class="volume-icon"></div>
														</div>
													</div>
													<div class="jp-current-time"></div>
													<ul class="jp-toggles">
														<li>
															<a href="javascript:;" class="jp-full-screen" tabindex="1" title="full screen">full screen</a>
														</li>
														<li>
															<a href="javascript:;" class="jp-restore-screen" tabindex="1" title="restore screen">restore screen</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--video player end-->
            		
            	</div>
            	<div class="dsc-box">
            		${command.guidSmmr}     
            	</div>
            </div>
          </article>
          
          <article class="boardView02">
          <nav class="bottomNaviNtc">
            <ul>
             <c:if test="${command.prevCon != null}" >
              <li>
              	<a href="${pageContext.request.contextPath}/Guide/read?guidId=${fn:split(command.prevCon,',')[1]}"><span class="wayMarkP"><spring:message code="board.btn_previous" text=""/></span>
              	<span class="listTitle">: ${fn:split(command.prevCon,',')[0]}</span>
              	<img src="<c:url value='/resources/usr/images/ico_img.gif' />" alt="include image"></a>              	
              </li>
              </c:if>
              <c:if test="${command.nextCon != null}" >
              <li class="noBb"> 
	              	<a href="${pageContext.request.contextPath}/Guide/read?guidId=${fn:split(command.nextCon,',')[1]}"><span class="wayMarkN"><spring:message code="board.btn_next" text=""/></span>
	              	<span class="listTitle">: ${fn:split(command.nextCon,',')[0]}</span>
	              	<img src="<c:url value='/resources/usr/images/ico_img.gif' />" alt="include image"></a></li>	           
	           </c:if>
            </ul>
          </nav>
          <div class="boardBtnNotice">
            <a href="${pageContext.request.contextPath }/Guide/list" class="rightBtn"><span class="btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
          </div>
          </article>
          
          <!-- <div class="boardBtnNotice">
            <a href="${pageContext.request.contextPath }/usr/Guide/list/" class="rightBtn"><span class="btnBase iconList">List</span></a>
          </div>-->
        </div>
      </div>
      <!--mypage end--> 
    </div>
  </div>
<!-- /div-->


