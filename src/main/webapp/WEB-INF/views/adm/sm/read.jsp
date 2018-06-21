<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
  - PROGRAM ID  : read.jsp
  - AUTHOR      : jsjeon
  - CREATED     : 2013.01.22
  - DESCRIPTION : 아이템관리>아이템 상세정보 페이지
--%>

<script type="text/javascript">
function doSubmit(url,actionName,value) {
    f = document.forms[0];
    f.action = url;
    
    if("item/list" == actionName) 
    {
        f.method = "post";
        
    }else if("item/delete" == actionName) {
       
        var check = confirm("Are you sure you want to delete?");
        if(check){
            f.method="post";
        }else{
            return;
        }

    }else if("item/edit" == actionName) {
        f.method="post";
    }
    
    f.submit();
}
</script>


<form>
    <input type="hidden" id="currentPage" name="currentPage" value="${currentPage }" />
    <input type="hidden" name="selectCheck" value="" />
    <input type="hidden" name="selectCheck" value="${ITEM.ITEM_ID }" />
    <input type="hidden" name="itemID" value="${ITEM.ITEM_ID }" />
    <input type="hidden" name="srvcID" value="${param.srvcID }" />
    <input type="hidden" name="godsID" value="${ITEM.GODS_ID }" />
    <input type="hidden" name="assetID" value="${ITEM.ASSET_ID }" />
    
    <%-- <input type="hidden" name="requestMap" value="${param.requestMap}"> --%>
    
    <input type="hidden" name="categoryOne" value="${param.categoryOne }" />
    <input type="hidden" name="categoryTwo" value="${param.categoryTwo }" />
    <input type="hidden" name="categoryThree" value="${param.categoryThree }" />
    
    <input type="hidden" name="searchAssetType" value="${param.searchAssetType }" />
    <input type="hidden" name="searchGodsDvsn" value="${param.searchGodsDvsn }" />
    <input type="hidden" name="searchAssetName" value="${param.searchAssetName }" />
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Item Management</h2>
		  <h3>Map data registered as assets with roducts and services</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 게시판 목록 : str -->
      <section class="itemSection mb18">
        <h4>Item Information</h4>
        <table class="boardView item" summary="Item Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
            <col width="18%" />
            <col width="25%" />
          </colgroup>
          <tr>
            <th>Date</th>
            <td><c:out value="${ITEM.FRST_RGST_DT }" /></td>
            <th>Registered by</th>
            <td><c:out value="${ITEM.FRST_RGST_USER_ID }" /></td>
          </tr>
          <tr>
            <th>Item</th>
            <td colspan="3"><c:out value="${ITEM.CNTS_NAME }" /></td>
          </tr>
          <tr>
            <th>Asset Type</th>
            <td colspan="3"><c:out value="${ITEM.ASSET_TYPE_NAME }" /></td>
          </tr>
          <tr>
            <th>Price</th>
            <td colspan="3"><c:out value="${ITEM.FLAT_RATE }" /> RM</td>
          </tr>
        </table>
      </section>
      <section>
        <h4>Product Information</h4>
        <table class="boardView" summary="Product Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Service Category</th>
            <td>
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
            <td><c:out value="${ITEM.GODS_NAME }" /></td>
          </tr>
          <tr>
            <th>Product Type</th>
            <td><c:out value="${ITEM.GODS_TYPE_NAME }" /></td>
          </tr>
          <tr>
            <th>Product Description</th>
            <td><c:out value="${ITEM.DESCRIPTION }" /></td>
          </tr>
        </table>
      </section>
     <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/edit','item/edit');">Edit</a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/delete','item/delete');">Delete</a>
          </div>
        </li>
        <li class="type2 list">
          <div class="button1 type2 list">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/item/list','item/list');"><img src="<c:url value='/resources/images/btn_icon_list.gif'/>" alt="icon" /><span>List</span></a>
          </div>
        </li>
      </ul>
    </div>
</form>