<%@ page contentType="text/html; charset=UTF-8" 
	import = "java.util.List, com.skt.mars.adm.co.Promote" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>

<%
	List<Promote> resultObject = (List<Promote>)request.getAttribute("list");
%>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/resources/css/basc.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/resources/inc/jquery-1.8.3.js' />"></script>
<script src="<c:url value='/resources/inc/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/adm_ui_common.js' />"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(function() {
		  	$("#searchSrtDt").datepicker({
		  		showOn: "button",
			    buttonImage: "../../resources/images/icon_calendar.gif",
			    buttonImageOnly: true 
		  	});
		  	$("#searchEndDt").datepicker({
		  		showOn: "button",
			    buttonImage: "../../resources/images/icon_calendar.gif",
			    buttonImageOnly: true 
		  	});
		 });
		
		$("#submiteBtn").click(function(){
			if($("#searchSrtDt").val() > $("#searchEndDt").val()){
				alert("Search date were incorrect...");
				return;
			}
			
			$("#searchFrm").submit();
			
		});
		
	});
	var snsPopClick = function(id, popId){
		//showLayer(id, popId);
		//alert("substring : " + popId.substring(6,8));
		$('#'+popId).show();	
	};
	
	var showHideLayers = function(popId, ord){
		$('#'+popId).hide();	
	};
	
/* 	function showLayer(target, popId)
	{
		var app = document.getElementById(popId);
		
	    app.style.display = "";
	    app.style.left = getDim(target).x;
	    app.style.top = getDim(target).y;
	    app.style.width = target.offsetWidth;
	    app.style.height = target.offsetHeight;
	}

	function getDim(id)
	{
	    var oTargetElem;
	    if(typeof(id) == "string")
	        oTargetElem = document.getElementById(id);
	    else
	        oTargetElem = id;
	    var oElement = oTargetElem; 
	    var curleft = 0;  
	    var curtop = 0;  

	    if (oElement.offsetParent)   
	    {
	        while (oElement.offsetParent)  
	        {   
	            curleft += ( oElement.offsetLeft - oElement.scrollLeft );  
	            curtop += ( oElement.offsetTop - oElement.scrollTop );   
	            oElement = oElement.offsetParent;   
	        }   
	    } 

	    return {x:curleft, y:curtop}
	}
 */



	function doSubmit(url,actionName,value) {
	    f = document.forms[0];
	    
	    if ("promote/read" == actionName) {
	    	f.method="post";
	    	var arrStr = value.split(':');
	    	var prmtId = arrStr[0];
	    	
	        f.prmtId.value = prmtId;
	        
	    } else if("promote/list" == actionName) {
	    	f.method="post";
	    	
	    } 
	    
	    f.action = url;
	    f.submit();
	}


</script>

<form name="promoteList" id="promoteList">
<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
<input type="hidden" id="prmtId" name="prmtId" value=""/>
<input type="hidden" id="twFlag" name="twFlag" value="B"/>

    <div class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

     <!-- 탭============================================ : str -->
      <div id="tabs">
       <ul>
          <li><a href="${pageContext.request.contextPath }/adm/commerce/list" >Templates</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/guide/list">Guides</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/promote/list" class="hover">PR Posts</a></li>
        </ul>
        <div id="tabs-1">
            <!-- 검색조건 : srt -->
            
            <table class="boardSch" summary="search">
              <colgroup>
                <col width="18%">
                <col width="*">
                <col width="18%">
                <col width="29%">
              </colgroup>
              <!-- form name="searchFrm" id="searchFrm" action="${pageContext.request.contextPath }/promote/list/" method="get"-->
                     <!-- input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" /-->
              <tr>
                <th>Date Range</th>
                <td colspan="3" class="category using">
                  <input type="text" name="searchSrtDt" id="searchSrtDt" value="${param.searchSrtDt}" />
                  ~
                  <input type="text" name="searchEndDt" id="searchEndDt" value="${param.searchEndDt}" />
                </td>
             </tr>
             <tr>
                 <th>SNS Type</th>
                  <td class="type">
                    <select style="height:24px;" name="searchSnsSel">
                      <option value="">All</option>
                      <option value="F" <c:if test="${param.searchSnsSel=='F'}">selected</c:if> >Facebook</option>
                      <option value="B" <c:if test="${param.searchSnsSel=='B'}">selected</c:if> >BlogSpot</option>
                      <option value="T" <c:if test="${param.searchSnsSel=='T'}">selected</c:if> >Twitter</option>
                    </select>
                  </td>
                    <th><select style="height:24px;" name="searchSel">
                      <option value="prod_nm" <c:if test="${param.searchSel=='prod_nm'}">selected</c:if> >Title</option>
                      <option value="prod_titl" <c:if test="${param.searchSel=='prod_titl'}">selected</c:if> >Product</option>
                      <option value="prod_sllr" <c:if test="${param.searchSel=='prod_sllr'}">selected</c:if> >Name</option>
                      <option value="user_id" <c:if test="${param.searchSel=='user_id'}">selected</c:if> >ID</option>
                    </select></th>
                    <td>
                    <p class="sch">
                      <input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" title="검색어 입력">
                      <!-- <button type="button" class="serSubmit" id="submiteBtn"></button> -->
		                <!-- <a href="#" id="submiteBtn">Search</a> -->
		                <button type="button" onclick="javascript:doSubmit('${pageContext.request.contextPath }/adm/promote/list','promote/list');"></button>
                     </p>
                  </td>
              </tr>
               <!--/form-->
            </table>
            
            <!-- 검색조건 : end -->
            <!-- 템플릿 목록 : str -->
            <table class="boardList" summary="Templet list">
               <colgroup>
                <col width="8%" />
                <col width="*" />
                <col width="14%" />
                <col width="14%" />
                <col width="14%" />
                <col width="14%" />
                <col width="14%" />
              </colgroup>
              <thead>
                <tr>
                  <th class="one">No.</th>
                  <th>Title</th>
                  <th>Product</th>
                  <th>Name</th>
                  <th>ID</th>
                  <th>Date</th>
                  <th class="end">SNS</th>
                </tr>
              </thead> 
              <tbody>
              	<c:if test="${list == null || fn:length(list) == 0}">
					<tr>
					 	<td colspan="8">No search result obtained.</td>
					</tr>
				</c:if>
              	<c:forEach var="resultObject" items="${list}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
                <tr>
                  <td class="tdfontColor01"><nav:listNo pageList="${list}" statusIndex="${status.index}" /></td>
                  <td class="alignL"><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/promote/read','promote/read','${resultObject.prmtId}:');">${resultObject.prodNm}</a></td>
                  <td>${resultObject.prodTitl} </td>
                  <td>${resultObject.prodSllr} </td>
                  <td>${resultObject.userId}</td>
                  <td class="time">${resultObject.frstRgstDt}</td>
                  <td class="sns" id="snsPop_${status.index}" onclick="javascript:snsPopClick(this.id, 'popupD_${status.index}')">
                  	<c:if test="${resultObject.fbSnsType == 1}" >
                  		<img src="<c:url value='/resources/images/ico_fb.gif' />" alt="fb type 1" />
                  	</c:if>
                  	<c:if test="${resultObject.bsSnsType == 1}" >
                  		<img src="<c:url value='/resources/images/ico_blg.gif' />" alt="blg type 1" />
                  	</c:if>
                  	<c:if test="${resultObject.twSnsType == 1}" >
                  		<img src="<c:url value='/resources/images/ico_tw.gif' />" alt="tw type 1" />
                  	</c:if>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
            <!-- 게시판 목록 : end -->
        </div>
      </div>
      <!-- 탭=========================================== : end -->
    </div>

    <!-- 버튼 : srt -->
    <ul class="listpageBtn">
    </ul>
    <!-- 버튼 : end -->
	
    <!-- 페이지 넘버 : srt -->
    <div class="pageNum">
        <nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/adm/promote/list','promote/list');" pageList="${list}" />
   </div>
    <!-- 페이지 넘버 : end -->
    
</form>    

<c:forEach var="resultObject2" items="${list}" varStatus="status" begin="${currentPage == 1 ? 0 : currentPage*10 -10 }" end="${currentPage*10 -1 }" step="1">
	
<div style="display:none">		<nav:listNo pageList="${list}" statusIndex="${status.index}" /></div>
	
	
 <div id="popupD_${status.index}" class="detailPopup type2" style="display:none;">
	  <h1><img src="<c:url value='/resources/images/title_pop_snsaddr.gif' />" alt="SNS 상품 등록 주소" /></h1>
	  <div class="innerBox">
	    <ul class="box-type">
	      <c:if test="${resultObject2.fbSnsType == 1}" >
	      <li>
	        <dl class="fb">
	          <input type="hidden" name="snsHsId" id="snsHsId" value="${fn:split(resultObject2.fbSnsInfo,',')[2]}" />
	          <dt><a href="${fn:split(resultObject2.fbSnsInfo,',')[0]}" target="_blank">${fn:split(resultObject2.fbSnsInfo,',')[3]}</a></dt>
	          <dd>Registered at : ${fn:split(resultObject2.fbSnsInfo,',')[1]}</dd>
	        </dl>
	      </li>
	     </c:if>
	     <c:if test="${resultObject2.bsSnsType == 1}" >
	      <li>
	        <dl class="blg">
	          <dt><a href="${fn:split(resultObject2.bsSnsInfo,',')[0]}" target="_blank">${fn:split(resultObject2.bsSnsInfo,',')[3]}</a></dt>
	          <dd>Registered at : ${fn:split(resultObject2.bsSnsInfo,',')[1]}</dd>
	        </dl>
	      </li>
	      </c:if>
	      <c:if test="${resultObject2.twSnsType == 1}" >
	      <li>
	        <dl class="tw">
	          <dt><a href="${fn:split(resultObject2.twSnsInfo,',')[0]}" target="_blank">${fn:split(resultObject2.twSnsInfo,',')[3]}</a></dt>
	          <dd>Registered at : ${fn:split(resultObject2.twSnsInfo,',')[1]}</dd>
	        </dl>
	      </li>
	      </c:if>
	    </ul>
	    <div class="btnCloseTop"><a  onClick="showHideLayers('popupD_${status.index}','','hide')" style="cursor:hand;"><img src="<c:url value='/resources/images/btn_close.gif' />" alt="close"></a></div>
	  </div>
	  <div class="btnClose"><a class="rightBtn" style="cursor:hand;" onClick="showHideLayers('popupD_${status.index}','','hide')"><span class="btnBase iconX">Close</span></a></div>
	</div>
</c:forEach>	