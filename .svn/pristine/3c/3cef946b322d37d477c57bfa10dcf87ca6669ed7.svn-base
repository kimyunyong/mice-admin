<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		document.form.submit();
	});
});

function deleteOpinion(element, idx){
	if (confirm("삭제 하시겠습니까?") == true){
		$.ajax({
	        url:'/crm/invite/deleteOpinion.do',
	        type:'get',
	        dataType: 'json',
	        data:{idx:idx},
	        success:function(data){
	        	alert("삭제 완료");
		        element.parentNode.parentNode.remove();
	        }
	    });
	}else{
	    return;
	}
}

function append_file_tag(tag, idx){
	$('#' + tag).append('<li><input name="' + tag + '" type="file" /><button class="btn2 clrGrad_Wgray" onclick="javascript:remove_file_tag(this);return false;">삭제</button></li>')	
}

function remove_file_tag(obj){
	$(obj).parent().remove();
}

function deletePromotionFile(element, file_id){
	if (confirm("삭제 하시겠습니까?") == true){
		$.ajax({
	        url:'/crm/invite/deleteFile.do',
	        type:'get',
	        dataType: 'json',
	        data:{file_id:file_id},
	        success:function(data){
	        	if(data != null){
	        		alert("삭제 완료");
		        	element.parentNode.remove();
	        	}
	        }
	    });
	}else{
	    return;
	}
}

</script>

<style>
	.search_new_btn{margin: 30px auto; width: 120px;}
</style>
<body>
	<!-- 상담내역 -->
<!-- adm_tbl2 -->
<form action="/crm/invite/insertOpinion.do" method="post" name="form" enctype="multipart/form-data">
<input type="hidden" name="parent_idx" value="${param.idx }" />
<input type="hidden" name="customer_idx" value="${param.customer_idx }" />

			<h5 class="s_tit">상담내역</h5><!-- 180104 -->

<table class="adm_tbl2" >
	<caption>상세</caption>
		<colgroup>
			<col width="27%">
			<col><!-- 180104 -->
		</colgroup>
		<tbody>

			<tr>
				<th scope="row">입력일</th>
				<td class="left">
					<input type="text" name="input_date" class="datepicker"/>
				</td>
			</tr>
				<tr>
				<th scope="row">상담형태</th>
				<td class="left">
					<select name="opinion_type" title="상담형태">
				    		<option value="TM">TM</option>
				    		<option value="방문">방문</option>
				    		<option value="답사">답사</option>
				    		<option value="DM">DM</option>
				    		<option value="EDM">EDM</option>
			      	</select>
				</td>
			</tr>
			
			<tr>
				<th scope="row">내용</th>
				<td class="left">
					<textarea style="height:200px; width:100%;" name="comment"></textarea>
				</td>
			</tr>
				
			<tr>
				<th scope="row">파일</th>
				<td class="left">
					<ul id="opinion_attach_file">
						<li><input name="opinion_attach_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('opinion_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>
				</td>
			</tr>
		
		</tbody>
</table>
<!-- //adm_tbl2 -->

<!-- //상담내역 -->

<!-- 버튼 위치(s) -->
<div class="btn_area"><!-- 180104 -->
	<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
	<a onclick="javascript:window.close();" role="button" class="btn1 clr_Wgray">닫기</a>
</div>
<!--// 버튼 위치(e) -->
</form>

<!-- adm_tbl2 -->
<table class="adm_tbl2" width="100%" style="margin-bottom: 60px;">
	<caption>상세</caption>
	<colgroup>
		<col width="20%">
		<col width="45%">
		<col width="25%">
	</colgroup>
	<thead>
	<tr>
		<th>날짜</th>
		<th>내용</th>
		<th>첨부</th>
	</tr>
	</thead>

	<tbody>
		<c:forEach var="opinion" items="${opinionList }">
			<tr>
				<th scope="row">${opinion.input_date }</th>
				<td class="left"><pre><a href="/crm/event/promotion_info.do?idx=${opinion.idx}&today=${toDay}&redirect_url2=/crm/promotion/list.do&redirect_url=${requestScope['javax.servlet.forward.request_uri']}?idx=${param.idx}||customer_idx=${param.customer_idx}" class="nyroModal">${opinion.comment }</a></pre></td>
				<td class="left">
					<c:import url="/crm/promotion/attach_file_list.do" charEncoding="utf-8">
						<c:param name="promotion_idx" value="${opinion.idx }" />
					</c:import>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
		<!-- //adm_tbl2 -->

<!-- //지원내역 -->
</body>
</html>