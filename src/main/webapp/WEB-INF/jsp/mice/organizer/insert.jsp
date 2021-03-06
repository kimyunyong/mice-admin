<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

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
			
		if($('input[name=logo_file_id]').val() == ''){
			alert('이미지를 선택해주세요.');
			$('input[name=logo_file_id]').focus();
			return false;
		}

		
		$('form').submit();
	});

	
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 organizer_name_ko : { required: true, minlength:2},
	 		 address_ko : { required: true, minlength:20},
	 		 tel_no : { required: true, minlength:9},
	 		 fax_no :  { required: true, minlength:9},
	 		 email : { required : true, email:true},
	 		 homeplage : { required: true, url:true}
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
	<h3><c:choose><c:when test="${param.org_tp == '0' }">콘텐츠관리 <span>></span> 컨벤션서비스업체관리 <span>></span> 등록</c:when><c:when test="${param.org_tp == '1' }">콘텐츠관리 <span>></span> 유관기관관리 <span>></span> 등록</c:when><c:when test="${param.org_tp == '4' }">얼라이언스관리 <span>></span> 얼라이언스관리 <span>></span> 등록</c:when></c:choose></h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/cvb/organizer/insert_action.do?org_tp=${param.org_tp }" enctype="multipart/form-data">
		<c:if test="${param.org_tp == '4' }">
		<input type="hidden" name="type" value="얼라이언스" />
		</c:if>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<c:if test="${param.org_tp == '4' }">
					<tr>
						<th scope="row">분과</th>
						<td class="left">
							<select name="sub_type">
								<option value="MICE 정책지원 분과" <c:if test="${result.sub_type == 'MICE 정책지원 분과' }">selected</c:if>>MICE 정책지원 분과</option>
								<option value="MICE 유치-시설 분과" <c:if test="${result.sub_type == 'MICE 유치-시설 분과' }">selected</c:if>>MICE 유치-시설 분과</option>
								<option value="MICE 유치-운영 분과" <c:if test="${result.sub_type == 'MICE 유치-운영 분과' }">selected</c:if>>MICE 유치-운영 분과</option>
								<option value="유니크베뉴 분과" <c:if test="${result.sub_type == '유니크베뉴 분과' }">selected</c:if>>유니크베뉴 분과</option>
								<option value="MICE 서비스 분과" <c:if test="${result.sub_type == 'MICE 서비스 분과' }">selected</c:if>>MICE 서비스 분과</option>
							</select>
						</td>
					</tr>
					</c:if>
					<c:if test="${param.org_tp == '0' }">
					<tr>
						<th scope="row">분류</th>
						<td class="left">
							<select name="type">
								<option value="PEO" <c:if test="${result.type == 'PEO' }">selected</c:if>>PEO</option>
								<option value="PCO" <c:if test="${result.type == 'PCO' }">selected</c:if>>PCO</option>
								<option value="이벤트사" <c:if test="${result.type == '이벤트사' }">selected</c:if>>이벤트사</option>
								<option value="여행사" <c:if test="${result.type == '여행사' }">selected</c:if>>여행사</option>
								<option value="수송업체" <c:if test="${result.type == '수송업체' }">selected</c:if>>수송업체</option>
								<option value="기타" <c:if test="${result.type == '기타' }">selected</c:if>>기타</option>
							</select>
						</td>
					</tr>
					</c:if>	
								
					<tr>
						<th scope="row">업체명(국문)</th>
						<td class="left">
							<input name="organizer_name_ko" type="text" style="ime-mode:active"/>
						</td>
					</tr>
					<tr>
						<th scope="row">업체명(영문)</th>
						<td class="left">
							<input name="organizer_name_en" type="text" style="ime-mode:inactive"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(국문)</th>
						<td class="left">
							<input name="address_ko" id="zip_address_ko" type="text"   style="ime-mode:active" class="wd80per"/>
							<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(영문)</th>
						<td class="left">
							<input name="address_en" id="zip_address_en" type="text"  style="ime-mode:inactive"/>
						</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td class="left">
							<input name="tel_no" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">팩스번호</th>
						<td class="left">
							<input name="fax_no" type="text"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="left">
							<input name="email" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							<input name="homepage" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">로고</th>
						<td class="left">
							<input name="logo_file_id" type="file"  accept=".gif, .jpg, .bmp, .png"/>
						</td>
					</tr>
					<tr>
						<th scope="row">설명</th>
						<td class="left">
							<input name="comment" type="text"  maxlength="20"/>
						</td>
					</tr>
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/cvb/organizer/info.do?idx=${param.idx}&org_tp=${param.org_tp }" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/cvb/organizer/list.do?org_tp=${param.org_tp }'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>