<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h3>지원관리 ,<span>></span> 행사등록관리 <span>></span> 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" action="/cvb/form/event_edit_action.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${result.idx }" />
		<input type="hidden" name="site" value="${result.site }" />
		<table class="adm_tbl2">
				<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col >
				</colgroup>
				<tbody>
					<tr style="fore-color:red">
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
		<h5 class="s_tit ">행사정보</h5>
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
							<input type="text" name="event_name_ko" value="<c:out value="${result.event_name_ko}" />"/>
						</td>
					</tr>
					<tr style="display:none">
						<th scope="row">행사명(영문)</th>
						<td class="left">
							<input type="text" name="event_name_en" value="<c:out value="${result.event_name_en}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">행사종류</th>
						<td class="left">
							<select name="event_type">
                                <option value="컨벤션" <c:if test="${result.event_type eq '컨벤션'}">selected</c:if>>컨벤션</option>
                                <option value="전시회" <c:if test="${result.event_type eq '전시회'}">selected</c:if>>전시회</option>
                                <option value="이벤트" <c:if test="${result.event_type eq '이벤트'}">selected</c:if>>이벤트</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">행사기간</th>
						<td class="left">
							<input type="text" class="datepicker wd35per" name="st_event_date" value="<c:out value="${result.st_event_date}" />" readonly /> ~ <input type="text" class="datepicker wd35per" name="ed_event_date" value="<c:out value="${result.ed_event_date}" />" readonly/>
						</td>
					</tr>
					<tr>
						<th scope="row">장소</th>
						<td class="left">
							<input type="text" name="location_addr" value="<c:out value="${d:decrypt(result.location_addr)}" />" style="width:784px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">참가규모</th>
						<td class="left">
							<input type="text" name="join_national_cnt" class="wd35per" value="<c:out value="${result.join_national_cnt}" />"/> 개국(한국포함) <input type="text" name="join_member_cnt" class="wd35per" value="${result.join_member_cnt }" /> 여명
						</td>
					</tr>
					<tr>
						<th scope="row">주최기관</th>
						<td class="left">
							<input type="text" name="host_organizer_name" value="<c:out value="${d:decrypt(result.host_organizer_name) }" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">관련<br class="mobile_show">국제기구</th>
						<td class="left">
							<input type="text" name="organizer_name" value="<c:out value="${d:decrypt(result.organizer_name)}" />"/> / <input type="text" name="organizer_homepage" value="<c:out value="${d:decrypt(result.organizer_homepage)}" />" style="width:784px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">행사<br class="mobile_show">홈페이지</th>
						<td class="left">
							<input type="text" name="event_homepage" value="<c:out value="${d:decrypt(result.event_homepage) }" />" style="width:784px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이미지</th>
						<td id="image_file_tag">
							<c:if test="${result.image_file_id != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_id}" />
							</c:import>
							<input type="hidden" name="image_file_id" value="${result.image_file_id}"/>
							<button onclick="deleteNsetInputFileTag(this, 'image_file_tag', 'image_file');return false;">삭제</button>
							</c:if>
							<c:if test="${result.image_file_id == ''}">
							<input type="hidden" name="image_file" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">행사개요</th>
						<td id="doc_file_tag">
							<c:if test="${result.event_doc_file_id != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.event_doc_file_id}" />
							</c:import>
							<input type="hidden" name="event_doc_file_id" value="${result.event_doc_file_id}"/>
							<button onclick="deleteNsetInputFileTag(this, 'doc_file_tag', 'event_doc_file');return false;">삭제</button>
							</c:if>
							<c:if test="${result.event_doc_file_id == ''}">
							<input type="file" name="event_doc_file" />
							</c:if>
						</td>
					</tr>
			</tbody>
		</table>
		<h5 class="s_tit ">주최자</h5>
		<table class="adm_tbl2">
				<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col >
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">기관(단체)명</th>
						<td class="left">
							<input type="text" name="organizer_ko" value="<c:out value="${d:decrypt(result.organizer_ko)}" />"/>
							<input type="hidden" name="organizer_en" value="<c:out value="${d:decrypt(result.organizer_en)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">담당자명</th>
						<td class="left">
							<input type="text" name="manager_name" value="<c:out value="${d:decrypt(result.manager_name)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">직위</th>
						<td class="left">
							<input type="text" name="manager_class" value="<c:out value="${d:decrypt(result.manager_class)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">전화</th>
						<td class="left">
							<input type="text" name="manager_tel_no" value="<c:out value="${d:decrypt(result.manager_tel_no)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">팩스</th>
						<td class="left">
							<input type="text" name="host_organizer_fax_no" value="<c:out value="${d:decrypt(result.host_organizer_fax_no)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">휴대전화</th>
						<td class="left">
							<input type="text" name="manager_phone_no" value="<c:out value="${d:decrypt(result.manager_phone_no)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="left">
							<input type="text" name="manager_email" value="<c:out value="${d:decrypt(result.manager_email)}" />" style="width:148px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td class="left">
							<input type="text" name="host_organizer_addr" value="<c:out value="${d:decrypt(result.host_organizer_addr)}" />" />
						</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td class="left">
							<input type="text" name="host_organizer_zip_code" value="<c:out value="${d:decrypt(result.host_organizer_zip_code)}" />"/>
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							<input type="text" name="host_organizer_homepage" value="<c:out value="${d:decrypt(result.host_organizer_homepage)}" />" style="width:784px"/>
						</td>
					</tr>
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/cvb/form/event_list.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/cvb/form/event_list.do' />" role="button" class="btn1 clr_Wgray">목록</a>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>