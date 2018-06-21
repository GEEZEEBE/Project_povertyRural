<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>


<script type="text/javascript"
	src="<c:url value='/resources/usr/js/freeCommon.js' />"></script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" type="both" pattern="yyyy" />

<section class="board">
	<!-- 제목 : str -->
	<div class="subtitle">
		<hgroup>
			<h2>Administrator Access Status</h2>
			<h3>Check administrators' access records here</h3>
		</hgroup>
	</div>
	<!-- 제목 : end -->
	<form id="command">
		<!-- 탭============================================ : str -->
		<section id="tab-container" class="stats">
			<ul>
				<li><a
					href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=operatorMonth', 'command', 'post');"
					class="tab"><img
						src="<c:url value='/resources/images/btn_month_on.gif' />" alt="" /></a></li>
				<li><a
					href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=operatorDay', 'command', 'post');"
					class="tab"><img
						src="<c:url value='/resources/images/btn_day.gif' />" alt="" /></a></li>
			</ul>
			<section id="tabs-1" class="topLine">
				<!-- Month : srt -->
				<div class="statsSchbox">
					<button type="button" class="statsSch"
						onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=operatorMonth', 'command', 'post')"></button>
					<select name="strYear" class="Year2" style="height: 24px;">
						<c:forEach var="i" begin="${year-5}" end="${year}">
							<option value="${i}"
								<c:if test="${requestMap.strYear==i}">selected</c:if>>${i}</option>
						</c:forEach>
					</select>
				</div>

				<div class="scrollX">
					<table class="boardSch scrollX" summary="Month" width="${(fn:length(list1)*115)+136}">
						<colgroup>
							<col width="136" />
							<c:forEach var="result" items="${list1}" varStatus="status">
								<col width="115" />
							</c:forEach>
						</colgroup>
						<thead>
							<tr>
								<th>Sort</th>
								<c:forEach var="result" items="${list1}" varStatus="status">
									<th><c:if test="${result.NAME==null}">0</c:if>${result.NAME}</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody>
							<% 
								HashMap orderbyMap = new HashMap();
								List list = (List)request.getAttribute("list");
								
									for(int i=0; i<list.size();i++){
										
										Map addr = (HashMap)list.get(i);
										Set set = addr.keySet();
										Object[] hmKeys = set.toArray();
										Arrays.sort(hmKeys,
												 new Comparator<Object>() {
											        public int compare(Object s1, Object s2) {
											            String ss1 = (String)s1;
											            String ss2 = (String)s2;
											            return (-1) * ss2.compareTo(ss1);
											        }
									    		}
												
												);
										
								%>
								
								<tr>
									<th><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=operatorDay&strMonth=
									<%if(addr.get("MONTH_NAME").toString().equals("Jan")){%>01<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Feb")){%>02<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Mar")){%>03<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Apr")){%>04<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("May")){%>05<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Jun")){%>06<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Jul")){%>07<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Aug")){%>08<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Sep")){%>09<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Oct")){%>10<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Nov")){%>11<%}%>
									<%if(addr.get("MONTH_NAME").toString().equals("Dec")){%>12<%}%>
									', 'command', 'post');"><%=addr.get("MONTH_NAME") %></a></th>
								<%		
										for(int j = 0; j < hmKeys.length; j++)
									    {
									        String key = (String)hmKeys[j];
									    if(!key.equals("MONTHLY") && !key.equals("MONTH_NAME")){
									    	DecimalFormat df = new DecimalFormat("#,###");
								%>
									<td><%=addr.get(key)!=null?df.format(addr.get(key)):"0" %><!-- %=key % --></td>
								
								<%		}	   
									} %>
									</tr>
								<%}%>
							
						</tbody>
						<!-- tfoot>
		                <tr class="bottomLine">
		                  <th>합계</th>
		                  <td>1,000</td>
		                  <td>1,000</td>
		                  <td>1,000</td>
		                  <td>1,000</td>
		                  <td>1,000</td>
		                  <td>1,000</td>
		                  <td class="end alignC">1,000</td>
		                </tr>
		              </tfoot -->
						<tbody>

						</tbody>
					</table>
				</div>

				<div class="excelDown">
					<div class="alignCenter">
						<div class="button1 type2">
							<a
								href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=operatorMonth&downExcel=Y', 'command', 'post');"><img
								src="<c:url value='/resources/images/btn_icon_excel.gif' />"
								alt="icon" /><span>Download Excel</span></a>
						</div>
					</div>
				</div>
				<!-- Month : end -->
			</section>

		</section>
		<!-- 탭=========================================== : end -->
	</form>
</section>