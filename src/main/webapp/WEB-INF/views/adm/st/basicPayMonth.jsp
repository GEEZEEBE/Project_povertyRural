<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
	
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
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicPayMonth', 'command', 'post');" class="hover">Payment Statistics</a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicAsset', 'command', 'post');">Asset Statistics</a></li>
        </ul>
        <div id="tabs-2">
          <!-- 수납통계 : str -->
          <dl class="network paymentSta">
          </dl>
          <img class="MON" src="<c:url value='/resources/images/btn_month_on.gif' />" alt="월별보기" />
          <section class="topLine tabTable">
            <table class="boardSch" summary="Month">
              <colgroup>
                <col width="120" />
                <col width="300" />
                <col width="*" />
              </colgroup>
              <thead>
                <tr>
                  <th>Sort</th>
                  <th>Amount Received</th>
                  <th class="end">Amount Returned</th>
                </tr>
              </thead>
              
              <!-- tfoot>
                <tr class="bottomLine">
                  <th>합계</th>
                  <td class="price">10,000</td>
                  <td class="end price">10,000</td>
                </tr>
              </tfoot -->
              <tbody>
                <c:forEach var="result" items="${list}" varStatus="status">
                <tr>
                  <th><c:if test="${result.MONTH_NAME==null}">0</c:if>${result.MONTH_NAME}</th>
                  <td class="price"><c:if test="${result.PAY_AMT==null}">0</c:if><fmt:formatNumber value="${result.PAY_AMT}" type="number"/></td>
                  <td class="end price"><c:if test="${result.REFUND_AMT==null}">0</c:if><fmt:formatNumber value="${result.REFUND_AMT}" type="number"/></td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
            <p class="unit">(unit: RM)</p>
          </section>
          <div class="excelDown unit">
            <div class="alignCenter">
              <div class="button1 type2">
                <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=basicPayMonth&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
              </div>
            </div>
          </div>
          <!-- 수납통계 : end -->
        </div>

      </div>
      </form>
      <!-- 탭=========================================== : end -->
    </section>