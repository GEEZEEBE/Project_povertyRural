<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>

  <!-- Notice : str -->
  <article class="noticeList">
    <h1>Announcements<a href="${pageContext.request.contextPath }/adm/notice/list"><span>More <em>▶</em></span></a></h1>
    <table class="boardList notice" summary="Notice">
      <colgroup>
        <col width="171" />
        <col width="130" />
        <col width="130" />
      </colgroup>
      <thead>
        <tr>
          <th class="one">Title</th>
          <th>Registered by</th>
          <th class="end">Date</th>
        </tr>
      </thead>
      <tbody>
    <c:forEach var="noticelist" items="${notice}" varStatus="status" begin="0" end="3">
		<tr>
          <td class="alignL"><a href="${pageContext.request.contextPath }/adm/notice/read?noticeId=${noticelist.NOTI_ID }" class="mainNtcTitle"><c:out value='${noticelist.NOTI_SUBJ }'/></a></td>
          <td><c:out value='${noticelist.FRST_RGST_USER_ID }'/></td>
          <td class="time"><fmt:formatDate value="${noticelist.FRST_RGST_DT }" type="both" pattern="yyyy.MM.dd" /></td>
        </tr>
     </c:forEach>
      </tbody>
    </table>
  </article>
  <!-- Notice : end -->
  <!-- Members : str -->
  <article class="membersList">
    <h1>Recently Registered Members<a href="${pageContext.request.contextPath }/adm/user/list"><span>More <em>▶</em></span></a></h1>
    <table class="boardList members" summary="Members">
      <colgroup>
        <col width="201" />
        <col width="100" />
        <col width="130" />
      </colgroup>
      <thead>
        <tr>
          <th class="one">Name</th>
          <th>Member ID</th>
          <th class="end">Date</th>
        </tr>
      </thead>
      <tbody>
        <tr>
    	<c:forEach var="memberslist" items="${members}" varStatus="status" begin="0" end="3">
	        <tr>
	          <td class="alignL"><a href="${pageContext.request.contextPath }/adm/user/read?userID=${memberslist.USER_ID }"><c:out value='${memberslist.NAME }'/></a></td>
	          <td><c:out value='${memberslist.USER_ID }'/></td>
	          <td class="time"><fmt:formatDate value="${memberslist.FRST_RGST_DT }" type="both" pattern="yyyy.MM.dd" /></td>
	        </tr>
     	</c:forEach>
     </tbody>
    </table>
  </article>
  <!-- Members : end -->
  <!-- use : str -->
  <article class="useList">
    <h1>Today's Usage Status<a href="${pageContext.request.contextPath }/adm/st/list?url=sumComul"><span>More <em>▶</em></span></a></h1>
    <table class="boardList use" summary="Use">
      <colgroup>
        <col width="171" />
        <col width="160" />
        <col width="100" />
      </colgroup>
      <thead>
        <tr>
          <th class="one" colspan="2">Classification</th>
          <th class="end">Usage Count</th>
        </tr>
      </thead>
      <tbody>
    	<c:forEach var="uselist" items="${use}" varStatus="status" begin="0" end="3">
        <tr>
          <td class="alignL"><c:out value='${uselist.SERVICE_TITLE}'/></td>
          <td><c:out value="${uselist.SERVICE_NAME}" /></td>
          <td><fmt:formatNumber value="${uselist.CNT}" type="number"/></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
  </article>
  <!-- use : end -->
  <!-- company : str -->
  <article class="companyList">
    <h1>Late Returns<a href="${pageContext.request.contextPath }/adm/assetUtil/returnList/"><span>More <em>▶</em></span></a></h1>
    <table class="boardList company" summary="Company">
      <colgroup>
        <col width="171" />
        <col width="160" />
        <col width="100" />
      </colgroup>
      <thead>
        <tr>
          <th class="one">Device</th>
          <th>Member ID</th>
          <th class="end">Days Overdue</th>
        </tr>
      </thead>
      <tbody>
    	<c:forEach var="companylist" items="${company}" varStatus="status" begin="0" end="3">
        <tr>
          <td class="alignL"><c:out value='${companylist.ITEM_NM}'/></td>
          <td><c:out value='${companylist.USER_ID}'/></td>
          <td class="time">${companylist.REMAIN_DATE}</td>
        </tr>
        </c:forEach></tbody>
    </table>
  </article>
  <!-- company : end -->
  <c:forEach var="upDown" items="${upDown}" varStatus="status">
      <c:set var="download" value="${upDown.download}" />
      <c:set var="upload" value="${upDown.upload}" />
  </c:forEach>
  <c:forEach var="vistor" items="${vistor}" varStatus="status">
      <c:set var="previousDay" value="${vistor.previousDay}" />
      <c:set var="toDay" value="${vistor.toDay}" />
  </c:forEach>
  <section class="guestGroup">
    <ul>
      <li class="updown">
        <ol>
          <li class="download">
            <div>
              <p><span>Today’s Visitors</span><em><fmt:formatNumber value="${toDay}" type="number"/></em></p>
            </div>
          </li>
          <li class="upload">
            <div>
              <p><span>Visitors from the Previous Day</span><em><fmt:formatNumber value="${previousDay}" type="number"/></em></p>
            </div>
          </li>
        </ol>
      </li>
      
    <!--   
      <li class="updown">
        <ol>
          <li class="download">
            <div>
              <p><span>Download</span><em>${download}Mbps</em></p>
            </div>
          </li>
          <li class="upload">
            <div>
              <p><span>Upload</span><em>${upload}Mbps</em></p>
            </div>
          </li>
        </ol>
      </li>
      <li class="side">
        <dl>
          <dt class="dottline">Visitors for the previous day</dt>
          <dd class="dottline">${previousDay}</dd>
          <dt>Today’s visitors</dt>
          <dd><span>${toDay}</span></dd>
        </dl>
      </li>
       -->
      
    </ul>
    </section>