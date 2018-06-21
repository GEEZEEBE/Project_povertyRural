<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>      

   <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <c:if test="${param.flag=='w'}" >
	      	<h2>Bace Price</h2>  
	      </c:if>
	      <c:if test="${param.flag=='e'}" >
	      	<h2>Bace Price</h2>
	      </c:if>
          <h3>Menu use site operating system</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
		<form name="command" id="command">
			<input type="hidden" name="frstRgstUserID" value="kut0100" />
			<input type="hidden" name="latCrctUserID" value="kut0100" />
	      <c:if test="${param.flag=='w'}" >
	      	<input type="hidden" name="flag" value="w" />  
	      </c:if>
	      <c:if test="${param.flag=='e'}" >
	      	<input type="hidden" name="flag" value="e" />
	      	<input type="hidden" name="costpricID" value="${command.costpricID}" />
	      </c:if>
	
      <!-- 게시판 목록 : str -->
      <section class="itemSection Product">
        <table class="boardView write asset" summary="Product register">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Asset Type</th>
            <td colspan="3">
              <select id="assetTypeCD" name="assetTypeCD" style="height:24px;">
                
              </select>
            </td>
          </tr>
          <tr>
            <th>Name</th>
            <td colspan="3" class="pcname">
           		<c:if test="${param.flag=='w'}" >
              	<input type="text" name="costpricNM" class="require" value="" />
		      	</c:if>
		      	<c:if test="${param.flag=='e'}" >
		      	<input type="text" name="costpricNM" class="require" value="${command.costpricNM}" />
		      	</c:if>
            </td>
          </tr>
          <tr>
            <th>Pricing Unit</th>
            <td colspan="3">
              <select id="costpricType" name="costpricType" style="height:24px;">
                
              </select>
            </td>
          </tr>
          <tr>
            <th>Base Price</th>
            <td colspan="3" class="costPrice">
              <c:if test="${param.flag=='w'}" >
              <input type="text" name="costpric" class="require" value="" />
		      </c:if>
		      <c:if test="${param.flag=='e'}" >
		      <input type="text" name="costpric" class="require" value="${command.costpric}" />
		      </c:if>
              <span>RM</span>
            </td>
          </tr>
          <tr>
            <th>Margin Rate</th>
            <td colspan="3" class="percent">
              
              <c:if test="${param.flag=='w'}" >
              <input type="text" name="prftMrgin" class="require" value="" />
		      </c:if>
		      <c:if test="${param.flag=='e'}" >
		      <input type="text" name="prftMrgin" class="require" value="${command.prftMrgin}" />
		      </c:if>
              <span>%</span>
            </td>
          </tr>
          <!-- 
          <tr>
            <th>Penalty margin rate</th>
            <td colspan="3" class="percent">
              
              <c:if test="${param.flag=='w'}" >
              <input type="text" name="fineMrgin" class="" value="50" onclick="this.value=''" />
		      </c:if>
		      <c:if test="${param.flag=='e'}" >
		      <input type="text" name="fineMrgin" class="" value="${command.fineMrgin}" />
		      </c:if>
              <span>%</span>
            </td>
          </tr>
           -->
          <tr class="bottomLine">
            <th>Late Fee</th>
            <td colspan="3" class="costPrice">
              
              <c:if test="${param.flag=='w'}" >
              <input type="text" name="fine" class="require" value="" />
		      </c:if>
		      <c:if test="${param.flag=='e'}" >
		      <input type="text" name="fine" class="require" value="${command.fine}" />
		      </c:if>
              <span>RM</span>
            </td>
          </tr>
        </table>
      </section>
      
      	</form>
      <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <li>
          <div class="button1 type2 enter">
            <a href="javascript:if(submitCheck()) doSubmit('${pageContext.request.contextPath }/adm/cost/', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Resister</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/cost/list', 'command', 'post');">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
<script>
	fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00600','assetTypeCD','${command.assetTypeCD}','');
	fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00500','costpricType','${command.costpricType}','');
</script>