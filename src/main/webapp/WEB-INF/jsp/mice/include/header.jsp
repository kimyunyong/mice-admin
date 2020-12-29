<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<%   
/* response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); */ 
%>   
<!DOCTYPE HTML>
<!--[if lt IE 7]><html class="lt-ie10 lt-ie9 lt-ie8 ie6" lang="ko-KR"><![endif]-->
<!--[if IE 7]><html class="lt-ie10 lt-ie9 lt-ie8 ie7" lang="ko-KR"><![endif]-->
<!--[if IE 8]><html class="lt-ie10 lt-ie9 ie8" lang="ko-KR"><![endif]-->
<!--[if IE 9]><html class="lt-ie10 ie9" lang="ko-KR"><![endif]-->
<!--[if !IE]><!--><html lang="ko-KR"><!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>HICO CRM</title><!-- 171219-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=10, minimum-scale=1, user-scalable=yes">

<!-- <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"> -->
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="Company">
<meta name="format-detection" content="telephone=yes, email=yes">
<meta name="robots" content="noindex" />


<!-- iPhone icon -->
<link rel="apple-touch-icon" sizes="57x57" href="/images/mice/new/icon57.png" />
<!-- iPad icon -->
<link rel="apple-touch-icon" sizes="72x72" href="/images/mice/new/icon72.png"  />
<!-- iPhone icon(Retina) -->
<link rel="apple-touch-icon" sizes="114x114" href="/images/mice/new/icon114.png" />
<!-- iPad icon(Retina) -->
<link rel="apple-touch-icon" sizes="144x144" href="/images/mice/new/icon144.png" />

<!-- android -->
<link rel="shortcut icon" href="/images/mice/new/icon144.png" />


<meta http-equiv="expires" content="-1" >
<link rel="shorcut icon" href="/images/mice/favicon.ico">
<!-- CSS Call -->
<link rel="stylesheet" href="<c:url value="/js/mice/jquery.mCustomScrollbar.min.css"/>" />
<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="css/mice/admin_ie7.css">
<![endif]-->
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/reset.css?ver=20160212"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/admin.css?ver=20160212"/>">
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="/css/mice/desktop.css" rel="stylesheet" type="text/css"   media="screen and (min-width:1024px)">
<link href="/css/mice/pad.css" rel="stylesheet" type="text/css" media="screen and (min-width:641px) and (max-width:1023px)">
<link href="/css/mice/mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:640px)">
<link href="/css/mice/s_mobile.css" rel="stylesheet" type="text/css"  media="screen and (max-width:350px)">
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="/css/mice/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- //bootstrap -->
<script>
    $(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip({
		// container: "body",
		delay: { "show": 0, "hide": 111000 }
	});
	$('.tooltip-right').tooltip({
		placement: 'right',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-viewport-right').tooltip({
		placement: 'right',
		viewport: {selector: '.container-viewport', padding: 2}
	});
	$('.tooltip-viewport-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: '.container-viewport', padding: 2}
	});
   });

   </script>


