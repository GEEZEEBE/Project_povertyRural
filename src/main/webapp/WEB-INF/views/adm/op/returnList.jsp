<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>

<script>
      
    //팝업2:반납등록============================
      $(function() {
    	  
    	  $( "#draggable2,#draggable82" ).draggable({ handle: ".popupTitle" });
    	
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
           // $('body').css({"overflow-y":"hidden", "margin-right":"17px"})
            return false;
          });
        });
        //닫기 버튼 클릭시 body 스크롤 hidden
        $(document).ready(function(){
          $(".btnClose2").click(function(e){
        	  e.preventDefault();
        	  runEffect2();
            $( ".effect2" ).hide();
            $('body').css({"margin-right":"0", "overflow-y":"scroll"});
          });
        });
        
		//날짜차이 함수
  	 	 function getDateDiff(sdate,edate){
 	      	var resSdate = new Date(sdate.substring(0,4),sdate.substring(4,6),sdate.substring(6,8)).valueOf();
 	      	var resEdate = new Date(edate.substring(0,4),edate.substring(4,6),edate.substring(6,8)).valueOf();
 	      	var res_date = Math.floor((resSdate-resEdate)/(1000 * 60 * 60 * 24));
 	      	return res_date;
 	      }
        // set effect from select menu value
        $( ".button02" ).click(function(e) {
          e.preventDefault();
          var idx=-1;
	    	$(".useHsNmbrID").each(function(){	
	    		if($(this).is(":checked") == true){
	    			idx = $(".useHsNmbrID").index(this);	
	    		}else{
	    				
	    		}
	    	});
	    	
	    	if(idx >= 0){
				
	    		//연체 일수 - 변수>0 = 초과(연체), 변수<0 = 남음
	    		var remain = getDateDiff('<fmt:formatDate value="${now}" type="both" pattern="yyyyMMdd"/>',$(".endTm:eq("+idx+")").val());
	    		
		    	var depoTxt=""; // 수납여부 체크
		    	var addPayVal=flatRate=latePay=deposRate=0; // 추가수납금,대여요금,연체료,디파짓
		    	
		    	if($(".depositRate:eq("+idx+")").val() != ""){
		    		depoTxt = $(".depositRate:eq("+idx+")").val()+" RM";
		    		if($(".payKind:eq("+idx+")").val() == "00301"){depoTxt += " (Paid)"; deposRate=$(".depositRate:eq("+idx+")").val(); } // 디파짓 수납
		    		else if($(".payKind:eq("+idx+")").val() == "00302"){depoTxt += " (Prior to payment)"; deposRate=(-1)*$(".depositRate:eq("+idx+")").val(); } // 디파짓 미수납
		    	}else{
		    		depoTxt = "0 RM";
		    	}
		    	
		    	var startTm = $(".startTm:eq("+idx+")").val();
		    		startTm = startTm.substring(0,4)+"."+startTm.substring(4,6)+"."+startTm.substring(6,8);
		    	var endTm = $(".endTm:eq("+idx+")").val();
		    		endTm = endTm.substring(0,4)+"."+endTm.substring(4,6)+"."+endTm.substring(6,8);
		    		
		    	$("#depositRate").text(depoTxt); //deposit
	    		$("#userID").text($(".userID:eq("+idx+")").val()); //member id
	    		$("#date").text(startTm+"~"+endTm+" ("+(remain>0?remain:(-1*remain))+(remain>0?" days late":" days")+")"); //rent day
		    	$("#flatRate").text($(".flatRate:eq("+idx+")").val()+" RM"); //대여요금 - 아이템에 저장되는 FALT_LATE 값
		    	
		    	latePay=0;
		    	if(remain > 0){
		    		latePay = $(".fine:eq("+idx+")").val()*remain;
		    	}
		    	$("#latePay").text(latePay+" RM"); //연체료 - 자산 원가의 FINE * 연체일수 
		    	flatRate = (-1)*$(".flatRate:eq("+idx+")").val(); //대여료 음수값이 없음
		    	latePay = (-1)*latePay;//연체료 음수값이 없음
		    	
		    	//alert(deposRate+"---"+flatRate+"--"+latePay);
		    	addPayVal = (parseInt(deposRate))+(parseInt(flatRate))+(parseInt(latePay)); // 디파짓-대여요금-연체료 = 추가수납금
		    	
		    	if(addPayVal > 0){
		    		$("#addPay").html("<span style='color:red'>"+addPayVal+" RM</span>");
		    	}else{
		    		$("#addPay").html("<span style='color:blue'>"+(addPayVal)*(-1)+" RM</span>");
		    	}
		    	
		    	$('input[name="dpstAmt"]').val(addPayVal);
		    	$('input[name="useHsNmbrID"]').val($(".useHsNmbrID:eq("+idx+")").val());
		    	runEffect2();
	    	}
          
          return false;
        });

        $( ".effect2" ).hide();
        
      //return detail popup
	      $( ".effect82" ).hide();
	      $( ".btnClose82" ).click(function(e) {
		    	e.preventDefault();
		    	
	      });
	      
	      $( ".rentDetail" ).click(function(e) {
		    	e.preventDefault();
		    	var selectedEffect = $( ".effectTypes" ).val();
		        // most effect types need no options passed by default
		        var options = {};

		        // run the effect
		        var idx = $(".rentDetail").index(this);	
		       
		       var detailSerial="PC 1 (SN:12542444)";
		       var detailDate="Date : 2012.12.12";
		       var detailUser="Member : Yim jun (ID: Terry)";
		       var detailFlatRate="Rental Fee : 2000 RM";
		       var detailExtraFee="Extra fee received : 1000 RM";
		       var detailPayKind="Payment Receive: Yes";
		       
		       detailSerial = $(".itemNM:eq("+idx+")").val()+" (SN:"+$(".item05:eq("+idx+")").val()+")"; //자산이름,자산 시리얼번호
		       
		       var changeDate = $(".startTm:eq("+idx+")").val();//등록일 형식변환
		       changeDate = changeDate.substring(0,4)+"."+changeDate.substring(4,6)+"."+changeDate.substring(6,8);
		       detailDate = "Date : "+changeDate;
		       detailUser="Member : "+ $(".userName:eq("+idx+")").val()+" (ID: "+$(".userID:eq("+idx+")").val()+")"; //사용자,사용자 아이디
		       detailFlatRate="Rental Fee : "+$(".flatRate:eq("+idx+")").val()+" RM"; // 대여요금
		       //detailExtraFee="Extra fee received : 0 RM";
		       //detailPayKind="Payment Receive: ";
		       $(".payKind:eq("+idx+")").val()=="00301"?detailPayKind+="Yes":detailPayKind+="No";
		       
		       $("#detailSerial").text(detailSerial);
		       $("#detailDate").text(detailDate);
		       $("#detailUser").text(detailUser);
		       $("#detailFlatRate").text(detailFlatRate);
		       //$("#detailExtraFee").text(detailExtraFee);
		       //$("#detailPayKind").text(detailPayKind);
		       $('input[name="useHsNmbrID"]').val($(".useHsNmbrID:eq("+idx+")").val());
		       
		        $( ".effect82" ).show( selectedEffect, options, 500, callback );
		    	
		    	
	      });
        
        
        
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
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/returnList/" class="hover">Return Registration</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/assetUtil/printList/">Print Registration</a></li>
        </ul>
        <form id="command">
        <div id="tabs-2">
          <!-- 반납등록 검색조건 : srt -->
          <table class="boardSch" summary="search">
            <colgroup>
              <col width="18%" />
              <col width="*" />
              <col width="20%" />
              <col width="40%" />
            </colgroup>
            <tr>
              <th>Device Type</th>
              <td>
                <select name="assetTypeCD" id="assetTypeCD" style="height: 24px;">
                  	<option value="">All</option>
                </select>
              </td>
              <th>Deposit Received</th>
              <td class="ox">
                <select class="seltWeith140" name="strPayKind" style="height: 24px;">
                  <option value="">All</option>
                  <option value="00301" <c:if test="${param.strPayKind == '00301'}">selected</c:if> >Received</option>
                  <option value="00302" <c:if test="${param.strPayKind == '00302'}">selected</c:if> >Not Yet</option>
                </select>
                <p class="sch">
                  <button type="button" onclick="javascript:doSubmit('${pageContext.request.contextPath }/adm/assetUtil/returnList/', 'command', 'post');"></button>
                </p>
              </td>
            </tr>
          </table>
          <!-- 반납등록 검색조건 : end -->
          <!-- 반납등록 : str -->
          <table class="boardList" summary="반납등록">
            <colgroup>
              <col width="60" />
              <col width="80" />
              <col width="120" />
              <col width="*" />
              <col width="100" />
              <col width="60" />
              <col width="90" />
            </colgroup>
            <thead>
              <tr>
                <th class="one">Select</th>
                <th>No.</th>
                <th>Service Category</th>
                <th>Item</th>
                <th>Serial number</th>
                <th>Deposit</th>
                <th class="end">Rental Date</th>
              </tr>
            </thead>
            <tbody>
              	<c:if test="${list == null || fn:length(list) == 0}">
		            <tr>
		            	<td colspan="7">No registered result obtained.</td>
		        	</tr>
			    </c:if>
		        <c:forEach var="resultObject" items="${list}" varStatus="status"  begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
		          <tr>
                	<td>
                		<input type="radio" name="checkItem" value="${resultObject.useHsNmbrID}" class="useHsNmbrID" />
                		<input type="hidden" value="${resultObject.userID}" class="userID" />
                		<input type="hidden" value="${fn:substring(resultObject.startTm,0,8)}" class="startTm"  />
                		<input type="hidden" value="${fn:substring(resultObject.endTm,0,8)}" class="endTm"  />
                		<input type="hidden" value="${resultObject.depositRate}" class="depositRate"  />
                		<input type="hidden" value="${resultObject.flatRate}" class="flatRate" />
                		<input type="hidden" value="${resultObject.payKind}" class="payKind" />
                		<input type="hidden" value="${resultObject.fine}" class="fine" />
                		<input type="hidden" value="${resultObject.userName}" class="userName" />
                		
                		<input type="hidden" value="${resultObject.CNTS_NAME}" class="itemNM" />
                		<input type="hidden" value="${resultObject.item05}" class="item05" />
                	</td>
	                <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
	                <td>${resultObject.srvcCtgrNM}</td>
	                <td class="alignL"><a href="#" class="rentDetail"><c:out value='${resultObject.CNTS_NAME}'/></a></td>
	                <td>${resultObject.item05}</td>
	                <td><c:if test="${resultObject.payKind == '00301'}">o</c:if><c:if test="${resultObject.payKind == '00302'}">x</c:if></td>
	                <td class="time">${resultObject.frstRgstDT}</td>
	              </tr>
		         </c:forEach>
            </tbody>
          </table>
        </div>
        </form>
          <div class="buttonWrite alnLeft">
            <div class="button1 type2 enter">
              <a href="#" class="button02" class="ui-state-default ui-corner-all"><img src="<c:url value='/resources/images/btn_icon_write.gif' />" alt="icon" /><span>Return</span></a>
            </div>
          </div>
          <!-- 반납등록 : end -->
    </div>
    

 <!-- 팝업2 - 반납등록 : srt -->
 <form id="commandInsert">
 <input type="hidden" name="cmplYN" value="E" />
 <input type="hidden" name="useHsNmbrID" value="" />
 
 <input type="hidden" name="dpstKind" value="00029">
 <input type="hidden" name="dpstMthd" value="00031">
 <input type="hidden" name="dpstAmt" value="">
 
 <input type="hidden" name="frstRgstUserID" value="kut0001">
 <input type="hidden" name="latCrctUserID" value="kut0001">
    
    <section class="toggler popup" id="draggable2" class="ui-widget-content">
      <div class="effect2" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span class="return">Return Registration</span>
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
              <div class="popupCategory">
                <!-- 팝업내용:str -->
                <dl class="rentalWrite return">
                  <dt>Member</dt>
                  <dd id="userID">djlagjla</dd>
                  <dt>Period</dt>
                  <dd id="date">2012.12.12~2013.06.12</dd>
                  <dt>Return Date</dt>
                  <dd id="endTm"><fmt:formatDate value="${now}" type="both" pattern="yyyy.MM.dd"/></dd>
                  <dt>Deposit</dt>
                  <dd id="depositRate">2,000 RM (Paid)</dd>
                  <dt>Charge</dt>
                  <dd id="flatRate">1000 RM (Prior to payment)</dd>
                  <dt>Overdue</dt>
                  <dd id="latePay">0 RM (Prior to payment)</dd>
                  <dt>Amount to be Paid</dt>
                  <dd class="charge" id="addPay"><em>2000</em> RM (Prior to payment)<span class="rece">* Receive a fee.</span><span class="refu">* Refund of fees.</span></dd>
                  <dt class="noline">Deposit Received</dt>
                  <dd class="radio noline">
                    <label><input type="radio" name="payKind" value="00301" checked />Yes</label>
                    <label><input type="radio" name="payKind" value="00302" />No</label>
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
                <a href="javascript:doSubmit2('${pageContext.request.contextPath }/adm/assetUtil/returnInsert/', 'commandInsert', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter2.gif' />" alt="Enter" /><span>Register</span></a>
              </div>
              <div class="button5">
                <a href="#" class="btnClose2" onclick="$( '.effect2' ).hide();">Cancel</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>

    <!-- 팝업2 - 반납등록 : end -->
    
    <!-- 팝업2 - 반납상세 : srt -->
   
    <section class="toggler popup" id="draggable82" class="ui-widget-content">
      <div class="effect82" class="ui-widget-content ui-corner-all">
        <header>
          <div class="popupTitle">
            <h1>
              <div class="bgcenter">
                <span>Return Details</span>
                <div class="button4">
                  <a href="#" class="btnClose82" onclick="$( '.effect82' ).hide();">X</a>
                </div>
              </div>
            </h1>
          </div>
        </header>
        <section class="popupBody">
          <div class="popupLeftbg">
            <div class="popupBodybg">
              <div class="popupCategory">
                <!-- 팝업내용:str -->
                <dl class="rentalWrite return">
                  <dt>Item </dt>
                  <dd id="detailSerial"></dd>
                  <dt>Status</dt>
                  <dd>Currently On Rental</dd>
                  <dt class="noline">Latest History</dt>
                  <dd class="retumCancel noline">
                    <span>Currently On Rental</span>
                    <a href="javascript:doSubmit2('${pageContext.request.contextPath }/adm/assetUtil/delete/', 'commandInsert', 'post');" id="rentCancle"><img src="<c:url value='/resources/images/btn_hireCancel.gif' />" alt="Button Hire Cancel" /></a><br />
                  </dd>
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailDate"></dd>
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailUser"></dd>
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailFlatRate"></dd>
                  <!--
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailExtraFee"></dd>
                  <dt class="noline"></dt>
                  <dd class="noline" id="detailPayKind"></dd>
                   -->
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
                <a href="#" class="btnClose82" onclick="$( '.effect82' ).hide();">Close</a>
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
    <!-- 팝업2 - 반납상세 : end -->
 </form>  
<script>
	fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00600','assetTypeCD','${param.assetTypeCD }','');
</script>