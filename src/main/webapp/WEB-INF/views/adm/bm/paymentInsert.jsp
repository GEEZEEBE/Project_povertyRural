<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>

<script type="text/javascript">
<!--

function fgetProductItemList(callURL, searchReceiptyTagName, searchUserTagName, searchItemTagID, listTableTagID) {
	
	var searchReceiptyType = $('input:radio[name='+searchReceiptyTagName+']:checked').val();/// Receipty name 
	var selectedUserID = $('input:radio[name='+searchUserTagName+']:checked').val(); 
	var selectedUserName = $('#'+selectedUserID).val();	// user name    
	var selectedItemName = $('#'+searchItemTagID).val();	// item or product name    
	
//	alert(selectedUserID+', '+selectedItemName);
	$('#serTxt').val(selectedUserName);
	
	$.getJSON(callURL, 
			{ userID: selectedUserID, itemName: selectedItemName, receiptyName: searchReceiptyType },
			function(data) {
//				alert(data.userID+', '+data.itemName);
				$('#'+listTableTagID).html("");
				var temp = "";
				if(data.itmes.length==0){
					temp += '<p class="infoNoHistoryTxt">There is no usage history of the member</p>';
				} else {
			     	$.each(data.itmes, function(i,item){
						temp += "<ul>";
						temp += "<li class='radio'><input type='radio' name='useHsNmbrID' value="+item.pkKeyID+" /></li>";
						temp += "<li class='itemInfo'>";
						temp += "<p class='pinfo1'>"+item.mixedName+"</p>";
						temp += "<p>Service category: "+item.serviceCatagory+"</p>";
						temp += "<p class='pinfo2'>Using day:"+item.endTM+"</p>";
						temp += "</li>";
						temp += "<li class='usingPrice'>using: RM<span>"+item.depositRate+"</span></li>";
						temp += "</ul>";
			   		});
			     }

	     		$('#'+listTableTagID).append(temp);
			});
}

function checkUser(){
	
	if(!$('input[name="userID"]').is(":checked")){
		alert('Please select members.');
	}else{
		$( '#effect' ).hide();
		fgetProductItemList('${pageContext.request.contextPath }/restful/productItemList', 'dpstKind', 'userID', 'itemTxt', 'itemList');
	}

	
}


function submitCheck2(){

	if(!$("#serTxt").val() || $("#serTxt").val().trim().length == 0){
		alert("These are mandatory fields");
		$("#serTxt").focus();
		return false;
	}

	if(!$("input[name='useHsNmbrID']").is(":checked")){
		alert("These are mandatory fields");
		$("#itemTxt").focus();
		return false;
	}
	
	if(!$(".rm").val() || $(".rm").val().trim().length == 0){
		alert("These are mandatory fields");
		$(".rm").focus();
		return false;
	}

	return true;
}
function onlyNumberInput() 
{ 
	 var code = window.event.keyCode; 
	
	 if ((code > 34 && code < 41) || (code > 47 && code < 58) || (code > 95 && code < 106) || code == 8 || code == 9 || code == 13 || code == 46) 
	 { 
	  window.event.returnValue = true; 
	  return; 
	 } 
	 window.event.returnValue = false; 
} 
//-->
</script>

<div>
	<!-- 제목 : str -->
	<div class="subtitle">
		<hgroup>
			<h2>Receivables Management</h2>
			<h3>Manage receivables generated from the services here</h3>
		</hgroup>
		<p class="sch write">
			<em>*</em> Required Fields
		</p>
	</div>
	<!-- 제목 : end -->

	<!-- 게시판 목록 : str -->
	<form name="formID" id="formID">
	<input type="hidden" name="frstRgstUserID" value="kut0100" />
	<input type="hidden" name="latCrctUserID" value="kut0100" />
	<table class="boardView write" summary="Write">
		<colgroup>
			<col width="20%" />
			<col width="*" />
			<col width="20%" />
			<col width="30%" />
		</colgroup>
		<tr>
			<th>Receipt Type<em>*</em></th>
			<td colspan="3">
				<label><input type="radio" name="dpstKind" value="00030" checked />Basic</label>
				<label><input type="radio" name="dpstKind" value="00029"/>Rental</label>
				<label><input type="radio" name="dpstKind" value="00028"/>Rental (w/ deposit)</label>
			</td>
		</tr>
		<tr>
			<th>Member Name<em>*</em></th>
			<td colspan="3" class="filesch receipt"><input type="text"
				title="Member name" id="serTxt" class="require membernm" readonly /> <a href="#" onClick="fgetUserListPopup('${pageContext.request.contextPath }/restful/userList', 'NAME', 'serTxt', 'effect', 'serTxtPop');" class="button01" 
				class="ui-state-default ui-corner-all"><img
					src="<c:url value='/resources/images/btn_member.gif' />"
					alt="Member" /></a><span class="infoRightTxt">Please select members.</span><!--0403 추가--></td>
		</tr>
		<tr>
			<th>Select<br />Product / Item <br />for Payment <em>*</em></th>
			<td colspan="3" class="subtitle receipt">
				<p class="sch">
					<span>Product / Item</span> <input type="text" title="Item" id="itemTxt" value=""  class="require"/>
					<button type="button" title="search" onclick="$( '#effect' ).hide(); fgetProductItemList('${pageContext.request.contextPath }/restful/productItemList', 'dpstKind', 'userID', 'itemTxt', 'itemList');"></button>
					<span class="infoRightTxt02">Please select receipt types and members.</span><!--0403 추가-->
				</p>
				<div id="itemList" class="cropwinList receipt require">
					<p class="infoNoHistoryTxt">There is no usage history of the member</p><!--0403 추가-->
				</div>
			</td>
		</tr>
		<tr class="bottomLine">
			<th>Received Amount<em>*</em></th>
			<td><input type="number" class="price require rm" name="dpstAmt" maxlength="9" onKeyDown = "javascript:onlyNumberInput()" style='IME-MODE: disabled' /><span>RM</span></td>
			<th>Method</th>
			<td class="recSelect"><select class="seltWeith4" style="height: 24px;" name="dpstMthd" id="dpstMthd">
			</select></td>
		</tr>
	</table>
	</form>
	<!-- 게시판 목록 : end -->
</div>

<!-- 버튼그룹 : srt -->
<div class="btnGroup write">
	<ul>
		<li class="type2">
			<div class="button1 type2 enter">
				<a href="javascript:if(submitCheck2()) doSubmit('${pageContext.request.contextPath }/adm/payment/', 'command', 'post');"><img
					src="<c:url value='/resources/images/btn_icon_enter.gif' />"
					alt="icon" /><span>Register</span></a>
			</div>
		</li>
		<li>
			<div class="button1">
				<a href="#" onClick="doSubmit('${pageContext.request.contextPath }/adm/payment/list', 'command', 'get');">Cancel</a>
			</div>
		</li>
	</ul>
</div>
<!-- 버튼그룹 : end -->

<!-- popup : srt -->
<section class="toggler popup" id="draggable" class="ui-widget-content">
	<div id="effect" class="ui-widget-content ui-corner-all">
		<header>
			<div class="popupTitle">
				<h1>
					<div class="bgcenter">
						<span>Member</span>
						<div class="button4">
							<a href="#" class="btnClose" onclick="$( '#effect' ).hide();">X</a>
						</div>
					</div>
				</h1>
			</div>
		</header>
		<section class="popupBody">
			<div class="popupLeftbg">
				<div class="popupBodybg">
					<fieldset class="schMember">
						<legend>Service Category</legend>
						<dl>
							<dt class="memberIDName">
								<span>ID/Member</span>
							</dt>
							<dd>
								<p class="sch">
									<input type="text" id="serTxtPop" title="" />
									<button type="button" title="search" onClick="fgetUserListPopup('${pageContext.request.contextPath }/restful/userList', 'NAME', 'serTxtPop', 'effect', 'serTxtPop');"></button>
								</p>
							</dd>
						</dl>
					</fieldset>
					<div class="popupCategory receipt">
						<table class="boardList register asset">
							<colgroup>
								<col width="40">
								<col width="60" />
								<col width="*" />
								<col width="140" />
							</colgroup>
							<thead>
								<tr>
									<th class="one"></th>
									<th>No.</th>
									<th>Member</th>
									<th class="end">ID</th>
								</tr>
							</thead>
						</table>
						<div class="cropwinList asset">
							<table id="userTableList" class="boardList register list">
								<colgroup>
								<col width="40">
								<col width="60" />
								<col width="*" />
								<col width="150" />
								</colgroup>
								<tbody>
								</tbody>
							</table>
						</div>
						<!-- 페이지 넘버 : srt -->
						<div class="pageNum">
							<nav:pageNavi
								doSubmit="doSubmit('${pageContext.request.contextPath }/adm/payment/list', 'command', 'get');"
								pageList="${list}" />
						</div>
						<!-- 페이지 넘버 : end -->
					</div>
				</div>
			</div>
		</section>
		<section class="btnGroup">
			<div class="popupBtn">
				<div class="popupBtnbg">
					<div class="button5 enter">
						<a href="javascript:checkUser();"><img
							src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Resister</span></a>
					</div>
					<div class="button5">
						<a href="#" class="btnClose" onclick="$( '#effect' ).hide();">Cancel</a>
					</div>
				</div>
			</div>
		</section>
	</div>
</section>
<!-- popup : end -->

<script type="text/javascript">
$( '#effect' ).hide();
fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','01200','dpstMthd',''); 	
</script>