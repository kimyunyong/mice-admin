<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : login.jsp
  * @Description : Login 인증 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2015.11.03    변종일          최초 생성
  *  @author 개발1팀 변종일
  *  @since 2015.11.03
  *  @version 1.0
  *
  *  Copyright (C) 2015 by Innodis Corp.  All right reserved.
  */
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HICO CRM</title><!-- 171226-->
    <!-- meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Pragma" content="no-cache" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <!-- //meta -->

<!-- 171219  아이콘추가-->
<!-- iPhone icon -->
<link rel="apple-touch-icon" sizes="57x57" href="/images/mice/new/icon57.png" />
<!-- iPad icon -->
<link rel="apple-touch-icon" sizes="72x72" href="/images/mice/new/icon72.png"  />
<!-- iPhone icon(Retina) -->
<link rel="apple-touch-icon" sizes="114x114" href="/images/mice/new/icon114.png" />
<!-- iPad icon(Retina) -->
<link rel="apple-touch-icon" sizes="144x144" href="/images/mice/new/icon144.png" />


<!-- android -->
<link rel="shortcut icon" href="/images/mice/new/icon144.png" /></link> 
<!-- //171219  아이콘추가-->

<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="/css/mice/desktop.css" rel="stylesheet" type="text/css"   media="screen and (min-width:1024px)">
<link href="/css/mice/pad.css" rel="stylesheet" type="text/css" media="screen and (min-width:641px) and (max-width:1023px)">
<link href="/css/mice/mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:640px)">
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/reset.css?ver=20160212"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/admin.css?ver=20160212"/>">

    <title></title>
<!-- admin css -->
<style>

</style>
<script type="text/javascript" src="/js/mice/jquery-1.11.2.min.js"></script>

<!-- //admin css -->
<script type="text/javascript">

	$(function() {
		if('' != '') {
			alert('입력하신 로그인 정보가 일치하지 않습니다. 다시 시도해 주세요');
		}
	});
	
	function saveid(form){
	    var expdate = new Date();
	    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
	    if (myform.checkId.checked){
	        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
			setCookie("saveid", myform.id.value, expdate);
			setCookie("savepwd", myform.password.value, expdate);
	    }else{
	        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
			setCookie("saveid", "", expdate);
			setCookie("savepwd", "", expdate);
		}

	}
	
    function setCookie(cName, cValue, cDay){
        var expire = new Date();
        expire.setDate(expire.getDate() + cDay);
        cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
        if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
        document.cookie = cookies;
    }

    
	function getCookie(cName) {
        cName = cName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cName);
        var cValue = '';
        if(start != -1){
            start += cName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cValue = cookieData.substring(start, end);
        }
        return unescape(cValue);
    }


	$(document).ready(function(){
		if($('#message').val() != ''){
			alert($('#message').val());
		}
		var id = getCookie('saveid');
		if(id != ''){
			$('input[name=id]').val(getCookie('saveid'));
			$('#checkId').attr('checked', true);
		}

		var pwd = getCookie('savepwd');
		if(pwd != ''){
			$('input[name=password]').val(getCookie('savepwd'));
			$('#checkId').attr('checked', true);
		}


	});
	
	$(function(){
		$('body').keydown(function(event){
			
			if(event.keyCode == 13){
				$('form').submit();
			}
		});
		
		$('#id').keydown(function(event){
			if(event.keyCode != 13){
				$('#checkId').attr('checked',false);
			}
		});
	});
</script>
</head>
<body class="admin_login_body clearfix">
    <div class="login">
        <h1><img src="/images/admin_login_top.jpg" alt="hico 경주화백컨밴션센터 administrator Login"/></h1>
        <div class="login_data clearfix mt25">
        	<form name="myform" id="myform" action="/uat/uia/actionLogin.do" method="post">
	           <!-- 171228 -->
			   <div class="new_login_area_wrap">
				<div class="new_login_area"> 
						<select name="userSe" class="admin_select">
							<option value="USR">임직원</option>
							<option value="ENT">협력사</option>
						</select>
						<label for="" class="hide">아이디</label>
						<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" class="admin_id_input"/>
						<label for="" class="hide">비밀번호</label>
						<input type="password" name="password" placeholder="비밀번호" class="admin_pw_input"/>	            
				</div>

	            <a style="cursor:pointer" class="admin_btn" onclick="javascript:$('form').submit();"><i class="fa fa-sign-in" aria-hidden="true"></i>
<p>로그인</p></a>
				</div>

			   <div class="new_login_area_wrap">
					<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
						<label class="admin_save">
							<input type="checkbox" id="checkId" onchange="javascript:saveid($('form'))">
							<span>저장</span>
						</label>
	            <p class="admin_login_ps">로그인 관련 사항은 054-702-1055 으로 문의하여 주십시오.</p>
			</div>

    <!-- //171228 -->

            </form>
        </div>
    </div>  
</body>
</html>
