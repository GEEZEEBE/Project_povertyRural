<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<script>
  //팝업:드래그
  $(function() {
    $( "#draggable3,#draggable2" ).draggable({ handle: ".popupTitle" });
  });
</script>

<div class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Asset Utilization Management</h2>
          <h3>Mange the usage of all the assets here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 탭============================================ : str -->
      <div id="tabs" class="rentReturn">
        <ul>
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/rentList/">Rental Registration</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/returnList/">Return Registration</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/printList/" class="hover">Print Registration</a></li>
        </ul>
      </div>
      <div id="tabs-3">
          <!-- 출력등록 검색조건 : srt -->
          <form id="command">
          <input type="hidden" name="del" value="0"/>
          <table class="boardSch printList" summary="search">
            <colgroup>
              <col width="*" />
              <col width="37.5%" />
            </colgroup>
            <tr>
              <th>
              	<label><input type="radio" name="strSrvcID" value="" checked />All</label>
              	<c:forEach var="categoryList" items="${categoryList}">
              	<c:if test="${categoryList.PARENT_CATEGORY != 2}">
                <label><input type="radio" name="strSrvcID" value="${categoryList.NODE_CATEGORY }" <c:if test="${param.strSrvcID==categoryList.NODE_CATEGORY}">checked</c:if>  />${categoryList.SRVC_CTGR_NM }</label>
                </c:if>
                </c:forEach>
              </th>
              <td>
                <p class="sch">
                  <button type="button" class="serSubmit"></button>
                </p>
              </td>
            </tr>
          </table>
         
          <!-- 출력등록 검색조건 : end -->
          <!-- 출력등록 : str -->
          <table class="boardList" summary="출력등록">
            <colgroup>
              <col width="60" />
              <col width="80" />
              <col width="120" />
              <col width="*" />
              <col width="110" />
              <col width="80" />
              <col width="100" />
            </colgroup>
            <thead>
              <tr>
              	<th class="one"><input type="checkbox" name="allCheck"></th>
                <th>No.</th>
                <th>Service Category</th>
                <th>Product</th>
                <th>Number of Prints</th>
                <th>Users</th>
                <th class="end">Date</th>
              </tr>
            </thead>
            <tbody>
	            <c:if test="${list == null || fn:length(list) == 0}">
		            <tr>
		            	<td colspan="7">No registered result obtained.</td>
		        	</tr>
			    </c:if>
		        <c:forEach var="resultObject" items="${list}" varStatus="status" >
	              <tr>
	              	<td><input type="checkbox" name="del" value="${resultObject.useHsNmbrID}"/></td>
	                <td class="tdfontColor01">${status.index+1}</td>
	                <td>${resultObject.srvcCtgrNM}</td>
	                <td>${resultObject.godsNM}</td>
	                <td>${resultObject.rentDay}</td>
	                <td>${resultObject.userID}</td>
	                <td class="time">${resultObject.frstRgstDT}</td>
	              </tr>
		         </c:forEach>
            </tbody>
          </table>
           </form>
          <div class="btnPrint">
          	<div class="button1">
          		<a href="javascript:doSubmit2('${pageContext.request.contextPath }/adm/assetUtil/printDelete/', 'command', 'post');" class="delPop">Delete</a>
          	</div>
          	<div class="print">
            	<div class="button1 type2 write">
              	    <a href="#" class="button03" class="ui-state-default ui-corner-all"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Register</span></a>
           	    </div>
          </div>
          <div>
          <!-- 출력등록 : end -->
        </div>  
 </div>
    
   <script>
   
 //팝업3:출력등록============================
   $(function() {
     // run the currently selected effect
     function runEffect3() {
       // get effect type from
       var selectedEffect = $( ".effectTypes3" ).val();
       // most effect types need no options passed by default
       var options = {};

       // run the effect
       $( ".effect3" ).show( selectedEffect, options, 500, callback );
     };

     //callback function to bring a hidden box back
     function callback() {
       setTimeout(function() {
         $( ".effect3:visible" ).removeAttr( "style" ).fadeIn();
       }, 1000 );
     };

     //버튼 클릭시 body 스크롤 hidden
     $(document).ready(function(){
       $(".button03").click(function(){
         //$('body').css({"overflow-y":"hidden", "margin-right":"17px"})
         return false;
       });
     });
     //닫기 버튼 클릭시 body 스크롤 hidden
     $(document).ready(function(){
       $(".btnClose3").click(function(e){
         runEffect3();
         $( ".effect3" ).hide();
         $( ".effect2" ).hide();
         //$('body').css({"margin-right":"0", "overflow-y":"scroll"});
       });
     });
     
     function printGodsList(srvcID){
    	 	
    	 $.ajax({
 			url: "${pageContext.request.contextPath }/adm/assetUtil/printGodsList/",
 			type: 'post',
 			data : { "srvcID":srvcID },
 			dataType:"json",
 			//contentType: 'application/json; charset="utf-8"',
 			success: function(data) {
 					$("select[name='godsID']").html("");
 					$.each(data.itmes, function(i,item){
 						//alert(item.srvcCtgrNM+item.godsID+item.godsNM);
 						$("select[name='godsID']").append("<option value='"+item.godsID+"'>"+item.godsNM+"</option>");
 			   		});
 			
 				},
 				beforeSend : function() {
 					//처리중 화면구성
 				},
 				error : function() {
 					alert("정보를 가져오는데 실패하였습니다.");
 				} 					
 		});	
     };
     
     $("select[name='srvcID']").change(function(){
    	 printGodsList($(this).val());
     });
     // set effect from select menu value
     $( ".button03" ).click(function(e) {
    	 printGodsList(1);			
    	 runEffect3();
       return false;
     });
     $( ".effect3" ).hide();
     
     
     
     //member popup
     $( ".effect2" ).hide();
     $( "#button" ).click(function(e) {
	    	e.preventDefault();
	    	var selectedEffect = $( ".effectTypes" ).val();
	        // most effect types need no options passed by default
	        var options = {};

	        // run the effect
	        $( ".effect2" ).show( selectedEffect, options, 500, callback );
	        fgetUserListPopup('${pageContext.request.contextPath }/restful/userList', 'NAME', 'serTxtPop', 'effect2', 'serTxtPop');
	         
   	});
     $(".btnEnter2").click(function(e){
         e.preventDefault();
         
         if($( ".effect2" ).find("input[name='userID']").is(":checked")==false){
       	  alert("Please select members.");
         }
         $( ".effect2" ).find("input[name='userID']").each(function(){
       	 if($(this).is(":checked")){
       		 $("#commandInsert").find("input[name='userID']").val($(this).val()); 
       		 $("#userNM").val( $("#"+$(this).val()).val() );
       		 $( ".effect2" ).hide();
       	 }
       	 
         });
         
         //$( ".effect2" ).hide();
         
     });
     
     $(".btnClose2").click(function(e){
         e.preventDefault();
         $( ".effect2" ).hide();
         
     });
   });
   
   </script>
   
   
   
    <!-- 팝업3 - 출력등록 : srt -->
    <form id="commandInsert">
    <input type="hidden" name="cmplYN" value="E">
    <input type="hidden" name="userID" value="">
    <input type="hidden" name="strSrvcID" value="${param.strSrvcID}">
    <input type="hidden" name="dpstKind" value="00028">
    <input type="hidden" name="dpstMthd" value="00031">
    <input type="hidden" name="payKind" value="00301">

    <input type="hidden" name="frstRgstUserID" value="kut0100">
    <input type="hidden" name="latCrctUserID" value="kut0100">
    <section class="toggler popup" id="draggable3" class="ui-widget-content">
      <div class="effect3" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Print registration</span>
                <div class="button4">
                  <a href="#" class="btnClose3" onclick="$( '.effect3' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody assetWrite print">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <div class="popupCategory">
                <!-- 팝업내용:str -->
                <dl class="rentalWrite">
                  <dt>Product Name</dt>
                  <dd class="gname">
                    <select name="srvcID" style="height: 24px;">
                    	<c:forEach var="categoryList" items="${categoryList}">
                    	<c:if test="${categoryList.PARENT_CATEGORY != 2}">
		                <option value="${categoryList.NODE_CATEGORY }">${categoryList.SRVC_CTGR_NM }</option>
		                </c:if>
		                </c:forEach>
                    </select>
                    <select name="godsID" style="height: 24px;">
                    </select>
                  </dd>
                  <dt>Number of Page(s)</dt>
                  <dd class="output"><input type="text" name="rentDay" value="1" />pgs.</dd>
                  <dt class="noline">Member</dt>
                  <dd class="filesch noline">
                    <input type="text" title="Member name" id="userNM" readonly />
                    <a href="#" id="button" class="ui-state-default ui-corner-all"><img src="<c:url value='/resources/images/btn_member.gif' />" alt="Member" /></a></dd>
                </dl>
                <!-- 팝업내용:end -->
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5 enter">
                <a href="javascript:doSubmit2('${pageContext.request.contextPath }/adm/assetUtil/printInsert/', 'commandInsert', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Register</span></a>
              </div>
              <div class="button5">
                <a href="#" class="btnClose3" onclick="$( '.effect3' ).hide();">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    </form>
    <!-- 팝업3 - 출력등록 : end -->
    
    <!-- 팝업1 - 대여등록 : end -->    
    <section class="toggler popup" id="draggable2" class="ui-widget-content">
      <div class="effect2" id="effect2" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Member</span>
                <div class="button4">
                  <a href="#" class="btnClose2">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody print">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <fieldset class="schMember">
                <legend>Service Category</legend>
                <dl>
                  <dt class="memberID">
                    <span>Member ID/Name</span>
                  </dt>
                  <dd>
                    <p class="sch">
                      <input type="text" id="serTxtPop" title="검색어 입력" />
                      <button type="button" title="search" onClick="javascript:fgetUserListPopup('${pageContext.request.contextPath }/restful/userList', 'NAME', 'serTxtPop', 'effect2', 'serTxtPop');"></button>
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
                      <col width="100" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th class="one"></th>
                      <th>No.</th>
                      <th>Member Name</th>
                      <th class="end">Member ID</th>
                    </tr>
                  </thead>
                </table>
                <div class="cropwinList asset">
                  <table id="userTableList" class="boardList register list">
                    <colgroup>
                      <col width="40">
                      <col width="60" />
                      <col width="*" />
                      <col width="100" />
                    </colgroup>
                    <tbody>
                    </tbody>
                  </table>
                </div>
              <!-- 페이지 넘버 : srt -->
             
              <!-- 페이지 넘버 : end -->
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5 enter">
                <a href="#" class="btnEnter2"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Register</span></a>
              </div>
              <div class="button5">
                <a href="#" class="btnClose2">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    <!-- 팝업 : end -->
