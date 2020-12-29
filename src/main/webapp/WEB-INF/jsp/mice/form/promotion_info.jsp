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
		location.href='/cvb/form/promotion_edit.do?idx=${param.idx}&form_type=${param.form_type}';
	});
 
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/cvb/form/promotion_delete.do?idx=${param.idx}');
	});
 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});


</script>
<section id="contentArea">
	<h3>지원관리 <span>></span> <c:choose><c:when test="${result.form_type == 0 }">홍보물신청관리</c:when><c:when test="${result.form_type == 1 }">진행요원주선신청관리</c:when></c:choose> <span>></span> 조회</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>

		<h5>주최자</h5>

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
							${d:decrypt(result.organization_name_ko)}
						</td>
					</tr>
					<tr>
						<th scope="row">담당자명</th>
						<td class="left">
							${d:decrypt(result.manager_name)}
						</td>
					</tr>
					<tr>
						<th scope="row">직위</th>
						<td class="left">
							${d:decrypt(result.manager_class)}
						</td>
					</tr>
					<tr>
						<th scope="row">전화</th>
						<td class="left">
							${d:decrypt(result.manager_tel_no)} 
						</td>
					</tr>
					<tr>
						<th scope="row">팩스</th>
						<td class="left">
							${d:decrypt(result.organization_fax_no)} 
						</td>
					</tr>
					<tr>
						<th scope="row">휴대전화</th>
						<td class="left">
							${d:decrypt(result.manager_phone_no)} 
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="left">
							${d:decrypt(result.manager_email)} 
						</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td class="left">
							${d:decrypt(result.organization_address)} 
						</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td class="left">
							${d:decrypt(result.organization_zip_code)} 
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							${d:decrypt(result.organization_homepage)} 
						</td>
					</tr>
					<c:if test="${result.form_type == 0}">
					<tr>
						<th scope="row">홍보물 종류</th>
						<td class="left">
							${result.promotion_type} 
						</td>
					</tr>
					</c:if>
					<c:if test="${result.form_type == 1}">
					<tr>
						<th scope="row">필요 진행요원</th>
						<td class="left">
							${result.require_member_cnt} 
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
						<a id="btnEdit" role="button" class="btn1 clr_Wgray">수정</a>
					
						<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
					
					<a href="<c:url value='/cvb/form/promotion_list.do?form_type=${param.form_type}'/>" role="button" class="btn1 clr_Wgray">목록</a>
                    </sec:authorize>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>