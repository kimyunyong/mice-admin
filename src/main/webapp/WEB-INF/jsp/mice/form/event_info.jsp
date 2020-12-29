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
		location.href='/cvb/form/event_edit.do?idx=${param.idx}';
	});
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/cvb/form/event_delete.do?idx=${param.idx}');
	});

 
 
});


</script>
<section id="contentArea">
	<h3>지원관리 > 행사등록관리</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<h5>행사정보</h5>



		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col >
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">행사명</th>
						<td class="left">
							<c:out value="${result.event_name_ko}" />
						</td>
					</tr>
					<tr>
						<th scope="row">행사종류</th>
						<td class="left">
							<c:out value="${result.event_type}" />
						</td>
					</tr>
					<tr>
						<th scope="row">행사기간</th>
						<td class="left">
							<c:out value="${result.st_event_date}" /> ~ <c:out value="${result.ed_event_date}" />
						</td>
					</tr>
					<tr>
						<th scope="row">장소</th>
						<td class="left">
							<c:out value="${d:decrypt(result.location_addr)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">참가규모</th>
						<td class="left">
							<c:out value="${result.join_national_cnt}" /> 개국(한국포함) <c:out value="${result.join_member_cnt }" /> 여명
						</td>
					</tr>
					<tr>
						<th scope="row">주최기관</th>
						<td class="left">
							<c:out value="${d:decrypt(result.host_organizer_name) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">관련국제기구</th>
						<td class="left">
							<c:out value="${d:decrypt(result.organizer_name)}" /> / <c:out value="${d:decrypt(result.organizer_homepage)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">행사홈페이지</th>
						<td class="left">
							<c:out value="${d:decrypt(result.event_homepage) }" />
						</td>
					</tr>
					<tr>
						<th scope="row">이미지</th>
						<td class="left">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_id}" />
							</c:import>
						</td>
					</tr>
					<tr>
						<th scope="row">행사개요</th>
						<td class="left">
							
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.event_doc_file_id}" />
							</c:import>
						</td>
					</tr>
			</tbody>
		</table>
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
							<c:out value="${d:decrypt(result.organizer_ko)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">담당자명</th>
						<td class="left">
							<c:out value="${d:decrypt(result.manager_name)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">직위</th>
						<td class="left">
							<c:out value="${d:decrypt(result.manager_class)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">전화</th>
						<td class="left">
							<c:out value="${d:decrypt(result.manager_tel_no)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">팩스</th>
						<td class="left">
							<c:out value="${d:decrypt(result.host_organizer_fax_no)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">휴대전화</th>
						<td class="left">
							<c:out value="${d:decrypt(result.manager_phone_no)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="left">
							<c:out value="${d:decrypt(result.manager_email)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td class="left">
							<c:out value="${d:decrypt(result.host_organizer_addr)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td class="left">
							<c:out value="${d:decrypt(result.host_organizer_zip_code)}" />
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							<a href="<c:url value="${d:decrypt(result.host_organizer_homepage)}" />" target="blank"><c:out value="${d:decrypt(result.host_organizer_homepage)}" /></</a>
						</td>
					</tr>
				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
						<a id="btnEdit" role="button" class="btn1 clr_Wgray">수정</a>
						<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>			
						<a href="<c:url value='/cvb/form/event_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
                    </sec:authorize>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>