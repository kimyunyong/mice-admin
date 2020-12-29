<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">

	
$(document).ready(function(){
	$('#btnEdit').on('click',function(){
		location.href='/hico/form/contact_edit.do?idx=${param.idx}';
	});
 
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/hico/form/contact_delete.do?idx=${param.idx}');
	});
 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});


</script>
<section id="contentArea">
	<h3>지원관리 > HICO Contact > 조회</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<div style="padding-bottom:5px;"><b style="font-size:18px">주최자</b></div>
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
					<tr>
						<th scope="row">이메일</th>
						<td>
							<c:out value="${d:decrypt(result.requester_email)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">문의내용</th>
						<td>
							<c:out value="${result.comment}" />
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
						<a id="btnEdit" role="button" class="btn1 clr_Wgray">수정</a>
					</sec:authorize>
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
						<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
					</sec:authorize>
					<a href="<c:url value='/hico/form/contact_list.do' />" role="button" class="btn1 clr_Wgray">목록</a>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>