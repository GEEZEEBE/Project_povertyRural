$(function() {
	// all checkbox
 	$('input[name="allCheck"]').click(function(){
		if ($(this).is(":checked")) {
			$('input[type="checkbox"]').attr("checked",true);
		} else {
			$('input[type="checkbox"]').attr("checked",false);
		}
	}); 
	// view link
 	$(".listItem").find("td").click(function(){
 		var isCheckBox = $(this).children().is("input[type='checkbox']");
 		if(isCheckBox==false){
 			var url = $(this).parent().find("a");
 			if(url.length > 0){location.href=url.attr("href");}
 		}
 		
 	});
 	// search form
 	$(".serSubmit").click(function(){
 		var $form = $(this).closest("form");
		$form.submit();
	});
	
	//delete
	$(".delPop").click(function(e){
		e.preventDefault();
		alert("삭제하시겠습니까?");
		
	});

});
