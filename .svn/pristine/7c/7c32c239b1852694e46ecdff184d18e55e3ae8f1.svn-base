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
		$('#btn_delete').on('click',function(){
			if(!confirm('삭제하시겠습니까?'))
				return false;
			$("input[name=redirect_url]").val( $("input[name=redirect_url2]").val() );
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

function deletePromotionFile(obj, delete_idx){
	$.ajax({
	    type: "POST",
	    url: "/crm/promotion/delete_attach_file.do",
	    data: {
	        idx : delete_idx
	    },
	    success: function (response) {
	    	$(obj).parent().remove();
	    	location.reload();
	    }
	});
}
</script>
</head>


<body>

	<h5 class="s_tit">상담내역<h5>
	
	<table class="adm_tbl2">
		<caption>상세</caption>
		<colgroup>
			<col width="27%">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">이름</th>
				<td class="left">${d:decrypt(result.user_nm) }</td>
			</tr>
			<tr>
				<th scope="row">입력일</th>
				<td class="left">${fn:substring(result.reg_date,0,10) }</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td class="left">
					<c:import url="/crm/promotion/attach_file_list.do" charEncoding="utf-8">
						<c:param name="promotion_idx" value="${result.idx }" />
					</c:import>
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td class="left">
					<pre >${result.comment }</pre>
					<form name="form" action="/crm/event/promotion_delete_action.do">
						<input name="idx" type="hidden" value="${result.idx }"/>
						<input name="parent_idx" type="hidden" value="${result.parent_idx}"/>
						<input name="redirect_url" type="hidden" value="${param.redirect_url}"/>
						<input name="redirect_url2" type="hidden" value="${fn:replace(param.redirect_url,'||','&')}"/>
					</form>
				</td>
			</tr>
		</tbody>
	</table>


	<div class="search_new_btn ">
		<c:if test="${ fn:substring(result.promotion_type,0,1) == 'I' }">
		<a href="/crm/event/promotion_edit.do?idx=${result.idx}&today=${toDay}&promotion_type=${result.promotion_type}&redirect_url=${param.redirect_url}" class="nyroModal btn1 clr_Wgray">수정</a>
		</c:if>
		<c:if test="${fn:substring(result.promotion_type,0,1) !='I'}">
		<a href="/crm/event/promotion_edit.do?idx=${result.idx}&today=${toDay}&promotion_type=${param.promotion_type}&redirect_url=${param.redirect_url}" class="btn1 clr_Wgray">수정</a>
		</c:if>
		
		
		<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
			<a id="btn_delete" class="btn1 clr_Wgray">삭제</a>
		</sec:authorize>
		<c:if test="${ fn:substring(result.promotion_type,0,1) == 'I' }">
		<a class="btn1 clr_Wgray" onclick="javasciprt:location.reload();">닫기</a>
		</c:if>
		<c:if test="${fn:substring(result.promotion_type,0,1) !='I'}">
		<a onclick="javascript:win_close();" class="btn1 clr_Wgray">닫기</a>
		</c:if>
		
	</div>

</body>
</html>
