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
          <h2>Commerce Statistics</h2>
          <h3>Menu use site operating system</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
      <!-- 탭============================================ : str -->
      <section id="tabs-1">
      <form id="command">
        <!-- Commerce통계 : str -->
        <dl class="network commerce">
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
	             <option value="10">~10</option>
	             <option value="10">11~13</option>
	             <option value="10">14~16</option>
	             <option value="10">17~19</option>
	             <option value="10">20~29</option>
	             <option value="10">30~39</option>
	             <option value="10">40~49</option>
	             <option value="10">50~</option>
            </select>
            <p class="sch">
              <button type="button" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/coList?url=commerceMonth', 'command', 'post')"></button>
            </p>
          </dd>
        </dl>
        <section id="tab-container" class="stats">
          <ul>
            <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/coList?url=commerceMonth', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_month_on.gif' />" alt="월별보기" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/coList?url=commerceDay', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_day.gif' />" alt="일별보기" /></a></li>
          </ul>
          <section id="tabs2-01">
            <!-- 월별보기 : str -->
            <section class="topLine">
              <div class="statsSchbox">
                <button type="button" class="statsSch" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/coList?url=commerceMonth', 'command', 'post')"></button>
                <select name="strYear" class="Year" style="height: 24px;">
                  <c:forEach var="i" begin="${year-5}" end="${year}">
					<option value="${i}" <c:if test="${requestMap.strYear==i}">selected</c:if> >${i}</option>
				  </c:forEach>
                </select>
              </div>
              <table class="boardSch" summary="Month">
                <colgroup>
                  <col width="70" />
                  <col width="80" />
                  <col width="80" />
                  <col width="80" />
                  <col width="75" />
                  <col width="75" />
                  <col width="63" />
                  <col width="63" />
                  <col width="63" />
                  <col width="*" />
                </colgroup>
                <thead>
                  <tr>
                    <th rowspan="3">Sort</th>
                    <th colspan="3">SNS Promotions</th>
                    <th colspan="2">Number of Prints</th>
                    <th colspan="4" class="end">Number of Prints</th>
                  </tr>
                  <tr>
                    <th rowspan="2">Facebook</th>
                    <th rowspan="2">Blogspot</th>
                    <th rowspan="2">Twitter</th>
                    <th rowspan="2">Labels</th>
                    <th rowspan="2">Brochures</th>
                    <th colspan="2">Labels</th>
                    <th colspan="2" class="end">Brochures</th>
                  </tr>
                  <tr>
                    <th>Color</th>
                    <th>B&W</th>
                    <th>Color</th>
                    <th class="end">B&W</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="result" items="${list}" varStatus="status">
                  <tr>
                    <th><a href="#"><c:if test="${result.MONTH_NAME==null}">0</c:if>${result.MONTH_NAME}</a></th>
                    <td><a href="#"><c:if test="${result.FACEBOOK==null}">0</c:if>${result.FACEBOOK}</a></td>
                    <td><a href="#"><c:if test="${result.BLOGSPOT==null}">0</c:if>${result.BLOGSPOT}</a></td>
                    <td><a href="#"><c:if test="${result.TWITTER==null}">0</c:if>${result.TWITTER}</a></td>
                    <td><a href="#"><c:if test="${result.LABEL==null}">0</c:if>${result.LABEL}</a></td>
                    <td><a href="#"><c:if test="${result.BROCHURE==null}">0</c:if>${result.BROCHURE}</a></td>
                    <td><a href="#"><c:if test="${result.LABEL_COLOR==null}">0</c:if>${result.LABEL_COLOR}</a></td>
                    <td><a href="#"><c:if test="${result.LABEL_BW==null}">0</c:if>${result.LABEL_BW}</a></td>
                    <td><a href="#"><c:if test="${result.BROCHURE_COLOR==null}">0</c:if>${result.BROCHURE_COLOR}</a></td>
                    <td class="end alignC"><a href="#"><c:if test="${result.BROCHURE_BW==null}">0</c:if>${result.BROCHURE_BW}</a></td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </section>
            <!-- 일별보기 : end -->
          </section>
          
        </section>
        <div class="excelDown">
          <div class="alignCenter">
              <div class="button1 type2">                
                <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/coList?url=commerceMonth&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
              </div>
            </div>
        </div>
        <!-- Commerce통계 : end -->
      </section>
      <!-- 탭=========================================== : end -->
    </section>

