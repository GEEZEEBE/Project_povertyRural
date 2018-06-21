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
<section class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Learning Statistics</h2>
          <h3>Check the usage statistics of the overall Learning Services here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
      <!-- 탭============================================ : str -->
      <div id="tabs">
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=learnMonth', 'command', 'post');" class="hover">Total</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=smartMonth', 'command', 'post');">Smart Class</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=engVillageMonth', 'command', 'post');">English Village</a></li>       
        </ul>
        <section id="tabs-1">
          <!-- Learning공통 : str -->
          <dl class="network learning">
            <dt>Gender</dt>
            <dd class="dd01">
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
                <button type="button" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=learnDay', 'command', 'post');"></button>
              </p>
            </dd>
          </dl>
          <section id="tab-container" class="stats">
            <ul>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=learnMonth', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_month.gif' />" alt="월별보기" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=learnDay', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_day_on.gif' />" alt="일별보기" /></a></li>
            </ul>
            <section id="tabs2-02">
              <!-- 일별보기 : str -->
              <section class="topLine">
                <div class="statsSchbox">
                  <button type="button" class="statsSch" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=learnDay', 'command', 'post');"></button>
                  <select name="strMonth" class="Month" style="height: 24px;">
	                <c:forTokens var="i" items="01,02,03,04,05,06,07,08,09,10,11,12" delims=",">
		              <option value="${i}" <c:if test="${requestMap.strMonth==i}">selected</c:if> >${i}</option>
		            </c:forTokens>
                  </select>
                  <select name="strYear" class="Year2" style="height: 24px;">                  
					<c:forEach var="i" begin="${year-5}" end="${year+5}">
						<option value="${i}" <c:if test="${requestMap.strYear==i}">selected</c:if> >${i}</option>
					</c:forEach>
                  </select>
                </div>
                <table class="boardSch" summary="search">
                  <colgroup>
                    <col width="120" />
                    <col width="230" />
                    <col width="180" />
                    <col width="*" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th>Sort</th>
                      <th>No. of Registered Members</th>
                      <th>VOD Views</th>
                      <th class="end">e-Book Views</th>
                    </tr>
                  </thead>
                  <tbody>
                 <c:forEach var="result" items="${list}" varStatus="status">
                  <tr>
                    <th>${fn:substring(result.END_DAILY,4,6)}/${fn:substring(result.END_DAILY,6,8)}<em>(${fn:substring(result.DAYNAME,0,3)})</em></th>
                    <td><c:if test="${result.basic==null}">0</c:if><fmt:formatNumber value="${result.basic}" type="number"/></td>                  
                    <td><c:if test="${result.VOD==null}">0</c:if><fmt:formatNumber value="${result.VOD}" type="number"/></td>
                    <td class="end alignC"><c:if test="${result.eBook==null}">0</c:if><fmt:formatNumber value="${result.eBook}" type="number"/></td>
                  </tr>
                 </c:forEach>
                 <!-- 
                    <tr class="bottomLine">
                      <th>2/28<em>(Sat)</em></th>
                      <td>1,000</td>
                      <td>1,000</td>
                      <td class="end alignC">1,000</td>
                    </tr>
                  -->   
                  </tbody>
                </table>
              </section>
              <!-- 일별보기 : end -->
            </section>
           
          </section>
          <div class="excelDown">
            <div class="alignCenter">
              <div class="button1 type2">
                <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=learnDay&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
              </div>
            </div>
          </div>
          <!-- Learning공통 : end -->
        </section>
       
      </div>
      <!-- 탭=========================================== : end -->
    </section>
</form>