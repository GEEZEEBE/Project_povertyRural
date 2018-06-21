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
		var check=0;
		$('input[name="del"]').each(function(){
			if($(this).is(":checked") == true){
				check=1;
			}
		});
		if(check==1){
			var ment = "Are you sure you want to delete?";
			if($(this).attr("title") != null && $(this).attr("title").length > 0){
				ment = $(this).attr("title");
			}
			
			if(confirm(ment)){
				location.href=$(this).attr("href");
			}
		}
		
	});
	
	$(".detailDelete").click(function(e){
		e.preventDefault();
		if(confirm("Are you sure you want to delete?")){
			location.href=$(this).attr("href");
		}
	});
	
	$(".selectChange").change(function(){
 		var $form = $(this).closest("form");
		$form.submit();
	});
	

});
