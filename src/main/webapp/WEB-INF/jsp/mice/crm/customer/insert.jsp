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
<section id="contentArea">
	<h3>고객DB관리 <span>></span> 고객명함관리 <span>></span> 등록</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/crm/customer/insert_action.do" enctype="multipart/form-data">
		
		<h5>* 기본정보</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<co>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="esicon">*</span>이름(국문)</th>
						<td class="left">
							<input name="name_ko" type="text" size="100" style="ime-mode:active"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="esicon">*</span>이름(영문)</th>
						<td class="left">
							<input name="name_en" type="text" size="100" style="ime-mode:inactive"/>
						</td>
					</tr>
					
					<tr>
						<th scope="row"><span class="esicon">*</span>직책</th>
						<td class="left">
							<input name="position" type="text" size="100" style="ime-mode:inactive"/>
						</td>
					</tr>					
					<tr>
						<th scope="row"><span class="esicon">*</span>소속_엑셀</th>
						<td class="left">
							<input name="sosoc_excel" type="text" size="100" style="ime-mode:inactive"/>
						</td>
					</tr>	
						
					<tr>
						<th scope="row"><span class="esicon">*</span>부서</th>
						<td class="left">
							<input name="department" type="text" size="100" style="ime-mode:inactive"/>
						</td>
					</tr>
																
					<tr>
						<th scope="row"><span class="esicon">*</span>전화번호</th>
						<td class="left">
							<input name="tel_no" type="text" size="100"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="esicon">*</span>휴대전화</th>
						<td class="left">
							<input name="phone_no" type="text" size="100"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="esicon">*</span>E-mail</th>
						<td class="left">
							<input name="email" type="text" size="100"/>
						</td>
					</tr>
					<tr>
						<th scope="row">FAX</th>
						<td class="left">
							<input name="fax_no" type="text" size="100"/>
						</td>
					</tr>
					
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
							<textarea name="etc" cols="100" rows="4"></textarea>
						</td>
					</tr>
				</tbody>
		</table>

<script>

function on_search_layer(obj){ //
	$('#search_layer').bPopup();
	$('#search_layer').attr('data-id',$(obj).attr('data-id'));
	$('input[name=search_organizer_name]').focus();
	
}	
</script>		

<script>
//추가기관 - 추가
function plus_append(obj){
	var att = $("#organizer_form .organizer_cont").clone();
	$("#organizer_list").last().append(att);
	
	//아이디 재정의
	plus_chkid();

}

//추가기관 - 클래스명 재정의 
function plus_chkid(){
	
	$(".organizer_cont").each(function(idx){
		var org_id = "organizers_"+idx;
		$(this).find("a").attr("data-id", org_id );	
	});
	$("#organizer_cnt").val( $("#organizer_list .organizer_cont").length );
}

$(document).ready(function(){
	
	//삭제
	$(document).on("click",".organizer_cont button[name=plus_append_del]",function(idx){
		var idx = $(".organizer_cont button[name=plus_append_del]").index(this);
		$(".organizer_cont").eq(idx).remove();
		
		//아이디 재정의
		plus_chkid();
	});

	
	
});	

</script>		

		<h5>* 기관정보</h5>
		<button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:plus_append(this);return false;">추가</button>

		<input type="hidden" name="organizer_cnt_plus" id="organizer_cnt" value="0"/>
		<div id="organizer_list">
		
		</div>



	
		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="/crm/customer/insert.do" role="button" class="btn1 clr_Wgray">취소</a>
				<a href="<c:url value='/crm/customer/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				
			</div>
		</div>
		<!--// 버튼 위치(e) -->
		
		</form>
		
		

		<div id="organizer_form"  style="display:none;">
			<div class="organizer_cont" >
				
				<table class="adm_tbl2">
				<caption>상세</caption>
					<colgroup>
						<col width="27%">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">소속</th>
							<td class="left">
								<select name="organizer_idx_plus" style="width:100px">
										<option value=""></option>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										 
										<option value="${result.idx }">${result.name_ko }</option>
									</c:forEach>
								</select>
								<a onclick="javascript:on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
							</td>
			    		</tr>
			    		<tr>
	    					<th scope="row">부서</th>
	    					<td><input name="unit_plus" type="text"/></td>
			    		</tr>
			    		<tr>
	    					<th scope="row">직함</th>
	    					<td><input name="staff_plus" type="text"/></td>
			    		</tr>
			    		<tr>
	    					<th scope="row">추가<br class="mobile_show">연락처</th>
	    					<td><input name="add_tel_no_plus" type="text"/></td>
			    		</tr>
			    		<tr>
	    					<th scope="row">담당업무</th>
	    					<td><input name="operation_plus" type="text"/>
								<input name="customer_idx_plus" type="hidden" value="${param.idx }"/>
	    					</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">
			    				<p><button class='btn2 clrGrad_Wgray' name='plus_append_del' >삭제</button></p>
			    			</td>
			    		</tr>
			     	    </tbody>
			    </table>	
			</div>	
		</div>
		
		
		<%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>