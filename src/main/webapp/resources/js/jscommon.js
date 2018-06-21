/**
 * doSubmit 
 *
 * @param actionName action Name
 * @param formID Form ID
 * @param methodType method Type(ex. get, post) 
 */
 function doSubmit(actionName, formID, methodType) {
	f = document.forms[0];
//	f = $("form[name='"+formID+"']");
    f.action = actionName;
    f.method = methodType;
//    alert(f.action +", "+f.method);
 	f.submit();

}
 function doSubmit2(actionName, formID, methodType) {
		f = document.getElementById(formID);
//		f = $("form[name='"+formID+"']");
	    f.action = actionName;
	    f.method = methodType;
//	    alert(f.action +", "+f.method);
	 	f.submit();

	}
 /**
  * doExcelFileDownSubmit 
  *
  * @param actionName action Name
  * @param formID Form ID
  * @param methodType method Type(ex. get, post) 
  */
function doExcelFileDownSubmit(actionName, formID, methodType) {
 	f = document.forms[0];
// 	f = $("form[name='"+formID+"']");
     f.action = actionName;
     f.method = methodType;
//     alert(f.action +", "+f.method);
  	f.submit();

 }
 /**
  * fgetSelectTag 
  *
  * @param callURL call full URL
  * @param keyID	parameter key
  * @param outID 	target Tag id
  * @param onChangeFunction  - current unusing
  */
function fgetSelectTag(callURL, keyID, outID, onChangeFunction) {
	var selected = keyID != null ? keyID : $("#"+outID+" option:selected");    

	$.getJSON(callURL, 
			{ keyID: selected },
		function(data) {
	     	$.each(data.itmes, function(i,item){
	     		$("#"+outID).append( new Option(item.codeName,item.commonCodeID));
	   		});
		});
}

/**
 * fgetSelectTag 
 *
 * @param callURL call full URL
 * @param keyID	parameter key
 * @param outID 	target Tag id
 * @param selectedValue 	selected value
 * @param onChangeFunction  - current unusing
 */
function fgetSelectTag(callURL, keyID, outID, selectedValue, onChangeFunction) {
	var selected = keyID != null ? keyID : $("#"+outID+" option:selected");    

	$.getJSON(callURL, 
			{ keyID: selected },
		function(data) {
	     	$.each(data.itmes, function(i,item){
	     		$("#"+outID).append( new Option(item.codeName,item.commonCodeID));
	   		});
//	     	alert(selectedValue);
	     	$("#"+outID).val( selectedValue ).attr('selected',true);
		});
}


/**
 * selectCategory 
 * 카테고리 드롭박스
 * 
 * @param callURL - call full URL
 * @param keyID - parameter key
 * @param outID - target Tag key
 * @param onChangeFunction - current unusing
 */
function selectCategory(callURL, keyID, outID, onChangeFunction) {
	var selected = keyID != null ? keyID : $("#"+outID+" option:Select");    
	var node = $("#"+keyID).val();
	if("categoryOne"==keyID){
		$("#categoryTwo").empty();
		$("#categoryTwo").append( new Option('Select'));
		$("#categoryThree").empty();
		$("#categoryThree").append( new Option('Select'));
		$("#categoryFour").empty();
		$("#categoryFour").append( new Option('Select'));
	}else if("categoryTwo"==keyID){
		$("#categoryThree").empty();
		$("#categoryThree").append( new Option('Select'));
		$("#categoryFour").empty();
		$("#categoryFour").append( new Option('Select'));
	}else if("categoryThree"==keyID){
		$("#categoryFour").empty();
		$("#categoryFour").append( new Option('Select'));
	}
	if(node == "Select"){
//		$("#"+outID).empty();
//		$("#"+outID).append( new Option('selected'));
	}else{
		var arrStr = node.split(':');
		var depth = arrStr[0];	//depth : 카테고리 딥스
		depth = Number(depth)+1;
		var lft = arrStr[1];	//lft : lft_node 
		var rgt = arrStr[2];	//rgt : rgt_node
		var srvcId = arrStr[3];
	
	//	alert("depth : "+depth+" / lft : "+lft+" / rgt : "+rgt);
	
		//카테고리 목록 초기화
//		$("#"+outID).empty();
//		$("#"+outID).append( new Option('selected'));
		
		$.getJSON(callURL, 
				{ keyID: selected, depth: depth, lft: lft, rgt: rgt, srvcId: srvcId},
			function(data) {
		     	$.each(data.itmes, function(i,item){
		     		$("#"+outID).append( new Option(item.SRVC_CTGR_NM,item.DEPTH+":"+item.NODE_LFT+":"+item.NODE_RGT+":"+item.NODE_CATEGORY));
		   		});
			});
	}
}



//작업용 _ 재성
//function selectCategoryList(callURL, keyID, outID, selectedValue, onChangeFunction) {
//	var selected = keyID;   
//	
//	$.getJSON(callURL, 
//			{ srvcID: selected },
//		function(data) {
//	     	$.each(data.itmes, function(i,item){
//	     		$("#"+outID).append( new Option(item.SRVC_CTGR_NM,item.NODE_CATEGORY));
//	   		});
//	     	$("#"+outID).val( selectedValue ).attr('selected',true);
//	     	
//	     	$("#"+outID).attr("onchange","javascript:selectCategoryList2('"+callURL+"', 'select01', 'select02', '', '');");
//	     	
//	     	if(selectedValue != ""){
//	     		selectCategoryList2(callURL, keyID, 'select02', '', '');
//	     	}
//		});
//}
//
//function selectCategoryList2(callURL, keyID, outID, selectedValue, onChangeFunction) {
//	
//	var selected = selectedValue != "" ? selectedValue : $("#"+keyID).val();
//	
//	$("#"+outID).html("");
//	$("#"+outID).append( new Option("all",""));
//	
//	$.getJSON(callURL, 
//			{ srvcID: selected },
//		function(data) {
//	     	$.each(data.itmes, function(i,item){
//	     		$("#"+outID).append( new Option(item.SRVC_CTGR_NM,item.NODE_CATEGORY));
//	   		});
//	});
//
//}
		
//popup script for user list
/*
  * @param callURL call full URL
  * @param searchColumeName  search colume name 
  * @param searchTagID	get value tag ID and use search parameter
  * @param listTableTagID 	target Tag id
  * @param targetDisplayTagID 	search value Display TagID
  * note : bottom html page in $( '#effect' ).hide();
  * ex. fgetUserListPopup('${pageContext.request.contextPath }/restful/userList', 'NAME', 'serTxt', 'effect', 'serTxtPop');
 */
 function fgetUserListPopup(callURL, searchColumeName, searchTagID, listTableTagID, searchValueDisplayTagID ) {
	
	var selectedEffect = $(".effectTypes").val();
	// most effect types need no options passed by default
	var options = {};

	$('body').css({
		"overflow-y" : "scroll"
	});
	//callback function to bring a hidden box back
	function callback() {
		setTimeout(function() {
			$("#"+listTableTagID+":visible").removeAttr("style").fadeIn();
		}, 1000);
	};

	// run the effect
	$("#"+listTableTagID).show(selectedEffect, options, 500, callback);
	var selected = $('#'+searchTagID).val();
	$.getJSON(callURL, 
			{ searchColume: searchColumeName, serTxt: selected },
			function(data) {
				$('#'+listTableTagID+' tbody').html('');
				var temp = "";
				var cnt = 0;
		     	$.each(data.itmes, function(i,item){
		     		cnt++;
		     		///html escape
					var userName = item.name ;
					userName = userName.replace(/</gi,"&lt;");
					userName = userName.replace(/>/gi,"&gt;");
					
					temp += "<tr>" ;
					temp += "<td><input type=\"radio\" name=\"userID\" value='"+item.userID+"' /><input type=\"hidden\" id='"+item.userID+"' value='"+userName+"' /></td>";
					temp += "<td>"+cnt+"</td>";
					temp += "<td class=\"alignL\">"+userName+"</td>";
					temp += "<td>"+item.userID+"</td>";
					temp += "</tr>";
		   		});
	     		$('#'+listTableTagID+' tbody').append(temp);
	     		$('#'+searchValueDisplayTagID).val(selected);
			});
	
	
	
}

/* get popup Product / Item
  * @param callURL call full URL
  * @param searchUserTagName  name to search 
  * @param searchItemTagID	product / item ID to search
  * @param listTableTagID 	target Tag id
 * 
 */
function fgetProductItem(callURL, searchUserTagName, searchItemTagID, listTableTagID) {
		
	var selectedUserID = $('input:radio[name='+searchUserTagName+']:checked').val();    
	var selectedUserName = $('#'+selectedUserID).val();	// user name    
	var selectedItemName = $('#'+searchItemTagID).val();	// item or product name    

//	alert(selectedUserID+', '+selectedItemName);
	$('#serTxt').val(selectedUserName);

	$.getJSON(callURL, 
			{ userID: selectedUserID, itemName: selectedItemName },
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



function submitCheck(){
	
	var check = true;
	$(".require").each(function(){	
		if(!$(this).val()  || $(this).val().trim().length == 0){
			if($(this).attr("title")) alert($(this).attr("title"));
			else alert("These are mandatory fields");
			$(this).focus();
			check=false;
			return false;
		}
		
	});
	if(check==true){
		return true;	
	}else{
		return false;
	}

	
}

function ReceiveSubmitCheck(){
	
	var check = true;

	$(".require").each(function(){	
		if(!$(this).val()  || $(this).val().length == 0){
			if($(this).attr("title")) alert($(this).attr("title"));
			else alert("These are mandatory fields");
			$(this).focus();
			check=false;
			return false;
		}
		
	});
	if(check==true){
		return true;	
	}else{
		return false;
	}

	
}

function assetSubmitCheck(){
	var type = $('select[name=type').val();
	var tbody = "";
	
	if('00601'==type){
		tbody = "pc";
	}else if('00602'==type){
		tbody = "tablet";
	}else if('00603'==type){
		tbody = "vod";
	}else if('00604'==type){
		tbody = "eBook";
	}else if('00605'==type){
		tbody = "etc";
	}else if('00606'==type){
		tbody = "outside";
	}
	var check = true;
	
	$("#"+tbody+" .require").each(function(){	
		if(!$(this).val()  || $(this).val().length == 0 || $(this).val().split(" ").join("").length==0){
			if($(this).attr("title")) alert("insert "+$(this).attr("title"));
			else alert("These are mandatory fields");
			$(this).focus();
			check=false;
			return false;
		}
	});
	
	if(check ==true){
		if('00603'==type){
			if('0'==$('select[name=langType]').val()){
				if(!$('input[name=vodNameEng]').val() || $('input[name=vodNameEng]').val().length == 0 || $('input[name=vodNameEng]').val().split(" ").join("").length==0){
					alert("insert Title");
					$('input[name=vodNameEng]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=dvdIntroEng]').text() || $('textarea[name=dvdIntroEng]').text().length == 0 || $('textarea[name=dvdIntroEng]').text().split(" ").join("").length==0){
					alert("insert Lesson Introduction");
					$('textarea[name=dvdIntroEng]').focus();
					check=false;
					return false;
				}else if(!$('input[name=vodNameMal]').val() || $('input[name=vodNameMal]').val().length == 0 || $('input[name=vodNameMal]').val().split(" ").join("").length==0){
					alert("insert Tajuk");
					$('input[name=vodNameMal]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=dvdIntroMal]').text() || $('textarea[name=dvdIntroMal]').text().length == 0 || $('textarea[name=dvdIntroMal]').text().split(" ").join("").length==0){
					alert("insert Pengenalan Kelas");
					$('textarea[name=dvdIntroMal]').focus();
					check=false;
					return false;
				}
			}else if('00033'==$('select[name=langType]').val()){
				if(!$('input[name=vodNameEng]').val() || $('input[name=vodNameEng]').val().length == 0 || $('input[name=vodNameEng]').val().split(" ").join("").length==0){
					alert("insert Title");
					$('input[name=vodNameEng]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=dvdIntroEng]').text() || $('textarea[name=dvdIntroEng]').text().length == 0 || $('textarea[name=dvdIntroEng]').text().split(" ").join("").length==0){
					alert("insert Lesson Introduction");
					$('textarea[name=dvdIntroEng]').focus();
					check=false;
					return false;
				}
			}else if('00034'==$('select[name=langType]').val()){
				if(!$('input[name=vodNameMal]').val() || $('input[name=vodNameMal]').val().length == 0 || $('input[name=vodNameMal]').val().split(" ").join("").length==0){
					alert("insert Tajuk");
					$('input[name=vodNameMal]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=dvdIntroMal]').text() || $('textarea[name=dvdIntroMal]').text().length == 0 || $('textarea[name=dvdIntroMal]').text().split(" ").join("").length==0){
					alert("insert Pengenalan Kelas");
					$('textarea[name=dvdIntroMal]').focus();
					check=false;
					return false;
				}
			}
		}else if('00604'==type){
			if('0'==$('select[name=eBookLangType]').val()){
				if(!$('input[name=eBookTitleEng]').val() || $('input[name=eBookTitleEng]').val().length == 0 || $('input[name=eBookTitleEng]').val().split(" ").join("").length==0){
					alert("insert Title");
					$('input[name=eBookTitleEng]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=eBookSummaryEng]').text() || $('textarea[name=eBookSummaryEng]').text().length == 0 || $('textarea[name=eBookSummaryEng]').text().split(" ").join("").length==0){
					alert("insert Plot Summary");
					$('textarea[name=eBookSummaryEng]').focus();
					check=false;
					return false;
				}else if(!$('input[name=eBookTitleMal]').val() || $('input[name=eBookTitleMal]').val().length == 0 || $('input[name=eBookTitleMal]').val().split(" ").join("").length==0){
					alert("insert Tajuk");
					$('input[name=eBookTitleMal]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=eBookSummaryMal]').text() || $('textarea[name=eBookSummaryMal]').text().length == 0 || $('textarea[name=eBookSummaryMal]').text().split(" ").join("").length==0){
					alert("insert Ringkasan Plot");
					$('textarea[name=eBookSummaryMal]').focus();
					check=false;
					return false;
				}
			}else if('00033'==$('select[name=eBookLangType]').val()){
				if(!$('input[name=eBookTitleEng]').val() || $('input[name=eBookTitleEng]').val().length == 0 || $('input[name=eBookTitleEng]').val().split(" ").join("").length==0){
					alert("insert Title");
					$('input[name=eBookTitleEng]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=eBookSummaryMal]').text() || $('textarea[name=eBookSummaryMal]').text().length == 0 || $('textarea[name=eBookSummaryMal]').text().split(" ").join("").length==0){
					alert("insert Plot Summary");
					$('textarea[name=eBookSummaryMal]').focus();
					check=false;
					return false;
				}
			}else if('00034'==$('select[name=eBookLangType]').val()){
				if(!$('input[name=eBookTitleMal]').val() || $('input[name=eBookTitleMal]').val().length == 0 || $('input[name=eBookTitleMal]').val().split(" ").join("").length==0){
					alert("insert Tajuk");
					$('input[name=eBookTitleMal]').focus();
					check=false;
					return false;
				}else if(!$('textarea[name=eBookSummaryMal]').text() || $('textarea[name=eBookSummaryMal]').text().length == 0 || $('textarea[name=eBookSummaryMal]').text().split(" ").join("").length==0){
					alert("insert Ringkasan Plot");
					$('textarea[name=eBookSummaryMal]').focus();
					check=false;
					return false;
				}
			}
		}
	}
	
	if(check == true){
		if(!$('input[name=setCostpricID]').val()){
			alert("select Asset Price");
			check=false;
			return false;
		}
	}
	if(check==true){
		return true;	
	}else{
		return false;
	}

	
}

function changeLang(url,lang){
	f = document.forms[0];
//	if("/usr/smartmain" == $('input[name=pageName]').val()){
//		$('input[name=lang]').val(lang);
//		f.method="get";
//		f.action = url+$('input[name=pageName]').val();
//		f.submit();
//	}else{
		$('input[name=lang]').val(lang);
		f.method="post";
		f.action = url+$('input[name=pageName]').val();
		f.submit();
//	}
}



function fncSerTxt(){
	$('input[name="serTrue"]').val("1");
}

function fncSearchCheck(){
	$('input[name="serTxt"]').val($('input[name="serTxt2"]').val());
}
// text area maxlength
function isMaxlength(obj){  
  	var mlength = obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : "";  
 	if (obj.getAttribute && obj.value.length > mlength)  
  	obj.value = obj.value.substring(0,mlength);  
}  

