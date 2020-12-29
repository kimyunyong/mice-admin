<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
%>   
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mice/admin.css?ver=20160212'/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/reset.css?ver=20160212"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/admin.css?ver=20160212"/>">
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="/css/mice/desktop.css" rel="stylesheet" type="text/css"   media="screen and (min-width:1024px)">
<link href="/css/mice/pad.css" rel="stylesheet" type="text/css" media="screen and (min-width:641px) and (max-width:1023px)">
<link href="/css/mice/mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:640px)">
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">

<title>문자보내기</title>
 
<script>
$(document).ready(function(){
	/*	
	$("#form").action="http://www.munja123.com/Remote/RemoteSms.html";
	$("#form").target="iframe_frm";
	$("#form").submit();
	alert("정상적으로 문자를 전송하였습니다.");
	//window.close();
	
	*/	
	var params = $("form[name=form]").serialize(); 
	$.ajax({
	    type: "POST",
	    dataType:"xml",
	    url: "http://www.munja123.com/Remote/RemoteSms.html",
	    data: params,
		error: function(obj){// 성공시 실행 함수
			//alert( "실패하였습니다.--"+obj);
			//for(key in obj){
			//	alert(key+"="+obj[key]);
			//}
		},	    
		success: function (response) {
	    	//alert("정상적으로 문자를 전송하였습니다.");
	    	//window.close();

	    }
	});

	alert("정상적으로 문자를 전송하였습니다.");
	window.close();


});


</script>

</head>

<body>

<form name="form" id="form" method="post" action = "http://www.munja123.com/Remote/RemoteSms.html">

<iframe name="iframe_frm" id="iframe_frm"></iframe>

<input type="hidden" name="remote_id" value="hico"><!-- 문자박사 아이디 --> 
<input type="hidden" name="remote_pass" value="hico0302&*"><!-- 문자박사 패스워드 --> 
<input type="hidden" name="remote_returnurl" value=""><!-- 발송후 리턴할 주소 형식 : www.test.co.kr/Remote/return.html --> 
<input type="hidden" name="remote_num" value="${vo.sms_remote_num}"><!-- 수신번호 개수 default : 1, 다수 번호,번호--> 
<input type="hidden" name="remote_reserve" value="0"><!-- 예약 1 , 일반 0 --> 
	<input type="hidden" name="remote_reservetime" value=""><!-- 예약시 예약 시간 년-월-일 시:분 --> 
<input type="hidden" name="remote_phone" value="${vo.sms_remote_phone}"><!-- 수신번호 다수일때는 쉼표','로 구분 -->
	<input type="hidden" name="remote_name" value=""><!-- 수신번호 다수일때는 이름을 쉼표','로 구분 --> 
<input type="hidden" name="remote_callback" value="0547021058"><!-- 발신번호 숫자만 입력 --> 
	<input type="hidden" name="remote_subject" value=""><!--  장문(lms)전송시에만 입력  --> 
<input type="hidden" name="remote_msg" value="${vo.sms_remote_msg}"> 
	<input type="hidden" name="remote_contents" value=""><!-- 미리 업로드 된 이미지 파일명 --> 
	<input type="hidden" name="remote_etc1" value=""><!-- 사용자 정의 변수1 --> 
	<input type="hidden" name="remote_etc2" value=""><!-- 사용자 정의 변수2 --> 

</form>

</body>
</html>
