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

<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>

<script type="text/javascript">
$(document).ready(function(){
	$('#btn_save').on('click', function(){
		
		var name_ko = $("input[name=name_ko]").val();
		var name_en = $("input[name=name_en]").val();
		var tel_no = $("input[name=tel_no]").val();
		var phone_no = $("input[name=phone_no]").val();
		var sosoc_excel = $("input[name=sosoc_excel]").val();
		var email = $("input[name=email]").val();
		var fax_no = $("input[name=fax_no]").val();
		var manager_id = $("select[name=manager_id]").val();
		var newsletter = $(":input:radio[name=newsletter]:checked").val();
		var country = $(":input:radio[name=country]:checked").val();
		var etc = $("textarea[name=etc]").val();
		var organizer_idx = $("select[name=organizer_idx]").val();
		var unit = $("input[name=unit]").val();
		var staff = $("input[name=staff]").val();
		
		if(organizer_idx == "") organizer_idx ="0";
		
		if(name_ko == ""){
			alert("이름을 입력하세요.");
			$("input[name=name_ko]").focus();
			return false;
		}
		
		$.ajax({
	           type : "post",
	           data:{
	        	'organizer_idx' : organizer_idx,
	        	'unit' : unit,
	        	'staff' : staff,
	        	'name_ko' : name_ko , 
	           	'name_en' : name_en , 
	           	'tel_no' : tel_no , 
	           	'phone_no' : phone_no ,
	           	'sosoc_excel' : sosoc_excel ,  
	           	'email' : email , 
	           	'fax_no' : fax_no , 
	           	'manager_id' : manager_id , 
	           	'newsletter' : newsletter , 
	           	'country' : country , 
	           	'etc' : etc	            
	           },
	           url : "/crm/invite/insertCustomer.do",
	           dataType : "json",
	           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	           error : function(){
	               alert('등록 실패..');
	           },
	           success : function(data){
	        	alert('등록완료');
				opener.setName(data.name_ko);
				window.close();
			} // success
	       });	// $ajax
	});
});

function on_search_layer(obj){
	$('#search_layer').bPopup({
		follow: [false, false],
		position: [150, 10]
	});
	
	$('#search_layer').attr('data-id',$(obj).attr('data-id'));
	$('input[name=search_organizer_name]').focus();
}
</script>
<style>
	.esicon{color:red;}
</style>

<section class="sect_nonetit">
	<h4>상세보기</h4>

	<table class="adm_tbl2">
		<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<co>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">소속</th>
					<td>
						<select name="organizer_idx" style="width:100px">
							<option value=""></option>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<option value="${result.idx }">${result.name_ko }</option>
							</c:forEach>
						</select>
						<a href="javascript:;" onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
					</td>
				</tr>
				
		  		<tr>
					<th scope="row">부서</th>
					<td><input name="unit" type="text"/></td>
		 		</tr>
		 		
		 		<tr>
		  			<th scope="row">직책</th>
		  			<td><input name="staff" type="text"/></td>
		  		</tr>
		  		
				<tr>
					<th scope="row"><span class="esicon">*</span>이름(국문)</th>
					<td class="left">
						<input name="name_ko" type="text" size="100" style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">이름(영문)</th>
					<td class="left">
						<input name="name_en" type="text" size="100" style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td class="left">
						<input name="tel_no" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">휴대전화</th>
					<td class="left">
						<input name="phone_no" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">소속_엑셀</th>
					<td class="left">
						<input name="sosoc_excel" type="text" size="100"/>
					</td>
				</tr>				
				<tr>
					<th scope="row">E-mail</th>
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
					<th scope="row">담당자</th>
					<td class="left">
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="manager_id" />
							<c:param name="result" value="myid" />
						</c:import>
					</td>
				</tr>
				<tr>
					<th scope="row">뉴스레터<br class="mobile_show">발송대상</th>
					<td class="left">
						<input type="radio" name="newsletter" value="Y" checked /> Y
						<input type="radio" name="newsletter" value="N" /> N
					</td>
				</tr>
				
				<tr>
					<th scope="row"><br class="mobile_show">내/외국인</th>
					<td class="left">

						<input type="radio" name="country" value="N" checked /> 내국인
						<input type="radio" name="country" value="F" /> 외국인

					</td>
				</tr>					

				<tr>
					<th scope="row">비고</th>
					<td class="left">
						<textarea name="etc" cols="100" rows="4"></textarea>
					</td>
				</tr>
			</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
<!-- </form> -->
	
	<!-- 버튼 위치(s) -->
	<div class="btn_area">
		<div class="center">
			<a id="btn_save" role="button" class="btn1 clr_Wgray">저장</a>
			<a class="btn1 clr_Wgray" onclick="javasciprt:window.close();">닫기</a>
		</div>
	</div>
	<!--// 버튼 위치(e) -->
	
</section>