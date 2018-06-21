<%@ page contentType="text/html; charset=UTF-8" 
	import="com.skt.mars.adm.co.*"
%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@page import="java.util.*, com.skt.mars.adm.co.ut.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link href="<c:url value='/resources/css/basc.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/inc/jquery-1.8.3.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/inc/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/adm_ui_common.js' />"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"  type="text/javascript"></script>
<script src="https://apis.google.com/js/client.js"></script>
<!-- script type="text/javascript" src="<c:url value='/resources/js/all.js' />"></script-->
<!-- script type="text/javascript" src="<c:url value='/resources/js/anywhere.js?id=kRhxdhdpRhJBXJi1GmDe0Q&v=1.1' />"></script-->
<!-- script type="text/javascript" src="<c:url value='/resources/js/widgets.js' />"></script-->

<script src="http://connect.facebook.net/ko_KR/all.js"></script>
<!--<script src="http://platform.twitter.com/Anywhere.js?id=8Zdej5LyC2TZMXegak6REg&v=1.1" type="text/javascript"></script> -->
<script src="http://platform.twitter.com/Anywhere.js?id=kbC6tnUm0L0k4skFDeBOcQ&v=1.1" type="text/javascript">
<script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>
<script type='text/javascript' src='http://www.google.com/jsapi'></script>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<%
	Promote pro = (Promote)request.getAttribute("command");
	Map resultMap = (Map)request.getAttribute("param");
	String twFlag = (String)resultMap.get("twFlag");	
	AccessToken  acccesstoken = (AccessToken )session.getAttribute("accessToken");
	
%>
<div id="fb-root"></div>
<script>
  function del(url){
	  var form = document.delForm;
	  var con = confirm("Are you sure you want to delete?");
	  if(con){
		  form.action=url;
		  //form.submit();
	  }else{
		  return;
	  }
  }
  
  //facebook setting
  //settingCnt = "0";
  window.fbAsyncInit = function() {   //페이지 로딩시 기본적으로 fb 세팅을 하는겁니다	  
      FB.init({   //기본 init 
      appId  : "287089474726465", //사용하는 페북 앱의 id값 넣는곳... 이건 다른곳 찾아봐도 자세하게 나옵니다.   //609394979088049      
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
    
    
    var FBtoken = "";
    
    function loginFB(postid){    	
    	FB.getLoginStatus(function(response) {
    		if (response.session) {     //로그인 되어 있는 상태
    			FBtoken =  response.authResponse.accessToken;
    			url = "https://graph.facebook.com/"+msg_id+"?access_token="+FBtoken+"&method=delete";
              	alert("FBtoken url log on : " + url);

   			}else{
   				FB.login(function(response) {
   					if (response.authResponse) {
   	               		alert("login success");
   	            	   FBtoken =  response.authResponse.accessToken;   	               		   	            	  
   	               		//url = "https://graph.facebook.com/"+msg_id+"?access_token="+FBtoken+"&method=delete";
   	               		FB.api(postid,'delete',function(response){
   	               			if(!response || response.error){
   	               				alert('Error occured');
   	               			}else{
   	               				alert('Post was deleted');   	               				   	               				
   	               			}
   	               		});   	               		
   	               } else {    
   	            	   alert("login fail");
   	               }
   				}
   		    	 , {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 
   		    	);
   			}
	    	
    	});
    }

    
    var twClient; 
	var twName = "";
	var twAcToken = null;
	twAcToken = '<%=acccesstoken %>';
	  	
    function twInit(postid){        	
    	//alert("1");
    	 //twttr.anywhere(function(){
    		// alert("2");
    		 //twttr.anywhere.config ({callbackURL : "http://test.skcbckualatomani.com.com:8080/app_admin/adm/promote/twDel/"});
    		 
    		 //alert("twAcToken.length222 : " + twAcToken.length);
    	 	 
    	 if(twAcToken == "" || twAcToken == null || twAcToken == "null"){ 
    		 //alert("token null iniNINininininin");
    		 	var frm = document.twitterForm;
    			//frm.popupUrl.value = "twDel_pop.jsp";       			
    	     	window.open("", "twDelete", "width=200 height=130 location=no status=yes");    	     	
    	     	frm.target = "twDelete";
    	     	frm.submit();
    	     	//postid = frm.getElementsByName("TpostId").value;    	     	
    		 
	    	  /*  screenName = T.currentUser.data('screen_name'); 
	    	   profile = T.currentUser.data('profile_image_url');
	    	   msg.innerHTML = "ID: " + screenName + " - profile :<img src='" + profile + "'>";
	    	   var frm = document.twitterForm;
	    	   frm.submit(); */
	    	   /* frm.method="post";
	    	   frm.action="HTTP://api.twitter.com/1/statuses/destroy/306284548487016448.json"; */
 	    	   //location.href="http://api.twitter.com/1/statuses/destroy/306256254353944576.json()";
 	    	   //location.href=="https://twitter.com/i/tweet/destroy/306258577646051328";
    	  }else{
    		  //var frm = document.twitterForm;
	    	  //frm.submit();
    		  //T.signIn(); 
    		  
    		  //http://api.twitter.com/1/statuses/destroy/msg_id.json();
    		  alert("accessToken1 : " + twAcToken);
    	  }
    	 //});
    	}   	    
    	 
    	 
    	 function bsAuth(postid) {
    		 
    		 //url = "https://www.googleapis.com/blogger/v3/blogs//posts/"+postid+"&method=delete";    		 
    		var bsFrm = document.bsForm;    		
 	     	window.open("", "bsDelete", "width=400 height=130 location=no status=yes"); 	     	
 	     	bsFrm.target = "bsDelete";
 	     	//postid = bsFrm.getElementsByName("BpostId").value;
 	     	bsFrm.submit();   		  
 	     	/*
 	     	var config = {
   		      'client_id': '760186707922-6htj91b8nidr1hiobgm8laplj9v92n2t.apps.googleusercontent.com',
   		      'scope': 'https://www.googleapis.com/auth/blogger',
   		      'immediate': 'true'
   		    };
   		    gapi.auth.authorize(config, function() {
   		      console.log('login complete');
   		      console.log(gapi.auth.getToken());
   		      alert(gapi.auth.getToken().access_token);
   		    });
   		    */
   		  }
    
    //blog delete
    //https://www.googleapis.com/blogger/v3/blogs/blogId/posts/postId
</script> 
 
<form name="bsForm" target="bsDelete" method="get" action="${pageContext.request.contextPath}/adm/promote/bsDel_pop" >
    <input type="hidden" name="prmtId" value="${command.prmtId}" />
	<input type="hidden" name="searchSel" value="${param.searchSel}" />
	<input type="hidden" name="searchSnsSel" value="${param.searchSnsSel}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<input type="hidden" name="searchSrtDt" value="${param.searchSrtDt}" />
	<input type="hidden" name="searchEndDt" value="${param.searchEndDt}" />
	<input type="hidden" name="bsFlag" value="B" />	
	<input type="hidden" name="BpostId" value="" />	
	<!-- 
	<input type="hidden" name="popupUrl" value="" />
	-->
</form>



<div id="msg"></div>
 <div class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

       <!-- 탭============================================ : str -->
      
       <!--  <ul>
          <li><a href="#tabs-1">Templet</a></li>
          <li><a href="#tabs-2">Guide</a></li>
          <li><a href="#tabs-3">PR Post</a></li>
        </ul> -->
        <div>
          <!-- 게시판 목록 : str -->
          <article class="noticeView">
            <header>
              <h1>${command.prodNm }</h1>
              <div class="details">
                <span>${command.prodSllr }</span>
                <time>${command.frstRgstDt }</time>
              </div>
            </header>
            <section class="textual templete">
              <div>
                <img src="<c:url value='/resources/images/temp_view_type01.jpg' />" alt="templete type 1" />
              </div>              
              <p>
                <span>Product</span> :  ${command.prodTitl }<br />
                <span>Price</span> : ${command.prodPric }<br />
                <span>Seller</span> : ${command.prodSllr }<br />
                <span>Phone</span> :  ${command.tlno }<br />
                <span>E-mail</span> :  ${command.emal }
              </p>              
                <ul class="sns-acc">
                 <c:forEach var="resultObject" items="${command2}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
	              	<c:if test="${resultObject.snsType == 'F'}">	
	              	<c:if test="${resultObject.delYn == 'N'}">              	
	              	<li class="fb"><span>${resultObject.snsId }</span><a href="javascript:loginFB(${resultObject.prmtSnsId})"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete facebook account"></a></li>
	              	</c:if>
	              	</c:if>
	              	<c:if test="${resultObject.snsType == 'B'}">
	              	<c:if test="${resultObject.delYn == 'N'}">
	              	<li class="blg"><span>${resultObject.snsId }</span><a href="javascript:bsAuth(${resultObject.prmtSnsId})"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete twitter account"></a></li>
	              	</c:if>	              	
	              	</c:if>
	              	<c:if test="${resultObject.snsType == 'T'}">
	              	<c:if test="${resultObject.delYn == 'N'}">
	              	<li class="tw"><span>${resultObject.snsId }</span><a href="javascript:twInit(${resultObject.prmtSnsId});"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete blogspot account"></a></li>
	              	<form name="twitterForm" target="twDelete" method="get" action="${pageContext.request.contextPath}/promote/twDel_pop" >
						<input type="hidden" name="prmtId" value="${command.prmtId}" />
						<input type="hidden" name="searchSel" value="${param.searchSel}" />
						<input type="hidden" name="searchSnsSel" value="${param.searchSnsSel}" />
						<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
						<input type="hidden" name="searchSrtDt" value="${param.searchSrtDt}" />
						<input type="hidden" name="searchEndDt" value="${param.searchEndDt}" />
						<input type="hidden" name="twFlag" value="T" />	 
						<input type="hidden" name="snsHsId" value="${resultObject.snsHsId}" />
						<input type="hidden" name="twPrmtSnsId" id="twPrmtSnsId" value="${resultObject.prmtSnsId}" />
						<!-- 
						<input type="hidden" name="popupUrl" value="" />
	 					-->
					</form>
	              	</c:if>	              	              
	              	</c:if>
	              	
	             </c:forEach>  
                </ul>                          
            </section>
            <hgroup>            
            <c:if test="${fn:split(command.prevCon,',')[1] != null}">
              <h1 class="prev">
                
                  <img src="<c:url value='/resources/images/icon_prev.png' />" alt="Icon Previous" />
                  <span><strong>Previous</strong><em>:</em>
                  	<c:if test="${command.prevCon != null}" >
	                  <a href="${pageContext.request.contextPath}/adm/promote/read?prmtId=${fn:split(command.prevCon,',')[1]}&searchSel=${param.searchSel}&searchSnsSel=${param.searchSnsSel}&searchTxt=${param.searchTxt}&searchSrtDt=${param.searchSrtDt}&searchEndDt=${param.searchEndDt}">${fn:split(command.prevCon,',')[0]} </a>
	                 </c:if>
                  </span>
                
              </h1>
            </c:if>  
            <c:if test="${fn:split(command.nextCon,',')[1] != null}">
              <h1>
                
                  <img src="<c:url value='/resources/images/icon_next.png' />" alt="Icon Next" />
                  <span><strong>Next</strong><em>:</em>
                  	 <c:if test="${command.nextCon != null}" >
	                  <a href="${pageContext.request.contextPath}/adm/promote/read?prmtId=${fn:split(command.nextCon,',')[1]}&searchSel=${param.searchSel}&searchSnsSel=${param.searchSnsSel}&searchTxt=${param.searchTxt}&searchSrtDt=${param.searchSrtDt}&searchEndDt=${param.searchEndDt}">${fn:split(command.nextCon,',')[0]} </a>
	                 </c:if>
                  </span>
                
              </h1>
            </c:if>
            </hgroup>
          </article>
         <!-- 게시판 목록 : end -->
        </div>
        
      </div>
      <!-- 탭=========================================== : end -->

    <!-- 버튼 : srt -->    
    <div class="btnGroup">
      <ul>
        <li class="type2">
          <div class="button1 type2 list">
			<a href="${pageContext.request.contextPath }/adm/promote/list?searchSel=${param.searchSel}&searchSnsSel=${param.searchSnsSel}&searchTxt=${param.searchTxt}&searchSrtDt=${param.searchSrtDt}&searchEndDt=${param.searchEndDt}"><img src="<c:url value='/resources/images/btn_icon_list.gif'/>" alt="icon" /><span>List</span></a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 버튼 : end -->
    