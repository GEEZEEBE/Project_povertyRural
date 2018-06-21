<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
    
    function doSubmit(url,actionName,value) {
        f = document.forms[0];
        if ("list" == actionName) {
            f.method="post";
            $('input[name=srvcID]').val(value);
        } else if ("read" == actionName) {
        	f.method="post";
        	$('input[name=itemID]').val(value);
        } else if ("prePage" == actionName) {
        	f.method="post";
        	var cPage = $('input[name=currentPage]').val();
        	var page = Number(cPage);
        	if(page == 1){
        		$('input[name=currentPage]').val(page);
        	}else{
        		$('input[name=currentPage]').val(page-1);	
        	}
        } else if ("nextPage" == actionName) {
        	f.method="post";
            var cPage = $('input[name=currentPage]').val();
            var endPage = parseInt(Number($('input[name=endPage]').val()));            
            var page = Number(cPage);
            if(endPage == cPage){
            	$('input[name=currentPage]').val(page);	
            }else{
                $('input[name=currentPage]').val(page+1);
            }
        }
        f.action = url;
        f.submit();
    }
    
</script>
<form>
 <input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
 <input type="hidden" id="endPage" name="endPage" value="<c:out value="${fn:length(malayList) div 8 + 1}" />" />
 <input type="hidden" name="srvcID" value="${srvcID }" />  
 <input type="hidden" name="userID" value="${userID }" />  
 <input type="hidden" name="itemID" value="" />  
 <input type="hidden" name="pageName" value="/usr/englishVillage/list" />
 <input type="hidden" name="lang" value="${lang }" />
 <input type="hidden" name="langType" value="${langType }" />
 <div class="engCont">
      <h2 class="engListH">VOD</h2>
      <div class="vodListCont">
        <div class="vodListBox01">
          <ul>
          
          <c:if test="${malayList == null || fn:length(malayList) == 0}">
		  <ul>
            <li class="noPost"><spring:message code="learningse.p_3" text=""/></li>
          </ul>
		  </c:if>
          
          <c:forEach var="malay" items="${malayList}" varStatus="status"
                        begin="${currentPage == null || currentPage == 1 ? 0 : currentPage*8 -8 }"
                        end="${currentPage == null ? 0 : currentPage*8 -1 }" step="1">
            <c:choose>
            <c:when test="${status.index mod 4 eq 3 }">
                <li>
                <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/read','read','${malay.ITEM_ID }')" class="noMr">
                <span class="imgBox"></span>
                <c:choose>
			    <c:when test="${malay.PHYSICAL_FILE_NAME eq null}">
			    <img src="<c:url value='/resources/usr/images/learning/noimg04.gif' />" alt="">
			    </c:when>
			    <c:otherwise>
			    <img src="${pageContext.request.contextPath }/learning/getImagePath?logFname=${malay.LOGICAL_FILE_NAME}&phyFname=${malay.PHYSICAL_FILE_NAME}" alt="">
			    </c:otherwise>
			    </c:choose>
                <span class="txtBox"><c:if test="${langType eq '00033' }"><c:out value="${malay.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"><c:out value="${malay.ITEM_03 }" /></c:if></span>
                </a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/read','read','${malay.ITEM_ID }')">
                <span class="imgBox"></span>
                <c:choose>
                <c:when test="${malay.PHYSICAL_FILE_NAME eq null}">
                <img src="<c:url value='/resources/usr/images/learning/noimg04.gif' />" alt="">
                </c:when>
                <c:otherwise>
                <img src="${pageContext.request.contextPath }/learning/getImagePath?logFname=${malay.LOGICAL_FILE_NAME}&phyFname=${malay.PHYSICAL_FILE_NAME}" alt="">
                </c:otherwise>
                </c:choose>
                <span class="txtBox"><c:if test="${langType eq '00033' }"><c:out value="${malay.ITEM_02 }" /></c:if><c:if test="${langType eq '00034' }"><c:out value="${malay.ITEM_03 }" /></c:if></span>
                </a>
                </li>
            </c:otherwise>
            </c:choose>
          </c:forEach>
          </ul>
        </div>
        <div class="vodPrev"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/list','prePage','${srvcID }')">prev</a></div>
        <div class="vodNext"><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/englishVillage/list','nextPage','${srvcID }')">next</a></div>
        
        <!--페이지 최대 갯수는 5개-->
        <div class="boardListPage">
                <nav:pageNavi doSubmit="doSubmit('${pageContext.request.contextPath }/usr/englishVillage/list','list','${srvcID }');" pageList="${malayList}" tabSize="5" sortOf="smart" />
        </div>
      </div>
    </div>
</form>
