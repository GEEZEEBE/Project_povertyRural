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
        }
        f.action = url;
        f.submit();
    }
    
    
</script>

<form>
<!-- ************************************************************ -->
<input type="hidden" name="srvcID" value="${srvcID }" />  
<input type="hidden" name="userID" value="${userID }" />  
<input type="hidden" name="lang" value="${lang }" />
<input type="hidden" name="langType" value="${langType }" />
<input type="hidden" name="pageName" value="/usr/smartmain" />

<input type="hidden" name="itemID" value="" />
  <div id="container" class="containerSmart">
    <div class="smartCont">
      <section class="smartUpsr">
        <div class="smartUpsrTitle">
          <h2><spring:message code="learningse.year_4" text=""/></h2>
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','4')" class="btnGo"><img src="<c:url value='/resources/usr/images/learning/btn_go.png'/>" alt="go"></a>
        </div>
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','5')" class="y401"><spring:message code="smart.subject_english" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','6')" class="y402"><spring:message code="smart.subject_mathematics" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','7')" class="y403"><spring:message code="smart.subject_science" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','8')" class="y404"><spring:message code="smart.subject_malay" text=""/></a></li>
        </ul>
      </section>
      <section class="smartUpsr">
        <div class="smartUpsrTitle bgY5">
          <h2><spring:message code="learningse.year_5" text=""/></h2>
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','9')" class="btnGo"><img src="<c:url value='/resources/usr/images/learning/btn_go.png'/>" alt="go"></a>
        </div>
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','10')" class="y501"><spring:message code="smart.subject_english" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','11')" class="y502"><spring:message code="smart.subject_mathematics" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','12')" class="y503"><spring:message code="smart.subject_science" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','13')" class="y504"><spring:message code="smart.subject_malay" text=""/></a></li>
        </ul>
      </section>
      <section class="smartUpsr">
        <div class="smartUpsrTitle bgY6">
          <h2><spring:message code="learningse.year_6" text=""/></h2>
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','14')" class="btnGo"><img src="<c:url value='/resources/usr/images/learning/btn_go.png'/>" alt="go"></a>
        </div>
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','15')" class="y601"><spring:message code="smart.subject_english" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','16')" class="y602"><spring:message code="smart.subject_mathematics" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','17')" class="y603"><spring:message code="smart.subject_science" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','18')" class="y604"><spring:message code="smart.subject_malay" text=""/></a></li>
        </ul>
      </section>
      <section class="smartUpsr lastUpsr">
        <div class="smartUpsrTitle bgEng mtEng">
          <h2><span class="smallText"><spring:message code="learningse.advanced" text=""/></span><span class="bigText"><spring:message code="learningse.english" text=""/></span></h2>
          <a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','19')" class="btnGo"><img src="<c:url value='/resources/usr/images/learning/btn_go.png'/>" alt="go"></a>
        </div>
        <ul>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','20')" class="eng01"><spring:message code="smart.subject_bulats" text=""/></a></li>
          <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/usr/smartClass/list','list','21')" class="eng02"><spring:message code="smart.subject_bulats,ac" text=""/></a></li>
        </ul>
      </section>
    </div>
  </div>
<!-- ************************************************************ -->
</form>
