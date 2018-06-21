<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<jsp:useBean id="now" class="java.util.Date"/>
<script type="text/javascript">
  
function fncUseTime(strFromDate){ 
  
//var strFromDate = "201012021500"; //시작시간
var strToDate   = "201012021759"; //종료시간
var today = new Date();
strToDate = today.getFullYear()+""+( (today.getMonth() + 1)>10?(today.getMonth() + 1):"0"+(today.getMonth() + 1) )+""+today.getDate()+""+today.getHours()+""+today.getMinutes();

  var fromDate = new Date(strFromDate.substring(0,4),
        strFromDate.substring(4,6)-1,
        strFromDate.substring(6,8),
        strFromDate.substring(8,10),
        strFromDate.substring(10,12)
       );
       
  var toDate = new Date(strToDate.substring(0,4),
        strToDate.substring(4,6)-1,
        strToDate.substring(6,8),
        strToDate.substring(8,10),
        strToDate.substring(10,12)
       );
    
  //daysAfter = (toDate.getTime() - fromDate.getTime()) / (1000*60*60*24);
  //hourAfter = (toDate.getTime() - fromDate.getTime()) / (1000*60*60);
  minAfter = (toDate.getTime() - fromDate.getTime()) / (1000*60);
  //secAfter = (toDate.getTime() - fromDate.getTime()) / (1000);
  return document.write( ( parseInt(minAfter/60)>10?parseInt(minAfter/60):"0"+parseInt(minAfter/60) ) +":"+( parseInt(minAfter % 60)>10?parseInt(minAfter % 60):"0"+parseInt(minAfter % 60) )   );
}
	
</script>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<!-- 프로그램 페이지영역 : str============================================================= -->
    <div>
      <!-- 제목 : str -->
      <div class="subtitle repair">
        <hgroup>
          <h2>PC Monitoring</h2>
          <h3>Menu use site operating system</h3>
        </hgroup>
        <p class="sch">
          <div class="button1 type2 repair">
            <a href="${pageContext.request.contextPath }/adm/pcMonitoring/list"><img src="<c:url value='/resources/images/btn_icon_repair.gif' />" alt="icon" /><span>Refresh</span></a>
          </div>
        </p>
      </div>
      <!-- 제목 : end -->

      <!-- PC 모니터 목록 : str============================================================= -->
      <section class="pcMonitoring">
      <c:forEach var="resultObject" items="${list}" varStatus="status">
        <div class="<c:if test="${resultObject.FRST_RGST_DT!=null}">use</c:if><c:if test="${resultObject.FRST_RGST_DT==null}">notUse</c:if>"><!-- ============class="use" ===== pc를 사용중일때" -->
         <c:if test="${resultObject.FRST_RGST_DT!=null}">
	          <img src="<c:url value='/resources/images/icon_monitor_use.gif' />" alt="icon Monitor" />
	          <span class="pcNum">${resultObject.CNTS_NAME}</span>
	          <p>${resultObject.NAME}</p>
	          <mark>
	            <label><b>Start :</b><time><fmt:formatDate value="${resultObject.FRST_RGST_DT}" type="both" pattern="a hh:mm" /></time></label>
	            <label><b>Use time :</b><time><script>fncUseTime('<fmt:formatDate value="${resultObject.FRST_RGST_DT}" type="both" pattern="yyyyMMddHHmm" />');</script></time></label>
	          </mark>
         </c:if>
         <c:if test="${resultObject.FRST_RGST_DT==null}">
         	<img src="<c:url value='/resources/images/icon_monitor_notuse.gif' />" alt="icon Monitor" />
          	<span class="pcNum">${resultObject.CNTS_NAME}</span>
         </c:if>
        </div>
        </c:forEach>
        <!--  ============class="notUse" ===== pc를 사용 안할때" 
        <div class="notUse nextLine">
          <img src="<c:url value='/resources/images/icon_monitor_notuse.gif' />" alt="icon Monitor" />
          <span class="pcNum">PC3</span>
        </div>
        <div class="notUse">
          <img src="<c:url value='/resources/images/icon_monitor_notuse.gif' />" alt="icon Monitor" />
          <span class="pcNum">PC4</span>
        </div>
         -->
      </section>
      <!-- PC 모니터 목록 : end=============================================================== -->
    </div>
    <!-- 프로그램 페이지영역 : end============================================================= -->
