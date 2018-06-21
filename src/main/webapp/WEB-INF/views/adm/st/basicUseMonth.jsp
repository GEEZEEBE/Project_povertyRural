<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" type="both" pattern="yyyy"/>
  

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
      <div id="tabs" class="rentReturn">
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth', 'command', 'post');" class="hover">Usage Statistics</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicPayMonth', 'command', 'post');">Payment Statistics</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicAsset', 'command', 'post');">Asset Statistics</a></li>
        </ul>
        <form id="command">
        
        <div id="tabs-1">
          <!-- 이용통계 : str -->
          <dl class="network">
            <dt>Gender</dt>
            <dd class="dd00">
              <select name="strSex" style="height: 24px;">
	             <option value="">All</option>
	             <option value="M" <c:if test="${requestMap.strSex=='M'}">selected</c:if> >Male</option>
	             <option value="F" <c:if test="${requestMap.strSex=='F'}">selected</c:if> >Female</option>
              </select>
            </dd>
            <dt class="dtleftLine">Age Group</dt>
            <dd>
              <select name="strAge" style="height: 24px;">
	             <option value="">All</option>
	             <option value="0~10" <c:if test="${requestMap.strAge=='0~10'}">selected</c:if> >~10</option>
	             <option value="11~13" <c:if test="${requestMap.strAge=='11~13'}">selected</c:if> >11~13</option>
	             <option value="14~16" <c:if test="${requestMap.strAge=='14~16'}">selected</c:if> >14~16</option>
	             <option value="17~19" <c:if test="${requestMap.strAge=='17~19'}">selected</c:if> >17~19</option>
	             <option value="20~29" <c:if test="${requestMap.strAge=='20~29'}">selected</c:if> >20~29</option>
	             <option value="30~39" <c:if test="${requestMap.strAge=='30~39'}">selected</c:if> >30~39</option>
	             <option value="40~49" <c:if test="${requestMap.strAge=='40~49'}">selected</c:if> >40~49</option>
	             <option value="50~100" <c:if test="${requestMap.strAge=='50~100'}">selected</c:if> >50~</option>
              </select>
              <p class="sch">
                <button type="button" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth', 'command', 'post')"></button>
              </p>
            </dd>
          </dl>
          <section id="tab-container" class="stats">
            <ul>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_month_on.gif' />" alt="월별보기" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseDay', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_day.gif' />" alt="일별보기" /></a></li>
            </ul>
            <section id="tabs2-01">
              <!-- 월별보기 : str -->
              <section class="topLine">
                <div class="statsSchbox">
                  <button type="button" class="statsSch" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth', 'command', 'post')"></button>
                  <select name="strYear" class="Year" style="height: 24px;">
                    <c:forEach var="i" begin="${year-5}" end="${year}">
						<option value="${i}" <c:if test="${requestMap.strYear==i}">selected</c:if> >${i}</option>
					</c:forEach>
                  </select>
                </div>
                <table class="boardSch" summary="Month">
                  <colgroup>
                    <col width="120" />
                    <col width="150" />
                    <col width="150" />
                    <col width="150" />
                    <col width="*" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th>Sort</th>
                      <th>No. of Registered Members</th>
                      <th>PC Usage (by Hour)</th>
                      <th>Number of PC Users</th>
                      <th class="end">User Portal Visitor Count</th>
                    </tr>
                  </thead>
                  <!-- tfoot>
                    <tr class="bottomLine">
                      <th>Total</th>
                      <td>15,000</td>
                      <td>15,000</td>
                      <td>15,000</td>
                      <td class="end alignC">15,000</td>
                    </tr>
                  </tfoot -->
                  <tbody>
                    <c:forEach var="result" items="${list}" varStatus="status">
                    <tr>
                      <th><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseDay&strMonth=<c:choose><c:when test="${result.MONTH_NAME=='Jan'}">01</c:when><c:when test="${result.MONTH_NAME=='Feb'}">02</c:when><c:when test="${result.MONTH_NAME=='Mar'}">03</c:when><c:when test="${result.MONTH_NAME=='Apr'}">04</c:when><c:when test="${result.MONTH_NAME=='May'}">05</c:when><c:when test="${result.MONTH_NAME=='Jun'}">06</c:when><c:when test="${result.MONTH_NAME=='Jul'}">07</c:when><c:when test="${result.MONTH_NAME=='Aug'}">08</c:when><c:when test="${result.MONTH_NAME=='Sep'}">09</c:when><c:when test="${result.MONTH_NAME=='Oct'}">10</c:when><c:when test="${result.MONTH_NAME=='Nov'}">11</c:when><c:when test="${result.MONTH_NAME=='Dec'}">12</c:when></c:choose>', 'command', 'post');">${result.MONTH_NAME}</a></th>
                      <td><c:if test="${result.NEW_CBC==null}">0</c:if><fmt:formatNumber value="${result.NEW_CBC}" type="number"/></td>
                      <td><c:if test="${result.USED_PC==null}">0</c:if><fmt:formatNumber value="${result.USED_PC}" type="number"/></td>
                      <td><c:if test="${result.USED_CNT_PC==null}">0</c:if><fmt:formatNumber value="${result.USED_CNT_PC}" type="number"/></td>
                      <td class="end alignC"><c:if test="${result.USED_USER==null}">0</c:if><fmt:formatNumber value="${result.USED_USER}" type="number"/></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </section>
              <!-- 월별보기 : end -->
            </section>
   
          </section>
          <div class="excelDown">
            <div class="alignCenter">
              <div class="button1 type2">
                <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicUseMonth&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
              </div>
            </div>
          </div>
          <!-- 이용통계 : end -->
        </div>
       
       </form>
      </div>
      <!-- 탭=========================================== : end -->
    </section>

