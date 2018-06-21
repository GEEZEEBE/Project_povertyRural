<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="today" value="${now}" type="both" pattern="yyyy.MM.dd"/>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$(function() {
		  	
			$("#stDateImg").click(function(){
				$(".firstDate0").datepicker('show');
			});
			$("#enDateImg").click(function(){
				$(".firstDate1").datepicker('show');
			})
			
			$(".firstDate0,.firstDate1").datepicker({
		  		dateFormat: "yy.mm.dd"
		  	});
			
			$(".firstDate0,.firstDate1").change(function(){
				if($(".firstDate0").val().trim().length>0 || $(".firstDate1").val().trim().length>0){
					var firstDate0 = $(".firstDate0").val().replace(".","");
					firstDate0 = firstDate0.replace(".","");
					
					var firstDate1 = $(".firstDate1").val().replace(".","");
					firstDate1 = firstDate1.replace(".","");
					
					//alert(firstDate0+"---"+firstDate1);
					if(parseInt(firstDate0) > parseInt(firstDate1)){
						$(".firstDate1").val($(".firstDate0").val());
						return false;
					}
				}
			});
			
			$("select[name='stHour'],select[name='stMin'],select[name='enHour'],select[name='enMin']").change(function(){
				
				var stHour = $("select[name='stHour']").val();
				var stMin = $("select[name='stMin']").val();
				var enHour = $("select[name='enHour']").val();
				var enMin = $("select[name='enMin']").val();
				
				allSt = stHour+stMin;
				allEn = enHour+enMin;
				
				if(parseInt(allSt) > parseInt(allEn)){
					$("select[name='enHour']").val(stHour);
					$("select[name='enMin']").val(stMin);
					return false;
				}
			})
		  	
		 });
	});
	
</script>

<div class="board using">
	<!-- 제목 : str -->
	<div class="subtitle">
		<hgroup>
			<h2>Usage Status</h2>
			<h3>Check the service usage and billing status of the members here</h3>
		</hgroup>
	</div>
	<!-- 제목 : end -->
	
	<form id="command" id="command">
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
	<input type="hidden" name="serTxt" value="<c:out value="${requestMap.serTxt }" />">
	</form>


	<!-- 검색조건 : srt -->
	<form name="command2" id="command2">
		<input type="hidden" id="currentPage" name="currentPage"
			value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />	
		<input type="hidden" name="serTrue" value="0">
		<table class="boardSch" summary="search">
			<colgroup>
				<col width="100" />
				<col width="*" />
				<col width="100" />
				<col width="192" />
				<col width="82" />
			</colgroup>
			<tr>
				<th>Extension</th>
				<td colspan="3" class="category using"><a href="#"><img
						src="<c:url value="/resources/images/icon_calendar.gif" />"
						alt="icon date" id="stDateImg" /></a> <input type="text" class="date firstDate0"
					value="<c:if test="${requestMap.stDate==null}">${today }</c:if>${requestMap.stDate }" title="date" name="stDate" readonly /> <img
					src="<c:url value="/resources/images/icon_time.gif" />"
					alt="icon datetime" /> 
					<!-- 
					<select name="stAmpm" style="height: 24px;">
						<option value="">All</option>
						<option value="am" <c:if test="${requestMap.stAmpm=='am'}">selected</c:if> >AM</option>
						<option value="pm" <c:if test="${requestMap.stAmpm=='pm'}">selected</c:if> >PM</option>
				</select> --> <select name="stHour" style="height: 24px;">
					<c:forTokens var="i" items="00,01,02,03,04,05,06,07,08,09,10" delims=",">
		            	<option value="${i}" <c:if test="${requestMap.stHour==i}">selected</c:if> >${i}</option>
		          	</c:forTokens>
		          	<c:forEach var="i" begin="11" end="23">
		          		<option value="${i}" <c:if test="${requestMap.stHour==i}">selected</c:if> >${i}</option>
		          	</c:forEach>
				</select> <select name="stMin" style="height: 24px;">
						<c:forTokens var="i" items="00,10,20,30,40,50" delims=",">
		            		<option value="${i}" <c:if test="${requestMap.stMin==i}">selected</c:if> >${i}</option>
		          		</c:forTokens>
				</select> <span>~</span> <a href="#"><img
						src="<c:url value="/resources/images/icon_calendar.gif" />"
						alt="icon date" id="enDateImg"/></a> <input type="text" class="date firstDate1"
					value="<c:if test="${requestMap.enDate==null}">${today }</c:if>${requestMap.enDate }" title="date" name="enDate" readonly /> <img
					src="<c:url value="/resources/images/icon_time.gif" />"
					alt="icon datetime" /> 
					<!-- 
					<select name="enAmpm" style="height: 24px;">
						<option value="">All</option>
						<option value="am" <c:if test="${requestMap.enAmpm=='am'}">selected</c:if> >AM</option>
						<option value="pm" <c:if test="${requestMap.enAmpm=='pm'}">selected</c:if> >PM</option>
				</select> --> <select name="enHour" style="height: 24px;">
					<c:forTokens var="i" items="00,01,02,03,04,05,06,07,08,09,10" delims=",">
		            	<option value="${i}" <c:if test="${requestMap.enHour==i}">selected</c:if> >${i}</option>
		          	</c:forTokens>
		          	<c:forEach var="i" begin="11" end="23">
		          		<option value="${i}" <c:if test="${requestMap.enHour==i}">selected</c:if> >${i}</option>
		          	</c:forEach>
				</select> <select name="enMin" style="height: 24px;">
						<c:forTokens var="i" items="00,10,20,30,40,50" delims=",">
		            		<option value="${i}" <c:if test="${requestMap.enMin==i}">selected</c:if> >${i}</option>
		          		</c:forTokens>
				</select></td>
				<td rowspan="2">
					<p class="btnSching">
						<button type="button" onclick="fncSerTxt(); doSubmit2('${pageContext.request.contextPath }/adm/using/list', 'command2', 'post');">Search</button>
					</p>
				</td>
			</tr>
			<tr>
				<th>Billing</th>
				<td class="type"><label class="radio"><input type="checkbox" title="checkbox" name="bill" value="Y" <c:if test="${requestMap.bill=='Y'}">checked</c:if> />Include billed</label></td>
				<th>Name / ID</th>
				<td>
					<p class="sch">
						<input type="text" name="serTxt" title="검색어 입력" value="<c:out value="${requestMap.serTxt }" />" />
					</p>
				</td>
			</tr>
		</table>
	</form>
	<!-- 검색조건 : end -->
	<!-- 청구 목록 : str -->
	
	<table class="boardList" summary="Item">
		<colgroup>
			<col width="80" />
			<col width="*" />
			<col width="330" />
		</colgroup>
		<thead>
			<tr>
				<th class="one">No.</th>
				<th>Name</th>
				<th class="end">Member ID</th>
			</tr>
		</thead>
		<tbody>
	        <c:if test="${list == null || fn:length(list) == 0}">
	            <tr>
	            	<td colspan="3">No registered result obtained.</td>
	        	</tr>
		    </c:if>
			<c:forEach var="result" items="${list}" varStatus="status"
				begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*10 -10 }"
				end="${currentPage == null ? 0 : currentPage*10 -1 }" step="1">
				<tr>
					<td><nav:listNo pageList="${list}"
							statusIndex="${status.index}" /></td>
					<td class="alignL"><a href="#" onClick="doSubmit('${pageContext.request.contextPath }/adm/using/read?userID=${result.USER_ID}', 'command', 'post');">${result.NAME}</a></td>
					<td>${result.USER_ID}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 청구 목록 : end -->
	
</div>

<!-- ===================================================================== -->

<!-- 페이지 넘버 : srt -->
<div class="pageNum">
	<nav:pageNavi
		doSubmit="doSubmit('${pageContext.request.contextPath }/adm/using/list', 'command', 'post');"
		pageList="${list}" />
</div>
<!-- 페이지 넘버 : end -->