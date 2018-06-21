<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<!-- *************************************************************************************************************** -->
<script type="text/javascript">

$(document).ready(function(){
	today = new Date();
	Y=today.getFullYear();
	M=today.getMonth()+1;
	showCalendar(today.getFullYear(), today.getMonth() + 1);
});

 function numberOfDays(year, month) {
  var days;
  if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12)) days = 31;
  else if ((month == 4) || (month == 6) || (month == 9) || (month == 11)) days = 30;
  else if (month == 2) {   //윤년
   if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) days = 29;
   else days = 28;
  }
  return days;
 }
 
function showCalendar(year, month){
   var str="";
   var firstDate = new Date(year, month-1, 1);
   var firstDay = firstDate.getDay();
   var tMonth = "";
   
   if(month == 10 || month == 11 || month == 12){
	   tMonth = month;
   }else{
	   tMonth ="0" + month;
   }
   $('.numDate').text(year+"."+tMonth);
   $('input[name=month]').val(tMonth);
   $('input[name=year]').val(year);
   var beforMonthLastDay;
   if('1'==month){
	   beforMonthLastDay = numberOfDays(year,12);
   } else {
	   beforMonthLastDay = numberOfDays(year,month-1);
   }
   var col = 0;
   str+="<TR>";
   for (var i=0; i<firstDay; i++) {
	    var lastDay = beforMonthLastDay-firstDay+i+1;
        str+="<TD class='non'>"+lastDay+"</TD>";
        col++;
   }
 ed=numberOfDays(year, month);
 
   for (i=1; i<=ed; i++) { //날짜
	   if(i<10){
		    if (col == 0) {
		    	str+="<td id='0"+i+"day' class='sun'>";
		    } else if(col == 6) {
		    	str+="<td id='0"+i+"day' class='sat'>";
		    } else {
		    	str+="<td id='0"+i+"day' >";
		    }
	   }else{
		   if (col == 0) {
	            str+="<td id='"+i+"day' class='sun'>";
	        } else if(col == 6) {
	            str+="<td id='"+i+"day' class='sat'>";
	        } else {
	            str+="<td id='"+i+"day' >";
	        }   
	   }
      
        str+=i;
        str+="</TD>";
        col++;
        if (col == 7) {   //새로운 행
       	   str+="</TR>";
       	   col = 0;
       	}
    }
   if(col != 0){
	   var nextMonthDay = 1;
	   for (col; col<7; col++){
	    	str+="<td class='non'>"+nextMonthDay+"</td>";
	    	nextMonthDay++;
	    }
	   str+="</tr>";
   }
 $('#calendarTbody').html(str);
 
 calendarDate();
 }
 
function cngCal(v1,v2){
	  if(v1==0){
	   Y=eval(Y+v2);
	  } else {
	   M=eval(M+v2);
	   if(M>12) {Y++;M=1;}
	   if(M<1) {Y--;M=12;}
	  }
	  showCalendar(Y, M);
}




function calendarDate(){
  
    $.ajax({
      type    : "GET",
      url     : "${pageContext.request.contextPath }/restful/smartClass/calendarData",
      dataType: "json",
      data: ({
    	  userID : $("input[name=userID]").val(),
          month : $("input[name=month]").val(),
          year : $("input[name=year]").val(),
          srvcID : '3'
          
      }),
      success : function(data){
          $.each(data.itmes, function(i,item){
        	 if(item.COUNT < 5){
                 $('#'+item.DAY+'day').html(item.DAY+"<span class='completeMark01'>"+item.COUNT+"</span>");
             }else if(4 < item.COUNT && item.COUNT < 10){
                 $('#'+item.DAY+'day').html(item.DAY+"<span class='completeMark02'>"+item.COUNT+"</span>");
             }else if(9 < item.COUNT){
                 $('#'+item.DAY+'day').html(item.DAY+"<span class='completeMark03'>"+item.COUNT+"</span>");
             }
          });
      },
      error : function(request,status,error){ 
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
     
    });
        
}


 
 
function doSubmit(url,actionName,value) {
    f = document.forms[0];
    if ("calendar" == actionName) {
        f.method="post";
    } else if ("lessonsList" == actionName) {
        f.method="post";
    } else if ("list" == actionName) {
        f.method="post";
        $('input[name=srvcID]').val(value);
    }  
    f.action = url;
    f.submit();
}
</script>

<!-- *************************************************************************************************************** -->
<form>
    <input type="hidden" name="year" value="" />
    <input type="hidden" name="month" value="" />
    <input type="hidden" name="userID" value="${userID }" />
    <input type="hidden" name="pageName" value="/usr/smartClass/calendar" />
    <input type="hidden" name="lang" value="${lang }" />
    <input type="hidden" name="langType" value="${langType }" />  
    <div class="smartCont" role="main">
      <div class="recordTitle">
        <hgroup class="lessonRecH">
          <h2><spring:message code="englishvill.calendar" text=""/></h2>
          <h3><spring:message code="smart.calender_text,p_1" text=""/></h3>
        </hgroup>
        <div class="btnView"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/lessonsList','lessonsList')"><img src="<spring:message code="ima.view_list_btn" text=""/>" alt="list"></a></div>
      </div>
      <div class="calendarBox">
        <div class="calDate"><a href="javascript:cngCal(1,-1);" class="btnPrevOn">prev</a><span class="numDate"></span><a href="javascript:cngCal(1,1);" class="btnNextOn">next</a></div>
        <table summary="Calendar" class="calendarTable">
          <caption>
          Calendar
          </caption>
          <colgroup>
            <col style="width:121px;">
            <col style="width:121px;">
            <col style="width:121px;">
            <col style="width:121px;">
            <col style="width:121px;">
            <col style="width:121px;">
            <col>
          </colgroup>
          <tr>
            <th scope="col" class="sun"><spring:message code="smart.calender_sun"/></th>
            <th scope="col"><spring:message code="smart.calender_mon"/></th>
            <th scope="col"><spring:message code="smart.calender_tue"/></th>
            <th scope="col"><spring:message code="smart.calender_wed"/></th>
            <th scope="col"><spring:message code="smart.calender_thu"/></th>
            <th scope="col"><spring:message code="smart.calender_fri"/></th>
            <th scope="col" class="sat"><spring:message code="smart.calender_sat"/></th>
          </tr>
          <tbody id="calendarTbody">
          <tr>
            <td class="nonSun">28</td>
            <td class="non">29</td>
            <td class="non">30</td>
            <td class="non">31</td>
            <td>1</td>
            <td>2</td>
            <td class="sat">3</td>
          </tr>
          <tr>
            <td class="sun">4</td>
            <td>5</td>
            <td>6</td>
            <td>7<span class="completeMark01">6</span></td>
            <td>8</td>
            <td>9</td>
            <td class="sat">10</td>
          </tr>
          <tr>
            <td class="sun">11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
            <td>15</td>
            <td>16</td>
            <td class="sat">17<span class="completeMark01">112</span></td>
          </tr>
          <tr>
            <td class="sun">18<span class="completeMark01">23</span></td>
            <td>19</td>
            <td>20</td>
            <td>21</td>
            <td>22</td>
            <td>23</td>
            <td class="sat">24</td>
          </tr>
          <tr>
            <td class="sun">25</td>
            <td>26</td>
            <td>27</td>
            <td>28</td>
            <td class="non">1</td>
            <td class="non">2</td>
            <td class="nonSat">3</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
</form>

