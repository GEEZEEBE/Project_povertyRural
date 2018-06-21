<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

function doSubmit(url,actionName) {
    f = document.forms[0];
    if('item/update'==actionName){
        f.method='post';        
    }else if("item/read" == actionName){
    	f.method='post';       
    }
    f.action = url;
    f.submit();
}
</script>


<form>
<input type="hidden" id="currentPage" name="currentPage" value="${param.currentPage }" />
<input type="hidden" id="srvcID" name="srvcID" value="${param.srvcID }" />
<input type="hidden" id="itemID" name="itemID" value="${ITEM.ITEM_ID }" />
<input type="hidden" id="godsID" name="godsID" value="${ITEM.GODS_ID }" />

<input type="hidden" name="searchSrvcID" value="${param.searchSrvcID }">

<input type="hidden" name="categoryOne" value="${param.categoryOne }" />
<input type="hidden" name="categoryTwo" value="${param.categoryTwo }" />
<input type="hidden" name="categoryThree" value="${param.categoryThree }" />

<input type="hidden" name="searchAssetType" value="${param.searchAssetType }" />
<input type="hidden" name="searchGodsDvsn" value="${param.searchGodsDvsn }" />
<input type="hidden" name="searchAssetName" value="${param.searchAssetName }" />
<!-- <input type="hidden" id="frstRgstUserID" name="frstRgstUserID" value="admin" />
<input type="hidden" id="latCrctUserID" name="latCrctUserID" value="admin" /> -->
<div>
<!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Item Management</h2>
		  <h3>Map data registered as assets with roducts and services</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <section class="itemSection mb18">
        <h4>Item Information</h4>
        <table class="boardView item" summary="Item Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
            <col width="18%" />
            <col width="25%" />
          </colgroup>
          <tr>
            <th>Date</th>
            <td><c:out value="${ITEM.FRST_RGST_DT }" /></td>
            <th>Registered by</th>
            <td><c:out value="${ITEM.FRST_RGST_USER_ID } "/></td>
          </tr>
          <tr>
            <th>Item</th>
            <td colspan="3"><c:out value="${ITEM.CNTS_NAME }" /></td>
          </tr>
          <tr>
            <th>Asset Type</th>
            <td colspan="3"><c:out value="${ITEM.ASSET_TYPE_NAME } "/></td>
          </tr>
          <tr class="bottomLine">
            <th>Price</th>
            <td colspan="3"><input type="num" name="inputPrice" maxlength="9" class="inputPrice" value="${ITEM.FLAT_RATE }" /></td>
          </tr>
        </table>
      </section>
      <section class="itemSection">
        <h4>Product Information</h4>
        <table class="boardView write" summary="Product Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr class="bottomLine">
            <th>Product<em>*</em></th>
            <td class="itemRegister">
              <a href="#" class="button01" id="productBtn" class="ui-state-default ui-corner-all"><img src="<c:url value='/resources/images/btn_product.gif'/>" alt="Product" /></a>
              <ol name="productInfo">
                <li><strong>[Product Information]</strong></li>
                <li>Product : <c:out value="${ITEM.GODS_NAME }" /></li>
                <li>Product Type : <c:out value="${ITEM.GODS_TYPE_NAME }" /> </li>
                <li>
                Category : <c:forEach var="category" items="${godsCategory}" varStatus="status">
                               <c:choose>
                               <c:when test="${status.index+1 != fn:length(godsCategory)}">
                                   <c:out value="${category.SRVC_CTGR_NM}" /> >
                               </c:when>
                               <c:otherwise>
                                   <c:out value="${category.SRVC_CTGR_NM}" />
                               </c:otherwise>
                               </c:choose>
                           </c:forEach> 
                </li>
                <li>Information : <c:out value="${ITEM.DESCRIPTION }" /></li>
              </ol>
            </td>
          </tr>
        </table>
      </section>
     <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li class="type2">
          <div class="button1 type2 save">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/update','item/update');"><img src="<c:url value='/resources/images/btn_icon_enter.gif'/>" alt="icon" /><span>Save</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/read','item/read');">Cancel</a>
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
          runEffect()
          $( ".effect" ).hide();
          $('body').css({"margin-right":"0", "overflow-y":"scroll"});
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
                        + "<li>Product : "+data.godsInfo.godsName+"</li>"
                        + "<li>Product type : "+data.godsInfo.godsDvsn+"</li>"
                        + "<li>Category : "+categoryNode+"</li>"
                        + "<li>Information : "+data.godsInfo.description+"</li>"
                        + "</ol>"
                          );
                
                $('#godsID').val(data.godsInfo.godsID);
                $('#srvcID').val(data.godsInfo.srvcID);
                $( ".effect" ).hide();
            },
            error : function(request,status,error){ 
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
           
          });
    }
    
    
    function searchProduct(){
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
                    $('#popTbody').append("<tr><td><input type='radio' name='productRadio' value='"+item.GODS_ID+":"+item.SRVC_ID+"' /></td><td>"+i+"</td><td>"+item.SRVC_CTGR_NM+"</td><td>"+item.CODE_NAME+"</td><td class='alignL'>"+item.GODS_NAME+"</td></tr>");
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
                    <label><input type="radio" name="productType" value="00102" checked="checked" />Item Product</label>
                    <label><input type="radio" name="productType" value="00101" />Rental Product</label>
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
                      <th>No</th>
                      <th>Service</th>
                      <th>Type</th>
                      <th class="end">Name</th>
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
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5 enter">
                <a class="btnEnter" href="javascript:selectProduct();"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Resister</span></a>
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

    <!-- 팝업 : end -->
</form>