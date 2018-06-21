<%@ page contentType="text/html; charset=UTF-8" 
	import="com.skt.mars.adm.co.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value='/resources/css/basc.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/inc/jquery-1.8.3.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/inc/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/adm_ui_common.js' />"></script>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js"></script>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<%
	Promote pro = (Promote)request.getAttribute("command");	 
%>
<script type="text/javascript">

	window.fbAsyncInit = function() {   //페이지 로딩시 기본적으로 fb 세팅을 하는겁니다
	     FB.init({   //기본 init 
	      appId  : "609394979088049", //사용하는 페북 앱의 id값 넣는곳... 이건 다른곳 찾아봐도 자세하게 나옵니다. 
	      status : true, // check login status
	      cookie : true, // enable cookies to allow the server to access the session
	      xfbml  : true, // parse XFBML
	      oauth  : true // enable OAuth 2.0   기본세팅입니다. 그냥 따라 쓰면 됩니다. 
	    });
	   };

	   (function(d){
	      var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
	      js = d.createElement('script'); js.id = id; js.async = true;
	      js.src = "//connect.facebook.net/en_US/all.js";
	      d.getElementsByTagName('head')[0].appendChild(js);
	    }(document));   //기본적으로 페이스북과 연동하는 세팅 입니다. 같이 써주면 됩니다.
</script>




    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

       <!-- 탭============================================ : str -->
      <div id="tabs">
       <!--  <ul>
          <li><a href="#tabs-1">Templet</a></li>
          <li><a href="#tabs-2">Guide</a></li>
          <li><a href="#tabs-3">PR Post</a></li>
        </ul> -->
        <div id="tabs-1">
          <!-- 게시판 목록 : str -->
          
          <article class="noticeView">
            <header>
              <h1>FaceBook Login</h1>
              <div class="details">
                <span>${command.prodSllr }</span>
                <time>${command.frstRgstDt }</time>
              </div> 
            </header>
            <section class="textual templete">
              <div>
                <img src="<c:url value='/resources/images/temp_view_type01.png' />" alt="templete type 1" />
              </div>
              <div class="viewTempleteInfo">
              <p>
                <span>Product</span> :  ${command.prodTitl }<br />
                <span>Price</span> : ${command.prodPric }<br />
                <span>Seller</span> : ${command.	prodSllr }<br />
                <span>Phone</span> :  ${command.tlno }<br />
                <span>E-mail</span> :  ${command.emal }
              </p>
              <ul class="sns-acc">
              <c:forEach var="resultObject" items="${command2}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
              	<c:if test="${resultObject.snsType == 'F'}">
              	<li class="fb"><span>${resultObject.snsId }</span><a href="#"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete facebook account"></a></li>
              	</c:if>
              	<c:if test="${resultObject.snsType == 'B'}">
              	<li class="blg"><span>${resultObject.snsId }</span><a href="#"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete facebook account"></a></li>
              	</c:if>
              	<c:if test="${resultObject.snsType == 'T'}">
              	<li class="tw"><span>${resultObject.snsId }</span><a href="#"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete facebook account"></a></li>
              	</c:if>
              	</c:forEach>
              </ul>
              </div>
            </section>
            <hgroup>
              <h1 class="prev">
                <div>
                  <img src="<c:url value='/resources/images/icon_prev.png' />" alt="Icon Previous" />
                  <span><strong>Previous</strong><em>:</em>
                  	<c:if test="${command.prevCon != ''}" >
	                  <a href="${pageContext.request.contextPath}/promote/read/?prmtId=${fn:split(command.prevCon,',')[1]}&searchSel=${param.searchSel}&searchSnsSel=${param.searchSnsSel}&searchTxt=${param.searchTxt}&searchSrtDt=${param.searchSrtDt}&searchEndDt=${param.searchEndDt}">${fn:split(command.prevCon,',')[0]} </a>
	                 </c:if>
                  </span>
                </div>
              </h1>
              <h1>
                <div>
                  <img src="<c:url value='/resources/images/icon_next.png' />" alt="Icon Next" />
                  <span><strong>Next</strong><em>:</em>
                  	 <c:if test="${command.nextCon != ''}" >
	                  <a href="${pageContext.request.contextPath}/promote/read/?prmtId=${fn:split(command.nextCon,',')[1]}&searchSel=${param.searchSel}&searchSnsSel=${param.searchSnsSel}&searchTxt=${param.searchTxt}&searchSrtDt=${param.searchSrtDt}&searchEndDt=${param.searchEndDt}">${fn:split(command.nextCon,',')[0]} </a>
	                 </c:if>
                  </span>
                </div>
              </h1>
            </hgroup>
          </article>
         <!-- 게시판 목록 : end -->
        </div>
        
      </div>
      <!-- 탭=========================================== : end -->
    </div>

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
      <li></li>
      <li class="alignR">
        <div class="button1 type2 list">
          <img src="<c:url value='/resources/images/btn_icon_list.gif' />" alt="icon" /><a href="${pageContext.request.contextPath }/promote/list/?searchSel=${param.searchSel}&searchSnsSel=${param.searchSnsSel}&searchTxt=${param.searchTxt}&searchSrtDt=${param.searchSrtDt}&searchEndDt=${param.searchEndDt}">List</a>
        </div>
      </li>
    </ul>
    <!-- 버튼 : end -->

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li>
          <div class="button1">
          <form name="delForm" method="post">
          	<input type="hidden" name="searchSel" value="${param.searchSel }" />
          	<input type="hidden" name="delChk" value="${command.tempId }" />
          </form>
            <a href="javascript:del('${pageContext.request.contextPath }/promote/delete/');">Delete</a>
          </div>
        </li>
        <li class="write">
          <div class="button1 type2 write">
            <a href="#"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Resister</span></a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
