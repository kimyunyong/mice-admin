<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>

<script type="text/javascript">
	$(document).ready(function(){		
		$('#save').on('click', function(){
			var organizer_idx = $("select[name=organizer_idx]").val();
			var unit = $("input[name=unit]").val();
			var staff = $("input[name=staff]").val();
			var add_tel_no = $("input[name=add_tel_no]").val();
			var operation = $("input[name=operation]").val();
			var customer_idx = $("input[name=customer_idx]").val();
			
			if($('select[name=organizer_idx]').val() ==''){
				alert('소속 정보를 선택하세요');
				return false;
			}
			
			$.ajax({
		           type : "post",
		           data:{'customer_idx' : customer_idx,
		        	'organizer_idx' : organizer_idx , 
		           	'unit' : unit , 
		           	'staff' : staff , 
		           	'add_tel_no' : add_tel_no , 
		           	'operation' : operation
		           },
		           url : "/crm/invite/insertDept.do",
		           dataType : "json",
		           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		           error : function(){
		               alert('등록 실패..');
		           },
		           success : function(data){
					if(data.msg == "success"){
						alert('등록 완료');
						opener.setName(data.name_ko);
						window.close();
					}else{
						alert('이미 회사를 등록하였습니다.');
					}
					
					location.reload();
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
<!-- <form name="insertForm" action="/crm/customer/organizer_insert_action.do" method="post"> -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl2">
	<caption>상세</caption>
	<colgroup>
		<col width="30%">
		<col width="70%">
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
  			<th scope="row">직함</th>
  			<td><input name="staff" type="text"/></td>
  		</tr>
  		<tr>
  			<th scope="row">추가연락처</th>
  			<td><input name="add_tel_no" type="text"/></td>
  		</tr>
  		<tr>
  			<th scope="row">담당업무</th>
  			<td><input name="operation" type="text"/>
				<input name="customer_idx" type="hidden" value="${param.idx }"/>
  			</td>
  		</tr>
		<tr>
			<td scope="row" colspan="2"><a id="save" style="width:120px;padding-top:5px" class="btn2 clrGrad_Wgray">저장</a></td>
		</tr>
	</tbody>
  </table>
  <%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
<!-- </form> -->