<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<c:set var="venue" value="${result.venue }"/>
<c:set var="venue" value="${fn:replace(venue,'컨벤션센터','')}"/>
<c:set var="venue" value="${fn:replace(venue,'특1급호텔','')}"/>
<c:set var="venue" value="${fn:replace(venue,'특2급호텔','')}"/>
<c:set var="venue" value="${fn:replace(venue,'1급호텔','')}"/>
<c:set var="venue" value="${fn:replace(venue,'2급호텔','')}"/>
<c:set var="venue" value="${fn:replace(venue,'3급호텔','')}"/>
<c:set var="venue" value="${fn:replace(venue,'콘도미니엄','')}"/>
<c:set var="venue" value="${fn:replace(venue,',','')}"/>


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

	$('#chk_use').change(function(){
		if($(this).is(':checked') == true){
			$('input[name=use_exhibition]').val('사용');
			$('#chk_no_use').attr('checked', false);
		}
	});
	
	$('#chk_no_use').change(function(){
		if($(this).is(':checked') == true){
			$('input[name=use_exhibition]').val('사용');
			$('#chk_use').attr('checked', false);
		}
	});
	
	$('input[name=venue_chk]').change(function(){
		$('input[name=venue]').val(venue_txt());
		venue_etc_txt($('input[name=venue_text]'));
	});	
	
	$('input[name=venue_text]').keyup(function(){

		venue_etc_txt(this);
	});
	
	var venue_txt =  function(){
		var res = "";
		$('input[name=venue_chk]').each(function(i){
			if($(this).is(':checked') == true)
				if(res.length > 0)
					res += "," + $(this).val();
				else
					res += $(this).val();
		});
		return res;
	}

	var venue_etc_txt = function(obj){
		var temp = venue_txt();
		var venue_text = $(obj).val();
		
		temp = temp.length > 0 && venue_text.length > 0 ? temp + ',' + venue_text  : temp.length == 0 && venue_text.length > 0 ? venue_text : temp;
		$('input[name=venue]').val(temp )
	}
	
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}
</script>
<section id="contentArea">
	<h3>지원관리 <span>></span> RFP관리 <span>></span> 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/cvb/form/rfp_edit_action.do" enctype="multipart/form-data">
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
		<h5 class="s_tit">행사정보</h5>
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
							<input name="event_name" value="${result.event_name}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">행사종류</th>
						<td class="left">
							<select name="event_type">
								<option value="학회" <c:if test="${result.event_type eq '학회'}">selected</c:if>>학회</option>
                                <option value="협회" <c:if test="${result.event_type eq '협회'}">selected</c:if>>협회</option>
                                <option value="기업" <c:if test="${result.event_type eq '기업'}">selected</c:if>>기업</option>
                                <option value="정부" <c:if test="${result.event_type eq '정부'}">selected</c:if>>정부</option>
                                <option value="연구원" <c:if test="${result.event_type eq '연구원'}">selected</c:if>>연구원</option>
                                <option value="기타" <c:if test="${result.event_type eq '기타'}">selected</c:if>>기타</option>
                            </select>
							
						</td>
					</tr>
					<tr>
						<th scope="row">참가규모</th>
						<td class="left">
							<input name="join_national_cnt" value="${result.join_national_cnt}" class="wd30per"/> 개국(한국포함) <input name="join_member_cnt" value="${result.join_member_cnt}"  class="wd30per"/>명
						</td>
					</tr>
					<tr>
						<th scope="row">행사일자</th>
						<td class="left">
							<input name="st_event_date" class="datepicker wd30per" value="${result.st_event_date}" /> ~ <input name="ed_event_date" class="datepicker wd30per" value="${result.ed_event_date}"/> 
						</td>
					</tr>
					<tr>
						<th scope="row">Venue</th>
						<td class="left">
							<div>
								<input type="checkbox" name="venue_chk" value="컨벤션센터" <c:if test="${fn:contains(result.venue,'컨벤션센터')}">checked</c:if>/>
								<label for="" class="mr15">컨벤션센터</label>
								<input type="checkbox" name="venue_chk" value="특1급호텔" <c:if test="${fn:contains(result.venue,'특1급호텔')}">checked</c:if>/>
								<label for="" class="mr15">특1급호텔</label>
								<input type="checkbox" name="venue_chk" value="특2급호텔" <c:if test="${fn:contains(result.venue,'특2급호텔')}">checked</c:if>/>
								<label for="" class="mr15">특2급호텔</label>
								<input type="checkbox" name="venue_chk" value="1급호텔" <c:if test="${fn:contains(result.venue,'1급호텔')}">checked</c:if>/>
								<label for="" class="mr15">1급호텔</label>
								<input type="checkbox" name="venue_chk" value="2급호텔" <c:if test="${fn:contains(result.venue,'2급호텔')}">checked</c:if>/>
								<label for="" class="mr15">2급호텔</label>
								<input type="checkbox" name="venue_chk" value="3급호텔" <c:if test="${fn:contains(result.venue,'3급호텔')}">checked</c:if>/>
								<label for="" class="mr15">3급호텔</label>
								<input type="checkbox" name="venue_chk" value="콘도미니엄" <c:if test="${fn:contains(result.venue,'콘도미니엄')}">checked</c:if>/>
								<label for="" class="mr15">콘도미니엄</label>
							</div>
							<div>
								<label for="" class="mr10">기타시설</label>
								<input type="text" name="venue_text" value="${venue}"/>
							</div>
							<input type="hidden" name="venue" value="${result.venue}"/>
							 
						</td>
					</tr>
					<tr>
						<th scope="row">수용인원</th>
						<td class="left">
							<input name="meeting_room_member_cnt" value="${result.meeting_room_member_cnt}"/> 
						</td>
					</tr>
					<tr>
						<th scope="row">셋업형태</th>
						<td class="left">
							<select name="meeting_room_type">
                            	<option value="극장형" <c:if test="${result.meeting_room_type eq '극장형'}">selected</c:if>>극장형</option>
                                <option value="교실형" <c:if test="${result.meeting_room_type eq '교실형'}">selected</c:if>>교실형</option>
                                <option value="연회형" <c:if test="${result.meeting_room_type eq '연회형'}">selected</c:if>>연회형</option>
                                <option value="기타" <c:if test="${result.meeting_room_type eq '기타'}">selected</c:if>>기타</option>
                            </select>
							${result.meeting_room_type} 
						</td>
					</tr>
					<tr>
						<th scope="row">총 필요 <br class="mobile_show">회의실 수</th>
						<td class="left">
							<input name="meeting_room_cnt" value="${result.meeting_room_cnt}"/> 
						</td>
					</tr>
					<tr>
						<th scope="row">전시장 <br class="mobile_show">사용여부</th>
						<td class="left">
							<input type="checkbox" id="chk_use" <c:if test="${result.use_exhibition eq '사용'}">checked</c:if>/>
                            <label for="" class="mr15">사용</label>
                            <input type="checkbox" id="chk_no_use" <c:if test="${result.use_exhibition eq '미사용'}">checked</c:if>/>
                            <label for="" class="mr15">미사용</label>
                            <input type="hidden" name="use_exhibition" value="${result.use_exhibition}"/> 
						</td>
					</tr>
					<tr>
						<th scope="row">전시장 <br class="mobile_show">필요규모</th>
						<td class="left">
							<input name="exhibition_size" value="${result.exhibition_size}"   class="wd30per"/ > ㎥ 
						</td>
					</tr>
					<tr>
						<th scope="row">기간</th>
						<td class="left">
							<input name="checkin_day" value="${result.checkin_day}"   class="wd30per"/> 박 
						</td>
					</tr>
					<tr>
						<th scope="row">1일평균</th>
						<td class="left">
							<input name="checkin_member" value="${result.checkin_member}"/   class="wd30per"> 명, Peak Night <input name="checkin_night_member" value="${result.checkin_night_member}"   class="wd30per"/> 
						</td>
					</tr>
					<tr>
						<th scope="row">가격대</th>
						<td class="left">
							<input name="checkin_price" value="${result.checkin_price}"   class="wd30per"/> 원 이하 
						</td>
					</tr>
					<tr>
						<th scope="row">기타<br class="mobile_show">요청사항</th>
						<td class="left">
							<textarea name="checkin_etc_text">
							${result.checkin_etc_text} 
							</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">프로그램<br class="mobile_show">첨부</th>
						<td class="left" id="checkin_file_tag">
							<c:if test="${result.checkin_file_id != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.checkin_file_id}" />
							</c:import>
							<input type="hidden" name="checkin_file_id" value="${result.checkin_file_id}"/>
							<button onclick="deleteNsetInputFileTag(this, 'checkin_file_tag', 'checkin_file');return false;">삭제</button>
							</c:if> 
							<c:if test="${result.checkin_file_id eq ''}">
							<input type="file" name="checkin_file" />
							</c:if>
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
							<input name="organization_name" value="${d:decrypt(result.organization_name)}"/>
						</td>
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
						<td>
							<input name="organization_addr" value="${d:decrypt(result.organization_addr)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td>
							<input name="organization_zip_code" value="${d:decrypt(result.organization_zip_code)}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td>
							<input name="organization_homepage" value="${d:decrypt(result.organization_homepage)}"/>
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
					<a href="<c:url value='/cvb/form/event_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>