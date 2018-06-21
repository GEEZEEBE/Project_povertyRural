<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
    
    function doSubmit(url,actionName,value) {
        f = document.forms[0];
        if ("list" == actionName) {
            f.method="post";
            $('input[name=srvcID]').val(value);
        } else if ("read" == actionName) {
            f.method="post";
            $('input[name=itemID]').val(value);
        }
        f.action = url;
        f.submit();
    }
    
    
</script>
<form>
<input type="hidden" id="currentPage" name="currentPage" value="1" />
<input type="hidden" name="srvcID" value="${srvcID }" />  
<input type="hidden" name="userID" value="${userID }" />  
<input type="hidden" name="itemID" value="" />  
<input type="hidden" name="lang" value="${lang }" />
<input type="hidden" name="langType" value="${langType }" />
<input type="hidden" name="pageName" value="/usr/englishvi" />
<div class="engCont">
  <section class="engVod">
    <div class="engVodTitle">
      <h2>VOD</h2>
      <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/list','list','23')" class="btnGo"><img src="<c:url value='/resources/usr/images/learning/btn_go.png'/>" alt="go"></a>
    </div>
    <ul>
    <c:forEach var="resultObject" items="${vod}" varStatus="status" begin="0" end="2" step="1">
        <li>
        <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/read','read','${resultObject.ITEM_ID }')">
        <span class="high">
        <span class="highTxt"><c:if test="${langType eq '00033' }"> <c:out value="${resultObject.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"> <c:out value="${resultObject.ITEM_03 }" /></c:if></span>
        </span>
        <c:choose>
          <c:when test="${resultObject.PHYSICAL_FILE_NAME eq null}">
          <img src="<c:url value='/resources/usr/images/learning/noimg.gif' />" alt="">
          </c:when>
          <c:otherwise>
          <img src="${pageContext.request.contextPath }/learning/getImagePath?logFname=${resultObject.LOGICAL_FILE_NAME}&phyFname=${resultObject.PHYSICAL_FILE_NAME}" alt="">
          </c:otherwise>
        </c:choose>
        <%-- <img src="<c:url value='/resources/usr/images/learning/temp_vod02.png'/>" alt=""> --%>
        </a>
        </li>               
    </c:forEach>
      <!-- <li><a href="#"><span class="high"><span class="highTxt">Kongjui and patzui is death</span></span><img src="<c:url value='/resources/usr/images/learning/temp_vod01.png'/>" alt=""></a></li>
      <li
    <c:forEach var="resultObject" items="${command}" varStatus="status" begin="0" end="2" step="1">
        <li><a href="#"><span class="high"><span class="highTxt">Pororo</span></span><img src="<c:url value='/resources/usr/images/learning/temp_vod02.png'/>" alt=""></a></li>             
    </c:forEach>><a href="#"><span class="high"><span class="highTxt">Pororo</span></span><img src="<c:url value='/resources/usr/images/learning/temp_vod02.png'/>" alt=""></a></li>
      <li><a href="#"><span class="high"><span class="highTxt">Canny Mull</span></span><img src="<c:url value='/resources/usr/images/learning/temp_vod03.png'/>" alt=""></a></li> -->
    </ul>
  </section>
  <section class="engEb">
    <div class="engEbTitle">
      <h2>e-Book</h2>
      <a href="#" class="btnGo"><img src="<c:url value='/resources/usr/images/learning/btn_go.png'/>" alt="go"></a>
    </div>
<%--     <ul><c:forEach var="resultObject" items="${ebook}" varStatus="status" begin="0" end="2" step="1">
        <li><a href="#"><span class="highTxt">LOVE</span><img src="<c:url value='/resources/usr/images/learning/temp_eb02.png'/>" alt=""></a></li>              
    </c:forEach>
    </ul> --%>
    <ul>
      <li><a href="#"><span class="highTxt">Tikey the Tikey the</span><img src="<c:url value='/resources/usr/images/learning/temp_eb01g.png'/>" alt=""></a></li>
      <li><a href="#"><span class="highTxt">LOVE YOU FOREVER</span><img src="<c:url value='/resources/usr/images/learning/temp_eb02g.png'/>" alt=""></a></li>
      <li><a href="#"><span class="highTxt">Kongjui and Kongjui and</span><img src="<c:url value='/resources/usr/images/learning/temp_eb03g.png'/>" alt=""></a></li>
    </ul>
    <div class="ebookService"><spring:message code="englishvill.e-book" /></div>
  </section>
</div>
</form>