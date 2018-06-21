<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<script type="text/javascript">

function submitCheck2(){
	
	
	if(!$("#userName").val() || $("#userName").val().trim().length == 0){
		alert("These are mandatory fields");
		$("#userName").focus();
		return false;
	}
	if(!$(".password:eq(0)").val() || $(".password:eq(0)").val().trim().length == 0){
		alert("These are mandatory fields");
		$(".password:eq(0)").focus();
		return false;
	}
	if($(".password:eq(0)").val().trim().length < 4 || $(".password:eq(0)").val().trim().length > 12){
		alert("Password is 4~12 numbers and letters");
		$(".password:eq(0)").focus();
		return false;
	}
	
	if($(".password:eq(0)").val()!=$(".password:eq(1)").val()){
		if($(".password:eq(0)").attr("title")) alert("Passwords do not match");
		else alert("Passwords do not match");
		$(".password:eq(1)").focus();
		return false;
	}
	
	if($(".phone").val().trim().length > 0){
		var phoneCheck = /^[0-9|-]+$/;
		if(!phoneCheck.test($(".phone").val())){
			
			alert("Please enter the phone number exactly");
			$(".phone").focus();
			return false;
			
		}
		var phoneCheck2 = /^[0-9]/;
		if(!phoneCheck2.test($(".phone").val()) ){
			alert("Please enter the phone number exactly");
			$(".phone").focus();
			return false;
		}
	}
	
	if(!$(".email:eq(0)").val() || $(".email:eq(0)").val().trim().length == 0){
		alert("These are mandatory fields");
		$(".email:eq(0)").focus();
		return false;
	}
	
	if(!$(".email:eq(1)").val() || $(".email:eq(1)").val().trim().length == 0){
		alert("These are mandatory fields");
		$(".email:eq(1)").focus();
		return false;
	}
	
	if($(".email:eq(0)").val() || $(".email:eq(1)").val()){
		
		var emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if(!emailCheck.test($(".email:eq(0)").val()+"@"+$(".email:eq(1)").val())){
			alert("Please enter a valid email address");
			$(".email:eq(0)").focus();
			return false;
		}
		
		
	}
	
	
	
	// 
	
	return true;
	
	

	
}

</script>
   <div>
      <!-- 제목 : str -->
      <div class="subtitle">
      <c:if test="${param.flag=='w'}" >
        <hgroup>
          <h2>Administrator Management</h2>
          <h3>Add or delete administrators here. You may also make changes to administrators' information.</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Required Fields
        </p>
      </c:if>
      <c:if test="${param.flag=='e'}" > 
      	<hgroup>
          <h2>Administrator Management</h2>
          <h3>Add or delete administrators here. You may also make changes to administrators' information.</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Required Fields
        </p>
      </c:if> 
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <form name="command" id="command">
      <input type="hidden" name="authority" value="M" />
      <input type="hidden" name="serCol" value="${param.serCol}" />
      <input type="hidden" name="serTxt" value="${param.serTxt}" />
      <input type="hidden" name="frstRgstUserID" value="kut0100" />
      <input type="hidden" name="latCrctUserID" value="kut0100" />
      <c:if test="${param.flag=='w'}" >
      </c:if>
      <c:if test="${param.flag=='e'}" >
      	<input type="hidden" class="name" name="userID" value="${command.userID}">
      </c:if>
      <table class="boardView write" summary="Write">
      	<c:if test="${param.flag=='w'}" >
        <colgroup>
          <col width="25%" />
          <col width="*" />
        </colgroup>
      <c:if test="${param.flag=='e'}" >
        <tr>
          <th>Administrator ID</th>
          <td>${command.userID}<input type="text" class="name" name="userID" value="${command.userID}"></td>
        </tr>
       </c:if>
        <tr>
          <th>Administrator Name<em>*</em></th>
          <td><input type="text" class="name require" name="name" value="" id="userName" maxlength="40"/></td>
        </tr>
        <tr>
          <th>Password<em>*</em></th>
          <td><input type="password" class="password require" name="pw" maxlength="12" /><span>* Must be between 4~12 nembers and/or letters.</span></td>
        </tr>
        <tr>
          <th>Confirm Password<em>*</em></th>
          <td><input type="password" class="password require" name="checkPw" maxlength="12" /><span></span></td>
        </tr>
        <tr>
          <th>Phone</th>
          <td><input type="text" class="phone" name="tlNO" maxlength="13" /><span>Ex) 000-0000-0000</span></td>
        </tr>
        <tr>
          <th>E-mail<em>*</em></th>
          <td><input type="email" class="email require" name="eMail00" maxlength="30" /> @ <input type="email" class="email" name="eMail01" maxlength="30" /><span>Ex) good@gmail.com</span></td>
        </tr>
        <tr>
          <th>Address</th>
          <td><input type="text" class="address" name="adrres" maxlength="80" /></td>
        </tr>
        <tr class="bottomLine">
          <th>etc</th>
          <td><input type="text" class="etc" name="etc" maxlength="80" /></td>
        </tr>
        </c:if>
        <c:if test="${param.flag=='e'}" >
        <colgroup>
          <col width="25%" />
          <col width="*" />
          <col width="18%" />
          <col width="25%" />
        </colgroup>
        <tr>
          <th>Date</th>
          <td>${command.frstRgstDT}</td>
          <th>Registered by</th>
          <td>${command.frstRgstUserID}</td>
        </tr>
        <tr>
          <th>Administrator ID</th>
          <td colspan="3">${command.userID}</td>
        </tr>
        <tr>
          <th>Administrator Name<em>*</em></th>
          <td colspan="3"><input type="text" class="name require" name="name" value="${command.name}" id="userName" maxlength="40" /></td>
        </tr>
        <tr>
          <th>Password<em>*</em></th>
          <td colspan="3"><input type="password" class="password require" name="pw" value="${command.pw}" maxlength="12"/><span>* Must be between 4~12 nembers and/or letters.</span></td>
        </tr>
        <tr>
          <th>Confirm Password<em>*</em></th>
          <td colspan="3"><input type="password" class="password require" name="checkPw" value="${command.pw}" maxlength="12"/><span></span></td>
        </tr>
        <tr>
          <th>Phone</th>
          <td colspan="3"><input type="text" class="phone" name="tlNO" value="${command.tlNO}" maxlength="13"/><span>Ex) 000-0000-0000</span></td>
        </tr>
        <tr>
          <th>E-mail<em>*</em></th>
          <td colspan="3"><input type="email" class="email require" name="eMail00" value="${command.eMail00}"  maxlength="30"/> @ <input type="email" class="email" name="eMail01" value="${command.eMail01}"  maxlength="30" /><span>Ex) good@gmail.com</span></td>
        </tr>
        <tr>
          <th>Address</th>
          <td colspan="3"><input type="text" class="address" name="adrres" value="${command.adrres}" maxlength="80"/></td>
        </tr>
        <tr class="bottomLine">
          <th>etc</th>
          <td colspan="3"><input type="text" class="etc" name="etc" value="${command.etc}" maxlength="80"/></td>
        </tr>
        </c:if>
      </table>
      </form>
      <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
    <c:if test="${param.flag=='w'}" >
      <ul>
        <li>
          <div class="button1 type2 enter">
                 <a href="javascript:if(submitCheck2()) doSubmit('${pageContext.request.contextPath }/operator/?flag=w', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Register</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/operator/list', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </c:if>
    <c:if test="${param.flag=='e'}" >
      <ul>
        <li>
          <div class="button1 type2 save">
                 <a href="javascript:if(submitCheck2()) doSubmit('${pageContext.request.contextPath }/operator/?flag=e', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Save</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/operator/read', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </c:if>
    </div>
    <!-- 페이지 넘버 : end -->

