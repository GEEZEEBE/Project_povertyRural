<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 

    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$(function() {
		  	
			$("#stDateImg").click(function(e){
				e.preventDefault();
				$(".statsDate").datepicker('show');
			});
			
			$(".statsDate").datepicker({
		  		dateFormat: "yy.mm.dd"
		  	});
		  	
		 });
	});	
</script>
    


<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="today" value="${now}" type="both" pattern="yyyy.MM.dd"/>

<!-- 팝업 : srt -->
<script>
   
   $(function() {
	   $( "#draggable,#draggable2,#effect81" ).draggable({ handle: ".popupTitle" });
	   
	  	 ////insert popup
	   	$( ".effect" ).hide();
		 //member popup
	      $( ".effect2" ).hide();
		 
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
	          //$('body').css({"overflow-y":"hidden", "margin-right":"17px"});
	          return false;
	        });
	      });
	      //닫기 버튼 클릭시 body 스크롤
	      $(document).ready(function(){
	        $(".btnClose").click(function(e){
	          e.preventDefault();
	          runEffect();
	          $( ".effect" ).hide();
	          $( ".effect2" ).hide();
	          //$('body').css({"margin-right":"0", "overflow-y":"scroll"});
	        });
	      });
	      // set effect from select menu value
	      $( ".button01" ).click(function(e) {
	    	e.preventDefault();
	    	var idx=-1;
	    	$(".itemID").each(function(){	
	    		if($(this).is(":checked") == true){
	    			idx = $(".itemID").index(this);	
	    		}else{
	    				
	    		}
	    	});
	    	if(idx >= 0){
		    	$('input[name="itemID"]').val($(".itemID:eq("+idx+")").val());
		    	$('input[name="godsID"]').val($(".godsID:eq("+idx+")").val());
		    	
		    	$('input[name="payKind"]').val($(".payKind:eq("+idx+")").val());
		    	$('input[name="pricType"]').val($(".pricType:eq("+idx+")").val());
		    	$('input[name="pricUnit"]').val($(".pricUnit:eq("+idx+")").val());
		    	
		    	var flatRate=$(".flatRate:eq("+idx+")").val();
		    	if(flatRate==""){
		    		flatRate=0;
		    	}
		    	
		    	$('input[name="flatRate"]').val(flatRate);
		    	var depositRate = "0";
		    	if($(".depositRate:eq("+idx+")").val().length > 0){depositRate = $(".depositRate:eq("+idx+")").val(); }
		    	
		    	$('input[name="depositRate"]').val(depositRate);
		    	$('input[name="rentDay"]').val($(".rentDay:eq("+idx+")").val());
		    	
		    	$("#deposit").text(depositRate+" RM");
		    	runEffect();
	    	}
	    	
	    	
	        return false;
	      });
	      $( ".effect" ).hide();
	      
	      
	      
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
	      
	      
	    //retal detail popup
	      $( ".effect81" ).hide();
	      $( ".btnClose81" ).click(function(e) {
		    	e.preventDefault();
		    	
	      });
	      
	      $( ".rentDetail" ).click(function(e) {
		    	e.preventDefault();
		    	var selectedEffect = $( ".effectTypes" ).val();
		        // most effect types need no options passed by default
		        var options = {};

		        // run the effect
		        var idx = $(".rentDetail").index(this);	
		        
		        $("#detailSerial").text($(".detailSerial:eq("+idx+")").val());
		        $("#detailState").text($(".detailState:eq("+idx+")").val());

		        var returnDay ="Date :";
		        
		        if($(".detailDate:eq("+idx+")").val() != null && $(".detailDate:eq("+idx+")").val().length > 0){
		        	$("#detailUse").text($(".detailUse:eq("+idx+")").val());
		        	
		        	var datailDate = $(".detailDate:eq("+idx+")").val();
		        	datailDate = datailDate.substring(0,4)+"."+datailDate.substring(5,7)+"."+datailDate.substring(8,10);
		        	
			    	$("#detailDate").text(returnDay+datailDate);
		        	$("#detailUser").text($(".detailUser:eq("+idx+")").val());
		        	
		        }else{
		        	$("#detailUse").text("");
		        	$("#detailDate").text("");
		        	$("#detailUser").text("");
		        	
		        }
		        
		        $( ".effect81" ).show( selectedEffect, options, 500, callback );
		    	
		    	
	      });
	      
	      
   });

   function checkdate(){

	   var startdate = "${today}";
	   startdate = startdate.replace(".","");
	   startdate = startdate.replace(".","");

	   var staday = parseInt(startdate);       
	   
	   var enddate = $("#endday").val();   
	   enddate = enddate.replace(".", ""); 
	   enddate = enddate.replace(".", "");        
	   
	   var endday = parseInt(enddate);       
	   
	   if(endday < staday ){
		   alert("Please select the future than today.");
		   $("#endday").val("${today}");
	   }
	}
   
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
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/rentList/" class="hover">Rental Registration</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/returnList/">Return Registration</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/printList/">Print Registration</a></li>
        </ul>
        <div id="tabs-1">
          <!-- 대여등록 검색조건 : srt -->
         <form id="command" method="post" action="${pageContext.request.contextPath }/adm/assetUtil/rentList/">
          <table class="boardSch" summary="search">
            <colgroup>
              <col width="18%" />
              <col width="*" />
            </colgroup>
            <tr>
              <th>Select Device</th>
              <td>
                <select name="assetTypeCD" style="height: 24px;" class="selectChange">
                  	<option value="">All</option>
	                <option value="00601"  <c:if test="${param.assetTypeCD=='00601'}" >selected</c:if> >PC</option>
	                <option value="00602"  <c:if test="${param.assetTypeCD=='00602'}" >selected</c:if> >Tablet</option>
	                <option value="00603"  <c:if test="${param.assetTypeCD=='00603'}" >selected</c:if> >VOD</option>
	                <option value="00604"  <c:if test="${param.assetTypeCD=='00604'}" >selected</c:if> >e-Book</option>
	                <option value="00605"  <c:if test="${param.assetTypeCD=='00605'}" >selected</c:if> >etc.</option>
                </select>
              </td>
            </tr>
          </table>
          <!-- 대여등록 검색조건 : end -->
          <!-- 대여등록 : str -->
          <table class="boardList" summary="대여등록">
            <colgroup>
              <col width="60" />
              <col width="80" />
              <col width="120" />
              <col width="*" />
              <col width="120" />
              <col width="80" />
            </colgroup>
            <thead>
              <tr>
                <th class="one">Select</th>
                <th>No.</th>
                <th>Service Category</th>
                <th>Item</th>
                <th>Serial Number</th>
                <th class="end">Date</th>
              </tr>
            </thead>
            <tbody>
              	<c:if test="${list == null || fn:length(list) == 0}">
		            <tr>
		            	<td colspan="6">No registered result obtained.</td>
		        	</tr>
			    </c:if>
		        <c:forEach var="resultObject" items="${list}" varStatus="status"  begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
		          <tr>
	                <td>
	                	<input type="radio" name="checkItem" value="${resultObject.itemID}" class="itemID" />
	                	<input type="hidden" value="${resultObject.godsID}" class="godsID" />
	                	<input type="hidden" value="${resultObject.payKind}" class="payKind" />
	                	<input type="hidden" value="${resultObject.pricType}" class="pricType" />
	                	<input type="hidden" value="${resultObject.pricUnit}" class="pricUnit" />
	                	<input type="hidden" value="${resultObject.flatRate}" class="flatRate" />
	                	<input type="hidden" value="${resultObject.depositRate}" class="depositRate" />
	                	<input type="hidden" value="${resultObject.rentDay}" class="rentDay" />
	                	<!-- detail rent -->
	                	
	                	<input type="hidden" value="${resultObject.CNTS_NAME} (SN:${resultObject.item05})" class="detailSerial" />
	                	<input type="hidden" value="Available for rental" class="detailState" />
	                	<input type="hidden" value="Return complete" class="detailUse" />
	                	<input type="hidden" value="${resultObject.returnDay}" class="detailDate" />
	                	<input type="hidden" value="Member : ${resultObject.userName} (ID: ${resultObject.userID})" class="detailUser" />
	                	
	                </td>
	                <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
	                <td>${resultObject.srvcCtgrNM}</td>
	                <td class="alignL"><a href="#" class="rentDetail"><c:out value='${resultObject.CNTS_NAME}'/></a></td>
	                <td>${resultObject.item05}</td>
	                <td class="time">${resultObject.frstRgstDT}</td>
	              </tr>
		         </c:forEach>
            </tbody>
          </table>
          </form>
          <div class="buttonWrite alnLeft">
            <div class="button1 type2 checkOut">
              <a href="#" class="button01" class="ui-state-default ui-corner-all"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Check Out</span></a>
            </div>
          </div>
          <!-- 대여등록 : end -->
        </div>
    	
    	</div>
    </div>
   
   
   
   
    <!-- 팝업1 - 대여등록 : srt -->
    <form id="commandInsert">
    <input type="hidden" name="godsID" value="" />
    <input type="hidden" name="itemID" value="" />
  
    <input type="hidden" name="payKind" value="" />
   	<input type="hidden" name="pricType" value="" />
   	<input type="hidden" name="pricUnit" value="" />
   	<input type="hidden" name="flatRate" value="" />
   	<input type="hidden" name="depositRate" value="" />
   	<input type="hidden" name="rentDay" value="" />
   	
    <input type="hidden" name="userID" value="">
    <input type="hidden" name="cmplYN" value="S">
    <input type="hidden" name="frstRgstUserID" value="cdckyt">
    <input type="hidden" name="latCrctUserID" value="cdckyt">
    <section class="toggler popup" id="draggable" class="ui-widget-content">
      <div id="effect" class="effect" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Rental registration</span>
                <div class="button4">
                  <a href="#" class="btnClose" onclick="$( '.effect' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody assetWrite">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <div class="popupCategory">
                <!-- 팝업내용:str -->
                <dl class="rentalWrite">
                  <dt>Start Date</dt>
                  <dd id="strday">${today}</dd>
                  <dt>Return Date</dt>
                  <dd class="date">
                    <a href="#" id="stDateImg"><img src="<c:url value='/resources/images/icon_calendar.gif' />" alt="icon date" /></a>
                    <input type="text" id="endday" title="date" name="endTm" value="${today}" class="statsDate" onchange="javascript:checkdate(this);" readonly />
                  </dd>
                  <dt>Member</dt>
                  <dd class="filesch">
                    <input type="text" id="userNM"  class="require" readonly />
                    <a href="#" id="button"><img src="<c:url value='/resources/images/btn_member.gif' />" alt="Member" /></a>
                  </dd>
                  <dt>Deposit</dt>
                  <dd id="deposit">RM 2000</dd>
                  <dt class="noline">Deposit Received</dt>
                  <dd class="radio noline">
                    <label><input type="radio" name="depositYN" value="00301" checked />Yes</label>
                    <label><input type="radio" name="depositYN" value="00302"/>No</label>
                  </dd>
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
                <a href="javascript:if(submitCheck()) doSubmit2('${pageContext.request.contextPath }/adm/assetUtil/rentInsert/', 'commandInsert', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Register</span></a>
              </div>
              <div class="button5">
                <a href="#" class="btnClose" onclick="$( '.effect' ).hide();">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    </form>
    <!-- 팝업1 - 대여등록 : end -->
    
    <section class="toggler popup" id="draggable2" class="ui-widget-content">
      <div class="effect2" id="effect2" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Member Look-up</span>
                <div class="button4">
                  <a href="#" class="btnClose2">X</a>
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
                      <th class="one"><input type="radio" /></th>
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
    
    
    <!-- 팝업1 - 대여상세 : srt -->
    <section class="toggler popup" id="effect81" class="ui-widget-content">
      <div class="effect81" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Rental Details</span>
                <div class="button4">
                  <a href="#" class="btnClose81" onclick="$( '.effect81' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody assetWrite">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <div class="popupCategory">
                <!-- 팝업내용:str -->
                <dl class="rentalWrite">
                  <dt>Item</dt>
                  <dd id="detailSerial">PC 1 (SN:12542444)</dd>
                  <dt>Status</dt>
                  <dd id="detailState">Available for rental</dd>
                  <dt class="noline">Latest History</dt>
                  <dd class="retumCancel noline">
                    <span id="detailUse">Return complete</span>
                  </dd>
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailDate">Date : 2012.12.12</dd>
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailUser">Member : Yim jun (ID: Terry)</dd>
                </dl>
                <!-- 팝업내용:end -->
              </div>
            </div>
          </div>
        </section>
        <section class="btnGroup">
          <div class="popupBtn">
            <div class="popupBtnbg">
              <div class="button5">
                <a href="#" class="btnClose81" onclick="$( '.effect81' ).hide();">Close</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    <!-- 팝업1 - 대여상세 : end -->

    <!-- 팝업 : end -->
    

    
  