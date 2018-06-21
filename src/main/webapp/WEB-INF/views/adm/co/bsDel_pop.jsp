<%@ page contentType="text/html; charset=UTF-8" 
	import="com.skt.mars.adm.co.*"
%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@page import="java.util.*, com.skt.mars.adm.co.ut.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link href="<c:url value='/resources/css/basc.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/inc/jquery-1.8.3.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/inc/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/adm_ui_common.js' />"></script>
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js"></script>
<script src="http://platform.twitter.com/anywhere.js?id=8Zdej5LyC2TZMXegak6REg&v=1.1" type="text/javascript"></script>
<script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>
<script type='text/javascript' src='http://www.google.com/jsapi'></script>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<%
	AccessToken acccesstoken = (AccessToken)session.getAttribute("accessToken");

System.out.println("bsDel_popopopopopopopopop");
%>
<script> 

	$(document).ready(function(){
		var accessToken = "<%=acccesstoken%>";
		
		if(accessToken != null){
			$(opener.document).find("#bsDelete").submit();
		}; 
		
		self.close();
		
	});

	

</script>