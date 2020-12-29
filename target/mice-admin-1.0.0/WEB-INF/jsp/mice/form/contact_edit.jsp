<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">

	
$(document).ready(function(){
	$('#btnSave').on('click',function(){
		$('form').submit();
	});
	
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}
</script>
<section id="contentArea">
	<h3>지원관리 > HICO Contact관리> 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/hico/form/contact_edit_action.do">
		<input type="hidden" name="idx" value="${result.idx }" />
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1">
				<caption>상세</caption>
				<colgroup>
					<col width="10%">
					<col width="90%">
				</colgroup>
				<tbody>
					<tr style="fore-color:red">
						<th scope="row">처리여부</th>
						<td>
							<select name="confirm_status">
								<option value="대기" <c:if test="${result.confirm_status eq '대기'}">selected</c:if>>대기</option>
								<option value="완료" <c:if test="${result.confirm_status eq '완료'}">selected</c:if>>완료</option>
								<option value="취소" <c:if test="${result.confirm_status eq '취소'}">selected</c:if>>취소</option>
							</select>
						</td>
					</tr>
				</tbody>
		</table>
		<div style="padding-top:15px;padding-bottom:5px;"><b style="font-size:18px">문의내용</b></div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1">
			<caption>상세</caption>
				<colgroup>
					<col width="10%">
					<col width="90%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">실무자</th>
						<td>
							<c:out value="${d:decrypt(result.manager_name)}" />
						</td>
					</tr>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<c:out value="${d:decrypt(result.requester_email)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">문의내용</th>
						<td>
							<c:out value="${result.comment }" />
						</td>
					</tr>
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/hico/form/contact_list.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/hico/form/contact_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>