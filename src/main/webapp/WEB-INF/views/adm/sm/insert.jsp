<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  - PROGRAM ID  : insert.jsp
  - AUTHOR      : jsjeon
  - CREATED     : 2013.01.22
  - DESCRIPTION : 아이템관리>아이템 등록페이지
--%>

<script type="text/javascript">


$(function() {
	$("input[class='product']").click(function(){
		if ($("ol[name='productInfo']").length > 0) {
			$("ol[name='productInfo']").remove();		
		} else {
			$("input[class='product']").after(				
					"<ol name='productInfo'>"
	              + "<li><strong>[Product information]</strong></li>"
	              + "<li>Product : Product name</li>"
	              + "<li>Product type : Item product</li>"
	              + "<li>Category : Learning > Smart class > UPSR > Math</li>"
	              + "<li>Information : Math vod</li>"
	              + "</ol>"
					);
		}
	});
	
	
	$('input[name="allCheck"]').click(function() {
        if ($(this).is(":checked")) {
            $('input[type="checkbox"]:enabled').attr("checked", true);
        } else {
            $('input[type="checkbox"]:enabled').attr("checked", false);
        }
    });
});

function doSubmit(url,actionName) {
	f = document.forms[0];
	f.action = url;
	if('item/insert'==actionName){
		if($('#assetFlag').val() == 'true' && $('#productFlag').val() == 'true'){
			f.method='post';
	        f.submit();	
		} else if($('#assetFlag').val() == 'true' && $('#productFlag').val() == 'false') {
			alert("Please select a Product.");
			return;
		} else if($('#assetFlag').val() == 'false' && $('#productFlag').val() == 'true') {
			alert("Please select a Asset.");
			return;
        } else {
        	alert("Please select a Product and Asset.");
        }
	}else if('item/list'==actionName){
		
		$('select[name=searchAssetType]').val("");
		$('#searchSrvcID').val("");

		f.method='post';
		f.submit();
	}
	
}
</script>

<form name="itemInsert" id="itemInsert">

<!-- <input type="hidden" id="frstRgstUserID" name="frstRgstUserID" value="admin" />
<input type="hidden" id="latCrctUserID" name="latCrctUserID" value="admin" /> -->

<input type="hidden" id="assetFlag" name="assetFlag" value="false" />
<input type="hidden" id="productFlag" name="productFlag" value="false" />
<!--  -->
<input type="hidden" id="godsID" name="godsID" value="" />

 <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Item Management</h2>
		  <h3>Map data registered as assets with roducts and services</h3>
        </hgroup>
        <p class="sch write">
          <em>*</em> Required Fields
        </p>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str================================================================ -->
      <section class="itemSection">
        <table class="boardView write" summary="Product Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Select Product<em>*</em></th>
            <td class="itemRegister">
              <a href="#" class="button01" class="ui-state-default ui-corner-all" id="productBtn"><img src="<c:url value='/resources/images/btn_product.gif' />" alt="Product" /></a>

            </td>
          </tr>
          <tr>
            <th>Select Asset<em>*</em></th>
            <td class="itemRegister">
              <p>
                <a href="#" class="button02" class="ui-state-default ui-corner-all"><img src="<c:url value='/resources/images/btn_asset.gif' />" alt="Asset" /></a>
                <span class="exText">* Multiple selection is allowed </span>
              </p>
              <div id="asset">
              </div>
            </td>
          </tr>
        </table>
      </section>
     <!-- 게시판 목록 : end============================================================================ -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li class="type2">
          <div class="button1 type2 enter">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/insert','item/insert')"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Register</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/list','item/list')">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 버튼그룹 : end -->

    <!-- 팝업 : srt -->

    <script>
    //팝업1-Product====================
    $(function() {
      // run the currently selected effect
      function runEffect() {
        // get effect type from
        var selectedEffect = $( ".effectTypes" ).val();
        // most effect types need no options passed by default
        var options = {};

        // run the effect
        $( ".effect" ).show( selectedEffect, options, 500, callback );
        $('body').css({"overflow-y":"scroll"});
      };

      //callback function to bring a hidden box back
      function callback() {
        setTimeout(function() {
          $( ".effect:visible" ).removeAttr( "style" ).fadeIn();
        }, 1000 );
      };

      //버튼 클릭시 body 스크롤 hidden
      $(document).ready(function(){
        $(".button01").click(function(){
          $('body').css({"overflow-y":"hidden", "margin-right":"17px"});
          return false;
        });
      });
      //닫기 버튼 클릭시 body 스크롤
      $(document).ready(function(){
        $(".btnClose").click(function(){
          runEffect();
          $( ".effect" ).hide();
          $('body').css({"margin-right":"0", "overflow-y":"scroll"});
          
          ///////////////////////////////////////////////////////
          $('#pt1').attr('checked','checked');
          $('input[name=godsName]').val("");
          $('#categoryOne option:first').attr('selected','selected');
          $('#categoryTwo').html('<option>selected</option>');
          $('#categoryThree').html('<option>selected</option>');
          $('#categoryFour').html('<option>selected</option>');
          $('#popTbody').html("");
          ///////////////////////////////////////////////////////
        });
      });
      //btnEnter 버튼 클릭시 body 스크롤 scroll
      $(document).ready(function(){
        $(".btnEnter").click(function(){
            runEffect();
            $( ".effect" ).hide();
            $('body').css({"margin-right":"0", "overflow-y":"scroll"});
        });
      });
      // set effect from select menu value
      $( ".button01" ).click(function() {
        runEffect();
        return false;
      });
      $( ".effect" ).hide();

    });
    
    function selectProduct(){
    	f = document.forms[0];
    	var value = $('input[name=productRadio]:checked').val();
    	if(value==null){
    		alert("Please select a Product.");
    		return;
    	}
   
    	var arrStr = value.split(':');
        var godsId = arrStr[0];
        var srvcId = arrStr[1];     
        
        $.ajax({
            type    : "GET",
            url     : "${pageContext.request.contextPath }/restful/item/godsInfo",
            dataType: "json",
            data: ({
            	searchSrvcID : srvcId,
                godsID : godsId
            }),
            success : function(data){
            	$('ol[name=productInfo]').remove();
            	
            	var categoryNode = "";
            	$.each(data.categoryList, function(i,item){
            		
            		if(i < data.categoryList.length-1){
            			  categoryNode = categoryNode + item.SRVC_CTGR_NM + " > ";	
            		} else {
            			categoryNode = categoryNode + item.SRVC_CTGR_NM;
            		}
            		
                }); 
            	
            	$('#productBtn').after(                
                        "<ol name='productInfo'>"
                        + "<li><strong>[Product information]</strong></li>"
                        + "<li>Product name : "+data.godsInfo.godsName+"</li>"
                        + "<li>Product type : "+data.godsInfo.godsDvsn+"</li>"
                        + "<li>Category : "+categoryNode+"</li>"
                        + "<li>Information : "+data.godsInfo.description+"</li>"
                        + "</ol>"
                          );
            	/* $('#itemInsert').append("<input type='hidden' id='godsID' name='godsID' value='"+data.godsInfo.godsID+"' />"); */
            	$('#godsID').val(data.godsInfo.godsID);
            	$( ".effect" ).hide();
            	$('#productFlag').val("true");
            },
            error : function(request,status,error){ 
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
           
          });
    }
    
    function searchProduct(){
    	$("#searchSrvcID").val("");
    	
    	f = document.forms[0];
    	
    	var one = $('#categoryOne').val();
        var two = $('#categoryTwo').val();
        var three = $('#categoryThree').val();
        var four = $('#categoryFour').val();
        var node;
        
        if ("Select" != four) {
            node = four;
        } else if ("Select" != three) {
            node = three;
        } else if ("Select" != two) {
            node = two;
        } else if ("Select" != one) {
            node = one;
        } else {
            node = "";
        }
        
        if(""!=node){
	        var arrStr = node.split(':');
	        var depth = arrStr[0];  
	        depth = Number(depth)+1;
	        var lft = arrStr[1];     
	        var rgt = arrStr[2];    
	        var srvcId = arrStr[3];
	        
	        f.searchSrvcID.value = srvcId;
	        
        }
        
    	$('#popTbody').empty();
    	
        $.ajax({
          type    : "GET",
          url     : "${pageContext.request.contextPath }/restful/item/godsList",
          dataType: "json",
          data: ({
        	  searchSrvcID : $("#searchSrvcID").val(),
        	  productType : $("input[name=productType]:checked").val(),
        	  godsName : $("input[name=godsName]").val()
          }),
          success : function(data){
              $.each(data.itmes, function(i,item){
            	  var index = i + 1 ;
                    $('#popTbody').append("<tr><td><input type='radio' name='productRadio' value='"+item.GODS_ID+":"+item.SRVC_ID+"' /></td><td>"+index+"</td><td>"+item.SRVC_CTGR_NM+"</td><td>"+item.CODE_NAME+"</td><td class='alignL'>"+item.GODS_NAME+"</td></tr>");
                });
          },
          error : function(request,status,error){ 
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
         
        });
    		
    }
    
    //팝업2-Asset======================
    $(function() {
      // run the currently selected effect
      function runEffect2() {
        // get effect type from
        var selectedEffect = $( ".effectTypes2" ).val();
        // most effect types need no options passed by default
        var options = {};

        // run the effect
        $( ".effect2" ).show( selectedEffect, options, 500, callback );
        $('body').css({"overflow-y":"scroll"});
      };

      //callback function to bring a hidden box back
      function callback() {
        setTimeout(function() {
          $( ".effect2:visible" ).removeAttr( "style" ).fadeIn();
        }, 1000 );
      };

      //버튼 클릭시 body 스크롤 hidden
      $(document).ready(function(){
        $(".button02").click(function(){
          $('body').css({"overflow-y":"hidden", "margin-right":"17px"})
          return false;
        });
      });
      //닫기 버튼 클릭시 body 스크롤 hidden
      $(document).ready(function(){
        $(".btnClose2").click(function(){
          runEffect2();
          $( ".effect2" ).hide();
          $('body').css({"margin-right":"0", "overflow-y":"scroll"});
          
          
          /////////////////////////////////////////////////////
          $('select[name=searchAssetType] option:first').attr('selected','selected');
          $('input[name=assetName]').val("");
          /////////////////////////////////////////////////////
          
        });
      });

      //btnEnter2 버튼 클릭시 body 스크롤 scroll
      $(document).ready(function(){
        $(".btnEnter2").click(function(){
            runEffect2();
            $( ".effect2" ).hide();
            $('body').css({"margin-right":"0", "overflow-y":"scroll"});
        });
      });
      
      // set effect from select menu value
      $( ".button02" ).click(function() {
        runEffect2();
        searchAsset();
        return false;
      });

      $( ".effect2" ).hide();
    });
    
    
    function selectAsset(){
    	f = document.forms[0];
    	
    	var tableStart = "<table id='insertAssetTable' class='boardList register'>"
					      +"<colgroup>"
					      +"<col width='80'>"
					      +"<col width='260'>"
					      +"<col width='70'>"
					      +"<col width='*'>"
					      +"</colgroup>"
					      +"<thead>"
					      +"<tr>"
					      +"	<th class='one'>Type</th>"
					      +"	<th>Name</th>"
					      +"	<th>Price</th>"
					      +"	<th class='end'>Delete</th>"
					      +"</tr>"
					      +"</thead>"
					      +"</table>"
					      +"<div class='cropwinList'>"
					      +"<table class='boardList register list'>"
					      +"<colgroup>"
					      +"<col width='80'>"
					      +"<col width='260'>"
					      +"<col width='70'>"
					      +"<col width='*'>"
					      +"</colgroup>"
					      +"<tbody id='insertAssetTbody'>";
					      
		var tableEnd = "</tbody></table></div>";
		
		var checkCount = $("input[name=assetCheck]:checkbox:checked").length;
	    
		var tableRow="";
		if(checkCount > 0){
		for(var i = 0; i<checkCount; i++){
			tableRow = tableRow + "<tr id='assetRow"+i+"'>"
			                    + "<td>" + $($("input[name=assetCheck]:checkbox:checked").parent().siblings('#popAssetType')[i]).text() + "</td>"
			                    + "<td class='alignL'>" + $($("input[name=assetCheck]:checkbox:checked").parent().siblings('#popAssetName')[i]).text() + "</td>"
			                    + "<td><input type='num' name='inputPrice' class='inputPrice' maxlength='20' value='"+$($("input[name=assetCheck]:checkbox:checked").parent().siblings('#popAssetPrice')[i]).text()+"' /></td>"
			                    + "<td class='btnDelete alignC'><input value='' type='button' onclick='assetDelete("+i+");' /></td>"
			                    + "</tr>";
			$('#itemInsert').append("<input type='hidden' id='exceptAssetID"+i+"' name='exceptAssetID' value='"+$($("input[name=assetCheck]:checkbox:checked")[i]).val()+"' />");
			$('#itemInsert').append("<input type='hidden' id='cntsName"+i+"' name='cntsName' value='"+$($("input[name=assetCheck]:checkbox:checked").parent().siblings('#popAssetName')[i]).text()+"' />");
		}

		var assertTable = "";
		$( ".effect2" ).hide();
		if($('#insertAssetTable').length>0){
			$('#insertAssetTbody').append(tableRow);
		} else {
			assertTable = tableStart+tableRow+tableEnd;
			$('#asset').append(assertTable);
		}
		$('#assetFlag').val("true");
		}else{
			alert("Please select a Asset.");
		}
    	
    }
    
    function assetDelete(assetID){
    	$("#assetRow"+assetID).remove();
    	$("#exceptAssetID"+assetID).remove();
    }
    
    
    function searchAsset(){
        f = document.forms[0];
        
        var count = $('input[name=exceptAssetID]').length;
        var exceptAssetID = "";
        for(var i = 0; i<count; i++){
        	if(i==count-1){
        		exceptAssetID = exceptAssetID + $($('input[name=exceptAssetID]')[i]).val();
        	}else{
        		exceptAssetID = exceptAssetID + $($('input[name=exceptAssetID]')[i]).val()+":";
        	}
        }
        
        $('#assetTbody').empty();
        
        $.ajax({
          type    : "GET",
          url     : "${pageContext.request.contextPath }/restful/item/assetList",
          dataType: "json",
          data: ({
        	  assetType : $("select[name=searchAssetType]").val(),
        	  assetName : $("input[name=assetName]").val(),
        	  exceptAssetID : exceptAssetID
          }),
          success : function(data){
              $.each(data.itmes, function(i,item){
            	  var index = i + 1 ;
            	  $('#assetTbody').append("<tr><td><input type='checkbox' name='assetCheck' value='"+item.ASSET_ID+"' /></td><td>"+index+"</td><td id='popAssetType'>"+item.CODE_NAME+"</td><td class='alignL' id='popAssetName'>"+item.ITEM_NM+"</td><td class='alignR price' id='popAssetPrice'>"+item.COSTPRIC+"</td></tr>");
                    
                });
          },
          error : function(request,status,error){ 
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
         
        });
            
    }
    
    </script>

    <!-- 팝업1-Product : str -->
    <input type="hidden" id="searchSrvcID" name="searchSrvcID" />
    <section class="toggler popup" id="draggable" class="ui-widget-content">
      <div class="effect" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Product</span>
                <div class="button4">
                  <a href="#" class="btnClose" onclick="$( '.effect' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <fieldset>
                <legend>Service Category</legend>
                <dl>
                  <dt>Service Category</dt>
                  <dd>
		              <select style="height:24px;" id="categoryOne" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryOne','categoryTwo','');">
		                <option>Select</option>
		                <c:forEach var="category" items="${categoryList}">
		                <option value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM }</option>
		                </c:forEach>
		              </select>
		              <select style="height:24px;" id="categoryTwo" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryTwo','categoryThree','');">
		                <option>Select</option>
		              </select>
		              <select style="height:24px;" id="categoryThree" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryThree','categoryFour','');">
		                <option>Select</option>
		              </select>
		              <select style="height:24px;" id="categoryFour">
		                <option>Select</option>
		              </select>
                  </dd>
                  <dt>
                    <label><input type="radio" id="pt1" name="productType" value="00102" checked="checked" />Item Product</label>
                    <label><input type="radio" id="pt2" name="productType" value="00101" />Rental Product</label>
                  </dt>
                  <dd>
                    <span>Product</span>
                    <p class="sch">
                      <input type="text" name="godsName" title="검색어 입력" />
                      <button type="button" onclick="javascript:searchProduct();" ></button>
                    </p>
                  </dd>
                </dl>
              </fieldset>
              <div class="popupCategory">
                <table class="boardList register">
                  <colgroup>
                      <col width="40">
                      <col width="60">
                      <col width="110">
                      <col width="110">
                      <col width="*">
                  </colgroup>
                  <thead>
                    <tr>
                      <th class="one"></th>
                      <th>No.</th>
                      <th>Service</th>
                      <th>Product Type</th>
                      <th class="end">Product</th>
                    </tr>
                  </thead>
                </table>
                <div class="cropwinList">
                  <table class="boardList register list">
                    <colgroup>
                      <col width="40">
                      <col width="60">
                      <col width="110">
                      <col width="110">
                      <col width="*">
                    </colgroup>
                    <tbody id="popTbody">
                    </tbody>
                  </table>
                </div>
                </table>
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5 enter">
                <a class="btnEnter" href="javascript:selectProduct();"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Register</span></a>
              </div>
              <div class="button5">
                <a href="#" class="btnClose" onclick="$( '.effect' ).hide();">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    <!-- 팝업1-Product : end -->
    
    
    
    <!-- 팝업2-Asset : str -->
    <section class="toggler popup" id="draggable2" class="ui-widget-content">
      <div class="effect2" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Asset</span>
                <div class="button4">
                  <a href="#" class="btnClose2" onclick="$( '.effect2' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <fieldset class="asset">
                <legend>Service Category</legend>
                <dl>
                  <dt>
                    Asset Type
                    <select style="height: 24px;" name="searchAssetType">
                    <option value="">All</option>
                    <c:forEach var="assetType" items="${assetType}">
                        <option value="<c:out value ='${assetType.commonCodeID}'/>" <c:if test="${param.searchAssetType eq assetType.commonCodeID}"> <c:out value="selected" /></c:if>>${assetType.codeName } </option>
                    </c:forEach>
                    </select>
                  </dt>
                  <dd>
                    <span>Product</span>
                    <p class="sch">
                      <input type="text" name="assetName" title="검색어 입력" />
                      <button type="button" onclick="javascript:searchAsset();"></button>
                    </p>
                  </dd>
                </dl>
              </fieldset>
              <div class="popupCategory asset">
                <table class="boardList register">
                  <colgroup>
                      <col width="50">
                      <col width="60">
                      <col width="100">
                      <col width="*">
                      <col width="80">
                  </colgroup>
                  <thead>
                    <tr>
                      <th class="one"></th>
                      <th>No.</th>
                      <th>Type</th>
                      <th>Name</th>
                      <th class="end">Price</th>
                    </tr>
                  </thead>
                </table>
                <div class="cropwinList">
                  <table class="boardList register list">
                    <colgroup>
                      <col width="50">
                      <col width="60">
                      <col width="100">
                      <col width="*">
                      <col width="80">
                    </colgroup>
                    <tbody id="assetTbody">
                      <!-- <tr>
                        <td><input type="checkbox" /></td>
                        <td>4</td>
                        <td>VOD</td>
                        <td class="alignL">Math2</td>
                        <td class="alignR price">1,000</td>
                      </tr> -->
                    </tbody>
                  </table>
                </div>
                </table>
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5 enter">
                <a class="btnEnter2" href="javascript:selectAsset();"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Register</span></a>
              </div>
              <div class="button5">
                <a href="#" class="btnClose2" onclick="$( '.effect2' ).hide();">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    <!-- 팝업2-Asset : end -->

    <!-- 팝업 : end -->
</form>