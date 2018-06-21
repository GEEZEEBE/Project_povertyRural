<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<script type="text/javascript">
  /* $(function() {
    $( "#tabs" ).tabs();
  }); */
  
  function del(url){
	  var form = document.delForm;
	  var con = confirm("Are you sure you want to delete?");
	  if(con){
		  form.action=url;
		  form.submit();
	  }else{
		  return;
	  }
  }
  //$("a#defaultSetting").attr('href', '/abc/commerce/defaultSetting/');
</script>
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

       <!-- 탭============================================ : str -->
      <!--div id="tabs"-->
        <!-- <ul>
          <li><a href="#tabs-1">Templet</a></li>
          <li><a href="#tabs-2">Guide</a></li>
          <li><a href="#tabs-3">PR Post</a></li>
        </ul> -->
        <!-- div id="tabs-1"-->
          <!-- 게시판 목록 : str -->
          <section class="itemSection">
            <table class="boardView item" summary="Templete Information">
              <colgroup>
                <col width="18%" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>Title</th>
                <td>${command.tempTitl}</td>
              </tr>
              <tr>
                <th>Type</th>
                <td>
                	<c:choose>
                	  <c:when test='${command.tempType=="P"}'>Promotional</c:when>
				      <c:when test='${command.tempType=="L"}'>Label</c:when>
				      <c:when test='${command.tempType=="B"}'>Brochure</c:when>
				      <c:otherwise>기타</c:otherwise>
				     </c:choose>
                </td>
              </tr>
              <tr>
                <td colspan="2" class="itemInfo">
                  <div class="templete">
                   <c:if test="${command.tempLang=='E'}">
                    <img src="${pageContext.request.contextPath}/resources/storage/commerce/template/eng/${command.tempImg}" alt="${command.tempImg}" />
                    </c:if>
                     <c:if test="${command.tempLang=='M'}">
                    <img src="${pageContext.request.contextPath}/resources/storage/commerce/template/mal/${command.tempImg}" alt="${command.tempImg}" />
                    </c:if>
                  </div>
                  <p><br/>
                    <span><b>Image</b></span> <b>:</b> ${command.tempImg} <br/>
                    <span><b>HTML</b></span> <b>:</b> ${command.tempHtml}<br/>
                    <c:if test="${command.tempType=='P' || command.tempType=='B'}">
	                    <span><b>Text Number</b></span> <b>:</b> ${command.textCnt}<br/>
	                    <span><b>Photo Number</b></span> <b>:</b> ${command.imgCnt} <br/>
	                    <span><b>Image Size 1 (width,height)</b></span> <b>:</b> ${command.img1WidtHeig}<br/>
	                    <c:if test="${command.imgCnt=='2' || command.imgCnt=='3'}">
	                    <span><b>Image Size 2 (width,height)</b></span> <b>:</b> ${command.img2WidtHeig}<br/>
	                    </c:if>
	                    <c:if test="${command.imgCnt=='3'}">
	                    <span><b>Image Size 3 (width,height)</b></span> <b>:</b> ${command.img3WidtHeig}<br/>
	                    </c:if>
                    </c:if>
                  </p>               
                </td>
              </tr>
              <tr>
                <th>Default</th>
                <td colspan="2">${command.dfltYn}</td>
                <!-- td class="rButton"><a href="${pageContext.request.contextPath }/commerce/defaultSetting/?tempId=${command.tempId}&tempType=${command.tempType}&searchSel=${param.searchSel}"><img src="../../resources/images/btn_defaultSetting.gif" alt="default setting" /></a></td-->
              </tr>
            </table>
            
          </section>
         <!-- 게시판 목록 : end -->
        <!-- /div-->
      <!--/div-->
      <!-- 탭=========================================== : end -->
    </div>

	<!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li>
          <div class="button1">
            <a href="${pageContext.request.contextPath }/adm/commerce/edit?tempId=${command.tempId}&searchSel=${param.searchSel}">Edit</a>
          </div>
        </li>
        <c:if test="${command.dfltYn=='N'}">
        <li>
          <div class="button1">
          <form name="delForm" method="post">
          	<input type="hidden" name="searchSel" value="${param.searchSel }" />
          	<input type="hidden" name="delChk" value="${command.tempId }" />
          </form>
            <a href="javascript:del('${pageContext.request.contextPath }/adm/commerce/delete');">Delete</a>
          </div>
        </li>
        </c:if>
        <li class="type2 list">
          <div class="button1 type2 list">
		    <a href="${pageContext.request.contextPath}/adm/commerce/list?searchSel=${param.searchSel}"><img src="<c:url value='/resources/images/btn_icon_list.gif'/>" alt="icon" /><span>List</span></a>
		  </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->