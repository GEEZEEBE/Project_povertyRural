<%@ page contentType="text/html; charset=UTF-8" 
	import = "java.util.List, com.skt.mars.adm.co.Commerce" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<%
	List<Commerce> resultObject = (List<Commerce>)request.getAttribute("list");
%>
<link href="<c:url value='/resources/css/basc.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/resources/inc/jquery-1.8.3.js' />"></script>
<script src="<c:url value='/resources/inc/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/adm_ui_common.js' />"></script>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>


 <div id="container" role="main">
  <div class="subContentsArea">
    <div class="subContentsBox">
      <div class="subTitleBox typeMypage">
        <h2 class="titleCommu"><img src="<c:url value='/resources/images/title_comservice.gif' />" alt="Commerce Service" /></h2>
        <p class="subTitleCommu"><img src="<c:url value='/resources/images/txt_mypage.gif' />" alt=" CBC members are at notice on this board." /></p>
      </div>
      <!--mypage start-->
      <section id="tabs-1">
        <!-- 이용통계 : str -->
        <dl class="network commerce">
          <dt>성별</dt>
          <dd class="dd01">
            <select style="height: 24px;">
              <option>전체</option>
            </select>
          </dd>
          <dt class="dtleftLine">연령대</dt>
          <dd>
            <select style="height: 24px;">
              <option>전체</option>
            </select>
            <p class="sch">
              <button type="button"></button>
            </p>
          </dd>
        </dl>
        <section id="tab-container" class="stats">
          <ul>
            <li><a href="#tabs2-01" class="tab"><img src="<c:url value='/resources/images/btn_month.gif' />" alt="월별보기" /></a></li>
            <li><a href="#tabs2-02" class="tab"><img src="<c:url value='/resources/images/btn_day.gif' />" alt="일별보기" /></a></li>
          </ul>
          <section id="tabs2-01">
            <!-- 월별보기 : str -->
            <section class="topLine">
              <div class="statsSchbox">
                <button type="button" class="statsSch"></button>
                <select class="Year" style="height: 24px;">
                  <option>Year</option>
                </select>
              </div>
              <table class="boardSch" summary="Month">
                <colgroup>
                  <col width="120" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="*" />
                </colgroup>
                <thead>
                  <tr>
                    <th rowspan="2">구분</th>
                    <th colspan="3">홍보등록수</th>
                    <th colspan="2">제작수</th>
                    <th colspan="2" class="end">출력수</th>
                  </tr>
                  <tr>
                    <th>Facebook</th>
                    <th>Blogspot</th>
                    <th>Twitter</th>
                    <th>라벨</th>
                    <th>브로셔</th>
                    <th>라벨</th>
                    <th class="end">브로셔</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th><a href="#">Jan</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Feb</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Mar</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Apr</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">May</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Jun</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Jul</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Aug</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Sep</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Oct</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr>
                    <th><a href="#">Nov</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                  <tr class="bottomLine">
                    <th><a href="#">Dec</a></th>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td><a href="#">15,000</a></td>
                    <td class="end alignC"><a href="#">15,000</a></td>
                  </tr>
                </tbody>
              </table>
              <p class="unit">(단위: 건수)</p>
            </section>
            <!-- 월별보기 : end -->
          </section>
          <section id="tabs2-02">
            <!-- 일별보기 : str -->
            <section class="topLine">
              <div class="statsSchbox">
                <button type="button" class="statsSch"></button>
                <select class="Month" style="height: 24px;">
                  <option>12</option>
                </select>
                <select class="Year2" style="height: 24px;">
                  <option>2013</option>
                </select>
              </div>
              <table class="boardSch" summary="search">
                <colgroup>
                  <col width="120" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="84" />
                  <col width="*" />
                </colgroup>
                <thead>
                  <tr>
                    <th rowspan="2">구분</th>
                    <th colspan="3">홍보등록수</th>
                    <th colspan="2">제작수</th>
                    <th colspan="2" class="end">출력수</th>
                  </tr>
                  <tr>
                    <th>Facebook</th>
                    <th>Blogspot</th>
                    <th>Twitter</th>
                    <th>라벨</th>
                    <th>브로셔</th>
                    <th>라벨</th>
                    <th class="end">브로셔</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th>2/1<em>(Sun)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>2/2<em>(Mon)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>2/3<em>(Tue)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>2/4<em>(Wed)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>2/5<em>(Thu)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>2/6<em>(Fri)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>2/7<em>(Sat)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr>
                    <th>...</th>
                    <td>...</td>
                    <td>...</td>
                    <td>...</td>
                    <td>...</td>
                    <td>...</td>
                    <td>...</td>
                    <td class="end alignC">...</td>
                  </tr>
                  <tr>
                    <th>2/27<em>(Fri)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                  <tr class="bottomLine">
                    <th>2/28<em>(Sat)</em></th>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td>1,000</td>
                    <td class="end alignC">1,000</td>
                  </tr>
                </tbody>
              </table>
              <p class="unit">(단위: 건수)</p>
            </section>
            <!-- 일별보기 : end -->
          </section>
          <script type="text/javascript">
            initTabMenu("tab-container");
          </script>
        </section>
        <div class="excelDown">
          <div class="alignCenter">
            <div class="button1 type2">
              <a href="#"><img src="images/btn_icon_excel.gif" alt="icon" /><span>Excel dowenload</span></a>
            </div>
          </div>
        </div>
        <!-- 이용통계 : end -->
      </section>
      <!--mypage end--> 
    </div>
  </div>
</div>


