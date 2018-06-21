<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" type="both" pattern="yyyy"/>

<form id="command">
<input type="hidden" name="del" value="0">
<input type="hidden" name="checkSearch" value="${param.checkSearch}">
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Member Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <table class="boardView" summary="Information">
        <colgroup>
          <col width="25%" />
          <col width="*" />
          <col width="18%" />
          <col width="25%" />
        </colgroup>
        <tr>
          <th>Date</th>
          <td>${command.frstRgstDT}</td>
          <th>Registered by</th>
          <td>${command.frstRgstUserID}</td>
        </tr>
        <tr>
          <th>Name</th>
          <td colspan="3"><c:out value="${command.name}" />(<c:out value ="${command.userID}" />)</td>
        </tr>
        <tr>
	        <th>Gender</th>
	        <td colspan="3">
		        <c:if test="${command.sex=='M'}" >Male</c:if>
		        <c:if test="${command.sex=='F'}" >Female</c:if>
	        </td>
        </tr>
        <tr>
          <th>Birthday</th>
          <td colspan="3">${birthYear}-${birthMonth}-${birthDay}</td>
        </tr>
        <tr>
          <th>Phone</th>
          <td colspan="3"><c:out value="${command.tlNO}" /></td>
        </tr>
        <tr>
          <th>E-mail</th>
          <td colspan="3"><c:out value="${emailFirst}" />@<c:out value="${emailLast}" /></td>
        </tr>
        <!--  tr>
          <th>Membership fee payment</th>
          <td colspan="3">reciptok
            <!-- <div class="button3">
              <a href="#">Enter</a>
            </div>
          </td>
        </tr-->
        <tr>
          <th>Address</th>
          <td colspan="3"><c:out value="${command.adrres}" /></td>
        </tr>
        <tr>
          <th>etc</th>
          <td colspan="3"><c:out value="${command.etc}" /></td>
        </tr>
      </table>
     <!-- 게시판 목록 : end -->
    </div>
</form>
    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li>
          <div class="button1">
			 <a href="${pageContext.request.contextPath }/adm/user/edit?serCol=${param.serCol}&serTxt=${param.serTxt}&flag=e&userID=${command.userID}">Edit</a>          
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/user/delete?del=${command.userID}', 'command', 'post');" class="detailDelete">Delete</a>
          </div>
        </li>
        <li class="type2 list">
          <div class="button1 type2 list">
            <a href="${pageContext.request.contextPath }/adm/user/list?serCol=${param.serCol}&serTxt=${param.serTxt}"><img src="<c:url value='/resources/images/btn_icon_list.gif' />" alt="icon" /><span>List</span></a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
