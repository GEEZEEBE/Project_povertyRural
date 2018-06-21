<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript" src="<c:url value="/resources/usr/js/all.js" />"></script>

<script type="text/javascript">
$(document).ready(function(){
    var pay = 0;
    $(".pay").each(function(i){
        pay = pay + Number($(this).text());
    });
    
    pay = pay.toString().replace(/(\d)(?=(?:\d{3})+$)/g,'$1,');
    
    $('.totalPay').append(pay);
});


function moveMonth(url,flag){
    f = document.forms[0];
    
    var month = "";
    var year = "";
    var cMonth = $('input[name=month]').val();
    var cYear = $('input[name=year]').val();
    
    if("prev"==flag){
        if("01" == cMonth){
            month = "12";
            year = cYear - 1; 
        }else{
            month = cMonth - 1;
            year = cYear;
        }
    }else if("next"==flag){
        if("12" == cMonth){
            month = "1";
            year = Number(cYear) + 1; 
        }else{
            month = Number(cMonth) + 1;
            year = cYear;
        }
    }
    $('input[name=year]').val(year);
    $('input[name=month]').val(month);
    
    f.method="post";
    f.action = url;
    f.submit();
}

</script>


<form>
<!--popup basic start-->
<div id="popupD" class="detailPopup typeB" style="visibility:hidden;">
  <h1><spring:message code="mybasic.title"/></h1>
  <div class="innerBox innerTypeB">
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mypageuse_pc"/>" alt="PC"></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Basic detail
        </caption>
        <colgroup>
          <col style="width:180px">
          <col style="width:145px">
          <col style="width:150px">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mybasic.date"/></th>
          <th scope="col"><spring:message code="mybasic.duration"/></th>
          <th scope="col"><spring:message code="mybasic.st"/></th>
          <th scope="col"><spring:message code="mybasic.et"/></th>
        </tr>
        <c:choose>
        <c:when test="${fn:length(usedPCList) eq 0 }">
        <tr>
          <td colspan="4"> <spring:message code="mybasic.not"/> </td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="usedPC" items="${usedPCList}">
        <tr>
          <td><c:out value="${usedPC.useDate }" /></td>
          <td><c:out value="${usedPC.use_time }" /></td>
          <td><c:out value="${usedPC.startTm }" /></td>
          <td><c:out value="${usedPC.endTm }" /></td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      </table>
    </section>
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mypageuse_tablet"/>" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Basic detail
        </caption>
        <colgroup>
          <col style="width:180px">
          <col style="width:230px">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mybasic.tablet"/></th>
          <th scope="col"><spring:message code="mybasic.rental"/></th>
          <th scope="col"><spring:message code="mybasic.return"/></th>
        </tr>
        
        <c:choose>
        <c:when test="${fn:length(rentTabletList) eq 0 }">
        <tr>
          <td colspan="3"> <spring:message code="mybasic.not"/> </td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="rentTablet" items="${rentTabletList}">
        <tr>
          <td><c:out value="${rentTablet.cnts_name }" /></td>
          <td><c:out value="${rentTablet.strt_tm }" /></td>
          <td><c:out value="${rentTablet.end_tm }" /></td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      </table>
    </section>
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mypageuse_print"/>" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Basic detail
        </caption>
        <colgroup>
          <col style="width:50%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mybasic.color"/></th>
          <th scope="col"><spring:message code="mybasic.bw"/></th>
        </tr>
        <tr>
        <c:forEach var="cbcBasic" items="${cbcBasicList}">
              <c:if test="${cbcBasic.gods_id eq '104' }">
              <td><c:choose><c:when test="${cbcBasic.gods_count ne null }">${cbcBasic.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
              </c:if>
        </c:forEach>
        <c:forEach var="cbcBasic" items="${cbcBasicList}">
              <c:if test="${cbcBasic.gods_id eq '105' }">
              <td><c:choose><c:when test="${cbcBasic.gods_count ne null }">${cbcBasic.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
              </c:if>
        </c:forEach>
        </tr>
      </table>
    </section>
    <div class="btnCloseTop"><a onClick="MM_showHideLayers('popupD','','hide')"><img src="<c:url value='/resources/usr/images/btn_close.gif' />" alt="close"></a></div>
  </div>
  <div class="btnClose"><a class="rightBtn" onClick="MM_showHideLayers('popupD','','hide')"><span class="btnBase iconX"><spring:message code="mypage.close"/></span></a></div>
</div>
<!--popup basic end-->

<!--popup learning start-->
<div id="popupLearning" class="detailPopup" style="visibility:hidden;">
  <h1><spring:message code="mylearning.title"/></h1>
  <div class="innerBox">
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mylearning_sc" />" alt="PC"></h2>
      <table class="mypageTable" summary="CBC Learning detail">
        <caption>
        CBC Learning detail
        </caption>
        <colgroup>
          <col style="width:25%">
          <col style="width:25%">
          <col style="width:25%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mylearning.y4"/></th>
          <th scope="col"><spring:message code="mylearning.y5"/></th>
          <th scope="col"><spring:message code="mylearning.y6"/></th>
          <th scope="col"><spring:message code="mylearning.ae"/></th>
        </tr>
        <tr>
          <td><c:out value="${year4Count[0].COUNT }" /></td>
          <td><c:out value="${year5Count[0].COUNT }" /></td>
          <td><c:out value="${year6Count[0].COUNT }" /></td>
          <td><c:out value="${engCount[0].COUNT }" /></td>
        </tr>
      </table>
    </section>
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mylearning_ev" />" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Learning detail
        </caption>
        <colgroup>
          <col style="width:50%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mylearning.vod"/></th>
          <th scope="col"><spring:message code="mylearning.eb"/></th>
        </tr>
        <tr>
        
        <td><c:choose><c:when test="${englishCount ne null }">${englishCount }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
        <td><c:choose><c:when test="${ebookCount ne null }">${ebookCount }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
        <%-- 
        <c:forEach var="english" items="${englishList}">
              <c:if test="${english.gods_id eq '215' }">
              <td><c:choose><c:when test="${english.gods_count ne null }">${english.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
              </c:if>
        </c:forEach>
        <c:forEach var="english" items="${englishList}">
              <c:if test="${english.gods_id eq '216' }">
              <td><c:choose><c:when test="${english.gods_count ne null }">${english.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
              </c:if>
        </c:forEach>
         --%>
        </tr>
      </table>
    </section>
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mylearning_ebu" />" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Learning detail
        </caption>
        <colgroup>
          <col style="width:180px">
          <col style="width:145px">
          <col style="width:150px">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mybasic.date"/></th>
          <th scope="col"><spring:message code="mybasic.duration"/></th>
          <th scope="col"><spring:message code="mybasic.st"/></th>
          <th scope="col"><spring:message code="mybasic.et"/></th>
        </tr>     
        <c:choose>
        <c:when test="${fn:length(usedBoardList) eq 0 }">
        <tr>
          <td colspan="4"> <spring:message code="mybasic.not"/> </td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="usedBoard" items="${usedBoardList}">
        <tr>
          <td><c:out value="${usedBoard.useDate }" /></td>
          <td><c:out value="${usedBoard.use_time }" /></td>
          <td><c:out value="${usedBoard.startTm }" /></td>
          <td><c:out value="${usedBoard.endTm }" /></td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>    
      </table>
    </section>
    
    <!--  -->
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mylearning_sbr" />" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Learning detail
        </caption>
        <colgroup>
          <col style="width:33%">
          <col style="width:33%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mylearning.sb"/></th>
          <th scope="col"><spring:message code="mybasic.rental"/></th>
          <th scope="col"><spring:message code="mybasic.return"/></th>
        </tr>
        <c:choose>
        <c:when test="${fn:length(rentSmartBeamList) eq 0 }">
        <tr>
          <td colspan="3"> <spring:message code="mybasic.not"/> </td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="rentSmartBeam" items="${rentSmartBeamList}">
        <tr>
          <td><c:out value="${rentSmartBeam.cnts_name }" /></td>
          <td><c:out value="${rentSmartBeam.strt_tm }" /></td>
          <td><c:out value="${rentSmartBeam.end_tm }" /></td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      </table>
    </section>

    <section class="innerSec">
      <h2><img src="<spring:message code="img.mylearning_br" />" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Learning detail
        </caption>
        <colgroup>
          <col style="width:33%">
          <col style="width:33%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mybasic.book"/></th>
          <th scope="col"><spring:message code="mybasic.rental"/></th>
          <th scope="col"><spring:message code="mybasic.return"/></th>
        </tr>
        <c:choose>
        <c:when test="${fn:length(rentBookList) eq 0 }">
        <tr>
          <td colspan="3"> <spring:message code="mybasic.not"/> </td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="rentBook" items="${rentBookList}">
        <tr>
          <td><c:out value="${rentBook.cnts_name }" /></td>
          <td><c:out value="${rentBook.strt_tm }" /></td>
          <td><c:out value="${rentBook.end_tm }" /></td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      </table>
    </section>
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mylearning_dr" />" alt=""></h2>
      <table class="mypageTable" summary="CBC Basic detail">
        <caption>
        CBC Learning detail
        </caption>
        <colgroup>
          <col style="width:33%">
          <col style="width:33%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="mylearning.dvd"/></th>
          <th scope="col"><spring:message code="mybasic.rental"/></th>
          <th scope="col"><spring:message code="mybasic.return"/></th>
        </tr>
        <c:choose>
        <c:when test="${fn:length(rentDVDList) eq 0 }">
        <tr>
          <td colspan="3"> <spring:message code="mybasic.not"/> </td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="rentDVD" items="${rentDVDList}">
        <tr>
          <td><c:out value="${rentDVD.cnts_name }" /></td>
          <td><c:out value="${rentDVD.strt_tm }" /></td>
          <td><c:out value="${rentDVD.end_tm }" /></td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
      </table>
    </section>
    <!--  -->
    <div class="btnCloseTop"><a onClick="MM_showHideLayers('popupLearning','','hide')"><img src="<c:url value='/resources/usr/images/btn_close.gif' />" alt="close"></a></div>
  </div>
  <div class="btnClose"><a class="rightBtn" onClick="MM_showHideLayers('popupLearning','','hide')"><span class="btnBase iconX"><spring:message code="mypage.close"/></span></a></div>
</div>
<!--popup learning end-->

<!--popup commerce start-->
<div id="popupCommerce" class="detailPopup typeC" style="visibility:hidden;">
  <h1><spring:message code="mycommerce.title"/></h1>
  <div class="innerBox innerTypeC">
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mycommerce_sns" />" alt=""></h2>
      <table class="mypageTable" summary="Commerce detail">
        <caption>
        Commerce detail
        </caption>
        <colgroup>
          <col style="width:33.33%">
          <col style="width:33.33%">
          <col>
        </colgroup>
        <tr>
          <th scope="col">Facebook</th>
          <th scope="col">Blogspot</th>
          <th scope="col">Twitter</th>
        </tr>
        <tr>
          <td><c:out value="${commerceDetailList[0].FACEBOOK eq null ? 0 : commerceDetailList[0].FACEBOOK }" /></td>
          <td><c:out value="${commerceDetailList[0].BLOGSPOT eq null ? 0 : commerceDetailList[0].BLOGSPOT  }" /></td>
          <td><c:out value="${commerceDetailList[0].TWITTER eq null ? 0 : commerceDetailList[0].TWITTER  }" /></td>
        </tr>
      </table>
    </section>
    
    <section class="innerSec">
      <h2><img src="<spring:message code="img.mycommerce_print" />" alt=""></h2>
      <table class="mypageTable" summary="Commerce detail">
        <caption>
        Commerce detail
        </caption>
        <colgroup>
          <col style="width:25%">
          <col style="width:25%">
          <col style="width:25%">
          <col>
        </colgroup>
        <tr>
          <th scope="col" colspan="2"><spring:message code="mycommerce.nopl"/></th>
          <th scope="col" colspan="2"><spring:message code="mycommerce.nopb"/></th>
        </tr>
        <tr>
          <th scope="col"><spring:message code="mybasic.color"/></th>
          <th scope="col"><spring:message code="mybasic.bw"/></th>
          <th scope="col"><spring:message code="mybasic.color"/></th>
          <th scope="col"><spring:message code="mybasic.bw"/></th>
        </tr>
        <tr>
          <td><c:out value="${commerceDetailList[0].LABEL_COLOR eq null ? 0 : commerceDetailList[0].LABEL_COLOR  }" /></td>
          <td><c:out value="${commerceDetailList[0].LABEL_BW eq null ? 0 : commerceDetailList[0].LABEL_BW  }" /></td>
          <td><c:out value="${commerceDetailList[0].BROCHURE_COLOR eq null ? 0 : commerceDetailList[0].BROCHURE_COLOR  }" /></td>
          <td><c:out value="${commerceDetailList[0].BROCHURE_BW eq null ? 0 : commerceDetailList[0].BROCHURE_BW  }" /></td>
        </tr>
      </table>
    </section>
    <div class="btnCloseTop"><a onClick="MM_showHideLayers('popupCommerce','','hide')"><img src="<c:url value='/resources/usr/images/btn_close.gif' />" alt="close"></a></div>
  </div>
  <div class="btnClose"><a class="rightBtn" onClick="MM_showHideLayers('popupCommerce','','hide')"><span class="btnBase iconX"><spring:message code="mypage.close"/></span></a></div>
</div>
<!--popup commerce end-->
<!--popup Health start-->
<div id="popupHealth" class="detailPopup typeH" style="visibility:hidden;">
  <h1><spring:message code="myhealth.title"/></h1>
  <div class="innerBox innerTypeH">
    <section class="innerSec">
      <h2><img src="<spring:message code="img.myhealth_out" />" alt=""></h2>
      <table class="mypageTable" summary="CBC Health detail">
        <caption>
        CBC Health detail
        </caption>
        <colgroup>
          <col style="width:50%">
          <col>
        </colgroup>
        <tr>
          <th scope="col"><spring:message code="myhealth.nop"/></th>
        </tr>
        <tr>
        <c:forEach var="health" items="${healthList}">
              <c:if test="${health.gods_id eq '401' }">
              <td><c:choose><c:when test="${health.gods_count ne null }">${health.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></td>
              </c:if>
        </c:forEach>
        </tr>
      </table>
    </section>
    <div class="btnCloseTop"><a onClick="MM_showHideLayers('popupHealth','','hide')"><img src="<c:url value='/resources/usr/images/btn_close.gif' />" alt="close"></a></div>
  </div>
  <div class="btnClose"><a class="rightBtn" onClick="MM_showHideLayers('popupHealth','','hide')"><span class="btnBase iconX"><spring:message code="mypage.close"/></span></a></div>
</div>
<!--popup Health end-->


<input type="hidden" name="year" value="<c:out value="${year }" />" />
<input type="hidden" name="month" value="<c:out value="${month }" />" />
<input type="hidden" name="userID" value="${userID }" />

<div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeMypage">
        <h2 class="titleCommu"><img src="<spring:message code="img.mypage_title" />" alt="My page" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.mypage_title,txt" />" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox">
        <nav role="navigation" class="mypageTab">
          <ul>
            <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/myPage/read', 'command', 'post');">My Account</a></li>
            <li><a href="#" class="tabWid tabOn">Detailed Descriptions of Services</a></li>
          </ul>
        </nav>
        <div class="mypageCbc">
          <div class="cbcMonth">
          <a href="javascript:moveMonth('${pageContext.request.contextPath }/usr/myUsePage/list','prev');" class="monthPrev">prev</a><span class="monthNum"><c:out value="${year }" />&nbsp;&nbsp;<c:out value="${month }" /></span><a href="javascript:moveMonth('${pageContext.request.contextPath }/usr/myUsePage/list','next');" class="monthNext">next</a>
          </div>
          <div class="cbcConBox">
          
          
          
            <section class="cbcSec01">
              <h1><img src="<spring:message code="img.myuse_title,1" />" alt="CBC Basic"></h1>
              <ul>
              <c:forEach var="cbcBasic" items="${cbcBasicList}">
              
              <c:if test="${cbcBasic.gods_id eq '102' }">
              <li>
              <span class="name">PC Usage: <c:choose><c:when test="${cbcBasic.use_time ne null }">${cbcBasic.use_time }</c:when><c:otherwise>0</c:otherwise></c:choose> min</span>
              <span class="pay"><c:choose><c:when test="${cbcBasic.deposit_sum ne null }">${cbcBasic.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>
              
              <c:if test="${cbcBasic.gods_id eq '103' }">
              <li>
              <span class="name">Tablet Rental: <c:choose><c:when test="${cbcBasic.gods_count ne null }">${cbcBasic.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              <span class="pay"><c:choose><c:when test="${cbcBasic.deposit_sum ne null }">${cbcBasic.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>
             
              <c:if test="${cbcBasic.gods_id eq '104' }">
              <li>
              <span class="name">Print(Color): <c:choose><c:when test="${cbcBasic.gods_count ne null }">${cbcBasic.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              <span class="pay"><c:choose><c:when test="${cbcBasic.deposit_sum ne null }">${cbcBasic.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>
              
              <c:if test="${cbcBasic.gods_id eq '105' }">
              <li>
              <span class="name">Print(B&W): <c:choose><c:when test="${cbcBasic.gods_count ne null }">${cbcBasic.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              <span class="pay"><c:choose><c:when test="${cbcBasic.deposit_sum ne null }">${cbcBasic.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>

              </c:forEach>
                
<%--               <c:forEach var="cbcBasic" items="${cbcBasicList}">
                <li><span class="name">${cbcBasic.gods_name }: ${cbcBasic.gods_count } </span><span class="pay">${cbcBasic.deposit_sum }</span></li>
              </c:forEach> --%>
              
<!--                 <li><span class="name">PC 이용: 21시간</span><span class="pay">13,400</span></li>
                <li><span class="name">Tablet 대여: 1대</span><span class="pay">0</span></li>
                <li><span class="name">복사: 30장</span><span class="pay">3,000</span></li> -->
              </ul>
              <div class="btnDetail"><a onClick="MM_showHideLayers('popupD','','show')"><img src="<c:url value='/resources/usr/images/btn_detail.gif' />" alt="detail"></a></div>
            </section>
            
            
            
            
            <section class="cbcSec01">
              <h1><img src="<spring:message code="img.myuse_title,2" />" alt="CBC Basic"></h1>
              <ul>
              
                <li class="stitle">[Smart class]</li>
                <li><span class="name">VOD Usage : <c:choose><c:when test="${smartCount ne null }">${smartCount }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay">${smartPrice }</span></li>
                
                <c:forEach var="learning" items="${learningList}">
                <c:if test="${learning.gods_id eq '106' }">
                <li><span class="name">Electronic board Usage: <c:choose><c:when test="${learning.gods_count ne null }">${learning.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${learning.deposit_sum ne null }">${learning.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
                
                </c:forEach>
                <li class="stitle">[English Village]</li>
                <li><span class="name">VOD Usage : <c:choose><c:when test="${englishCount ne null }">${englishCount }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay">${englishPrice }</span></li>
                
                <li><span class="name">e-Book view : <c:choose><c:when test="${ebookCount ne null }">${ebookCount }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay">${ebookPrice }</span></li>
                <%-- 
                <c:forEach var="english" items="${englishList}">
                <c:if test="${english.gods_id eq '215' }">
                <li><span class="name">VOD Usage: <c:choose><c:when test="${english.gods_count ne null }">${english.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${english.deposit_sum ne null }">${english.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
              
                <c:if test="${english.gods_id eq '216' }">
                <li><span class="name">e-Book view: <c:choose><c:when test="${english.gods_count ne null }">${english.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${english.deposit_sum ne null }">${english.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
                </c:forEach>
                 --%>
                <c:forEach var="learning" items="${learningList}">
                <c:if test="${learning.gods_id eq '107' }">
                <li><span class="name">Smart Beam Rental: <c:choose><c:when test="${learning.gods_count ne null }">${learning.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${learning.deposit_sum ne null }">${learning.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
                <c:if test="${learning.gods_id eq '108' }">
                <li><span class="name">Book Rental: <c:choose><c:when test="${learning.gods_count ne null }">${learning.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${learning.deposit_sum ne null }">${learning.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
                <c:if test="${learning.gods_id eq '109' }">
                <li><span class="name">DVD Rental: <c:choose><c:when test="${learning.gods_count ne null }">${learning.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${learning.deposit_sum ne null }">${learning.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
                </c:forEach>
        
              
<!--                 <li class="stitle">[Smart class]</li>
                <li><span class="name">Vod 재생 : 30</span><span class="pay">13,400</span></li>
                <li class="stitle">[English village]</li>
                <li><span class="name">E-book 보기 : 1</span><span class="pay">0</span></li> -->
              </ul>
              <div class="btnDetail"><a onClick="MM_showHideLayers('popupLearning','','show')"><img src="<c:url value='/resources/usr/images/btn_detail.gif' />" alt="detail"></a></div>
            </section>
            
            
            
            
            <section class="cbcSec01">
              <h1><img src="<spring:message code="img.myuse_title,3" />" alt="CBC Basic"></h1>
              <ul>
              <c:forEach var="commerce" items="${commerceList}">
              <li><span class="name">${commerce.SERVICE_NAME }: <c:choose><c:when test="${commerce.CNT ne null }">${commerce.CNT }</c:when><c:otherwise>0</c:otherwise></c:choose><c:choose><c:when test="${commerce.SERVICE_NAME eq 'SNS' }"></c:when><c:otherwise></c:otherwise></c:choose></span>
              <span class="pay"><c:choose><c:when test="${commerce.MONEY ne null }">${commerce.MONEY }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
              <%-- <c:if test="${commerce.SERVICE_NAME eq 'Label color print' }">
              <li>
              <span class="name">${commerce.SERVICE_NAME } : <c:choose><c:when test="${commerce.CNT ne null }">${commerce.CNT }</c:when><c:otherwise>0</c:otherwise></c:choose> </span>
              <span class="pay"><c:choose><c:when test="${commerce.MONEY ne null }">${commerce.MONEY }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>   
              <c:if test="${commerce.SERVICE_NAME eq 'Label bw Print' }">
              <li>
              <span class="name">${commerce.SERVICE_NAME } : <c:choose><c:when test="${commerce.CNT ne null }">${commerce.CNT }</c:when><c:otherwise>0</c:otherwise></c:choose> </span>
              <span class="pay"><c:choose><c:when test="${commerce.MONEY ne null }">${commerce.MONEY }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>
              <c:if test="${commerce.SERVICE_NAME eq 'Brochre color Print' }">
              <li>
              <span class="name">${commerce.SERVICE_NAME } : <c:choose><c:when test="${commerce.CNT ne null }">${commerce.CNT }</c:when><c:otherwise>0</c:otherwise></c:choose> </span>
              <span class="pay"><c:choose><c:when test="${commerce.MONEY ne null }">${commerce.MONEY }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if>
              <c:if test="${commerce.SERVICE_NAME eq 'Brochre bw Print' }">
              <li>
              <span class="name">${commerce.SERVICE_NAME } : <c:choose><c:when test="${commerce.CNT ne null }">${commerce.CNT }</c:when><c:otherwise>0</c:otherwise></c:choose> </span>
              <span class="pay"><c:choose><c:when test="${commerce.MONEY ne null }">${commerce.MONEY }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
              </li>
              </c:if> --%>
              </c:forEach>                       
              </ul>
              <div class="btnDetail"><a onClick="MM_showHideLayers('popupCommerce','','show')"><img src="<c:url value='/resources/usr/images/btn_detail.gif' />" alt="detail"></a></div>
            </section>
            
            
            
            
            <section class="cbcSec01 notBd">
              <h1><img src="<spring:message code="img.myuse_title,4" />" alt="CBC Basic"></h1>
              <ul>
              <c:forEach var="health" items="${healthList}">
                <%-- <li>
                <span class="name">${health.gods_name }: ${health.gods_count } </span>
                <span class="pay">${health.deposit_sum }</span>
                </li> --%>
                <c:if test="${health.gods_id eq '401' }">
                <li><span class="name">Measure and Print Out: <c:choose><c:when test="${health.gods_count ne null }">${health.gods_count }</c:when><c:otherwise>0</c:otherwise></c:choose></span>
                <span class="pay"><c:choose><c:when test="${health.deposit_sum ne null }">${health.deposit_sum }</c:when><c:otherwise>0</c:otherwise></c:choose></span></li>
                </c:if>
              </c:forEach>         
                <!-- <li><span class="name">측정 및 출력: 1</span><span class="pay">13,400</span></li> -->
              </ul>
              <div class="btnDetail"><a onClick="MM_showHideLayers('popupHealth','','show')"><img src="<c:url value='/resources/usr/images/btn_detail.gif' />" alt="detail"></a></div>
            </section>
            
            
          </div>
          <div class="totalPay"><img src="<c:url value='/resources/usr/images/txt_mypage_total.gif' />" alt="total:"> RM </div>
          <div class="infoHistory"><spring:message code="myuse.txt" /></div>
          <!-- If you need a bill with detailed usage history, please refer to operator in charge. -->
        </div>
      </div>
      <!--mypage end--> 
    </div>
  </div>
</form>