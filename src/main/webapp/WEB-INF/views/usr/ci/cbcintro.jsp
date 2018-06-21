<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nav" uri="/pNavi-tags"%>
<%@ taglib prefix="spring"uri="http://www.springframework.org/tags" %>

<div id="container" role="main">
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeCbcintro">
        <h2 class="titleCommu"><img src="<spring:message code="img.cbcintro_title" text=""/>" alt="Learning Service Introduction" /></h2>
        <p class="subTitleCommu"><img src="<spring:message code="img.cbcintro_title,txt1"/>" alt=" CBC members are at notice on this board." /></p>
      </div>
      <div role="main" class="subConBox CBCINT">
        <h1><span><spring:message code="cbcintro.h1_title" text=""/></span></h1>
        <h2><spring:message code="cbcintro.h2_title,1" text=""/></h2>
        <p><spring:message code="cbcintro.p_1" text=""/></p>
        <h2><spring:message code="cbcintro.h2_title,2" text=""/></h2>
        <p><spring:message code="cbcintro.p_2" text=""/></p>
        <div>
          <table summary="Provide services and rates">
            <caption>
            Provide services and rates
            </caption>
            <colgroup>
              <col width="245">
              <col width="289">
              <col width="102">
            </colgroup>
            <thead>
              <tr>
                <th><span>Service Name</span></th>
                <th><span>Charges</span></th>
                <th><span class="end">Target</span></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="sname">PC use.</td>
                <td class="charg">RM <span>0</span></td>
                <td class="targe">Anyone</td>
              </tr>
              <tr>
                <td class="sname">Internet use.</td>
                <td class="charg">RM <span>0</span></td>
                <td class="targe">Members</td>
              </tr>
              <tr>
                <td class="sname">Print (color)</td>
                <td class="charg">RM <span>0</span></td>
                <td rowspan="2" class="targe">Anyone</td>
              </tr>
              <tr>
                <td class="sname">Print (black and white)</td>
                <td class="charg">RM <span>0</span></td>
              </tr>
              <tr>
                <td class="sname">Tablet Rental</td>
                <td class="charg">RM <span>0</span><em>(Deposit  RM 5,000)</em></td>
                <td rowspan="8" class="targe">Members</td>
              </tr>
              <tr>
                <td class="sname">Smart Beam Rental</td>
                <td class="charg">RM <span>0</span><em>(Deposit  RM 1,000)</em></td>
              </tr>
              <tr>
                <td class="sname">Book rental</td>
                <td class="charg">RM <span>0</span><em>(Deposit  RM 10)</em></td>
              </tr>
              <tr>
                <td class="sname">DVD Rental</td>
                <td class="charg">RM <span>0</span><em>(Deposit  RM 10)</em></td>
              </tr>
              <tr>
                <td class="sname">Smart Class</td>
                <td class="charg">RM <span>0</span></td>
              </tr>
              <tr>
                <td class="sname">English Village</td>
                <td class="charg">RM <span>0</span></td>
              </tr>
              <tr>
                <td class="sname">Click & Sell</td>
                <td class="charg">RM <span>0</span><em>(Label or brochure in the output price occurs)</em></td>
              </tr>
              <tr class="noLine">
                <td class="sname">Health Measurement and Output</td>
                <td class="charg">RM <span>0</span><em>(Results not output when rates occur)</em></td>
              </tr>
            </tbody>
          </table>
        </div>
        <p class="footnote"><spring:message code="cbcintro.p_3" text=""/></p>
        <h2><spring:message code="cbcintro.h2_title,3" text=""/></h2>
        <p><spring:message code="cbcintro.p_4" text=""/></p>
      </div>
      <!--mypage start-->
      <div role="main" class="subConBox">
        
      </div>
      <!--mypage end--> 
    </div>
  </div>
</div>