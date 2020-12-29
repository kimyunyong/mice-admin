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


<style>
	.error{color:red}
	label{padding-left:5px}
</style>

<c:set var="target2" value = "."/>

<script type="text/javaScript" language="javascript">

$(document).ready(function(){
	//var target2 = "#${target}";
	$('#btnCustomerSave').on('click',function(){
		if(!$('form[name=customerForm]').valid())
			return false;
		
	    var params = $("form[name=customerForm]").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	     
	    $.ajax({
	        url: '/crm/event/addCustomer_action.do?organizer_idx=${dataid}&name=${name}',
	        type: 'POST',
	        data:params,
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'json',
	        success: function (result) {
	            if (result.result){
	            	alert('등록되었습니다.');

	            	if($('#${target}').find('select').val() != undefined){
	            		$('#${target}').find('select').append('<option value="' + result.customer.idx + '">' + result.customer.name_ko+"("+ result.customer.phone_no+")"+ '</option>');
	            	}else{
	            		$('#${target}').empty();
	            		$('#${target}').append('<select name="${name}"><option value="' + result.customer.idx + '">' + result.customer.name_ko+"("+ result.customer.phone_no+")"+ '</option></select>');
	            	}
	            	
	            	$.nmTop().close();
	            }else{
	            	alert('오류가 발생했습니다. 관리자에게 문의하세요.');
	            }
	        }
	    });
	});
	
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 name_ko : { required: true, minlength:2, maxlength:100}
			 /* name_ko : { required: true, minlength:2, maxlength:100},
	 		 name_en : { required: true, minlength:2, maxlength:100},
	 		 tel_no : { required: true, minlength:9, maxlength:20},
	 		 phone_no :  { required: true, minlength:10, maxlength:20},
	 		 fax_no : { required: true, minlength:9, maxlength:20},
	 		email : { required: true, email:true, maxlength:255} */
		 }
	 });
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}
</script>
		<form name="customerForm" method="post" action="/crm/customer/insert_action.do" enctype="multipart/form-data">
		
		<h5 class="s_tit">기본정보</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="esicon">*</span>이름(국문)</th>
						<td class="left">
							<input name="name_ko" type="text" style="ime-mode:active"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="esicon">*</span>이름(영문)</th>
						<td class="left">
							<input name="name_en" type="text" style="ime-mode:inactive"/>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><span class="esicon">*</span>직책</th>
						<td class="left">
							<input name="position" type="text" size="100" value="" style="ime-mode:inactive"/>
						</td>
					</tr>
					
						
					<tr>
						<th scope="row"><span class="esicon">*</span>소속_엑셀</th>
						<td class="left">
							<input name="sosoc_excel" type="text" size="100" value="" style="ime-mode:inactive"/>
						</td>
					</tr>									
					
					<tr>
						<th scope="row"><span class="esicon">*</span>부서</th>
						<td class="left">
							<input name="department" type="text" size="100" value="" style="ime-mode:inactive"/>
						</td>
					</tr>						
					
					<tr>
						<th scope="row"><span class="esicon">*</span>전화번호</th>
						<td class="left">
							<input name="tel_no" type="text" >
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="esicon">*</span>휴대전화</th>
						<td class="left">
							<input name="phone_no" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="esicon">*</span>E-mail</th>
						<td class="left">
							<input name="email" type="text" />
						</td>
					</tr>
					<tr>
						<th scope="row">FAX</th>
						<td class="left">
							<input name="fax_no" type="text" />
						</td>
					</tr>
					<!-- 
					<tr>
						<th scope="row">우편번호</th>
						<td class="left">
							<input id="zip_postcode" name="zip_code" type="text"  class="wd50per"/>
							<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(국문)</th>
						<td class="left">
							<input id="zip_address_ko" name="address_ko" type="text" size="100" style="ime-mode:active"/>
						</td>
					</tr>
					<tr>
						<th scope="row">주소(영문)</th>
						<td class="left">
							<input id="zip_address_en" name="address_en" type="text" size="100" style="ime-mode:inactive"/>
						</td>
					</tr>	
					!-->				
					
					<tr>
						<th scope="row"><span class="esicon">*</span>담당자</th>
						<td class="left">
							<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
								<c:param name="name" value="manager_id" />
								<c:param name="result" value="myid" />
							</c:import>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><span class="esicon">*</span>뉴스레터<br class="mobile_show">발송대상</th>
						<td class="left">
							<input type="radio" name="newsletter" value="Y" checked /> Y
							<input type="radio" name="newsletter" value="N" /> N
						</td>
					</tr>
					
					<tr>
						<th scope="row"><span class="esicon">*</span><br class="mobile_show">내/외국인</th>
						<td class="left">

							<input type="radio" name="country" value="내국인" checked /> 내국인
							<input type="radio" name="country" value="외국인" /> 외국인
	
						</td>
					</tr>											
					
					<tr>
						<th scope="row">특기사항</th>
						<td class="left">
							<textarea name="etc" rows="4"></textarea>
						</td>
					</tr>
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnCustomerSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="javascript:$.nmTop().close();" role="button" class="btn1 clr_Wgray">취소</a>
				</div>
			</div>
</body>
</html>

