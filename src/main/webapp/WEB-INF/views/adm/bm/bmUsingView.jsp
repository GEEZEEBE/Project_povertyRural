<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript">
<!--
var initBody;
 
function beforePrint() {
 boxes = document.body.innerHTML;
 document.body.innerHTML = box.innerHTML;
}
function afterPrint() { 
 document.body.innerHTML = boxes;
}
function printArea() {
 window.print();
}
 
window.onbeforeprint = beforePrint;
window.onafterprint = afterPrint;
 
-->
</script>
<script type="text/javascript">

	$("#printOk").live("click",function(e){
		e.preventDefault();

		$.ajax({
			url: '${pageContext.request.contextPath}/adm/using/billSave',
			type: 'post',
			data : {"strUserID":"${requestMap.userID}"},
			success: function(data) {
					printArea();
				},
				beforeSend : function() {
					//처리중 화면구성
				},
				error : function() {
					alert("false");
				} 					
		});
	
	});
</script>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<c:set var="totalBillCharge" value="0" />
<c:set var="totalCharge" value="0" />

<form id="command" name="command">
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
<input type="hidden" name="stDate" value="${requestMap.stDate}">
<input type="hidden" name="stAmpm" value="${requestMap.stAmpm}">
<input type="hidden" name="stHour" value="${requestMap.stHour}">
<input type="hidden" name="stMin" value="${requestMap.stMin}">
<input type="hidden" name="enDate" value="${requestMap.enDate}">
<input type="hidden" name="enAmpm" value="${requestMap.enAmpm}">
<input type="hidden" name="enHour" value="${requestMap.enHour}">
<input type="hidden" name="enMin" value="${requestMap.enMin}">
<input type="hidden" name="bill" value="${requestMap.bill}">
<input type="hidden" name="serTxt" value="${requestMap.serTxt}">
</form>

    <div class="board using" id="box">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
			<h2>Usage Status</h2>
			<h3>Check the service usage and billing status of the members here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 상세 : str -->   
<!-- CBC Basic -->      
<c:if test="${fn:length(UsingPC) != 0 || fn:length(TabletRental) != 0 || fn:length(Print) != 0}">       
      <h4>CBC Basic</h4>
      <p class="sch using">
        <label><em>*</em>Currency Unit</label>
      </p>
<c:if test="${fn:length(UsingPC) != 0}">      
      <!-- PC 이용 -->
      <section class="itemSection Product mb18">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${UsingPC}" varStatus="status">        
<c:if test="${status.count == 1}">
          <tr>
            <th rowspan="${fn:length(UsingPC)+1}">${result.GODS_NAME }</th>
            <th>Date</th>
            <th>Duration</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
</c:if>
          <tr>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:formatDate value="${result.USING_TIME }" type="both" pattern="kk:mm" /></td>
            <td><fmt:formatDate value="${result.STRT_TM_DATE }" type="both" pattern="a hh:mm" /></td>
            <td><fmt:formatDate value="${result.END_TM_date }" type="both" pattern="a hh:mm" /></td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />          
</c:forEach> 
       
        </table>
      </section>
</c:if>
 
<c:if test="${fn:length(TabletRental) != 0}">       
      <!-- Tablet 대여 -->  
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${TabletRental}" varStatus="status">        
	<c:if test="${status.count == 1}">          
          <tr>
            <th rowspan="2">Tablet Rental</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Overdue</th>
            <th>Deposit</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
	</c:if>          
          <tr class="bottomLine">
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:parseDate value="${fn:substring(result.END_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td>${result.DEPOSIT_RATE }</td>
            <td>0</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />              
</c:forEach>          
        </table>
      </section>
</c:if>

<c:if test="${fn:length(Print) != 0}">    
      <!-- 프린트 -->
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="150" />
            <col width="150" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${Print}" varStatus="status">        
	<c:if test="${status.count == 1}">             
          <tr>
            <th>Print</th>
            <th>Date</th>
            <th>Duration</th>
            <th>Number of prints</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
     </c:if>     
          <tr>
          	<th>${result.GODS_NAME }</th>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="a hh:mm" /></td>
            <td>${result.RENT_DAY }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
          <!-- 
          <tr class="bottomLine">
            <th>프린트(컬러)</th>
            <td>2013.01.05</td>
            <td>AM 09:00</td>
            <td>0장</td>
            <td>200</td>
            <td class="end">청구 전</td>
          </tr>
           -->
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />           
</c:forEach>          
        </table>
      </section>
</c:if>
      
</c:if>      

<!-- Learning (Smart Class) -->
<c:if test="${fn:length(SmartClass) != 0 || fn:length(InteractiveWhiteBoard) != 0 }">      
      <h4>Learning (Smart Class)</h4>
      
<c:if test="${fn:length(SmartClass) != 0}">       
      <section class="itemSection Product mb18">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="300" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${SmartClass}" varStatus="status">          
<c:if test="${status.count == 1}"> 
          <tr>
            <th>Sort</th>
            <th>Date</th>
            <th>Title</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
</c:if>          
          <tr>
          	<th>${result.GODS_NAME }</th>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td class="alignLpadd6">${result.CNTS_NAME }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />  
</c:forEach>          
<!--           
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">수학의 정석 (DVD)</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <th rowspan="5">Year4<br />Malay</th>
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD제목 너무 길경우 두줄로 표시 해주세요.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD제목 입니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD는 건당과금으로 등록될 것이고 중복 과금 되지 않습니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD 날짜가 찍히는 기준은 현재 기준 마지막 조회 일이며 청구여부는 여러 날 조회 하더라도 최초일 기준으로 청구여부가 결정됩니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD제목 입니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr class="bottomLine">
            <th>Bulats</th>
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD제목 입니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
 -->          
        </table>
      </section>
</c:if>     

<c:if test="${fn:length(InteractiveWhiteBoard) != 0}">  
      <!-- 전자칠판 이용 -->
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${InteractiveWhiteBoard}" varStatus="status">          
	<c:if test="${status.count == 1}">          
          <tr>
            <th></th>
            <th>Date</th>
            <th>Duration</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
	</c:if>          
          <tr>
    <c:if test="${status.count == 1}">      
          	<th rowspan="${fn:length(InteractiveWhiteBoard)+1}">Electronic Board</th>
    </c:if>      	
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:formatDate value="${result.USING_TIME }" type="both" pattern="kk:mm" /></td>
            <td><fmt:formatDate value="${result.STRT_TM_DATE }" type="both" pattern="a hh:mm" /></td>
            <td><fmt:formatDate value="${result.END_TM_date }" type="both" pattern="a hh:mm" /></td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />          
</c:forEach>
<!--          
          <tr>
            <td>2013.01.05</td>
            <td>01:11</td>
            <td>AM 09:00</td>
            <td>PM 05:25</td>
            <td>1,500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td>01:11</td>
            <td>AM 09:00</td>
            <td>PM 05:25</td>
            <td>1,500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td>01:11</td>
            <td>AM 09:00</td>
            <td>PM 05:25</td>
            <td>1,500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr class="bottomLine">
            <td>2013.01.05</td>
            <td>01:11</td>
            <td>AM 09:00</td>
            <td>PM 05:25</td>
            <td>1,500</td>
            <td class="end">청구완료</td>
          </tr>
 -->           
        </table>
      </section>
</c:if>

</c:if>

<c:if test="${fn:length(eBook) != 0 || fn:length(SmartBeamUsing) != 0 || fn:length(BookRental) != 0 || fn:length(DVDRental) != 0}">     
      <h4>Learning (English Village)</h4>
<c:if test="${fn:length(eBook) != 0}">       
      <section class="itemSection Product mb18">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="300" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${eBook}" varStatus="status">           
<c:if test="${status.count == 1}"> 
          <tr>
            <th>Sort</th>
            <th>Date</th>
            <th>Title</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
 </c:if>        
          <tr>
          	<th>${result.GODS_NAME }</th>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td class="alignLpadd6">${result.CNTS_NAME }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />  
</c:forEach>          
<!--          
          <tr>
            <th rowspan="4">E-book</th>
            <td>2013.01.05</td>
            <td class="alignLpadd6">E-book제목 너무 길경우 두줄로 표시 해주세요.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">E-book는 건당과금으로 등록될 것이고 중복 과금 되지 않습니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
          <tr class="bottomLine">
            <td>2013.01.05</td>
            <td class="alignLpadd6">VOD 날짜가 찍히는 기준은 현재 기준 마지막 조회 일이며 청구여부는 여러 날 조회 하더라도 최초일 기준으로 청구여부가 결정됩니다.</td>
            <td>500</td>
            <td class="end">청구완료</td>
          </tr>
 -->           
        </table>
      </section>
 </c:if>
 
<c:if test="${fn:length(SmartBeamUsing) != 0}">        
      <!-- Smart Beam 대여 -->
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${SmartBeamUsing}" varStatus="status">           
	<c:if test="${status.count == 1}">           
          <tr>
            <th></th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Overdue</th>
            <th>Deposit</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
	</c:if>          
          <tr class="bottomLine">
    <c:if test="${status.count == 1}">      
          	<th rowspan="${fn:length(SmartBeamUsing)+1}">Smart Beam Rental</th>
    </c:if>       
           	<td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:parseDate value="${fn:substring(result.END_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td>${result.DEPOSIT_RATE }</td>
            <td>0</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />          
</c:forEach>          
        </table>
      </section>
</c:if>

<c:if test="${fn:length(BookRental) != 0}">       
      <!-- 책 대여 -->
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${BookRental}" varStatus="status">           
	<c:if test="${status.count == 1}">          
          <tr>
            <th></th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Overdue</th>
            <th>Deposit</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
      </c:if>     
          <tr>
     <c:if test="${status.count == 1}">      
          	<th rowspan="${(fn:length(BookRental)+1)*2}">Book Rental</th>
    </c:if>       
            <td rowspan="2"><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td rowspan="2"><fmt:parseDate value="${fn:substring(result.END_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td>${result.DEPOSIT_RATE }</td>
            <td>0</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
          <tr>
            <td colspan="4" class="end alignLpadd6">${result.CNTS_NAME }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />	
</c:forEach>          
          <!-- 
          <tr>
            <td rowspan="2">2013.01.05</td>
            <td rowspan="2">2013.01.10</td>
            <td>0</td>
            <td>10</td>
            <td>0</td>
            <td class="end">청구 전</td>
          </tr>
          <tr class="bottomLine">
            <td colspan="4" class="end alignLpadd6">책 제목입니다. 책 제목이 길 경우 두줄로 표시해 주세요. 책 제목이 길 경우 두줄로 표시해 주세요.</td>
          </tr>
           -->
        </table>
      </section>
</c:if>

<c:if test="${fn:length(DVDRental) != 0}">        
      <!-- DVD 대여 -->
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${DVDRental}" varStatus="status">           
	<c:if test="${status.count == 1}">            
          <tr>
            <th></th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Overdue</th>
            <th>Deposit</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
     </c:if>      
          <tr>
     <c:if test="${status.count == 1}">      
          	<th rowspan="${(fn:length(BookRental)+1)*2}">DVD Rental</th>
    </c:if>       
            <td rowspan="2"><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td rowspan="2"><fmt:parseDate value="${fn:substring(result.END_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td>${result.DEPOSIT_RATE }</td>
            <td>0</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
          <tr>
            <td colspan="4" class="end alignLpadd6">${result.CNTS_NAME }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />            
</c:forEach>          
          <!-- 
          <tr>
            <td rowspan="2">2013.01.05</td>
            <td rowspan="2">2013.01.10</td>
            <td>0</td>
            <td>10</td>
            <td>0</td>
            <td class="end">청구 전</td>
          </tr>
          <tr class="bottomLine">
            <td colspan="4" class="end alignLpadd6">DVD 제목입니다. DVD 제목이 길 경우 두줄로 표시해 주세요. DVD 제목이 길 경우 두줄로 표시해 주세요.</td>
          </tr>
           -->
        </table>
      </section>
</c:if>

</c:if>

<c:if test="${fn:length(Promotion) != 0 || fn:length(LabelPrint) != 0 || fn:length(BrochurePrint) != 0}">      
      <h4>Commerce</h4>
<c:if test="${fn:length(Promotion) != 0}">      
      <section class="itemSection Product mb18">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="300" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${Promotion}" varStatus="status">          
<c:if test="${status.count == 1}">
          <tr>
            <th rowspan="${fn:length(Promotion)+1}">${result.GODS_NAME }</th>
            <th>Date</th>
            <th>Title</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
</c:if>
		  <tr>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td class="alignLpadd6">${result.SRVC_CTGR_NM }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />           
</c:forEach>          
          
<!--           
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">홍보글 명칭입니다.</td>
            <td>500</td>
            <td class="end">Finish</td>
          </tr>
          <tr>
            <th rowspan="3">Facebook</th>
            <td>2013.01.05</td>
            <td class="alignLpadd6">홍보글 명칭입니다.</td>
            <td>500</td>
            <td class="end">Finish</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">홍보글 명칭입니다.</td>
            <td>500</td>
            <td class="end">Finish</td>
          </tr>
          <tr>
            <td>2013.01.05</td>
            <td class="alignLpadd6">홍보글 명칭입니다.</td>
            <td>500</td>
            <td class="end">Finish</td>
          </tr>
          <tr class="bottomLine">
            <th>Twitter</th>
            <td>2013.01.05</td>
            <td class="alignLpadd6">홍보글 명칭입니다.</td>
            <td>500</td>
            <td class="end">Finish</td>
          </tr>
 -->          
        </table>
      </section>
</c:if>

<c:if test="${fn:length(LabelPrint) != 0}">      
      <!-- 라벨 프린트 --> 
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="150" />
            <col width="150" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${LabelPrint}" varStatus="status">          
	<c:if test="${status.count == 1}">       
          <tr>
            <th>Print</th>
            <th>Date</th>
            <th>Duration</th>
            <th>Number of prints</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
   </c:if>        
          <tr>
          	<th>${result.GODS_NAME }</th>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="a hh:mm" /></td>
            <td>${result.RENT_DAY }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />          
</c:forEach>	          
          <!-- 
          <tr class="bottomLine">
            <th>라벨 프린트<br />(컬러)</th>
            <td>2013.01.05</td>
            <td>AM 09:00</td>
            <td>1장</td>
            <td>0</td>
            <td class="end">청구 전</td>
          </tr>
           -->
        </table>
      </section>
</c:if>

<c:if test="${fn:length(BrochurePrint) != 0}">      
      <!-- 브로셔 프린트 -->
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="150" />
            <col width="150" />
            <col width="100" />
            <col width="100" />
          </colgroup>
<c:forEach var="result" items="${BrochurePrint}" varStatus="status">          
	
	<c:if test="${status.count == 1}">             
          <tr>
            <th>Print</th>
            <th>Date</th>
            <th>Duration</th>
            <th>Number of prints</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
    </c:if>      
          <tr>
          	<th>${result.GODS_NAME }</th>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="a hh:mm" /></td>
            <td>${result.RENT_DAY }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />          
</c:forEach>  
       
      <!--     
          <tr class="bottomLine">
            <th>브로셔 프린트<br />(컬러)</th>
            <td>2013.01.05</td>
            <td>AM 09:00</td>
            <td>0장</td>
            <td>0</td>
            <td class="end">청구 전</td>
          </tr>
       -->    
        </table>
      </section>
</c:if>
      
</c:if>

<c:if test="${fn:length(HealthPrint) != 0}">      
      <h4>Health</h4>
      <section class="itemSection Product">
        <table class="boardView using" summary="CBC Basic">
          <colgroup>
            <col width="*" />
            <col width="100" />
            <col width="150" />
            <col width="150" />
            <col width="100" />
            <col width="100" />
          </colgroup>
 <c:forEach var="result" items="${HealthPrint}" varStatus="status"> 
    <c:if test="${status.count == 1}">      
          <tr>
            <th></th>
            <th>Date</th>
            <th>Duration</th>
            <th>Number of prints</th>
            <th>Charge</th>
            <th class="end">Billing</th>
          </tr>
     </c:if>        
          <tr class="bottomLine">
     <c:if test="${status.count == 1}">      
          	<th rowspan="${fn:length(HealthPrint)+1}">${result.GODS_NAME }</th>
    </c:if>      
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="yyyy.MM.dd" /></td>
            <td><fmt:parseDate value="${fn:substring(result.STRT_TM,0,14) }" var="dateFmt" pattern="yyyyMMddkkmmss" /><fmt:formatDate value="${dateFmt}" type="both" pattern="a hh:mm" /></td>
            <td>${result.RENT_DAY }</td>
            <td><fmt:formatNumber value="${result.FLAT_RATE }" type="number"/></td>
            <td class="end">${result.BILLING_YN }</td>
          </tr>
<c:if test="${result.BILLING_YN == 'N'}">          
<c:set var="totalBillCharge" value="${totalBillCharge + result.FLAT_RATE }" />
</c:if>
<c:set var="totalCharge" value="${totalCharge + result.FLAT_RATE }" />  
</c:forEach>          
        </table>
      </section>
</c:if>   
  
      <!-- 상세 : end -->
      <section class="deposit">
        <dl>
          <dt class="dottline"><span>Total Charge:</span></dt>
          <dd class="dottline"><span>RM</span><fmt:formatNumber value="${totalCharge }" type="number"/></dd>
        </dl>
        <p>The billing status will convert to "Y" once this page gets printed</p>
      </section>
    </div>

    <!-- ===================================================================== -->
    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li class="type2">
          <div class="button1 type2">
            <a href="#" id="printOk"><img src="<c:url value="/resources/images/btn_icon_print.gif" />" alt="icon" /><span>Print</span></a>
          </div>
        </li>
        <li class="type2">
          <div class="button1 type2 list">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/using/list', 'command', 'get');"><img src="<c:url value="/resources/images/btn_icon_list.gif" />" alt="icon" /><span>List</span></a>
          </div>
        </li>
      </ul>
    </div>
    

    <!-- 버튼그룹 : end -->