<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>
<script type="text/javascript">
function ebookMessage(){
alert('Sorry, E-book services are provided only on Tablet');
}
</script>

<div id="container" role="main">
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeSitemap">
        <h2 class="titleCommu"><img src="<spring:message code="img.sitemap.title" text=""/>" alt="sitemap" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.sitemap.title,txt1"/>" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--contents start-->
      <div role="main" class="subConBox">
        <div class="sitemapMenu">
          <h3 class="HNum01"><img src="<spring:message code="img.sitemap.cbc" text=""/>" alt="CBC"></h3>
          <ul class="menuListM">
            <li><a href="${pageContext.request.contextPath }/sktintro"><spring:message code="menu.sitemap_skt" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/cbcintro"><spring:message code="menu.sitemap_cbc" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/usrFree/list"><spring:message code="menu.sitemap_free" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/notice/list"><spring:message code="menu.sitemap_notice" text=""/></a></li>
            <li>
              <a href="${pageContext.request.contextPath }/usr/myPage/read?userID=${userID}"><spring:message code="menu.sitemap_mypage" text=""/></a>
              <ul class="menuListS">
              	<li><a href="${pageContext.request.contextPath }/usr/myPage/read?userID=${userID}"><spring:message code="menu.sitemap_myinfor" text=""/></a></li>
                <li><a href="${pageContext.request.contextPath }/usr/myUsePage/list?userID=${userID}"><spring:message code="menu.sitemap_product" text=""/></a></li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="sitemapMenu secondSMBox">
          <h3 class="HNum02"><img src="<spring:message code="img.sitemap.learning" text=""/>" alt="Learning"></h3>
          <ul class="menuListM">
            <li><a href="${pageContext.request.contextPath }/learningsi"><spring:message code="menu.sitemap_learningsi" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/usr/smartmain"><spring:message code="menu.sitemap_smart" text=""/></a>
              <ul class="menuListS">
              	<li><a href="${pageContext.request.contextPath }/usr/smartClass/list?srvcID=4"><spring:message code="menu.sitemap_year4" text=""/></a></li>
                <li><a href="${pageContext.request.contextPath }/usr/smartClass/list?srvcID=9"><spring:message code="menu.sitemap_year5" text=""/></a></li>
                <li><a href="${pageContext.request.contextPath }/usr/smartClass/list?srvcID=14"><spring:message code="menu.sitemap_year6" text=""/></a></li>
                <li><a href="${pageContext.request.contextPath }/usr/smartClass/list?srvcID=19"><spring:message code="menu.sitemap_en,advanced" text=""/></a></li>
                <li><a href="${pageContext.request.contextPath }/usr/smartClass/lessonsList?userID=${userID}"><spring:message code="menu.sitemap_myhistory" text=""/></a></li>
              </ul>
            </li>
            <li>
              <a href="${pageContext.request.contextPath }/usr/englishvi"><spring:message code="menu.sitemap_envill" text=""/></a>
              <ul class="menuListS">
              	<li><a href="${pageContext.request.contextPath }/usr/englishVillage/list"><spring:message code="menu.sitemap_vod" text=""/></a></li>
                <li><a href="javascript:ebookMessage();"><spring:message code="menu.sitemap_ebook" text=""/></a></li>
                <li><a href="${pageContext.request.contextPath }/usr/englishVillage/lessonsList?userID=${userID}"><spring:message code="menu.sitemap_myhistory" text=""/></a></li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="sitemapMenu secondSMBox">
          <h3 class="HNum03"><img src="<spring:message code="img.sitemap.commerce" text=""/>" alt="Commerce"></h3>
          <ul class="menuListM">
            <li><a href="${pageContext.request.contextPath }/commercesi"><spring:message code="menu.sitemap_commercesi" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/usr/Promote/list/"><spring:message code="menu.sitemap_com,marketing" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/Guide/list/"><spring:message code="menu.sitemap_com,guide" text=""/></a></li>
          </ul>
        </div>
        <div class="sitemapMenu secondSMBox">
          <h3 class="HNum04"><img src="<spring:message code="img.sitemap.health" text=""/>" alt="Health"></h3>
          <ul class="menuListM">
            <li><a href="${pageContext.request.contextPath }/healthsi"><spring:message code="menu.sitemap_healthsi" text=""/></a></li>
            <li><a href="${pageContext.request.contextPath }/healthse"><spring:message code="menu.sitemap_healthinfor" text=""/></a></li>
          </ul>
        </div>
      </div>
      <!--contents end--> 
    </div>
  </div>
</div>