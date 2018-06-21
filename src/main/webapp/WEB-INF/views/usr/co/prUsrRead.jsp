<%@ page contentType="text/html; charset=UTF-8" 
	import="com.skt.mars.adm.co.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>
<link href="<c:url value='/resources/usr/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<%
	Promote pro = (Promote)request.getAttribute("command");	 
%>
<script>
  function del(url){
	  var form = document.delForm;
	  var con = confirm("Are you sure you want to delete?");
	  if(con){
		  form.action=url;
		  //form.submit(); 
	  }else{
		  return;
	  }
  }
  //$("a#defaultSetting").attr('href', '/abc/commerce/defaultSetting/');
</script>
 <!-- div id="container" role="main"-->
  <div class="subContentsArea">
    <div class="subContentsBox">
    <input type="hidden" name="searchTxtUser" value="${param.searchTxtUser}">
      <div class="subTitleBox typeCommerce">
        <h2 class="titleCommu"><img src="<spring:message code="img.commerce.title" text=""/>" alt="Commerce Service" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.commerce.smmr" text=""/>" alt=" CBC members are at notice on this board." /></p>
        <!-- 언어변경 <p class="subTitleCommu"><img src="<c:url value='/resources/images/txt_commerceservice_mal.gif' />" alt=" CBC members are at notice on this board." /></p> -->
        <!--  <div class="boardMainBtn">
        <a href="${pageContext.request.contextPath }/usr/Promote/list/?searchTxtUser=${param.searchTxtUser}" class="rightBtn"><span class="btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
       	<c:if test="${command.nextCon != null}" >
         <a href="${pageContext.request.contextPath}/usr/Promote/read/?prmtId=${fn:split(command.nextCon,',')[1]}&searchTxtUser=${param.searchTxtUser}" class="btnViewN"><img src="<c:url value='/resources/usr/images/btn_next.png' />" alt="next"></a>
       	</c:if>
       	<c:if test="${command.prevCon != null}" >
         <a href="${pageContext.request.contextPath}/usr/Promote/read/?prmtId=${fn:split(command.prevCon,',')[1]}&searchTxtUser=${param.searchTxtUser}" class="btnViewP"><img src="<c:url value='/resources/usr/images/btn_prev.png' />" alt="prev"></a>
         </c:if>
        </div> -->
      </div>
       <div role="main" class="subConBox">
      <nav role="navigation" class="mypageTab">
          <ul>
            <li><a href="#" class="tabOn"><spring:message code="promote.tap_title1" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/Guide/list/" ><spring:message code="promote.tap_title2" text=""/></a></li>
          </ul>
        </nav>
      <!--mypage start-->
      <!-- div role="main" class="subConBox" -->
        <!--게시판 영역 시작-->
        <div role="main">
          <article class="boardView01">
            <header class="viewHeader"><h1>${command.prodNm }</h1></header>
            <div class="viewInfo"><span class="name">${command.prodSllr }</span><span class="date">${command.frstRgstDt }</span></div>
            <div class="templete-area">
            	<div class="viewTemplete">
	              <img src="<c:url value='/resources/images/temp_view_type01.jpg' />" alt="templete type 1" />
	            </div>
	            <div class="viewTempleteInfo">
	              <span><spring:message code="promote.column_product" text=""/></span> : ${command.prodTitl }<br />
	              <span><spring:message code="promote.column_price" text=""/></span> :  ${command.prodPric }<br />
	              <span><spring:message code="promote.column_seller" text=""/></span> : ${command.prodSllr }<br />
	              <span><spring:message code="promote.column_phone" text=""/></span> : ${command.tlno }<br />
	              <span>E-mail</span> : ${command.emal }
	               
	              <ul class="sns-acc">
	              <c:forEach var="resultObject" items="${command2}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
	              	<c:if test="${resultObject.snsType == 'F'}">
	              	<li class="fb"><span>${resultObject.snsId }</span><a href="#"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete facebook account"></a></li>
	              	</c:if>
	              	<c:if test="${resultObject.snsType == 'B'}">
	              	<li class="blg"><span>${resultObject.snsId }</span><a href="#"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete twitter account"></a></li>
	              	</c:if>
	              	<c:if test="${resultObject.snsType == 'T'}">
	              	<li class="tw"><span>${resultObject.snsId }</span><a href="#"><img src="<c:url value='/resources/images/btn_snsDelete.gif' />" alt="delete blogspot account"></a></li>
	              	</c:if>
	              	</c:forEach>
	              </ul>
	            </div>
            </div>
          </article>
          <article class="boardView02">
          <nav class="bottomNaviNtc">
            <ul>
             <c:if test="${command.prevCon != null}" >
              <li>
              	<a href="${pageContext.request.contextPath}/usr/Promote/read/?prmtId=${fn:split(command.prevCon,',')[1]}&searchTxtUser=${param.searchTxtUser}"><span class="wayMarkP"><spring:message code="board.btn_previous" text=""/></span>
              	<span class="listTitle">: ${fn:split(command.prevCon,',')[0]}</span>
              	<img src="<c:url value='/resources/usr/images/ico_img.gif' />" alt="include image"></a>              	
              </li>
              </c:if>
              <c:if test="${command.nextCon != null}" >
              <li class="noBb"> 
	              	<a href="${pageContext.request.contextPath}/usr/Promote/read/?prmtId=${fn:split(command.nextCon,',')[1]}&searchTxtUser=${param.searchTxtUser}"><span class="wayMarkN"><spring:message code="board.btn_next" text=""/></span>
	              	<span class="listTitle">: ${fn:split(command.nextCon,',')[0]}</span>
	              	<img src="<c:url value='/resources/usr/images/ico_img.gif' />" alt="include image"></a></li>	           
	           </c:if>
            </ul>
          </nav>
          <div class="boardBtnNotice">
            <a href="${pageContext.request.contextPath }/usr/Promote/list/?searchTxtUser=${param.searchTxtUser}" class="rightBtn"><span class="btnBaseTxt"><spring:message code="board.btn_list" text=""/></span></a>
          </div>
          </article>
        </div>
      </div>
      <!--mypage end--> 
      </div>
    </div>
<!-- /div-->
   

