<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<script>
	fgetSelectTag('${pageContext.request.contextPath}/ws/common/commonCode','00600','strAssetTypeCD','${requestMap.strAssetTypeCD }','');
</script> 	
	<section class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>CBC Basic Statistics</h2>
          <h3>Check the usage, payment, and asset statistics of the basic CBC services here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
      <!-- 탭============================================ : str -->
      <form id="command">
      <div id="tabs" class="rentReturn">
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth', 'command', 'post');">Usage Statistics</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicPayMonth', 'command', 'post');">Payment Statistics</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicAsset', 'command', 'post');" class="hover">Asset Statistics</a></li>
        </ul> 
        <div id="tabs-3">
          <!-- 자산통계 : str -->
          <dl class="network">
            <dt>Asset Type</dt>
            <dd>
              <select id="strAssetTypeCD" name="strAssetTypeCD" style="height: 24px;">
                <option value="">All</option>
              </select>
              <p class="sch">
                <button type="button" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicAsset', 'command', 'post');"></button>
              </p>
            </dd>
          </dl>
          <section class="topLine tabTable">
            <table class="boardSch" summary="Month">
              <colgroup>
                <col width="120" />
                <col width="300" />
                <col width="*" />
              </colgroup>
              <thead>
                <tr>
                  <th>No.</th>
                  <th>Asset Name</th>
                  <th class="end">Serial Number</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="result" items="${list}" varStatus="status">
                <tr>
                  <th>${result.rownum }</th>
                  <td>${result.ITEM_NM}</td>
                  <td class="end alignC">${result.ITEM_05}</td>
                </tr>
                </c:forEach>
                <!-- 
                <tr class="bottomLine">
                  <th>1000</th>
                  <td>PC12</td>
                  <td class="end alignC">sn_kut_pc_0011</td>
                </tr>
                 -->
              </tbody>
            </table>
          </section>
          <div class="excelDown">
            <div class="alignCenter">
              <div class="button1 type2">
                <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicAsset&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
              </div>
            </div>
          </div>
          <!-- 자산통계 : end -->
        </div>
      </div>
      </form>
      <!-- 탭=========================================== : end -->
    </section>