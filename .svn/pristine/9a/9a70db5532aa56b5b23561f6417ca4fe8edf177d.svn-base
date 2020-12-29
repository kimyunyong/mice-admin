<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>

<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>



<html>
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

	
$(function(){
	$('#btnOrganizerSave').on('click',function(){
		if(!$('form[name=organizerform]').valid())
			return false;
		
	    var params = $("form[name=organizerform]").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	    $.ajax({
	        url: '/crm/event/addOrganizer_action.do',
	        type: 'POST',
	        data:params,
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'json',
	        success: function (result) {
	            if (result.result){
	            	alert('등록되었습니다.');
	            	$('a[data-id=${dataid}]').parent().find('select').append('<option value="' + result.organizer.idx + '" selected>' + result.organizer.name_ko + '</option>');
	            	$('a[data-id=${dataid}]').parent().find('select').change();
	            	$.nmTop().close();
	            }else{
	            	alert('오류가 발생했습니다. 관리자에게 문의하세요.');
	            }
	        }
	    });
	});

	
	 $('form[name=organizerform]').validate({
		 lang: 'ko',
		 rules : {
			 name_en : { maxlength:100},
			 name_etc : { maxlength:100},			 
			 name_ko : { required: true, minlength:2,maxlength:100},
	 		 tel_no : { required: true, minlength:9,maxlength:20},
	 		 type_idx :  { required: true},
	 		 national : { maxlength:100},
	 		 city : { maxlength:100},
	 		 zip_code : {maxlength:20},
	 		 address_ko : { required: true, minlength:2,maxlength:255},
	 		 address_en : { maxlength:255},
	 		 tel_no : {maxlength:255},
	 		 fax : { maxlength:20},
	 		 homepage : { maxlength:255},
	 	     email : { required: true, email:true,maxlength:100}
		 }
	 });
});
</script>
<body>
		
	<form name="organizerform" method="post" action="/crm/organizer/insert_action.do" enctype="multipart/form-data">
		
		<h5 class="s_tit">기관단체명</h5>

		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl2">
		<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col >
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">국문</th>
					<td>
						<input name="name_ko" type="text"  style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">영문</th>
					<td>
						<input name="name_en" type="text"   style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">기타</th>
					<td>
						<input name="name_etc" type="text" />
					</td>
				</tr>
			</tbody>
			</table>


			<h5 class="s_tit">기본정보</h5>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl2">
				<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col >
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">구분</th>
						<td>
							<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
								<c:param name="name" value="type_idx" />
								<c:param name="type" value="주최자구분" />
							</c:import>
						</td>
					</tr>
					<tr>
						<th scope="row">국가</th>
						<td>
							<input name="national" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">도시</th>
						<td>
							<input name="city" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">우편번호</th>
						<td>
							<input id="zip_postcode" name="zip_code" type="text"/>
							<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(국문)</th>
						<td>
							<input id="zip_address_ko" name="address_ko" type="text" style="ime-mode:active"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(영문)</th>
						<td>
							<input id="zip_address_en" name="address_en" type="text" style="ime-mode:inactive"/>
						</td>
					</tr>
					<tr>
						<th scope="row">대표전화</th>
						<td>
							<input name="tel_no" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">FAX</th>
						<td>
							<input name="fax" type="text" "/>
						</td>
					</tr>
					<tr>
						<th scope="row">대표 E-mail</th>
						<td>
							<input name="email" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td>
							<input name="homepage" type="text""/>
						</td>
					</tr>
				</tbody>
			</table>


			<h5 class="s_tit">추가정보</h5>
			<textarea name="comment" ></textarea>
	
	</form>

	<!-- 버튼 위치(s) -->
	<div class="btn_area">
			<a id="btnOrganizerSave" role="button" class="btn1 clr_Wgray">저장</a>
			<a href="javascript:;" onclick="javascript:$.nmTop().close();" role="button" class="btn1 clr_Wgray">취소</a>
	</div>
	<!--// 버튼 위치(e) -->
	
</body>
</html>