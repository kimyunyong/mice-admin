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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a,
abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, textarea, 
kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, 
center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, 
tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure,
figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, select, 
time, mark, audio, video, button,input { font-size:14px;    font-family: 'NanumBarunGothic' }


h5.s_tit {border-left:5px solid #1779c7; padding-left:10px; margin:25px 0px 10px 0px; line-height:20px !important;}
h5{
	margin-bottom: 20px;
	font-size: 14px;
	line-height: 1.5;
	font-weight: bold;
	letter-spacing: -1px;
}

a.n_btn01 {background:#eee; border:1px solid #bbb; color:#777;}
a.n_btn02 {background:#123e5a; border:1px solid #111; color:#fff;}
a.n_btn03 {background:#123e5a; border:1px solid #082639; color:#fff; padding:0px 30px;}

table { border:0px; padding:0px; margin:0px;}
table td{ border:0px; padding:0px; margin:0px;}
table tr{ border:0px; padding:0px; margin:0px;}

textarea { clear:both; height:77px; min-height:0px;
font:9pt 굴림체; word-break:break-all; overflow:hidden; background-color:transparent; min-height:0px; 
border:0px;
}



/* .search_new_btn */
.search_new_btn  {overflow:hidden; width:100%; padding:10px 0px 20px 0px; text-align:center;}
.search_new_btn  a { text-align:center;  font-weight:600; display:inline-block; *zoom:1; margin:0px 5px; padding:0px 10px;}

.search_new_btn2 {overflow:hidden; width:100%; padding:10px 0px 0px 0px; text-align:center;}
.search_new_btn2  a{ text-align:center;  font-weight:600; display:inline-block; *zoom:1; margin:0px 5px; padding:0px 10px; line-height:41px; font-size:16px;}

a.btn1{ color:#fff !important;
	display: inline-block;
	zoom: 1;
	vertical-align: middle;
	padding: 0 10px;
	text-align: center;
	margin-left:5px;
	background:#666;
}

.btn1{background:#666; color:#fff; border:1px solid #222;}
.btn1{font-size:16px; line-height:41px; height:41px; vertical-align:top;}

a {text-decoration:none;}
.texting_area { color:#fff; }
</style>

<link rel="stylesheet" type="text/css" href="/css/mice/reset.css?ver=20160212">
<link rel="stylesheet" type="text/css" href="/css/mice/admin.css?ver=20160212">
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="/css/mice/desktop.css" rel="stylesheet" type="text/css"   media="screen and (min-width:1024px)">
<link href="/css/mice/pad.css" rel="stylesheet" type="text/css" media="screen and (min-width:641px) and (max-width:1023px)">
<link href="/css/mice/mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:640px)">
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">


<title>문자보내기</title>
<script>
function getSmsByte(value, maxByte) {
	var i, len;
	var byteSize = 0;
	var endPos = -1;

	for (i=0, len=value.length; i<len; i++) {
		if (escape(value.charAt(i)).length >= 4) {
			byteSize += 2;
		}else if (escape(value.charAt(i)) != "%0D") {
			++byteSize;
		}
		if (byteSize > maxByte && endPos < 0) endPos = i;
	}

	return { size:byteSize, pos:endPos };
}

function checkSmsContent(item, no) {
	var f = document.form;
	var i, len;

	var value = item.value;
	var byteInfo = getSmsByte(value, 80);

	if (!no) no = "";

	var objContentLen = eval("f.contentLen"+no);
	objContentLen.value = byteInfo.size;

	if (byteInfo.size > 80) {
		alert("최대 80byte 까지 입력이 가능합니다");
		item.value = value.substring(0, byteInfo.pos);
	}
}

function openSmsLayer(elmId) {
	var objLayer = document.getElementById(elmId);

	if (objLayer.style.display == "none") {
		var menuLocBod = window.document.body;
		var xPos = menuLocBod.scrollLeft + event.clientX + 100;
		var yPos = menuLocBod.scrollTop + event.clientY - 170;

		objLayer.style.pixelLeft = xPos;
		objLayer.style.pixelTop = yPos;
		objLayer.style.display = ""
	}else {
		objLayer.style.display = "none"
	}
}

function insSmsChr(value) {
	var f = document.Frm;
	f.content.value = f.content.value + value;
	checkSmsContent(f.content);
}

function submitChk(){
	var f = document.form;

	if (f.content.value == "") {
		alert("메세지를 입력해 주세요.");
		f.content.focus();
		return false;
	}

	//if (f.receiveNumber.value == "") {
	//	alert("핸드폰번호를 입력해 주세요.");
	//	f.receiveNumber.focus();
	//	return false;
	//}

/*
	if (getRadioVal(f.reservedFlag) == "true") {
		if (checkEmpty(f.reservedDate)) {
			alert("예약 일자를 입력해 주세요.");
			f.reservedDate.focus();
			return false;
		}
	}
*/

	f.submit();
}
$(document).ready(function(){

	$('#btn_save').on('click', function(){
		if($('#sms_remote_msg').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}
			
		$('form').submit();
	});
});
</script> 
<script>
function win_open(url){
	window.open(url, "", "width=1200px, height=800px, resizable=yes, scrollbars=yes");
}
function win_close(){
	parent.location.reload();
	window.close();
}
</script>
</head>

<body>

	<form name="form" action="/crm/search/sms_send.do" method="POST" enctype="multipart/form-data">
	
	<input type="hidden" name="searchOrder" value="${vo.searchOrder}"/>
	<input type="hidden" name="searchExcel" value="${vo.searchExcel}"/>
	<input type="hidden" name="searchUserName" value="${vo.searchUserName}"/>
	<input type="hidden" name="searchUserAddr" value="${vo.searchUserAddr}"/>
	
	<input type="hidden" name="searchUserPosition" value="${vo.searchUserPosition}"/>
	<input type="hidden" name="searchUserEtc" value="${vo.searchUserEtc}"/>
	<input type="hidden" name="searchSosoc" value="${vo.searchSosoc}"/>
	<input type="hidden" name="searchEvtName" value="${vo.searchEvtName}"/>
	
	<input type="hidden" name="searchArea" value="${vo.searchArea}"/>
	<input type="hidden" name="searchSdate" value="${vo.searchSdate}"/>
	<input type="hidden" name="searchEdate" value="${vo.searchEdate}"/>
	<input type="hidden" name="searchMngName" value="${vo.searchMngName}"/>
	<input type="hidden" name="searchRegName" value="${vo.searchRegName}"/>
	<input type="hidden" name="searchOrgList" value="${vo.searchOrgList}"/>
	<input type="hidden" name="searchEvtThemeList" value="${vo.searchEvtThemeList}"/>
	<input type="hidden" name="searchNewsLetter" value="${vo.searchNewsLetter}"/>
	<input type="hidden" name="searchCountry" value="${vo.searchCountry}"/>
	<input type="hidden" name="searchNum" value="${vo.searchNum}"/>

	<input type="hidden" name="sms_remote_num" value="${vo.sms_remote_num}"/>
	<input type="hidden" name="sms_remote_phone" value="${vo.sms_remote_phone}"/>

	<div style="padding-left:20px;">
		<h5 class="s_tit">
		<c:if test="${vo.searchExcel=='select'}">선택항목</c:if>
		<c:if test="${vo.searchExcel=='search'}">검색항목</c:if>
		<c:if test="${vo.searchExcel=='all'}">전체</c:if>
		 문자보내기</h5>
		<font color="#990000">
		* 내용 입력시 80 Bytes 이상 적으시면 발송이 안됩니다. 참고하시기 바랍니다.<br/>
		* 100명 이상 문자 전송시 속도가 지연될수도 있으므로 유의하시기 바랍니다.<br/>
		* 휴대전화번호가 없으면 전송갯수에서 제외됩니다.
		</font><br>
		<br>
		* 전체  : ${vo.sms_remote_num}명
	</div>
	

<script>
$(document).ready(function(){
	$("#sms_remote_msg").val( $("#basic_msg").val() );
});
</script>

	<div class="mobile_sms">
		<input type="hidden" name="basic_msg" id="basic_msg" value="하이코에서 알려드립니다." />
		
		<div><img src="http://dtc.or.kr/develop/image/sms_top.gif" /></div>
		<div  class="texting_area" align="center">
			<textarea name="sms_remote_msg" id="sms_remote_msg" cols="16" rows="5" style="" onKeyUp="checkSmsContent(this)" onChange="checkSmsContent(this)"></textarea>
		</div>
	
		<div class="bytes">
			<input type="text" name="contentLen" style="width:20px; text-align:right; border:0; font-size:8pt; font-style:verdana;" value="0" readonly><font class=ver8 color=262626>/80 Bytes</font>
		</div>
	
	
			<!-- 
			<tr>
				<th scope="row">수신자 선택</th>
				<td class="left">
		
					<font color="#262626">받는사람</font><br/>
					<textarea name="receiveNumber" style="overflow:visible; width:130px;" class="box"></textarea>
					(숫자만 기입하십시요)
		
				</td>
			</tr>
		
			<tr>
				<th scope="row">관리자 번호</th>
				<td class="left">
		
					<input type="text" name="sendNumber" class="type-text1" value="" onKeyPress="blockNotNumber(event)" onKeyUp="numberOnly(this)" onBlur="numberOnly(this)">
		
				</td>
			</tr>
			 -->
	
			<div class="search_new_btn">
				<a href="javascript:;" class="btn1 clr_Wgray" id="btn_save">문자보내기</a>
				<a href="javascript:;" class="btn1 clr_Wgray" onclick="javasciprt:win_close();">닫기</a>
			</div>
		
	</div>
	
	</form>

</body>
</html>