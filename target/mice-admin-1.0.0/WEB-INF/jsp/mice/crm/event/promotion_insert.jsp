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

<title>상 담 내 역</title>

<script type="text/javascript">
	$(document).ready(function(){
		$('.datepicker').each(function () {
            $(this).datepicker({
              //showOn: "button",
              //buttonImage: "images/btn_cal.png",
              buttonImageOnly: true,
              //buttonText: "날짜 선택",
              buttonClass: "find_date",
              dateFormat: "yy-mm-dd",
              dayNames: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
              dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
              dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
              monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
              monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
              prevText: "이전달",
              nextText: "다음달",
              showOtherMonths: true,
              showMonthAfterYear: true,
		      changeMonth : true,
		      changeYear : true,
              beforeShowDay: function (day, year) {
                var result;
                switch (day.getDay()) {
                  case 0: // 일요일?
                    result = [true, "ui-date-sunday"];
                    break;
                  case 6: // 토요일?
                    result = [true, "ui-date-saturday"];
                    break;
                  default:
                    result = [true, ""];
                    break;
                }
                return result;
              }
            });
            $('.ui-datepicker-calendar > thead td.ui-datepicker-week-end:last-child a').addClass('ui-date-saturday');
          });    
		
		$('#btn_file_add').on('click',function(){
			$('#file_tag_div').append('<p><input name="attach_file" type="file" style="width:80%;"/> <a class="btn1 clr_Wgray" onclick="javascript:file_append_cancel(this);">삭제</a></p>');
		});
		
		$('#btn_save').on('click', function(){
			if($('#comment').val() == ''){
				alert('내용을 입력해주세요.');
				return false;
			}
				
			$('form').submit();
		});
	});
	
	function file_append_cancel(obj){
		$(obj).parent().remove();
	}
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


<form name="form" action="/crm/event/promotion_insert_action.do" method="POST" enctype="multipart/form-data">
<input name="parent_idx" type="hidden" value="${param.idx }"/>
<input name="redirect_url" type="hidden" value="${param.redirect_url}"/>
<input name="promotion_type" type="hidden" value="${param.promotion_type}"/>

<div class="auto wd95per">

	<h5 class="s_tit">현황입력<h5>
	
	<table class="adm_tbl2">
	<caption>상세</caption>
		<colgroup>
			<col width="27%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">이름</th>
				<td class="left">${d:decrypt(loginVO.name) }(${loginVO.id })</td>
			</tr>
			
			<c:if test="${param.promotion_type =='O'}">
			<input name="promotion_type2" type="hidden" value="${param.promotion_type}"/>
			</c:if>
			<c:if test="${param.promotion_type =='E'}">
			<tr>
				<th scope="row">상담형태</th>
				<td class="left">
					<!-- 
					<c:import url="/crm/code/select_box2.do" charEncoding="utf-8">
						<c:param name="name" value="promotion_type2__" />
						<c:param name="type" value="상담형태" />
						<c:param name="result" value="${param.promotion_type}"/>
						<c:param name="searchInList" value="E"/>
					</c:import> 
					 -->  
					
					<input name="promotion_type2" type="hidden" value="ETM"/>대관관리(TM)
							                
				</td>
			</tr>
			</c:if>				
			
			<tr>
				<th scope="row">입력일</th>
				<td><input type="text" class="datepicker" name="input_date" readonly value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />"/></td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td><textarea name="comment" id="comment" style="width:100%" rows="10"></textarea></td>
			</tr>
			<tr>
				<th scope="row">파일</th>
				<td class="left">
					<div id="file_tag_div">
						<p><input name="attach_file" type="file" style="width:80%;"/> <a class="btn1 clr_Wgray" id="btn_file_add">추가</a></p>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="search_new_btn" class="pt20">
		<a class="btn1 clr_Wgray" id="btn_save">저장</a>
		<a class="btn1 clr_Wgray" onclick="javasciprt:win_close();">닫기</a>
	</div>

</form>

<!-- 180117 --></div><!-- //180117 -->
</body>
</html>