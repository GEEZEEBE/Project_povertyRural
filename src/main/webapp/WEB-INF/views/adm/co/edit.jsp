<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript">
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
	  if(null_check(form.tempTitl, "Insert Title!")==false){return;}
	  if(null_check(form.tempImg, "Choose your Image." )==false){return;}
	  if(null_check(form.tempHtml, "Choose your HTML file.")==false){return;}
	  if(fileImgCheck(form.tempImg.value)==false){return;}
	  if(fileCheck(form.tempHtml.value)==false){return;} 
	 
	  if(null_check(form.textCnt, "Insert your Number.")==false){return;} else if(numberCheck("textCnt")==false){form.textCnt.value=""; return false}
	  if($("#imgCnt option:selected").val() == 1){
		  if(null_check(form.img1Widt, "Enter the size of the image." )==false){return;} else if(numberCheck("img1Widt")==false){form.img1Widt.value=""; return false}
		  if(null_check(form.img1Heig, "Enter the size of the image." )==false){return;} else if(numberCheck("img1Heig")==false){form.img1Heig.value=""; return false}
	  }
	  if($("#imgCnt option:selected").val() == 2){
		  if(null_check(form.img1Widt, "Enter the size of the image." )==false){return;} else if(numberCheck("img1Widt")==false){form.img1Widt.value=""; return false}
		  if(null_check(form.img1Heig, "Enter the size of the image." )==false){return;} else if(numberCheck("img1Heig")==false){form.img1Heig.value=""; return false}
		  if(null_check(form.img2Widt, "Enter the size of the image." )==false){return;} else if(numberCheck("img2Widt")==false){form.img2Widt.value=""; return false}
		  if(null_check(form.img2Heig, "Enter the size of the image." )==false){return;} else if(numberCheck("img2Heig")==false){form.img2Heig.value=""; return false}
	  }
	  if($("#imgCnt option:selected").val() == 3){
		  if(null_check(form.img1Widt, "Enter the size of the image." )==false){return;} else if(numberCheck("img1Widt")==false){form.img1Widt.value=""; return false}
		  if(null_check(form.img1Heig, "Enter the size of the image." )==false){return;} else if(numberCheck("img1Heig")==false){form.img1Heig.value=""; return false}
		  if(null_check(form.img2Widt, "Enter the size of the image." )==false){return;} else if(numberCheck("img2Widt")==false){form.img2Widt.value=""; return false}
		  if(null_check(form.img2Heig, "Enter the size of the image." )==false){return;} else if(numberCheck("img2Heig")==false){form.img2Heig.value=""; return false}
		  if(null_check(form.img3Widt, "Enter the size of the image." )==false){return;} else if(numberCheck("img3Widt")==false){form.img3Widt.value=""; return false}
		  if(null_check(form.img3Heig, "Enter the size of the image." )==false){return;} else if(numberCheck("img3Heig")==false){form.img3Heig.value=""; return false}
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
	  if(null_check(form.tempTitl, "Insert Title!")==false){return;}
	  if(null_check(form.tempImg, "Choose your Image." )==false){return;}
	  if(null_check(form.tempHtml, "Choose your HTML file.")==false){return;}
	  if(fileImgCheck(form.tempImg.value)==false){return;}
	  if(fileCheck(form.tempHtml.value)==false){return;} 	  
	 
	  return true;
  }
  
	function templeteUpdate(){
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
		$("#imgCnt option:selected").each(function(){
			if($(this).val() == 1){
				$("#ps1").show();
				$("#ps2").hide();
				$("#ps3").hide();
				$("#ps2").val("");
				$("#ps3").val("");
				$("#img2WidtHeig").val("");
				$("#img3WidtHeig").val("");
				
			}
			if($(this).val() == 2){
				$("#ps1").show();
				$("#ps2").show();
				$("#ps3").hide();
				$("#ps3").val("");
				$("#img3WidtHeig").val("");
			}
			if($(this).val() == 3){
				$("#ps1").show();
				$("#ps2").show();
				$("#ps3").show();
			}
			if("${command.tempType}" == 'L'){
				$("#tn").hide();
				$("#pn").hide();
				$("#ps1").hide();
				$("#ps2").hide();
				$("#ps3").hide();
			}
			});
		
		$("#imgCnt").change(function(){
			$("#imgCnt option:selected").each(function(){
				if($(this).val() == 1){
					$("#ps1").show();
					$("#ps2").hide();
					$("#ps3").hide();
					$("#ps2").val("");
					$("#ps3").val("");
					$("#img2WidtHeig").val("");
					$("#img3WidtHeig").val("");
					
				}
				if($(this).val() == 2){
					$("#ps1").show();
					$("#ps2").show();
					$("#ps3").hide();
					$("#ps3").val("");
					$("#img3WidtHeig").val("");
				}
				if($(this).val() == 3){
					$("#ps1").show();
					$("#ps2").show();
					$("#ps3").show();
				}
			});
		});
		
		$("#tempImgReal").change(function(){
			$("#fileChangeImg").val("Y");
		});
		$("#tempHtmlReal").change(function(){
			$("#fileChangeHtml").val("Y");
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
					/*  $('#some-div').append("111111");
                    $('#some-div').append(data[0].defaultSettingCnt);
                    for (var i=0; i<data.length; ++i)
                    {
                    alert(data[i].defaultSettingCnt);
                    } 
                    alert( "Data Saved: " + data.get("ddd"));*/
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
        <div id="tabs-1">
      <!-- 게시판 목록 : str -->
      <section class="itemSection ">
       <form name="tempForm" id="tempForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/adm/commerce/">
	  <input type="hidden" name="insertFlag" value="A" />	  
	  <input type="hidden" name="tempId" value="${command.tempId }" />
	  <input type="hidden" name="fileChangeImg" id="fileChangeImg" value="N" />
	  <input type="hidden" name="fileChangeHtml" id="fileChangeHtml" value="N" />
	  <input type="hidden" name="oriImg" value="${command.tempImg }" />
	  <input type="hidden" name="oriHtml" value="${command.tempHtml}" />
	  <input type="hidden" name="oriImgPhysical" value="${command.pfnImgName }" />
	  <input type="hidden" name="oriHtmlPhysical" value="${command.pfnHtmlName}" />
	  <input type="hidden" name=uniqueKeyImg value="${command.uniqueKeyImg }" />
	  <input type="hidden" name="uniqueKeyHtml" value="${command.uniqueKeyHtml}" />
	  <input type="hidden" name="kindOfWork" value="" />
	  
            <table class="boardView write asset" summary="Templet register">
              <colgroup>
                <col width="18%" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>Type<em>*</em></th>
                <td>
                <c:if test="${command.dfltYn=='Y'}">
                  <select style="height:24px;" class="tmplType" name="tempType" id="tempType" onchange="tempTypeChn();">
                  <c:if test="${command.tempType=='P'}">                                      	
                    <option value="P">Promotion Templete</option>
                  </c:if>
                  <c:if test="${command.tempType=='L'}">
                    <option value="L">Label Templete</option>
                  </c:if>
                  <c:if test="${command.tempType=='B'}">
                    <option value="B">Brochure Templete</option>
                  </c:if>                    
                  </select>
                </c:if>  
                <c:if test="${command.dfltYn=='N'}">
                  <select style="height:24px;" class="tmplType" name="tempType" id="tempType" onchange="tempTypeChn();">                  	
                    <option value="P" <c:if test="${command.tempType eq 'P'}">selected</c:if>>Promotional</option>
                    <option value="L" <c:if test="${command.tempType eq 'L'}">selected</c:if>>Label</option>
                    <option value="B" <c:if test="${command.tempType eq 'B'}">selected</c:if>>Brochure</option>                    
                  </select>
                </c:if>              
                </td>
              </tr>
              <tr>
                <th>Title<em>*</em></th>
                <td>
                  <input type="text" name="tempTitl" value="${command.tempTitl}" id="tempTitl" class="tmplTitle" />
                </td>
              </tr>
              <tr>
                <th>Language<em>*</em></th>
                <td>
                  <select style="height:24px;" class="tempLang" name="tempLang" id="tempLang">
                    <option value="M">Malaysian</option>
                    <option value="E">English</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>Image<em>*</em></th>
                <td class="filesch">
                  <input type="text" id="fakeFileTxt1" name="tempImg" class="fakeFileTxt" value="${command.tempImg }" readonly="" />
                  <div class="fileDiv">
                    <input type="button" class="buttonImg" />
                    <input type="file" class="realFile" name="tempImgReal" id="tempImgReal" onchange="javascript:document.getElementById('fakeFileTxt1').value = this.value;" />
                  </div>
                </td>
              </tr>
              <tr>
                <th>HTML<em>*</em></th>
                <td class="filesch">
                  <input type="text" id="fakeFileTxt2" name="tempHtml" class="fakeFileTxt" value="${command.tempHtml }" readonly="" />
                  <div class="fileDiv">
                    <input type="button" class="buttonImg" />
                    <input type="file" class="realFile" name="tempHtmlReal" id="tempHtmlReal" onchange="javascript:document.getElementById('fakeFileTxt2').value = this.value;" />
                  </div>
                </td>
              </tr>
              <tr id="tn">
                <th>No. of Texts<em>*</em></th>
                <td>
                  <input type="text" name="textCnt" id="textCnt" value="${command.textCnt}"  />
                </td>
              </tr>
              <tr id="pn">
                <th>No. of Photo<em>*</em></th>
                <td>
                  <select name="imgCnt" id="imgCnt" style="width:50px">
                  	<option value="1" <c:if test="${command.imgCnt eq '1'}">selected</c:if>>1</option>
                  	<option value="2" <c:if test="${command.imgCnt eq '2'}">selected</c:if>>2</option>
                  	<option value="3" <c:if test="${command.imgCnt eq '3'}">selected</c:if>>3</option>
                  </select>
                </td> 
              </tr>
              <tr id="ps1" style="display:block;">
                <th>Photo size 1<em>*</em></th>
                <td>
                  width : <input type="text" name="img1Widt"  id="img1Widt"  value="${fn:split(command.img1WidtHeig,',')[0]}"/>
                  height : <input type="text" name="img1Heig"  id="img1Heig"  value="${fn:split(command.img1WidtHeig,',')[1]}" />
                  <input type="hidden" name="img1WidtHeig" id="img1WidtHeig"  value="${command.img1WidtHeig}"/>
                </td>
              </tr>
              <tr id="ps2" style="display:none;">
                <th>Photo size 2<em>*</em></th>
                <td>
                  width : <input type="text" name="img2Widt" id="img2Widt" value="${fn:split(command.img2WidtHeig,',')[0]}"  />
                  height : <input type="text" name="img2Heig" id="img2Heig" value="${fn:split(command.img2WidtHeig,',')[1]}"  />
                  <input type="hidden" name="img2WidtHeig" id="img2WidtHeig" value="${command.img2WidtHeig}"/>
                </td>
              </tr>
              <tr id="ps3" style="display:none;">
                <th>Photo size 3<em>*</em></th>
                <td>
                  width : <input type="text" name="img3Widt"  id="img3Widt"  value="${fn:split(command.img3WidtHeig,',')[0]}"/>
                  height : <input type="text" name="img3Heig"  id="img3Heig" value="${fn:split(command.img3WidtHeig,',')[1]}" />
                  <input type="hidden" name="img3WidtHeig" id="img3WidtHeig" value="${command.img3WidtHeig}" />
                </td>
              </tr>
              <tr>
                <th>Default</th>
                <td>                
                  <select style="height:24px;" class="tmplDefault" name="dfltYn" id="dfltYn" onchange="defaultSettingAjax('${pageContext.request.contextPath }/adm/commerce/defaultSettingAjax/');">
                  <c:if test="${command.dfltYn=='N'}">
                    <option value="N">N</option>
                    <option value="Y">Y</option>
                  </c:if>
                  <c:if test="${command.dfltYn=='Y'}">
                    <option value="Y">Y</option>                    
                  </c:if>
                  </select>                 
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
          <div class="button1 type2 save">
            <a href="javascript:templeteUpdate()"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Save</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="${pageContext.request.contextPath }/adm/commerce/list?searchSel=${param.searchSel}">Cancel</a>
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
