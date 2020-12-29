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

		$('form').submit();
	});
	
	$('form').validate({
		 lang: 'ko',
		 rules : {
			 name_ko : { required: true, minlength:2}
			 /* name_ko : { required: true, minlength:2},
	 		 name_en : { required: true, minlength:2},
	 		 tel_no : { required: true, minlength:9},
	 		 phone_no :  { required: true, minlength:10},
	 		 fax_no : { required: true, minlength:9},
	 		email : { required: true, email:true} */
		 }
	 });
	 
});




</script>
<section id="contentArea">
	<h3>고객DB관리 <span>></span> 고객명함관리 <span>></span> 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<h5>기본정보</h5>
		<form name="form" method="post" action="/crm/customer/edit_action.do" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${result.idx }"/>

		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col >
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">이름(국문)</th>
						<td class="left">
							<input name="name_ko" type="text" size="100" value="${d:decrypt(result.name_ko) }" style="ime-mode:active"/>
						</td>
					</tr>
					<tr>
						<th scope="row">이름(영문)</th>
						<td class="left">
							<input name="name_en" type="text" size="100" value="${d:decrypt(result.name_en) }" style="ime-mode:inactive"/>
						</td>
					</tr>
					
					<tr>
						<th scope="row">직책</th>
						<td class="left">
							<input name="position" type="text" size="100" value="${result.position}" style="ime-mode:inactive"/>
						</td>
					</tr>
					
						
					<tr>
						<th scope="row">소속_엑셀</th>
						<td class="left">
							<input name="sosoc_excel" type="text" size="100" value="${result.sosoc_excel}" style="ime-mode:inactive"/>
						</td>
					</tr>									
					
					<tr>
						<th scope="row">부서</th>
						<td class="left">
							<input name="department" type="text" size="100" value="${result.department}" style="ime-mode:inactive"/>
						</td>
					</tr>	
										
					<tr>
						<th scope="row">전화번호</th>
						<td class="left">
							<input name="tel_no" type="text" size="100" value="${d:decrypt(result.tel_no) }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">휴대전화</th>
						<td class="left">
							<input name="phone_no" type="text" size="100" value="${d:decrypt(result.phone_no) }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">E-mail</th>
						<td class="left">
							<input name="email" type="text" size="100" value="${d:decrypt(result.email) }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">FAX</th>
						<td class="left">
							<input name="fax_no" type="text" size="100" value="${d:decrypt(result.fax_no) }"/>
						</td>
					</tr>
					


					<tr>
						<th scope="row">우편번호</th>
						<td class="left">
							<input id="zip_postcode" name="zip_code" type="text"  class="wd55per" value="${result.zip_code }"/>
							<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(국문)</th>
						<td class="left">
							<input id="zip_address_ko" name="address_ko" type="text" size="100" value="${d:decrypt(result.address_ko) }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(영문)</th>
						<td class="left">
							<input id="zip_address_en" name="address_en" type="text" size="100" value="${d:decrypt(result.address_en) }"/>
						</td>
					</tr> 
					
					<tr>
						<th scope="row">담당자</th>
						<td class="left">
							<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
								<c:param name="name" value="manager_id" />
								<c:param name="result" value="${result.manager_id }"/>
							</c:import>
						</td>
					</tr>
					<tr>
						<th scope="row">뉴스레터 발송대상</th>
						<td class="left">
							<input type="radio" name="newsletter" value="Y" <c:if test="${result.newsletter == 'Y'}"> checked </c:if> /> Y
							<input type="radio" name="newsletter" value="N" <c:if test="${result.newsletter == 'N'}"> checked </c:if> /> N
						</td>
					</tr>		
					
								
					<tr>
						<th scope="row">내/외국인</th>
						<td class="left">

							<input type="radio" name="country" value="내국인" <c:if test="${result.country == '내국인'}"> checked </c:if> /> 내국인
							<input type="radio" name="country" value="외국인" <c:if test="${result.country == '외국인'}"> checked </c:if> /> 외국인
									

						</td>
					</tr>					
					
					<tr>
						<th scope="row">특기사항</th>
						<td class="left">
							<textarea name="etc" cols="100" rows="4">${result.etc }</textarea>
						</td>
					</tr>									
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/crm/customer/info.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/crm/customer/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>