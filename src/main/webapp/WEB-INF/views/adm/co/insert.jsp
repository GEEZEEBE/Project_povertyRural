<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript">
  /* $(function() {
    $( "#tabs" ).tabs();
  }); */
 
  function null_check(str,msg){
		 var nidV = str.value;
		 var new_nidv = "";
		 var len = nidV.length;
		
		 for(i=0;i<=len;i++){
			 id_str = nidV.substring(i, i+1);
			 new_nidv += id_str.replace(" ", "");
		}
		
		if (new_nidv==""){
			alert(msg); 
			str.focus();
			str.value= "";
			return false;
		}
		//str.value=new_nidv;
	}	
	
	//fileCheck for Image
	function fileImgCheck(filename){  
		var temp = filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase();
		var flag = false;
		var ext = new Array("gif","jpg","png","jpeg");
		
		for(var i = 0; i < ext.length; i++){
			if(temp == ext[i]){
				flag = true;
				break;
			}
		}
		if(!flag){
			alert("You can enter only gif, jpg and png file.");
			return false;
		}else{
			return true;
		}
		
	}
  
  	//fileCheck for HTML
	function fileCheck(filename){  
		var temp = filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase();
		var flag = false;
		var ext = new Array("html");
		
		for(var i = 0; i < ext.length; i++){
			if(temp == ext[i]){
				flag = true;
				break;
			}
		}
		if(!flag){
			alert("You can enter only html file.");
			return false;
		}else{
			return true;
		}
		
	}

	var numberCheck = function(name) {
		var temp = document.getElementById(name).value;
		var chk = true;
		if(isNaN(temp) == true) {
			alert("You can enter only Number.");
			chk = false;
		} 
		
		return chk;

	};
	
  function pageNullCheck(form){
	  if(null_check(form.tempTitl, "Insert Title!")==false){return false;}
	  if(null_check(form.tempImg, "Choose your Image." )==false){return false;}
	  if(null_check(form.tempHtml, "Choose your HTML file.")==false){return false;}
	  if(fileImgCheck(form.tempImg.value)==false){return false;}
	  if(fileCheck(form.tempHtml.value)==false){return false;}
	  
	  
	  if(null_check(form.textCnt, "Insert your Number.")==false){return;} else if(numberCheck("textCnt")==false){form.textCnt.value=""; return false}
	  if($("#imgCnt option:selected").val() == 1){
		  if(null_check(form.img1Widt, "Enter the size of the image." )==false){return false;} else if(numberCheck("img1Widt")==false){form.img1Widt.value=""; return false}
		  if(null_check(form.img1Heig, "Enter the size of the image." )==false){return false;} else if(numberCheck("img1Heig")==false){form.img1Heig.value=""; return false}
	  }
	  if($("#imgCnt option:selected").val() == 2){
		  if(null_check(form.img1Widt, "Enter the size of the image." )==false){return false;} else if(numberCheck("img1Widt")==false){form.img1Widt.value=""; return false}
		  if(null_check(form.img1Heig, "Enter the size of the image." )==false){return false;} else if(numberCheck("img1Heig")==false){form.img1Heig.value=""; return false}
		  if(null_check(form.img2Widt, "Enter the size of the image." )==false){return false;} else if(numberCheck("img2Widt")==false){form.img2Widt.value=""; return false}
		  if(null_check(form.img2Heig, "Enter the size of the image." )==false){return false;} else if(numberCheck("img2Heig")==false){form.img2Heig.value=""; return false}
	  }
	  if($("#imgCnt option:selected").val() == 3){
		  if(null_check(form.img1Widt, "Enter the size of the image." )==false){return false;} else if(numberCheck("img1Widt")==false){form.img1Widt.value=""; return false}
		  if(null_check(form.img1Heig, "Enter the size of the image." )==false){return false;} else if(numberCheck("img1Heig")==false){form.img1Heig.value=""; return false}
		  if(null_check(form.img2Widt, "Enter the size of the image." )==false){return false;} else if(numberCheck("img2Widt")==false){form.img2Widt.value=""; return false}
		  if(null_check(form.img2Heig, "Enter the size of the image." )==false){return false;} else if(numberCheck("img2Heig")==false){form.img2Heig.value=""; return false}
		  if(null_check(form.img3Widt, "Enter the size of the image." )==false){return false;} else if(numberCheck("img3Widt")==false){form.img3Widt.value=""; return false}
		  if(null_check(form.img3Heig, "Enter the size of the image." )==false){return false;} else if(numberCheck("img3Heig")==false){form.img3Heig.value=""; return false}
	  }
	  
	  if($("#imgCnt option:selected").val() == 1){
		  $("#img1WidtHeig").val($("#img1Widt").val() + "," + $("#img1Heig").val());
	  }
	  if($("#imgCnt option:selected").val() == 2){
		  $("#img1WidtHeig").val($("#img1Widt").val() + "," + $("#img1Heig").val());
		  $("#img2WidtHeig").val($("#img2Widt").val() + "," + $("#img2Heig").val());
	  }
	  if($("#imgCnt option:selected").val() == 3){
		  $("#img1WidtHeig").val($("#img1Widt").val() + "," + $("#img1Heig").val());
		  $("#img2WidtHeig").val($("#img2Widt").val() + "," + $("#img2Heig").val());
		  $("#img3WidtHeig").val($("#img3Widt").val() + "," + $("#img3Heig").val());
	  }
	  
	  return true;
  }
  
  function pageNullCheck2(form){
	  if(null_check(form.tempTitl, "Insert Title!")==false){return false;}
	  if(null_check(form.tempImg, "Choose your Image." )==false){return false;}
	  if(null_check(form.tempHtml, "Choose your HTML file.")==false){return false;}
	  if(fileImgCheck(form.tempImg.value)==false){return false;}
	  if(fileCheck(form.tempHtml.value)==false){return false;}
	  
	  return true;
  }
  
  
	function templateInsert(){
		var form = document.tempForm;
		var flag = false;
		
		//flag = pageNullCheck(form);
		if(form.tempLang.value=='E'){
			form.kindOfWork.value = "commerceTemplateEng";
		}else{
			form.kindOfWork.value = "commerceTemplateMal";
		}
		
		if(form.tempType.value=='L'){
		   flag = pageNullCheck2(form);
		}else{
		   flag = pageNullCheck(form);
		}
		
		if(flag == true){
			form.submit();
		}
	}
	
	$(document).ready(function(){
		$("#imgCnt").change(function(){
			$("#imgCnt option:selected").each(function(){
				if($(this).val() == 1){
					$("#ps1").show();
					$("#ps2").hide();
					$("#ps3").hide();
					$("#ps2").val("");
					$("#ps3").val("");
				}
				if($(this).val() == 2){
					$("#ps1").show();
					$("#ps2").show();
					$("#ps3").hide();
					$("#ps3").val("");
				}
				if($(this).val() == 3){
					$("#ps1").show();
					$("#ps2").show();
					$("#ps3").show();
				}
			});
		});
	});
	
	var defaultSettingAjax = function(contextUrl){
		//var url=""
		if($('#dfltYn').val() == 'Y'){
			var url = contextUrl;
			var postString = "tempType=" + $('#tempType').val();
			
			$.ajax({
				type:"GET",
				url:url,
				cache:false,
				data:postString,
				dataType:"json",
				success: function(data){
					//alert("ggggggggggggg : " + eval('(' + result + ')'));
					/* $(data.object).each(function(key,val){
						alert("dddddddd : " + val.defaultSettingCnt);
					}); */
					if(data[0].defaultSettingCnt > 0){
						var con = confirm("Already another template is the default setting.\nCurrently registered to the template as your default template?");
						if(con){
							
						}else{
							$('#dfltYn').val('N');
						}
					}				
                },
				error : function(jqXHR, textStatus, errorThrown){
                    alert(textStatus + ", " + errorThrown + "," + jqXHR);
                }
			});
		}
	};
	
	var tempTypeChn = function(){
			$('#dfltYn').val('N');
			if($('#tempType').val() == 'L'){
				$('#tn').hide();
				$('#pn').hide();
				$('#ps1').hide();
				$('#ps2').hide();
				$('#ps3').hide();
			}else{
				$('#tn').show();
				$('#pn').show();
				$('#ps1').show();
				if($('#imgCnt').val() == '2'){
					$('#ps2').show();
				}
				if($('#imgCnt').val() == '3'){
					$('#ps3').show();
				}
			}
	};
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
          <!-- <ul>
            <li><a href="#tabs-1">Templet</a></li>
            <li><a href="#tabs-2">Guide</a></li>
            <li><a href="#tabs-3">PR Post</a></li>
          </ul> -->
        <div id="tabs-1">
      <!-- 게시판 목록 : str -->
      <section class="itemSection ">
       <form name="tempForm" id="tempForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/adm/commerce/read">
       <input type="hidden" name="kindOfWork" value="" />
	  <input type="hidden" name="insertFlag" value="B" />
            <table class="boardView write asset" summary="Templet register">
              <colgroup>
                <col width="18%" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>Type<em>*</em></th>
                <td>
                  <select style="height:24px;" class="tmplType" name="tempType" id="tempType" onchange="tempTypeChn();">
                    <option value="P">Promotional</option>
                    <option value="L">Label</option>
                    <option value="B">Brochure</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>Title<em>*</em></th>
                <td>
                  <input type="text" name="tempTitl" value="" id="tempTitl" class="tmplTitle" />
                </td>
              </tr>
              <tr>
                <th>Language<em>*</em></th>
                <td>
                  <select style="height:24px;" class="tempLang" name="tempLang" id="tempLang" onClick="">				                   
                    <option value="M">Malaysian</option>
                    <option value="E">English</option>	                    
                  </select>
                </td>
              </tr>
	          <tr>
                <th>Image<em>*</em></th>
                <td class="filesch">
                  <input type="text" id="fakeFileTxt1" name="tempImg" class="fakeFileTxt" readonly="" />
                  <div class="fileDiv">
                    <input type="button" class="buttonImg" />
                    <input type="file" class="realFile" name="tempImgReal" id="tempImgReal" onchange="javascript:document.getElementById('fakeFileTxt1').value = this.value" />
                  </div>
                </td>
              </tr>
              <tr>
                <th>HTML<em>*</em></th>
                <td class="filesch">
                  <input type="text" id="fakeFileTxt2" name="tempHtml" class="fakeFileTxt" readonly="" />
                  <div class="fileDiv">
                    <input type="button" class="buttonImg" />
                    <input type="file" class="realFile" name="tempHtmlReal" id="tempHtmlReal" onchange="javascript:document.getElementById('fakeFileTxt2').value = this.value" />
                  </div>
                </td>
              </tr>
              <tr id="tn">
                <th>No. of Texts<em>*</em></th>
                <td>
                  <input type="text" name="textCnt" value="" id="textCnt"  />
                </td>
              </tr>
              <tr id="pn">
                <th>No. of Photo<em>*</em></th>
                <td>
                  <select name="imgCnt" id="imgCnt" style="width:50px">
                  	<option value="1">1</option>
                  	<option value="2">2</option>
                  	<option value="3">3</option>
                  </select>
                </td>
              </tr>
              <tr id="ps1" style="display:block;">
                <th>Photo size 1<em>*</em></th>
                <td>
                  width : <input type="text" name="img1Widt" value="" id="img1Widt"  />
                  height : <input type="text" name="img1Heig" value="" id="img1Heig"  />
                  <input type="hidden" name="img1WidtHeig" id="img1WidtHeig" />
                </td>
              </tr>
              <tr id="ps2" style="display:none;">
                <th>Photo size 2<em>*</em></th>
                <td>
                  width : <input type="text" name="img2Widt" value="" id="img2Widt"  />
                  height : <input type="text" name="img2Heig" value="" id="img2Heig"  />
                  <input type="hidden" name="img2WidtHeig" id="img2WidtHeig" />
                </td>
              </tr>
              <tr id="ps3" style="display:none;">
                <th>Photo size 3<em>*</em></th>
                <td>
                  width : <input type="text" name="img3Widt" value="" id="img3Widt"  />
                  height : <input type="text" name="img3Heig" value="" id="img3Heig"  />
                  <input type="hidden" name="img3WidtHeig" id="img3WidtHeig" />
                </td>
              </tr>
              <tr>
                <th>Default</th>
                <td ${defaultSettingCnt}>
                  <select style="height:24px;" class="tmplDefault" name="dfltYn" id="dfltYn" onchange="defaultSettingAjax('${pageContext.request.contextPath }/adm/commerce/defaultSettingAjax/');">
                    <option value="N">N</option>
                    <option value="Y">Y</option>
                  </select>
                  <div id="some-div"></div>
                </td>
              </tr>              
            </table>
            </form>
          </section>
     <!-- 게시판 목록 : end -->
     </div>
        <div id="tabs-2" style="display:none;">
       		<h1>Here is tabs-2</h1>
        </div>
        <div id="tabs-3" style="display:none;">
          	<h1>Here is tabs-3</h1>
        </div>
        
      </div>
      <!-- 탭=========================================== : end -->
    </div>


    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <li>
          <div class="button1 type2 enter">
            <a href="javascript:templateInsert()"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Register</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="${pageContext.request.contextPath }/adm/commerce/list/">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->

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
