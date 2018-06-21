<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" type="both" pattern="yyyy"/>

 <script type="text/javascript">

function fgetGetCommonByDivide(id, callBackName, keyID, outPutId, onChangeFunction) {
//	var selected = $("#developer option:selected");    
	$.getJSON('${pageContext.request.contextPath }/ws/common/'+callBackName, 
			{ keyID: keyID },
		function(data) {
			alert('data: '+data);
			var temp = '<select id="'+id+'" onChange="'+onChangeFunction+'">';
	     	$.each(data.itmes, function(i,item){
	     		temp += '<option value="'+item.commonCodeID.toString()+'">'+item.codeName.toString()+'</option>';
	   		});
			temp += '</select>';
			$("#"+outPutId).html(temp);
		});
}

function submitCheck2(){
	
	
	if(!$("#userName").val() || $("#userName").val().trim().length == 0){
		alert("These are mandatory fields");
		$("#userName").focus();
		return false;
	}
	if(!$(".password:eq(0)").val() || $(".password:eq(0)").val().trim().length == 0){
		alert("These are mandatory fields");
		$(".password1").focus();
		return false;
	}
	if($(".password:eq(0)").val().trim().length < 4 || $(".password:eq(0)").val().trim().length > 12){
		alert("Password is 4~12 numbers and letters");
		$(".password1").focus();
		return false;
	}
	
	if($(".password:eq(0)").val()!=$(".password:eq(1)").val()){
		if($(".password:eq(0)").attr("title")) alert("Passwords do not match");
		else alert("Passwords do not match");
		$(".password2").focus();
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
	
	
	
	return true;
	
	

	
}

function checkpw(){
	 var pw = $("#pw").val();
	 var repw = $("#repw").val();
	 
	if(pw == repw){
		 $("#notPW").hide();
		 $("#okPW").show();
	}
	if(pw != repw){
		 $("#okPW").hide();
		 $("#notPW").show();
	}
}

function editcheckpw(){
	 var pw = $("#edpw").val();
	 var repw = $("#edrepw").val();
	 
	if(pw == repw){
		 $("#notPW").hide();
		 $("#okPW").show();
	}
	if(pw != repw){
		 $("#okPW").hide();
		 $("#notPW").show();
	}
}
</script>

    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <c:if test="${param.flag=='w'}" > 
        <hgroup>
          <h2>Member Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Required Fields
        </p>
        </c:if>
        <c:if test="${param.flag=='e'}" > 
        <hgroup>
          <h2>Member Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Required Fields
        </p>
        </c:if>
      </div>
      
      <!-- 제목 : end -->

      <form name="command" id="command">
      <!-- 게시판 목록 : str -->
      <input type="hidden" name="authority" value="U" />
      <input type="hidden" name="frstRgstUserID" value="kut0100" />
      <input type="hidden" name="latCrctUserID" value="kut0100" />
      <input type="hidden" name="serCol" value="${param.serCol}" />
      <input type="hidden" name="serTxt" value="${param.serTxt}" />
      <input type="hidden" name="checkSearch" value="${param.checkSearch}">
      <input type="hidden" name="flag" value="${param.flag}" />

      <c:if test="${param.flag=='e'}" >
      	<input type="hidden" name="userID" value="${command.userID}" />
      	<input type="hidden" name="pw" value="${command.pw}" />
      </c:if>
      <table class="boardView write" summary="Write">
        <c:if test="${param.flag=='w'}" >
        <colgroup>
          <col width="25%" />
          <col width="*" />
        </colgroup>
        <tr>
          <th>Name<em>*</em></th>
          <td><input id="userName" name="name" type="text" class="name require" placeholder="Kut0100" value="" title="insert title!" maxlength="40" /></td>
        </tr>
        <tr>
          <th>Password<em>*</em></th>
          <td><input name="pw" id="pw" type="password" class="password require password1" maxlength="12" /><span>* Must be between 4~12 nembers and/or letters.</span></td>
        </tr>
        <tr>
          <th>Confirm Password<em>*</em></th>
          <td><input type="password" id="repw" class="password require password2" maxlength="12" onchange="javascript:checkpw(this);"/><span></span>
          <span class="notPW" id="notPW" style="display:none;">* Passwords do not match.</span>
          <span class="okPW" id="okPW" style="display:none;">* Password match.</span></td>
        </tr>
        <tr>
          <th>Gender<em>*</em></th>
          <td><label><input type="radio" name="sex" value="M" checked />Male</label><label><input type="radio" name="sex" value="F" />Female</label></td>
        </tr>
        <tr>
          <th>Birthday<em>*</em></th>
          <td>
            <select name="birthYear">
              <c:forEach var="i" begin="1905" end="${year}">
					<option value="${i}">${i}</option>
				</c:forEach>
            </select>
            <select name="birthMonth">
              <c:forTokens var="i" items="01,02,03,04,05,06,07,08,09,10,11,12" delims=",">
		            <option value="${i}">${i}</option>
		      </c:forTokens>
            </select>
            <select name="birthDay">
              <c:forTokens var="i" items="01,02,03,04,05,06,07,08,09,10" delims=",">
		            <option value="${i}">${i}</option>
		      </c:forTokens>
		      <c:forEach var="i" begin="11" end="31">
					<option value="${i}">${i}</option>
				</c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <th>Phone</th>
          <td><input name="tlNO" type="text" class="phone require" maxlength="13" /><span>Ex) 000-0000-0000</span></td>
        </tr>
        <tr>
          <th>E-mail<em>*</em></th>
          <td><input name="emailFirst" type="email" class="email require" maxlength="30" /> @ <input name="emailLast" type="email" class="email require" maxlength="30" /><span>Ex) good@gmail.com</span></td>
        </tr>
        <tr>
          <th>Address</th>
          <td><input name="adrres" type="text" class="address" maxlength="80" /></td>
        </tr>
        <tr>
          <th>etc</th>
          <td><input name="etc" type="text" class="etc"  maxlength="80" /></td>
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
          <th>ID</th>
          <td colspan="3">${command.userID}</td>
        </tr>
        <tr>
          <th>Name<em>*</em></th>
          <td colspan="3"><input id="userName" name="name" type="text" class="name require" value="${command.name}" maxlength="40" /></td>
        </tr>
        <tr>
          <th>Password<em>*</em></th>
          <td colspan="3"><input type="password" id="edpw" class="password require" value="${command.pw}" maxlength="12"/><span>* Must be between 4~12 nembers and/or letters.</span></td>
        </tr>
        <tr>
          <th>Confirm Password<em>*</em></th>
          <td colspan="3"><input type="password" id="edrepw" class="password require password2" value="${command.pw}" onchange="javascript:editcheckpw(this);" maxlength="12"/><span></span>
          	<span class="notPW" id="notPW" style="display:none;">* Passwords do not match.</span>
          	<span class="okPW" id="okPW" style="display:none;">* Password match.</span>
       	  </td>
        </tr>
        <tr>
          <th>Gender<em>*</em></th>
          <td colspan="3"><label><input type="radio" name="sex" value="M" <c:if test="${command.sex=='M'}" >checked</c:if> />Male</label><label><input type="radio" name="sex" value="F" <c:if test="${command.sex=='F'}" >checked</c:if> />Female</label></td>
        </tr>
        <tr>
          <th>Birthday<em>*</em></th>
          <td colspan="3">
            <select name="birthYear">
              <c:forEach var="i" begin="1905" end="${year}">
					<option value="${i}" <c:if test="${birthYear==i}">selected</c:if> >${i}</option>
				</c:forEach>
            </select>
            <select name="birthMonth">
              <c:forTokens var="i" items="01,02,03,04,05,06,07,08,09,10,11,12" delims=",">
		            <option value="${i}" <c:if test="${birthMonth==i}">selected</c:if> >${i}</option>
		      </c:forTokens>
            </select>
            <select name="birthDay">
              <c:forTokens var="i" items="01,02,03,04,05,06,07,08,09,10" delims=",">
		            <option value="${i}" <c:if test="${birthDay==i}">selected</c:if> >${i}</option>
		      </c:forTokens>
		      <c:forEach var="i" begin="11" end="31">
					<option value="${i}" <c:if test="${birthDay==i}">selected</c:if> >${i}</option>
				</c:forEach>
            </select>
            
          </td>
        </tr>
        <tr>
          <th>Phone</th>
          <td colspan="3"><input name="tlNO" type="text" class="phone" value="${command.tlNO}" maxlength="13" /><span>Ex) 000-0000-0000</span></td>
        </tr>
        <tr>
          <th>E-mail<em>*</em></th>
          <td colspan="3"><input name="emailFirst" type="email" class="email require" value="${emailFirst}" maxlength="30" /> @ <input name="emailLast" type="email" class="email" value="${emailLast}" maxlength="30" /><span>Ex) good@gmail.com</span></td>
        </tr>
        <tr>
          <th>Address</th>
          <td colspan="3"><input name="adrres" type="text" class="address" value="${command.adrres}" maxlength="80" /></td>
        </tr>
        <tr class="bottomLine">
          <th>etc</th>
          <td colspan="3"><input name="etc" type="text" class="etc" value="${command.etc}" maxlength="80" /></td>
        </tr>
        </c:if>
      </table>
      <!-- 게시판 목록 : end -->
      </form>
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
    <c:if test="${param.flag=='w'}" >
      <ul>
        <li>
          <div class="button1 type2 enter">
         		<a href="javascript:if(submitCheck2()) doSubmit('${pageContext.request.contextPath }/adm/user/', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Register</span></a>
                 <!--a href="#" onClick="doSubmit('${pageContext.request.contextPath }/adm/user/', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Enter</span></a-->
          </div>
        </li>
        <li>
          <div class="button1">
            	<a href="#" onClick="doSubmit('${pageContext.request.contextPath }/adm/user/list', 'command', 'get');">Cancel</a>
          </div>
        </li>
      </ul>
    </c:if>
    <c:if test="${param.flag=='e'}" >
      <ul>
        <li>
          <div class="button1 type2 save">
                 <a href="javascript:if(submitCheck2()) doSubmit('${pageContext.request.contextPath }/adm/user/', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Save</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="#" onClick="doSubmit('${pageContext.request.contextPath }/adm/user/read', 'command', 'get');">Cancel</a>
          </div>
        </li>
      </ul>
    </c:if>  
    </div>
    <!-- 버튼그룹 : end -->


    <!-- 팝업 : srt -->
    <section class="popup" style="display: none;">
      <header>
        <h1>
          <span>Recipt</span>
          <div class="button4">
            <a href="#">X</a>
          </div>
        </h1>
      </header>
      <div class="btnGroup popup">
        <p>CBC members from reciving?</p>
        <ol>
          <li>
            <div class="button5">
              <a href="#">Yes<br /><em>Now recipt</em></a>
            </div>
          </li>
          <li>
            <div class="button5">
              <a href="#">No<br /><em>Later recipt</em></a>
            </div>
          </li>
        </ol>
      </div>
    </section>
    <!-- 팝업 : end -->
