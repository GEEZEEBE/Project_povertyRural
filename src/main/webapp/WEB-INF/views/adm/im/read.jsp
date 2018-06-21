<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
  - PROGRAM ID  : read.jsp
  - AUTHOR      : jsjeon
  - CREATED     : 2013.01.29
  - DESCRIPTION : 상품관리 - 상품 상세정보 페이지
--%>

<script type="text/javascript">
function doSubmit(url,actionName,value) {
    f = document.forms[0];
    f.action = url;
    
    if("gods/list" == actionName) 
    {
        f.method = "post";
        
    }else if("gods/delete" == actionName) {
       
        var check = confirm("Are you sure you want to delete?");
        if(check){
            f.method="post";
        }else{
            return;
        }

    }else if("gods/edit" == actionName) {
    	f.method="post";
    }
    
    f.submit();
}
</script>

<form name="godsRead" id="godsRead">
    <input type="hidden" id="currentPage" name="currentPage" value="${param.currentPage }" />
    <input type="hidden" name="selectCheck" value="" />
    <input type="hidden" name="selectCheck" value="${GODS.godsID }" />
    <input type="hidden" name="godsID" value="${GODS.godsID }" />
    <input type="hidden" name="srvcID" value="${GODS.srvcID }" />
    
    <input type="hidden" name="categoryOne" value="${param.categoryOne }" />
    <input type="hidden" name="categoryTwo" value="${param.categoryTwo }" />
    <input type="hidden" name="categoryThree" value="${param.categoryThree }" />
    
    <input type="hidden" name="searchGodsName" value="${param.searchGodsName }" />
    <input type="hidden" name="searchGodsDvsn" value="${param.searchGodsDvsn }" />

    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Product Management</h2>
          <h3>Register and manage product here.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <section class="itemSection Product">
        <table class="boardView" summary="Item Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
            <col width="18%" />
            <col width="25%" />
          </colgroup>
          <tr>
            <th>Date</th>
            <td><c:out value="${GODS.frstRgstDT }" /></td>
            <th>Registered by</th>
            <td><c:out value="${GODS.frstRgstUserID }" /></td>
          </tr>
          <tr>
            <th>Service Category</th>
            <!-- <td colspan="3">Learning > Smart Class > UPSR > 수학</td> -->
            <td colspan="3">
            <c:forEach var="category" items="${CATEGORY}" varStatus="status">
                <c:choose>
                    <c:when test="${status.index+1 != fn:length(CATEGORY)}">
                    <c:out value="${category.SRVC_CTGR_NM}" /> >
                    </c:when>
                    <c:otherwise>
                    <c:out value="${category.SRVC_CTGR_NM}" />
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            </td>
          </tr>
          <tr>
            <th>Product</th>
            <td colspan="3"><c:out value="${GODS.godsName }" /></td>
          </tr>
          <tr>
            <th>Product Type</th>
            <td colspan="3"><c:out value="${GODS.godsDvsn }" /></td>
          </tr>
          <tr class="bottomLine">
            <th>Product Status</th>
            <td colspan="3"><c:out value="${GODS.godsStts }" /></td>
          </tr>
        </table>
      </section>
      <section>
        <table class="boardView item" summary="Product Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Payment</th>
            <td><c:out value="${PRICE.payKind }" /></td>
          </tr>
          <tr>
            <th>Pricing Method</th>
            <td><c:out value="${PRICE.pricType }" /></td>
          </tr>
          <tr>
            <th>Pricing Unit</th>
            <td><c:out value="${PRICE.pricUnit }" /></td>
          </tr>
          <tr>
            <th>Price</th>
            <td><c:if test="${PRICE.flatRate eq null }" > - </c:if><c:out value="${PRICE.flatRate }" /></td>
          </tr>
          <tr>
            <th>Deposit</th>
            <td><c:if test="${PRICE.depositRate eq null }" > - </c:if><c:out value="${PRICE.depositRate }" /></td>
          </tr>
          <tr class="bottomLine">
            <th>Rental Period(in Days)</th>
            <td><c:if test="${PRICE.rentDay eq null }" > - </c:if><c:out value="${PRICE.rentDay }" /></td>
          </tr>
        </table>
      </section>
     <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <c:if test="${GODS.delYN ne 'D' }">
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/edit','gods/edit');">Edit</a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/delete','gods/delete');">Delete</a>
          </div>
        </li>
        </c:if>
        <li class="type2 list">
          <div class="button1 type2 list">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/list','gods/list');"><img src="<c:url value='/resources/images/btn_icon_list.gif'/>" alt="icon" /><span>List</span></a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
</form>