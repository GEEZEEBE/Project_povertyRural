<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<div id="container" role="main">
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeHealth">
        <h2 class="titleCommu"><img src="<spring:message code="img.health_title,m" text=""/>" alt="My page" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.health_p1"/>" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--Health Service start-->
      <div role="main" class="subConBox">
        <section class="healthBanner">
          <a href="http://www.myhealth.gov.my/v2/index.php/en/kids/general/perkhidmatan-kesihatan-sekolah" class="kids"><img src="<spring:message code="img.health_kids"/>" alt="Banner Link : Kids" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/remaja/growing-up/your-body" class="teen"><img src="<spring:message code="img.health_teenagers"/>" alt="Banner Link : Teenagers" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/prime-years/lifestyle/screening" class="prim"><img src="<spring:message code="img.health_primeyears"/>" alt="Banner Link : Prime Years" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/golden-years/fitness-a-you/introduction-to-fitness" class="gold"><img src="<spring:message code="img.health_goldenyears"/>" alt="Banner Link : Golden Years" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/nutrition/general/fakta-mengenai-gula" class="nutr"><img src="<spring:message code="img.health_nutrition"/>" alt="Banner Link : Nutrition" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/medication-a-you/general/consumer-complaints-on-side-effects-of-medicine" class="medi"><img src="<spring:message code="img.health_medication"/>" alt="Banner Link : Medication" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/oral-health/general/allergies-related-to-dentistry" class="oral"><img src="<spring:message code="img.health_oralhealth"/>" alt="Banner Link : Oral Health" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/mental-health/introduction/general-mental-health" class="ment"><img src="<spring:message code="img.health_mental"/>" alt="Banner Link : Mental Health" /></a>
          <a href="http://www.myhealth.gov.my/v2/index.php/en/general/medical-report-preparation-in-ministry-of-health-facilities" class="gene"><img src="<spring:message code="img.health_genral"/>" alt="Banner Link : General" /></a>
        </section>
      </div>
      <!--Health Service end-->
    </div>
  </div>
</div>