<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
		<tiles:insertAttribute name="header" />
</head>
<body>
<header class="main">
		<tiles:insertAttribute name="menuTop" />
</header>
<section class="subContainer mAuto">
  <aside class="left">
		<tiles:insertAttribute name="menuLeft" />
  </aside>
  <section class="contents">
    <header>
    <!-- 현재위치 : str -->
		<tiles:insertAttribute name="currentDirectory" />
    <!-- 현재위치 : end -->
    </header>
    <!-- body : str -->
		<tiles:insertAttribute name="body" />
    <!-- body : end -->
	</section>
  <div class="whiteBG"></div><!-- 좌측배경 확장으로 인한 레이아웃 변경: contents 오른쪽 흰색배경 -->
</section>

<footer>
		<tiles:insertAttribute name="footer" />
</footer>

</body>
</html>
