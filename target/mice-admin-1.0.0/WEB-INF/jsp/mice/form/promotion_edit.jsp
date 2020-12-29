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
	<h3>지원관리 <span>></span> <c:choose><c:when test="${result.form_type == 0 }">홍보물신청관리</c:when><c:when test="${result.form_type == 1 }">진행요원주선신청관리</c:when></c:choose>> 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/cvb/form/promotion_edit_action.do">
		<input type="hidden" name="idx" value="${result.idx }" />
		<input type="hidden" name="site" value="${result.site }" />
		<input type="hidden" name="form_type" value="${result.form_type }" />
		<table class="adm_tbl2">
				<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">처리여부</th>
						<td class="left">
							<select name="confirm_status">
								<option value="대기" <c:if test="${result.confirm_status eq '대기'}">selected</c:if>>대기</option>
								<option value="완료" <c:if test="${result.confirm_status eq '완료'}">selected</c:if>>완료</option>
								<option value="취소" <c:if test="${result.confirm_status eq '취소'}">selected</c:if>>취소</option>
							</select>
						</td>
					</tr>
				</tbody>
		</table>
		<h5 class="s_tit">주최자</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">기관(단체)명</th>
						<td class="left">
							<input name="organization_name_ko" value="${d:decrypt(result.organization_name_ko)}"/>
						</td>
					</tr>
					</tr>
					<tr>
						<th scope="row">담당자명</th>
						<td class="left">
							<input name="manager_name" value="${d:decrypt(result.manager_name)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">직위</th>
						<td class="left">
							<input name="manager_class" value="${d:decrypt(result.manager_class)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">전화</th>
						<td class="left">
							<input name="manager_tel_no" value="${d:decrypt(result.manager_tel_no)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">팩스</th>
						<td class="left">
							<input name="organization_fax_no" value="${d:decrypt(result.organization_fax_no)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">휴대전화</th>
						<td class="left">
							<input name="manager_phone_no" value="${d:decrypt(result.manager_phone_no)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="left">
							<input name="manager_email" value="${d:decrypt(result.manager_email)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td class="left">
							<input name="organization_address" value="${d:decrypt(result.organization_address)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td class="left">
							<input name="organization_zip_code" value="${d:decrypt(result.organization_zip_code)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							<input name="organization_homepage" value="${d:decrypt(result.organization_homepage)}"/>
						</td>
					</tr>
					<c:if test="${result.form_type == 0 }">
					<tr>
						<th scope="row">홍보물 종류</th>
						<td class="left">
							<input name="promotion_type" value="${result.promotion_type}"/>
						</td>
					</tr>
					</c:if>
					<c:if test="${result.form_type == 1 }">
					<tr>
						<th scope="row">필요<br class="mobile_show">진행요원</th>
						<td class="left">
							<input name="require_member_cnt" value="${result.require_member_cnt}"/>
						</td>
					</tr>
					</c:if>
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/cvb/form/promotion_list.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/cvb/form/promotion_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>