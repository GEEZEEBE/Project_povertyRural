<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  - PROGRAM ID  : insert.jsp
  - AUTHOR      : jsjeon
  - CREATED     : 2013.01.29
  - DESCRIPTION : 상품관리 - 상품 수정 페이지
--%>

<script type="text/javascript">
$(document).ready(function(){
	selectGodsDvsn();
	selectPricType();
	
});
</script>

<script type="text/javascript">
function selectGodsDvsn(){
	var type = $('#godsDvsn').val();
    if("00102" == type || "00101" == type){
        $('input[name=flatRate]').val('');
        $('input[name=flatRate]').attr('disabled','disabled');
        $('input[name=flatRate]').css('background','#e9e9e9');
    } else {
        $('input[name=flatRate]').removeAttr('disabled');
        $('input[name=flatRate]').css('background','#fff');
    }
    
    if("00101" == type){
        $('input[name=depositRate]').removeAttr('disabled');
        $('input[name=depositRate]').css('background','#fff');
        $('input[name=rentDay]').removeAttr('disabled');
        $('input[name=rentDay]').css('background','#fff');
    } else {
        $('input[name=depositRate]').attr('disabled','disabled');
        $('input[name=depositRate]').css('background','#e9e9e9');
        $('input[name=rentDay]').attr('disabled','disabled');
        $('input[name=rentDay]').css('background','#e9e9e9');
    }
}

function selectPricType(){
    var type = $('#pricType').val();
    if("00401" == type){
        $('select[name=pricUnit]').removeAttr('disabled');
    } else {
        $('select[name=pricUnit]').attr('disabled','true');
    }
}

function doSubmit(url,actionName,value) {
    f = document.forms[0];
    f.action = url;
    
    if ("gods" == actionName) {
        var one = $('#categoryOne').val();
        var two = $('#categoryTwo').val();
        var three = $('#categoryThree').val();
        var four = $('#categoryFour').val();
        var node;
        
        if ("Select" != four) {
            node = four;
        } else if ("Select" != three) {
            node = three;
        } else if ("Select" != two) {
            node = two;
        } else if ("Select" != one) {
            node = one;
        } else {
        	alert("select category");
            return;
        }
        
        var arrStr = node.split(':');
        var depth = arrStr[0];  
        depth = Number(depth)+1;
        var lft = arrStr[1];     
        var rgt = arrStr[2];    
        var srvcId = arrStr[3];
        
        f.srvcID.value = srvcId;
        f.method = "post";
        
    } else if("gods/list" == actionName) {
        f.method = "post";
    }
    f.submit();
    
}
</script>

<form id="godsEdit" name="godsEdit">
<input type="hidden" id="currentPage" name="currentPage" value="${param.currentPage }" />

<input type="hidden" name="godsID" value="${GODS.godsID }" />
<input type="hidden" name="srvcID" value="${GODS.srvcID }" />
<input type="hidden" id="method" name="method" value="edit" />
<input type="hidden" name="searchGodsName" value="${param.searchGodsName }" />
<input type="hidden" name="searchGodsDvsn" value="${param.searchGodsDvsn }" />

<input type="hidden" name="categoryOne" value="${param.categoryOne }" />
<input type="hidden" name="categoryTwo" value="${param.categoryTwo }" />
<input type="hidden" name="categoryThree" value="${param.categoryThree }" />

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
        <table class="boardView write" summary="Product register">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr>
          <%-- 
            <th>Service category<em>*</em></th>
            <td colspan="3">
              <select class="seltWeith1" style="height:24px;" id="categoryOne" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryOne','categoryTwo','');">
                <option>selected</option>
                <c:forEach var="category" items="${DEPTH}">
                <option value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM }</option>
                </c:forEach>
              </select>
              <select class="seltWeith2" style="height:24px;" id="categoryTwo" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryTwo','categoryThree','');">
                <option>selected</option>
              </select>
              <select class="seltWeith3" style="height:24px;" id="categoryThree" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryThree','categoryFour','');">
                <option>selected</option>
              </select>
              <select class="seltWeith4" style="height:24px;" id="categoryFour">
                <option>selected</option>
              </select>
            </td>
             --%>
            <th>Service Category</th>
               <td colspan="3" class="category"><select class="seltWeith1" style="height: 24px;"
                   id="categoryOne" name="categoryOne"
                   onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryOne','categoryTwo','');">
                       <option value="Select">Select</option>
                       <c:forEach var="category" items="${DEPTH}">
                           <option
                               <c:if test="${category.NODE_CATEGORY eq check}"> Select </c:if>
                               value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">
                               ${category.SRVC_CTGR_NM}</option>
                       </c:forEach>
               </select> <select class="seltWeith2" style="height: 24px;" id="categoryTwo" name="categoryTwo"
                   onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryTwo','categoryThree','');">
                       <option value="Select">Select</option>
                       <c:forEach var="category" items="${DEPTH1}">
                           <option
                               <c:if test="${category.NODE_CATEGORY eq check1}"> selected </c:if>
                               value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
                               }</option>
                       </c:forEach>
               </select> <select class="seltWeith3" style="height: 24px;" id="categoryThree"
                   name="categoryThree" onChange="selectCategory('${pageContext.request.contextPath}/ws/common/category','categoryThree','categoryFour','');">
                       <option value="Select">Select</option>
                       <c:forEach var="category" items="${DEPTH2}">
                           <option
                               <c:if test="${category.NODE_CATEGORY eq check2}"> selected </c:if>
                               value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
                               }</option>
                       </c:forEach>
               </select><select class="seltWeith4" style="height: 24px;" id="categoryFour"
                   name="categoryFour">
                       <option value="Select">Select</option>
                       <c:forEach var="category" items="${DEPTH3}">
                           <option
                               <c:if test="${category.NODE_CATEGORY eq check3}"> selected </c:if>
                               value="<c:out value='${category.DEPTH }:${category.NODE_LFT }:${category.NODE_RGT }:${category.NODE_CATEGORY }'/>">${category.SRVC_CTGR_NM
                               }</option>
                       </c:forEach>
               </select></td>
          </tr>
          <tr>
            <th>Product<em>*</em></th>
            <td class="name"><input type="text" title="Name" name="godsName" class="require" maxlength="40" value="<c:out value="${GODS.godsName }" />" /></td>
          </tr>
          <tr>
            <th>Product type<em>*</em></th>
            <td>
              <select class="seltWeith5" style="height:24px;" id="godsDvsn" name="godsDvsn" onchange="javascript:selectGodsDvsn();">
                <c:forEach var="godsDvsn" items="${godsDvsn}">
                    <option value="<c:out value ='${godsDvsn.commonCodeID}'/>" <c:if test="${GODS.godsDvsn eq godsDvsn.codeName}"> <c:out value="selected" /></c:if>>${godsDvsn.codeName }</option>
                </c:forEach>
              </select>
            </td>
          </tr>
          <tr>
            <th>Product Status<em>*</em></th>
            <td>
              <select class="seltWeith5" style="height:24px;" name="godsStts">
                <c:forEach var="godsStts" items="${godsStts}">
                <option value="<c:out value ='${godsStts.commonCodeID}'/>" <c:if test="${GODS.godsStts eq godsStts.codeName}"> <c:out value="selected" /></c:if>>${godsStts.codeName }</option>
                </c:forEach>
              </select>
            </td>
          </tr>
          <tr class="bottomLine">
            <th>Description</th>
            <td class="progress"><input type="text" name="description" title="Progress" maxlength="100" value="<c:out value="${GODS.description }" />" /></td>
          </tr>
        </table>
      </section>
      <section class="itemSection Product">
        <table class="boardView write" summary="Product Information">
          <colgroup>
            <col width="20%" />
            <col width="*" />
          </colgroup>
          <tr>
            <th>Payment</th>
            <td>
              <select class="seltWeith6" style="height:24px;" name="payKind">
                <c:forEach var="dpstType" items="${dpstType}">
                <option value="<c:out value ='${dpstType.commonCodeID}'/>" <c:if test="${PRICE.payKind eq dpstType.codeName}"> <c:out value="selected" /></c:if>>${dpstType.codeName }</option>
                </c:forEach>
              </select>
            </td>
          </tr>
          <tr>
            <th>Pricing Method</th>
            <td>
              <select class="seltWeith6" style="height:24px;" id="pricType" name="pricType" onchange="javascript:selectPricType();">
                <c:forEach var="pricType" items="${pricType}">
                <option value="<c:out value ='${pricType.commonCodeID}'/>" <c:if test="${PRICE.pricType eq pricType.codeName}"> <c:out value="selected" /></c:if>>${pricType.codeName }</option>
                </c:forEach>
              </select>
            </td>
          </tr>
          <tr>
            <th>Pricing Unit</th>
            <td>
              <select class="seltWeith6" style="height:24px;" name="pricUnit">
                <c:forEach var="pricUnit" items="${pricUnit}">
                <option value="<c:out value ='${pricUnit.commonCodeID}'/>" <c:if test="${PRICE.pricUnit eq pricUnit.codeName}"> <c:out value="selected" /></c:if>>${pricUnit.codeName }</option>
                </c:forEach>
              </select>
            </td>
          </tr>
          <tr>
            <th>Price</th>
            <td><input type="text" name="flatRate" title="Price" maxlength="9" value="<c:out value="${PRICE.flatRate }" />" /></td>
          </tr>
          <tr>
            <th>Deposit</th>
            <td><input type="text" name="depositRate" title="Price" maxlength="9" value="<c:out value="${PRICE.depositRate }" />" /></td>
          </tr>
          <tr class="bottomLine">
            <th>Rental Period(in Days)</th>
            <td><input type="text" name="rentDay" title="Price" max="5" value="<c:out value="${PRICE.rentDay }" />" /></td>
          </tr>
        </table>
      </section>
     <!-- 게시판 목록 : end -->
    </div>

    <!-- 버튼그룹 : srt -->
    <div class="btnGroup">
      <ul>
        <li>
        <div class="button1 type2 save">
          <a href="javascript:if(submitCheck()) doSubmit('${pageContext.request.contextPath }/adm/gods/','gods');"><img src="<c:url value='/resources/images/btn_icon_enter.gif'/>" alt="icon" /><span>Save</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/gods/read','gods/read');">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->
</form>
