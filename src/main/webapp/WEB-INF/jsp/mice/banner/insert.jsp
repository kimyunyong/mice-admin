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
		var st_date = $('input[name=st_date]').val().replace('-') + $('select[name=st_hour]').val() + $('select[name=st_time]').val();
		var ed_date = $('input[name=ed_date]').val().replace('-') + $('select[name=ed_hour]').val() + $('select[name=ed_time]').val();
		
		if(st_date > ed_date){
			alert('시작일자와 종료일자 값이 선택할 수 없는 값입니다.');
			return false;
		}
		
		if($('input[name=view_status]:checked').val() == ''){
			alert('게시상태를 선택해주세요.');
			return false;
		}
		
		if($('input[name=image_file_id]').val() == ''){
			alert('이미지(공통)을 선택해주세요.');
			return false;
		}
		
		if($('input[name=image_file_id_en]').val() == ''){
			alert('이미지(영문)을 선택해주세요.');
			return false;
		}
		
		$('input[name=view_st_date]').val($('input[name=st_date]').val() + ' ' + $('select[name=st_hour]').val() + ':' + $('select[name=st_time]').val() + ':00');
		$('input[name=view_ed_date]').val($('input[name=ed_date]').val() + ' ' + $('select[name=ed_hour]').val() + ':' + $('select[name=ed_time]').val() + ':00');
		$('form').submit();
	});
	
	
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 title_ko : { required: true, minlength:2},
	 		 title_en : { required: true, minlength:2},
	 		 sort_no : { required: true, minlength:1, number:true},
	 		 comment_ko :  { required: true, minlength:2},
	 		 comment_en : { required: true, minlength:2},
	 		 url_ko : { required: true, minlength:2},
	 		 url_en : { required: true, minlength:2},
	 		 st_date : { required: true, minlength:2},
	 		 ed_date : { required: true, minlength:2},
		 }
	 });
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}
</script>
<section id="contentArea">
	<h3>메인관리 <span>></span> <c:choose><c:when test="${site == 'cvb' && type == '1' }">CVB 메인비주얼관리</c:when><c:when test="${site == 'cvb' && type == '4' }">CVB 팝업관리</c:when><c:when test="${type == '3' }">공통배너관리</c:when><c:when test="${site == 'hico' && type == '1' }">HICO 메인비주얼관리</c:when><c:when test="${site == 'hico' && type == '2' }">HICO 배너관리</c:when><c:when test="${site == 'hico' && type == '4' }">HICO 팝업관리</c:when></c:choose><span>></span>  등록</h3><!-- 171222 -->
	<section class="sect_nonetit">
		<form name="form" method="post" action="/${site }/banner/${type }/banner_insert_action.do" enctype="multipart/form-data">
		<input name="site" value="${site }" type="hidden"/>
		<input name="banner_kind" value="${type }" type="hidden"/>
			<table  class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">순번</th>
						<td class="left">
							<input name="sort_no" value="${sortNo }" />
						</td>
					</tr>
					<tr>
						<th scope="row">제목(국문)</th>
						<td class="left">
							<input name="title_ko" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">제목(영문)</th>
						<td class="left">
							<input name="title_en" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">설명(국문)</th>
						<td class="left">
							<input name="comment_ko" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">설명(영문)</th>
						<td class="left">
							<input name="comment_en" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">URL(국문)</th>
						<td class="left">
							<input name="url_ko" type="text" class="wd60per"/>
							<select name="url_ko_window">
								<option value="_self">현재창</option>
								<option value="_blank" <c:if test="${type == 4 }">selected</c:if>>새창</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">URL(영문)</th>
						<td class="left">
							<input name="url_en" type="text" class="wd60per" />
							<select name="url_en_window">
								<option value="_self">현재창</option>
								<option value="_blank" <c:if test="${type == 4 }">selected</c:if>>새창</option>
							</select>
						</td>
					</tr>					
					<tr>
						<th scope="row">기간</th>
						<td class="left">
							<input class="datepicker wd60per" type="text" name="st_date" placeholder="시작날짜를 선택해주세요" />
							<select name="st_hour">
								<c:forEach var="val" begin="00" end="23">
									<option value="${val }">${val }</option>
								</c:forEach>
							</select> 시 
							<select name="st_time">
								<c:forEach var="val" begin="00" end="59">
									<option value="${val }">${val }</option>
								</c:forEach>
							</select> 분부터 ~
							<input class="datepicker wd60per" type="text" name="ed_date" placeholder="종료날짜를 선택해주세요"/>
							<select name="ed_hour">
								<c:forEach var="val" begin="00" end="23">
									<option value="${val }">${val }</option>
								</c:forEach>
							</select> 시
							<select name="ed_time">
								<c:forEach var="val" begin="00" end="59">
									<option value="${val }">${val }</option>
								</c:forEach>
							</select> 까지 
						</td>
					</tr>
					<c:if test="${type == 4 }">
					<tr>
						<th scope="row">크기/위치</th>
						<td class="left">
							크기 : 가로 <input type="text" name="popup_width" value="640"/> 세로 <input type="text" name="popup_height" value="480"/> / 위치 : X <input type="text" name="popup_left" value="0"/><span style="padding-left:10px">Y <input type="text" name="popup_top" value="0"/></span> 
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row">게시상태</th>
						<td class="left">
							<input type="radio" value="Y" name="view_status" />Y
							<input type="radio" value="N" name="view_status" checked/>N
						</td>
					</tr>
					<tr>
						<th scope="row">이미지<br class="mobile_show">(공통)</th>
						<td class="left">
							<input name="image_file_id" type="file" accept=".gif, .jpg, .bmp, .png"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이미지<br class="mobile_show">(영문)</th>
						<td class="left">
							<input name="image_file_id_en" type="file" accept=".gif, .jpg, .bmp, .png"/>
						</td>
					</tr>
				</tbody>
		</table>
		<input type="hidden" name="view_st_date" />
		<input type="hidden" name="view_ed_date" />
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