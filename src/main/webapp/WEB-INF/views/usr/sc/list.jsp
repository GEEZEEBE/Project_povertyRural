<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
    
    function doSubmit(url,actionName,value,autoPlayFlag) {
        f = document.forms[0];
        if ("list" == actionName) {
            f.method="post";
            $('input[name=currentPage]').val(1);
            $('input[name=srvcID]').val(value);
        } else if ("read" == actionName) {
        	f.method="post";
        	$('input[name=itemID]').val(value);
        	$('input[name=autoPlayFlag]').val(autoPlayFlag);
        } else if ("page" == actionName) {
            f.method="post";
            $('input[name=srvcID]').val(value);
        }
        f.action = url;
        f.submit();
    }
    
    
</script>

<form>
<!-- ************************************************************ -->
    <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
    <input type="hidden" name="srvcID" value="${srvcID }" />  
    <input type="hidden" name="userID" value="${userID }" />  
    <input type="hidden" name="itemID" value="" />
    <input type="hidden" name="autoPlayFlag" value="" />
    <input type="hidden" name="pageName" value="/usr/smartClass/list" />
    <input type="hidden" name="lang" value="${lang }" />
    <input type="hidden" name="langType" value="${langType }" />
    <div class="smartCont" role="main">
      
      <c:choose>
      <c:when test="${srvcID eq '4' || srvcID eq '5' || srvcID eq '6' || srvcID eq '7' || srvcID eq '8' }"><h2 class="smartListH"><spring:message code="learningse.year_4" text=""/></h2></c:when>
      <c:when test="${srvcID eq '9' || srvcID eq '10' || srvcID eq '11' || srvcID eq '12' || srvcID eq '13' }"><h2 class="smartListH bgY5"><spring:message code="learningse.year_5" text=""/></h2></c:when>
      <c:when test="${srvcID eq '14' || srvcID eq '15' || srvcID eq '16' || srvcID eq '17' || srvcID eq '18' }"><h2 class="smartListH bgY6"><spring:message code="learningse.year_6" text=""/></h2></c:when>
      <c:when test="${srvcID eq '19' || srvcID eq '20' || srvcID eq '21' }"><h2 class="smartListH bgEng"><spring:message code="learningse.advanced_en" text=""/></h2></c:when>
      </c:choose>
      <nav role="navigation" class="smartListNavi">
        <ul>
        <c:choose>
          <c:when test="${srvcID eq '4' || srvcID eq '5' || srvcID eq '6' || srvcID eq '7' || srvcID eq '8' }">
          <li class=<c:choose><c:when test="${srvcID eq '4'}" >'tabFirst tabOn'</c:when><c:otherwise>tabFirst</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','4')" class="all"><spring:message code="smart.subject_all" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '5'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','5')" class="engY4"><spring:message code="smart.subject_english" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '6'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','6')" class="matY4"><spring:message code="smart.subject_mathematics" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '7'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','7')" class="sciY4"><spring:message code="smart.subject_science" text=""/></a></li>
          <li class=<c:choose><c:when test="${srvcID eq '8'}" >'tabLast tabOn'</c:when><c:otherwise>tabLast</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','8')" class="malY4"><spring:message code="smart.subject_malay" text=""/></a></li>
          </c:when>
          <c:when test="${srvcID eq '9' || srvcID eq '10' || srvcID eq '11' || srvcID eq '12' || srvcID eq '13' }">
          <li class=<c:choose><c:when test="${srvcID eq '9'}" >'tabFirst tabOn'</c:when><c:otherwise>tabFirst</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','9')" class="all"><spring:message code="smart.subject_all" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '10'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','10')" class="engY5"><spring:message code="smart.subject_english" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '11'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','11')" class="matY5"><spring:message code="smart.subject_mathematics" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '12'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','12')" class="sciY5"><spring:message code="smart.subject_science" text=""/></a></li>
          <li class=<c:choose><c:when test="${srvcID eq '13'}" >'tabLast tabOn'</c:when><c:otherwise>tabLast</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','13')" class="malY5"><spring:message code="smart.subject_malay" text=""/></a></li>
          </c:when>
          <c:when test="${srvcID eq '14' || srvcID eq '15' || srvcID eq '16' || srvcID eq '17' || srvcID eq '18' }">
          <li class=<c:choose><c:when test="${srvcID eq '14'}" >'tabFirst tabOn'</c:when><c:otherwise>tabFirst</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','14')" class="all"><spring:message code="smart.subject_all" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '15'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','15')" class="engY6"><spring:message code="smart.subject_english" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '16'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','16')" class="matY6"><spring:message code="smart.subject_mathematics" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '17'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','17')" class="sciY6"><spring:message code="smart.subject_science" text=""/></a></li>
          <li class=<c:choose><c:when test="${srvcID eq '18'}" >'tabLast tabOn'</c:when><c:otherwise>tabLast</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','18')" class="malY6"><spring:message code="smart.subject_malay" text=""/></a></li>
          </c:when>
          <c:when test="${srvcID eq '19' || srvcID eq '20' || srvcID eq '21' }">
          <li class=<c:choose><c:when test="${srvcID eq '19'}" >'tabFirst tabOn'</c:when><c:otherwise>tabFirst</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','19')" class="all02"><spring:message code="smart.subject_all" text=""/></a></li>
          <li class=<c:if test="${srvcID eq '20'}" >tabOn</c:if>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','20')" class="bul"><spring:message code="smart.subject_bulats" text=""/></a></li>
          <li class=<c:choose><c:when test="${srvcID eq '21'}" >'tabLast tabOn'</c:when><c:otherwise>tabLast</c:otherwise></c:choose>><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','21')" class="act"><spring:message code="smart.subject_bulats,ac" text=""/></a></li>
          </c:when>
        </c:choose>
        </ul>
      </nav>
      <div class="smartList">
        <table summary="smart class UPSR list" class="smartBoard01">
  <caption>
    smart class UPSR list
  </caption>
  <colgroup>
    <col style="width:110px">
    <col style="width:545px">
    <col style="width:110px">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th scope="col"><spring:message code="smart.column_subject" text=""/></th>
      <th scope="col"><spring:message code="board.column_title" text=""/></th>
      <th scope="col"><spring:message code="smart.column_play" text=""/></th>
      <th scope="col" class="lastTh"><spring:message code="smart.column_state" text=""/></th>
    </tr>
  </thead>
  <tbody>
  
    <c:if test="${malayList == null || fn:length(malayList) == 0}">
        <tr><td colspan="4" class="noPost"><spring:message code="learningse.p_3" text=""/></td></tr><!--말레이 Tiada sejarah.-->
    </c:if>
  
    <c:forEach var="malay" items="${malayList}" varStatus="status"
						begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*5 -5 }"
						end="${currentPage == null ? 0 : currentPage*5 -1 }" step="1">
    <tr>
      <td class="subj"><span class="cateMark02">${malay.SRVC_CTGR_NM }</span></td>
      <%-- <td><span class="imgName"><img src="<c:url value='/resources/usr/images/learning/img_temp.gif' />" alt=""></span><span class="listName">${malay.CNTS_NAME }</span></td> --%>
      <td>
      <span class="imgName">
      <c:choose>
      <c:when test="${malay.PHYSICAL_FILE_NAME eq null}">
      <img src="<c:url value='/resources/usr/images/learning/img_temp.gif' />" alt="">
      </c:when>
      <c:otherwise>
      <img src="${pageContext.request.contextPath }/learning/getImagePath?logFname=${malay.LOGICAL_FILE_NAME}&phyFname=${malay.PHYSICAL_FILE_NAME}" alt="">
      </c:otherwise>
      </c:choose>
      </span>
      <%-- <span class="imgName"><img src="${pageContext.request.contextPath }/learning/getImagePath?logFname=${malay.LOGICAL_FILE_NAME}&phyFname=${malay.PHYSICAL_FILE_NAME}" alt=""></span> --%>
      <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/read','read','${malay.ITEM_ID }','false')"><span class="listName"><c:if test="${langType eq '00033' }">${malay.ITEM_02 }</c:if><c:if test="${langType eq '00034' }">${malay.ITEM_03 }</c:if></span></a>
      </td>
      <td class="subj"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/read','read','${malay.ITEM_ID }','true')"><img src="<c:url value='/resources/usr/images/learning/btn_play.png' />" alt="play"></a></td>
      <td class="subj">
      <c:choose>
        <c:when test="${malay.CMPL_YN == 'E' }"><img src="<c:url value='/resources/usr/images/learning/ico_star01.png' />" alt="Complete" title="Complete"></c:when>
        <c:when test="${malay.CMPL_YN == 'S' }"><img src="<c:url value='/resources/usr/images/learning/ico_star02.png' />" alt="In progress" title="In progress"></c:when>
        <c:when test="${empty malay.CMPL_YN }"><img src="<c:url value='/resources/usr/images/learning/ico_star03.png' />" alt="No state" title="No state"></c:when>
      </c:choose>
      </td>
    </tr>
    </c:forEach>
    
  </tbody>
</table>
        <!--페이지 최대 갯수는 5개-->
        <div class="boardListPage">
				<nav:pageNavi
					doSubmit="doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','page','${srvcID }');"
					pageList="${malayList}" tabSize="5" sortOf="smart" />
        </div>
      </div>
    </div>
<!-- ************************************************************ -->
</form>
