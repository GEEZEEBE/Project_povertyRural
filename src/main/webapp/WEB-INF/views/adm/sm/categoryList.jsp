<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<link href="<c:url value="/resources/css/tree.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/tree.js" />" type="text/javascript"></script>

<script type="text/javascript">
</script>

<form>
	<input type="hidden" id="currentPage" name="currentPage" value="<c:out value="${currentPage == null ? 1 : currentPage}" />" />
    <input type="hidden" name="itemID" value="">
    <input type="hidden" name="srvcID" value="">
    <input type="hidden" name="selectCheck" value="">
    <input type="hidden" name="searchSrvcID" value="">
	<div class="categoryList">
		<!-- 제목 : str -->
		<div class="subtitle">
        <hgroup>
          <h2>Service Category</h2>
          <h3>This is categories of services provided.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 카테고리================================================ : str -->
      <section class="testC">
      <ul id="tree_menu">
	    <li><img src="<c:url value='/resources/images/icon_cdepth1.png'/>" alt="icon category depth1" /> <span><c:out value="${categoryList[0].SRVC_CTGR_NM }" /><!-- CBC Basic --></span> 
	    </li>
	    <li><img src="<c:url value='/resources/images/icon_cdepth1.png'/>" alt="icon category depth1" /> <span><c:out value="${categoryList[1].SRVC_CTGR_NM }" /><!-- Learning Service --></span>
	        <ul>
	            <li><img src="<c:url value='/resources/images/icon_cdepth2.png'/>" alt="icon category depth2" /> <span><c:out value="${categoryList[2].SRVC_CTGR_NM }" /><!-- Smart Class --></span>
	                <ul>
	                    <li><img src="<c:url value='/resources/images/icon_cdepth3.png'/>" alt="icon category depth3" /> <span><c:out value="${categoryList[3].SRVC_CTGR_NM }" /><!-- Year 4 --></span>
		                    <ul>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[4].SRVC_CTGR_NM }" /><!-- English --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[5].SRVC_CTGR_NM }" /><!-- Math --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[6].SRVC_CTGR_NM }" /><!-- Science --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[7].SRVC_CTGR_NM }" /><!-- Malay --></span></li>
		                    </ul>
		                </li>
		                <li><img src="<c:url value='/resources/images/icon_cdepth3.png'/>" alt="icon category depth3" /> <span><c:out value="${categoryList[8].SRVC_CTGR_NM }" /><!-- Year 5 --></span>
		                    <ul>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[9].SRVC_CTGR_NM }" /><!-- English --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[10].SRVC_CTGR_NM }" /><!-- Math --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[11].SRVC_CTGR_NM }" /><!-- Science --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[12].SRVC_CTGR_NM }" /><!-- Malay --></span></li>
		                    </ul>
		                </li>
		                <li><img src="<c:url value='/resources/images/icon_cdepth3.png'/>" alt="icon category depth3" /> <span><c:out value="${categoryList[13].SRVC_CTGR_NM }" /><!-- Year 6 --></span>
		                    <ul>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[14].SRVC_CTGR_NM }" /><!-- English --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[15].SRVC_CTGR_NM }" /><!-- Math --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[16].SRVC_CTGR_NM }" /><!-- Science --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[17].SRVC_CTGR_NM }" /><!-- Malay --></span></li>
		                    </ul>
		                </li>
		                <li><img src="<c:url value='/resources/images/icon_cdepth3.png'/>" alt="icon category depth3" /> <span><c:out value="${categoryList[18].SRVC_CTGR_NM }" /><!-- Advanced English --></span>
		                    <ul>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[19].SRVC_CTGR_NM }" /><!-- Bulats --></span></li>
		                        <li><img src="<c:url value='/resources/images/icon_cdepth4.png'/>" alt="icon category depth4" /> <span><c:out value="${categoryList[20].SRVC_CTGR_NM }" /><!-- Bulats in Action --></span></li>
		                    </ul>
		                </li>
	                </ul>
	            </li>
	            <li><img src="<c:url value='/resources/images/icon_cdepth2.png'/>" alt="icon category depth2" /> <span><c:out value="${categoryList[21].SRVC_CTGR_NM }" /><!-- English Village --></span>
                    <ul>
                        <li><img src="<c:url value='/resources/images/icon_cdepth3.png'/>" alt="icon category depth3" /> <span><c:out value="${categoryList[22].SRVC_CTGR_NM }" /><!-- VOD --></span>
                        </li>
                        <li><img src="<c:url value='/resources/images/icon_cdepth3.png'/>" alt="icon category depth3" /> <span><c:out value="${categoryList[23].SRVC_CTGR_NM }" /><!-- e-Book --></span>
                        </li>
                    </ul>
                </li>
	        </ul>
	    </li>
	    <li><img src="<c:url value='/resources/images/icon_cdepth1.png'/>" alt="icon category depth1" /> <span><c:out value="${categoryList[24].SRVC_CTGR_NM }" /><!-- Commerce Service --></span>
	    </li>
	    <li><img src="<c:url value='/resources/images/icon_cdepth1.png'/>" alt="icon category depth1" /> <span><c:out value="${categoryList[25].SRVC_CTGR_NM }" /><!-- Health Service --></span>
        </li>
	</ul>
	</section>
      <!-- 카테고리================================================ : end -->
    </div>
</form>