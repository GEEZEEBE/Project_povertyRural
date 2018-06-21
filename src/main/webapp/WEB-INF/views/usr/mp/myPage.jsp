<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">

/*
 * 비밀번호, 비밀번호 확인 일치 체크
 */
 $(function() {
     $("input[name=pwd]").keypress(function(){
         if(event.keyCode==32){
             event.returnValue = false;
         }
     });
     $("input[name=pwdCheck]").keypress(function(){
         if(event.keyCode==32){
             event.returnValue = false;
         }
     });
  });
 
 $(function() {
	    $("input[name=pwd]").keyup(function(){
	        var adminPwd = $("input[name=pwd]").val();
	        var adminPwdCheck = $("input[name=pwdCheck]").val();
	        if($("input[name=pwd]").val().length >= 4 && $("input[name=pwdCheck]").val().length >= 4){
	            if (adminPwd == adminPwdCheck) {
	                $('.pwConfirm').css("color", "blue");
	                el = " Passwords match";
	                $("#pwCheck").val("T");
	            } else {
	                $('.pwConfirm').css("color", "red");
	                el = " Passwords not match";
	                $("#pwCheck").val("F");
	            }
	            $('.pwConfirm').html(el);       
	        }else{
	        	$('.pwConfirm').html("");
	        	$("#pwCheck").val("F");
	        }
	    });
	});
 
 $(function() {
	    $("input[name=pwdCheck]").keyup(function(){
	        var adminPwd = $("input[name=pwd]").val();
	        var adminPwdCheck = $("input[name=pwdCheck]").val();
	        if($("input[name=pwd]").val().length >= 4 && $("input[name=pwdCheck]").val().length >= 4){
		        if (adminPwdCheck != null && adminPwdCheck != "") {
		            if (adminPwd == adminPwdCheck) {
		                $('.pwConfirm').css("color", "blue");
		                el = " Passwords match";
		                $("#pwCheck").val("T");
		            } else {
		                $('.pwConfirm').css("color", "red");
		                el = " Passwords not match";
		                $("#pwCheck").val("F");
		            }
		            $('.pwConfirm').html(el);
		        }
	        }else{
	        	$('.pwConfirm').html("");
	        	$("#pwCheck").val("F");
	        }
	    });
	});

 function changePassword(url) {
	 if($("input[name=pwd]").val().length >= 4){
		 if("T"==$("#pwCheck").val()){
	     /* f = document.forms[0];
	     f.action = url;
	     f.method = "post";
	     f.submit(); */
		 $.ajax({
	            type    : "GET",
	            url     : "${pageContext.request.contextPath }/restful/myPage/changePwd",
	            dataType: "json",
	            data: ({
	                userID : $('input[name=userID]').val(),
	                pwd : $('input[name=pwd]').val()
	            }),
	            success : function(data){
	            	$('input[name=pwd]').val("");
	            	$('input[name=pwdCheck]').val("");
	            	$('.pwConfirm').html("");
	            	alert("Editing is complete");
	            },
	            error : function(request,status,error){ 
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	           
	          });
		 }else{
			 alert("please check your password");	 
		 }
	 }else{
		 alert("password is more than 4 letters");

	 }
	}
</script>
<form>
<input type="hidden" id="pwCheck" name="pwCheck" />
<input type="hidden" id="userID" name="userID" value="${userID }" />
<div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeMypage">
        <h2 class="titleCommu"><img src="<spring:message code="img.mypage_title"/>" alt="My page" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.mypage_title,txt"/>" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox">
        <nav role="navigation" class="mypageTab">
          <ul>
            <li><a href="#" class="tabOn"><spring:message code="menu.sitemap_myinfor"/></a></li>
            <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/myUsePage/list', 'command', 'post');" class="tabWid"><spring:message code="mypage.detailed"/></a></li>
          </ul>
        </nav>
        <section>
          <h1 class="mypageStitle"><img src="<spring:message code="img.mypage_title,txt2"/>" alt="Account Summary"></h1>
          <table summary="mypage" class="boardWrite01 mypageType">
            <caption>
            mypage
            </caption>
            <colgroup>
            <col style="width:150px;">
            <col>
            </colgroup>
            <tr>
              <th scope="row"><spring:message code="mypage.date"/></th>
              <td>${userInfo.frstRgstDT }</td>
            </tr>
            <tr>
              <th scope="row"><spring:message code="mypage.name"/></th>
              <td>${userInfo.name }</td>
            </tr>
            <tr>
              <th scope="row"><spring:message code="mypage.id"/></th>
              <td>${userInfo.userID }</td>
            </tr>
            <tr>
              <th scope="row"><spring:message code="mypage.address"/></th>
              <td>${userInfo.adrres }</td>
            </tr>
            <tr>
              <th scope="row"><spring:message code="mypage.email"/></th>
              <td>${userInfo.eMail }</td>
            </tr>
            <tr>
              <th scope="row"><spring:message code="mypage.birthday"/></th>
              <td>${userInfo.birthDay }</td>
            </tr>
          </table>
        </section>
        <section class="mypagePsec">
          <h1 class="mypageStitle"><img src="<spring:message code="img.mypage_title,txt3"/>" alt="Change Password"></h1>
          <div class="mypageTitleR"><spring:message code="mypage.pass,myst"/></div>
          <table summary="mypage" class="boardWrite01 mypageType">
            <caption>
            mypage
            </caption>
            <colgroup>
            <col style="width:150px;">
            <col>
            </colgroup>
            <tr>
              <th scope="row"><spring:message code="mypage.password"/></th>
              <td><input type="password" name="pwd" title="Please enter your password." placeholder="Please enter your password." class="mypagePW"></td>
            </tr>
            <tr>
              <th scope="row"><spring:message code="mypage.verifypass"/></th>
              <td><input type="password" name="pwdCheck" title="Please re-enter your password to verify." placeholder="Please re-enter your password to verify." class="mypagePW">
              <span class="pwConfirm"></span></td>
            </tr>
          </table>
        </section>
        <div class="boardBtnLine notBd"><a href="javascript:changePassword('${pageContext.request.contextPath }/usr/myPage');" class="rightBtn"><span class="btnBase iconEnt">Save</span></a></div>
      </div>
      <!--mypage end--> 
    </div>
  </div>
</form>