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
		location.href='/cvb/form/rfp_edit.do?idx=${param.idx}';
	});
 
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/cvb/form/rfp_delete.do?idx=${param.idx}');
	});
 

});


</script>
<section id="contentArea">
	<h3>지원관리 <span>></span> RFP관리 > 조회</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>

		<h5>행사정보</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">행사명</th>
						<td class="left">
							${result.event_name}
						</td>
					</tr>
					<tr>
						<th scope="row">행사종류</th>
						<td class="left">
							${result.event_type}
						</td>
					</tr>
					<tr>
						<th scope="row">참가규모</th>
						<td class="left">
							${result.join_national_cnt} 개국(한국포함) ${result.join_member_cnt}명
						</td>
					</tr>
					<tr>
						<th scope="row">행사일자</th>
						<td class="left">
							${result.st_event_date} ~ ${result.ed_event_date} 
						</td>
					</tr>
					<tr>
						<th scope="row">Venue</th>
						<td class="left">
							${result.venue} 
						</td>
					</tr>
					<tr>
						<th scope="row">수용인원</th>
						<td class="left">
							${result.meeting_room_member_cnt} 
						</td>
					</tr>
					<tr>
						<th scope="row">셋업형태</th>
						<td class="left">
							${result.meeting_room_type} 
						</td>
					</tr>
					<tr>
						<th scope="row">총 필요<br class="mobile_show">회의실 수</th>
						<td class="left">
							${result.meeting_room_cnt} 
						</td>
					</tr>
					<tr>
						<th scope="row">전시장<br class="mobile_show">사용여부</th>
						<td class="left">
							${result.use_exhibition} 
						</td>
					</tr>
					<tr>
						<th scope="row">전시장<br class="mobile_show">필요규모</th>
						<td class="left">
							${result.exhibition_size} 
						</td>
					</tr>
					<tr>
						<th scope="row">기간</th>
						<td>
							${result.checkin_day} 
						</td>
					</tr>
					<tr>
						<th scope="row">1일평균</th>
						<td class="left">
							${result.checkin_member} 명, Peak Night ${result.checkin_night_member} 
						</td>
					</tr>
					<tr>
						<th scope="row">가격대</th>
						<td class="left">
							${result.meeting_room_member_cnt} 
						</td>
					</tr>
					<tr>
						<th scope="row">가격대</th>
						<td class="left">
							${result.checkin_price} 원 이하 
						</td>
					</tr>
					<tr>
						<th scope="row">기타<br class="mobile_show">요청사항</th>
						<td class="left">
							${result.checkin_etc_text} 
						</td>
					</tr>
					<tr>
						<th scope="row">프로그램<br class="mobile_show">첨부</th>
						<td class="left">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.checkin_file_id}" />
							</c:import> 
						</td>
					</tr>
				</tbody>
			</table>

<h5>주최자</h5>



		<table  class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">기관(단체)명</th>
						<td class="left">
							${d:decrypt(result.organization_name)}
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
							${d:decrypt(result.organization_addr)}
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
				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
						<a id="btnEdit" role="button" class="btn1 clr_Wgray">수정</a>
						<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
					</sec:authorize>
					<a href="<c:url value='/cvb/form/rfp_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>