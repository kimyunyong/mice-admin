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
		if($('select[name=class_info]').val() == '' && $('select[name=type]').val() == '호텔'){
			alert('등급을 선택해주세요.');
			$('select[name=class_info]').focus();
			return false;
		}
		if($('input[name=image_file_path1]').val() == ''){
			alert('이미지를 선택해주세요.');
			$(this).focus();
			return false;
		}
		if($('input[name=image_file_path2]').val() == ''){
			alert('이미지를 선택해주세요.');
			$(this).focus();
			return false;
		}
		if($('input[name=image_file_path3]').val() == ''){
			alert('이미지를 선택해주세요.');
			$(this).focus();
			return false;
		}
		$('form').submit();
	});
	$('select[name=type]').change(function(){
		if($(this).val() == '호텔'){
			 $('form').validate({
				 lang: 'ko',
				 rules : {
					 name_ko : { required: true, minlength:2},
			 		 name_en : { required: true, minlength:2},
				 }
			 });
			$('select[name=class_info]').parent().parent().show();
			$('select[name=class_info]').empty();
			$('select[name=class_info]').append('<option value="">등급을선택해주세요</option><option value="특1급">특1급</option><option value="1급">1급</option><option value="2급">2급</option><option value="전통호텔">전통호텔</option><option value="콘도미니엄">콘도미니엄</option>');
			$('table > tbody > tr').each(function(i){
				if( i >= 12)
					$(this).show();
				$('#oldhouse').hide();
				$('#oldhouse_title').hide();
			});	
			$('textarea[name=comment]').parent().parent().hide();
			$('textarea[name=comment_en]').parent().parent().hide();
		}else if($(this).val() == '전통고택'){
			 $('form').validate({
				 lang: 'ko',
				 rules : {
					 name_ko : { required: true, minlength:2},
			 		 name_en : { required: true, minlength:2},
			 		 homepage : { required: true, minlength:2},
			 		 address_ko :  { required: true, minlength:2},
			 		 address_en : { required: true, minlength:2},
			 		 google_map : { required: true, minlength:2}
				 }
			 });
			$('select[name=class_info]').parent().parent().hide();
			$('table > tbody > tr').each(function(i){
				if( i >= 12)
					$(this).hide();
				$('#oldhouse').show();
				$('#oldhouse_title').show();
				$('#total_room').show();
				$('#total_room_title').show();
			});
			$('textarea[name=comment]').parent().parent().hide();
			$('textarea[name=comment_en]').parent().parent().hide();
		}else if($(this).val() == '경주관광20선'){
			 $('form').validate({
				 lang: 'ko',
				 rules : {
					 name_ko : { required: true, minlength:2},
			 		 name_en : { required: true, minlength:2},
			 		 address_ko :  { required: true, minlength:2},
			 		 address_en : { required: true, minlength:2},
			 		 comment : { required: true, minlength:2},
				 }
			 });
			$('select[name=class_info]').parent().parent().hide();
			$('table > tbody > tr').each(function(i){
				if( i >= 12)
					$(this).hide();
			})
			$('select[name=class_info]').parent().parent().show();
			$('select[name=class_info]').empty();
			$('select[name=class_info]').append('<option value="">지역을선택해주세요</option><option value="시내권">시내권</option><option value="보문권">보문권</option><option value="불국사권">불국사권</option><option value="남산권">남산권</option><option value="동해권">동해권</option><option value="북부권">북부권</option>')
			$('textarea[name=google_map]').parent().parent().hide();
			$('textarea[name=comment]').parent().parent().show();
			$('textarea[name=comment_en]').parent().parent().show();
		}else if($(this).val() == '주요관광지'){
			 $('form').validate({
				 lang: 'ko',
				 rules : {
					 name_ko : { required: true, minlength:2},
			 		 name_en : { required: true, minlength:2},
			 		 address_ko :  { required: true, minlength:2},
			 		 address_en : { required: true, minlength:2},
				 }
			 });
			 $('select[name=class_info]').parent().parent().show();
			 $('select[name=class_info]').empty();
			 $('select[name=class_info]').append('<option value="">구분을 입력해주세요.</option><option value="역사유적지">역사유적지</option><option value="박물관/미술관">박물관/미술관</option><option value="테마파크/워터파크">테마파크/워터파크</option>');
			$('table > tbody > tr').each(function(i){
				if( i >= 12)
					$(this).hide();
			})
			$('textarea[name=google_map]').parent().parent().show();
			$('textarea[name=comment]').parent().parent().show();	
			$('textarea[name=comment_en]').parent().parent().show();
		}else if($(this).val() == '골프장' || $(this).val() == '관광프로그램' || $(this).val() == '체험프로그램'){
				 $('form').validate({
					 lang: 'ko',
					 rules : {
						 name_ko : { required: true, minlength:2},
				 		 name_en : { required: true, minlength:2},
				 		 address_ko :  { required: true, minlength:2},
				 		 address_en : { required: true, minlength:2},
					 }
				 });
				$('select[name=class_info]').parent().parent().hide();
				$('table > tbody > tr').each(function(i){
					if( i >= 12)
						$(this).hide();
				})
				$('textarea[name=google_map]').parent().parent().hide();
				$('textarea[name=comment]').parent().parent().hide();				
				$('textarea[name=comment_en]').parent().parent().hide();
		}else
		{
			 $('form').validate({
				 lang: 'ko',
				 rules : {
					 name_ko : { required: true, minlength:2},
			 		 name_en : { required: true, minlength:2},
			 		 homepage : { required: true, minlength:2},
			 		 address_ko :  { required: true, minlength:2},
			 		 address_en : { required: true, minlength:2},
			 		 google_map : { required: true, minlength:2},
			 		 total_room_count : { required:true, minlength:2},
			 		 total_room_capacity : { required:true, minlength:2}
				 }
			 });
			$('select[name=class_info]').parent().parent().hide();
			$('table > tbody > tr').each(function(i){
				if( i >= 12)
					$(this).hide();
			})
			$('textarea[name=comment]').parent().parent().show();
			$('textarea[name=comment_en]').parent().parent().show();
			$('textarea[name=google_map]').parent().parent().show();
			$('#oldhouse').hide();
			$('#oldhouse_title').hide();
		}
	});
	
	 
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '"  accept=".gif, .jpg, .bmp, .png"/>');
}
</script>
<section id="contentArea">
	<h3>콘텐츠관리 > 숙박/관광지/프로그램 관리 > 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/cvb/lodgment/edit_action.do" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${result.idx }"/>

			<h5 class="s_tit">기본정보</h5>

		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					</tr>
					<tr>
						<th scope="row">이름(국문)</th>
						<td class="left">
							<input name="name_ko" type="text" value="${result.name_ko }" />
						</td>
					</tr>
					<tr>
						<th scope="row">이름(영문)</th>
						<td class="left">
							<input name="name_en" type="text" value="${result.name_en }" />
						</td>
					</tr>
					<tr>
						<th scope="row">구분</th>
						<td class="left">
							<select name="type">
								<option value="호텔" <c:if test="${result.type == '호텔' }">selected</c:if>>호텔/리조트</option>
								<option value="전통고택" <c:if test="${result.type == '전통고택' }">selected</c:if>>전통고택</option>
								<option value="캠핑장" <c:if test="${result.type == '캠핑장' }">selected</c:if>>캠핑장</option>
								<option value="경주관광20선" <c:if test="${result.type == '경주관광20선' }">selected</c:if>>경주관광20선</option>
								<option value="유네스코유산" <c:if test="${result.type == '유네스코유산' }">selected</c:if>>유네스코유산</option>
								<option value="주요관광지" <c:if test="${result.type == '주요관광지' }">selected</c:if>>주요관광지</option>
								<option value="골프장" <c:if test="${result.type == '골프장' }">selected</c:if>>골프장</option>
								<option value="관광프로그램" <c:if test="${result.type == '관광프로그램' }">selected</c:if>>관광프로그램</option>
								<option value="체험프로그램" <c:if test="${result.type == '체험프로그램' }">selected</c:if>>체험프로그램</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">등급</th>
						<td class="left">
							<c:choose>
							<c:when test="${result.type == '호텔' }">
							<select name="class_info">
								<option value="">등급을선택해주세요</option>
								<option value="특1급" <c:if test="${result.class_info == '특1급'}">selected</c:if>>특1급</option>
								<option value="1급" <c:if test="${result.class_info == '1급'}">selected</c:if>>1급</option>
								<option value="2급" <c:if test="${result.class_info == '2급'}">selected</c:if>>2급</option>
								<option value="전통호텔" <c:if test="${result.class_info == '전통호텔'}">selected</c:if>>전통호텔</option>
								<option value="콘도미니엄" <c:if test="${result.class_info == '콘도미니엄'}">selected</c:if>>콘도미니엄</option>
							</select>
							</c:when>
							<c:when test="${result.type == '경주관광20선' }">
							<select name="class_info">
								<option value="">지역을선택해주세요</option>
								<option value="시내권" <c:if test="${result.class_info == '시내권' }">selected</c:if>>시내권</option>
								<option value="보문권" <c:if test="${result.class_info == '보문권' }">selected</c:if>>보문권</option>
								<option value="불국사권" <c:if test="${result.class_info == '불국사권' }">selected</c:if>>불국사권</option>
								<option value="남산권" <c:if test="${result.class_info == '남산권' }">selected</c:if>>남산권</option>
								<option value="동해권" <c:if test="${result.class_info == '동해권' }">selected</c:if>>동해권</option>
								<option value="북부권" <c:if test="${result.class_info == '북부권' }">selected</c:if>>북부권</option>
							</select>
							</c:when>
							<c:when test="${result.type == '주요관광지' }">
							<select name="class_info">
								<option value="">구분을 입력해주세요.</option>
								<option value="역사유적지" <c:if test="${result.class_info == '역사유적지'}">selected</c:if>>역사유적지</option>
								<option value="박물관/미술관" <c:if test="${result.class_info == '박물관/미술관'}">selected</c:if>>박물관/미술관</option>
								<option value="테마파크/워터파크" <c:if test="${result.class_info == '테마파크/워터파크'}">selected</c:if>>테마파크/워터파크</option>
							</select>
							</c:when>
							<c:otherwise>
							<select name="class_info"></select>
							</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th scope="row">대표<br class="mobile_show">이미지1</th>
						<td id="image_file_path1">
							<c:if test="${result.image_file_path1 != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_path1}" />
							</c:import>
							<input type="hidden" name="image_file_path1" value="${result.image_file_path1}"/>
							<button onclick="deleteNsetInputFileTag(this, 'image_file_path1', 'image_file_path1');return false;">삭제</button>
							</c:if> 
							<c:if test="${result.image_file_path1 == ''}">
							<input name="image_file_path1" type="file" accept=".gif, .jpg, .bmp, .png"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">대표<br class="mobile_show">이미지2</th>
						<td id="image_file_path2">
							<c:if test="${result.image_file_path2 != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_path2}" />
							</c:import>
							<input type="hidden" name="image_file_path2" value="${result.image_file_path2}"/>
							<button onclick="deleteNsetInputFileTag(this, 'image_file_path2', 'image_file_path2');return false;">삭제</button>
							</c:if> 
							<c:if test="${result.image_file_path2 == ''}">
							<input name="image_file_path2" type="file" accept=".gif, .jpg, .bmp, .png"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">대표<br class="mobile_show">이미지3</th>
						<td id="image_file_path3">
							<c:if test="${result.image_file_path3 != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_path3}" />
							</c:import>
							<input type="hidden" name="image_file_path3" value="${result.image_file_path3}"/>
							<button onclick="deleteNsetInputFileTag(this, 'image_file_path3', 'image_file_path3');return false;">삭제</button>
							</c:if> 
							<c:if test="${result.image_file_path3 == ''}">
							<input name="image_file_path3" type="file" accept=".gif, .jpg, .bmp, .png"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							<input name="homepage" type="text" value="${result.homepage }" />
						</td>
					</tr>
					<tr>
						<th scope="row">주소<br class="mobile_show">(국문)</th>
						<td class="left">
							<input id="zip_address_ko" name="address_ko" type="text" value="${result.address_ko }" />
							<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">주소<br class="mobile_show">(영문)</th>
						<td class="left">
							<input id="zip_address_en" name="address_en" type="text" value="${result.address_en}" />
						</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td class="left">
							<input name="tel_no" type="text" value="${result.tel_no }" style="width:200px"/>
						</td>
					<tr>
					</tr>					
					<tr>
						<th scope="row">지도</th>
						<td class="left">
							<textarea name="google_map" placeholder="위치가 확인된 구글맵 정보를 등록해주세요." rows="10" >${result.google_map }</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">내용(국문)</th>
						<td class="left">
							<textarea name="comment" placeholder="내용을 입력해주세요." rows="10">${result.comment }</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">내용(영문)</th>
						<td class="left">
							<textarea name="comment_en" placeholder="내용을 입력해주세요." rows="10" >${result.comment_en }</textarea>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row" colspan="2">[위치]</th>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">소재지<br class="mobile_show">(국문)</th>
						<td class="left">
							<input name="locality_ko" type="text" value="${result.locality_ko }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">소재지<br class="mobile_show">(영문)</th>
						<td class="left">
							<input name="locality_en" type="text" value="${result.locality_en}"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">HICO</th>
						<td class="left">
							<input name="hico" type="text" value="${result.hico }" }/>KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">신경주역</th>
						<td class="left">
							<input name="new_gyeongju_ktx_station" type="text" value="${result.new_gyeongju_ktx_station}"/>KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주역</th>
						<td class="left">
							<input name="gyeongju_station" type="text" value="${result.gyeongju_station }"/>KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">서경주역</th>
						<td class="left">
							<input name="west_gyeongju_station" type="text" value="${result.west_gyeongju_station }"/>KM
						</td>
					</tr>					
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주고속버스터미널</th>
						<td class="left">
							<input name="gyeongju_express_bus" type="text" value="${result.gyeongju_express_bus}"/>KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주시외버스터미널</th>
						<td class="left">
							<input name="gyeongju_intercity_bus" type="text" value="${result.gyeongju_intercity_bus }"/>KM
						</td>
					</tr>					
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주IC</th>
						<td class="left">
							<input name="gyeongju_ic" type="text" value="${result.gyeongju_ic }"/>KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔' && result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row" colspan="2">[객실]</th>
					</tr>
					<tr <c:if test="${result.type != '호텔' && result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row">총 객실수</th>
						<td class="left">
							<input name="total_room_count" type="text" value="${result.total_room_count }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">스위트룸</th>
						<td class="left">
							<input name="sweetroom_count" type="text" value="${result.sweetroom_count }"/>
						</td>
					</tr>						
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">일반룸</th>
						<td class="left">
							<input name="nomal_room_count" type="text" value="${result.nomal_room_count }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">더블룸</th>
						<td class="left">
							<input name="double_room_count" type="text" value="${result.double_room_count }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">트윈룸</th>
						<td class="left">
							<input name="tween_room_count" type="text" value="${result.tween_room_count }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">트리플룸</th>
						<td class="left">
							<input name="triple_room_count" type="text" value="${result.triple_room_count }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">쿼드러플룸</th>
						<td class="left">
							<input name="quadruple_room_count" type="text" value="${result.quadruple_room_count }"/>
						</td>
					</tr>						
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">온돌 룸</th>
						<td class="left">
							<input name="ondol_room_count" type="text" value="${result.ondol_room_count }"/>
						</td>
					</tr>											
					<tr <c:if test="${result.type != '호텔' && result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row" colspan="2">[수용규모 Largest room]</th>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">극장식</th>
						<td class="left">
							<input name="theater_capacity" type="text" value="${result.theater_capacity }"/>
						</td>
					</tr>										
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">교실식</th>
						<td class="left">
							<input name="classroom_capacity" type="text" value="${result.classroom_capacity }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">연회식</th>
						<td class="left">
							<input name="convention_capacity" type="text" value="${result.convention_capacity }"/>
						</td>
					</tr>					
					<tr <c:if test="${result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row">전통고택</th>
						<td class="left">
							<input name="total_room_capacity" type="text" value="${result.total_room_capacity }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">연회실<br class="mobile_show"> 수</th>
						<td class="left">
							<input name="banquet_basic_count" type="text" value="${result.banquet_basic_count }"/>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">최대 <br class="mobile_show">연회실 수</th>
						<td class="left">
							<input name="banquet_max_count" type="text" value="${result.banquet_max_count }"/>
						</td>
					</tr>										
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/cvb/lodgment/info.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/cvb/lodgment/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>