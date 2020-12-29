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
			$('input[name=image_file_path1]').focus();
			return false;
		}
		if($('input[name=image_file_path2]').val() == ''){
			alert('이미지를 선택해주세요.');
			$('input[name=image_file_path2]').focus();
			return false;
		}
		if($('input[name=image_file_path3]').val() == ''){
			alert('이미지를 선택해주세요.');
			$('input[name=image_file_path2]').focus();
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
			 		 homepage : { required: true, minlength:2}
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
				 $('select[name=class_info]').append('<option value="">구분을 입력해주세요.</option><option value="역사유적지">역사유적지</option><option value="박물관/미술관">박물관/미술관</option><option value="테마파크/워터파크">테마파크/워터파크</option><option value="기타관광지">기타관광지</option>');
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
	
	 /* $('form').validate({
		 lang: 'ko',
		 rules : {
			 name_ko : { required: true, minlength:2},
	 		 name_en : { required: true, minlength:2},
	 		 homepage : { required: true, minlength:2},
	 		 address_ko :  { required: true, minlength:2},
	 		 address_en : { required: true, minlength:2},
	 		 google_map : { required: true, minlength:2},
	 		 locality_ko : { required: true, minlength:2},
	 		 locality_en : { required: true, minlength:2},
	 		hico : { required: true, minlength:1, number:true},
	 		new_gyeongju_ktx_station : { required: true, minlength:1, number:true},
	 		gyeongju_station : { required: true, minlength:1, number:true},
	 		gyeongju_express_bus:{required:true, minlength:1, number:true},
	 		gyeongju_intercity_bus:{required:true, minlength:1, number:true},
	 		gyeongju_ic:{required:true, minlength:1, number:true},
	 		total_room_count:{required:true, minlength:1, number:true},
	 		deluxe_room_count:{required:true, minlength:1, number:true},
	 		premium_room_count:{required:true, minlength:1, number:true},
	 		ondol_room_count:{required:true, minlength:1, number:true},
	 		sweetroom_count:{required:true, minlength:1, number:true},
	 		theater_capacity:{required:true, minlength:1, number:true},
	 		classroom_capacity:{required:true, minlength:1, number:true},
	 		convention_capacity:{required:true, minlength:1, number:true},
	 		banquet_basic_count:{required:true, minlength:1, number:true},
	 		banquet_max_count:{required:true, minlength:1, number:true}
		 }
	 }); */
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}
</script>
<section id="contentArea">

<!-- 171222 -->


	<h3>콘텐츠관리 <span>></span> 숙박/관광지/프로그램 관리<span>></span> 등록</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>

<h5 class="s_tit">기본정보</h5>



		<form name="form" method="post" action="/cvb/lodgment/insert_action.do" enctype="multipart/form-data">

		<table class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col >
				</colgroup>
				<tbody>

					</tr>
					<tr>
						<th scope="row">이름(국문)</th>
						<td>
							<input name="name_ko" type="text" style="width:200px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이름(영문)</th>
						<td>
							<input name="name_en" type="text" style="width:200px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">구분</th>
						<td>
							<select name="type">
								<option value="호텔">호텔/리조트</option>
								<option value="전통고택">전통고택</option>
								<option value="캠핑장">캠핑장</option>
								<option value="경주관광20선">경주관광20선</option>
								<option value="유네스코유산">유네스코유산</option>
								<option value="주요관광지">주요관광지</option>
								<option value="골프장">골프장</option>
								<option value="관광프로그램">관광프로그램</option>
								<option value="체험프로그램">체험프로그램</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">등급</th>
						<td>
							<select name="class_info">
								<option value="">등급을선택해주세요</option>
								<option value="특1급">특1급</option>
								<option value="1급">1급</option>
								<option value="2급">2급</option>
								<option value="전통호텔">전통호텔</option>
								<option value="콘도미니엄">콘도미니엄</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">대표이미지1</th>
						<td>
							<input name="image_file_path1" type="file" accept=".gif, .jpg, .bmp, .png"/>
						</td>
					</tr>
					<tr>
						<th scope="row">대표이미지2</th>
						<td>
							<input name="image_file_path2" type="file" accept=".gif, .jpg, .bmp, .png"/>
						</td>
					</tr>
					<tr>
						<th scope="row">대표이미지3</th>
						<td>
							<input name="image_file_path3" type="file" accept=".gif, .jpg, .bmp, .png"/>
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td>
							<input name="homepage" type="text" style="width:500px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(국문)</th>
						<td>
							<input id="zip_address_ko" name="address_ko" type="text" style="width:500px"/>
							<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(영문)</th>
						<td>
							<input id="zip_address_en" name="address_en" type="text" style="width:500px"/>
						</td>
					</tr>
					<tr>
						<th scopre="row">전화번호</th>
						<td>
							<input name="tel_no" type="text" value="${result.tel_no }" style="width:200px"/>
						</td>
					</tr>
					<tr>
						<th scope="row">지도</th>
						<td>
							<textarea name="google_map" placeholder="위치가 확인된 구글맵 정보를 등록해주세요." rows="10" style="width:640px"></textarea>
						</td>
					</tr>
					<tr style="display:none">
						<th scope="row">내용(국문)</th>
						<td>
							<textarea name="comment" placeholder="내용을 입력해주세요." rows="10" style="width:640px"></textarea>
						</td>
					</tr>
					<tr style="display:none">
						<th scope="row">내용(영문)</th>
						<td>
							<textarea name="comment_en" placeholder="내용을 입력해주세요." rows="10" style="width:640px"></textarea>
						</td>
					</tr>
					</tbody>
					</table>

		<h5 class="s_tit">위치</h5>

		<table class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col >
				</colgroup>
					<tr>
						<th scope="row">소재지(국문)</th>
						<td>
							<input name="locality_ko" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">소재지(영문)</th>
						<td>
							<input name="locality_en" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">HICO</th>
						<td>
							<input name="hico" type="text" class="wd80per"/>KM
						</td>
					</tr>
					<tr>
						<th scope="row">신경주역</th>
						<td>
							<input name="new_gyeongju_ktx_station" type="text"  class="wd80per"/>KM
						</td>
					</tr>
					<tr>
						<th scope="row">경주역</th>
						<td>
							<input name="gyeongju_station" type="text"  class="wd80per"/>KM
						</td>
					</tr>
					<tr>
						<th scope="row">서경주역</th>
						<td>
							<input name="west_gyeongju_station" type="text"  class="wd80per"/>KM
						</td>
					</tr>				
					<tr>
						<th scope="row">경주고속버스터미널</th>
						<td>
							<input name="gyeongju_express_bus" type="text"  class="wd80per"/>KM
						</td>
					</tr>
					<tr>
						<th scope="row">경주시외버스터미널</th>
						<td>
							<input name="gyeongju_intercity_bus" type="text"  class="wd80per"/>KM
						</td>
					</tr>					
					<tr>
						<th scope="row">경주IC</th>
						<td>
							<input name="gyeongju_ic" type="text"  class="wd80per"/>KM
						</td>
					</tr>
</table>






		<h5 class="s_tit"  id="total_room_title">객실</h5>

		<table class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col >
				</colgroup>

					<tr id="total_room">
						<th scope="row">총 객실수</th>
						<td>
							<input name="total_room_count" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">스위트룸</th>
						<td>
							<input name="sweetroom_count" type="text"/>
						</td>
					</tr>						
					<tr>
						<th scope="row">일반룸</th>
						<td>
							<input name="nomal_room_count" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">더블룸</th>
						<td>
							<input name="double_room_count" type="text"/>
						</td>
					</tr>						
					<tr>
						<th scope="row">트윈룸</th>
						<td>
							<input name="tween_room_count" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">트리플룸</th>
						<td>
							<input name="triple_room_count" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">쿼드러플룸</th>
						<td>
							<input name="quadruple_room_count" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">온돌 룸</th>
						<td>
							<input name="ondol_room_count" type="text"/>
						</td>
					</tr>						
										
						</table>
					




		<h5 class="s_tit" id="oldhouse_title">수용규모 Largest room</h5>

		<table class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col >
				</colgroup>

					<tr>
						<th scope="row">극장식</th>
						<td>
							<input name="theater_capacity" type="text"/>
						</td>
					</tr>										
					<tr>
						<th scope="row">교실식</th>
						<td>
							<input name="classroom_capacity" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">연회식</th>
						<td>
							<input name="convention_capacity" type="text"/>
						</td>
					</tr>	
					<tr style="display:none" id="oldhouse">
						<th scope="row">수용인원</th>
						<td>
							<input name="total_room_capacity" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">연회실 수</th>
						<td>
							<input name="banquet_basic_count" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">최대 연회실 수</th>
						<td>
							<input name="banquet_max_count" type="text"/>
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