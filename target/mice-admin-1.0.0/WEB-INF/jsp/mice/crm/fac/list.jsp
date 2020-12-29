<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<% pageContext.setAttribute("enter","\n"); %>

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
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/crm/customer/delete_action.do?idx=${param.idx}');
	});

	$('#type').val($('select[name=searchType]').val());

	if($('#type').val() != '')
		$('#type').attr('readonly', true);
	
	$('select[name=searchType]').change(function(){
			$('form[name=searchForm]').submit();
	});
		
	$('#appendTag').focus();
	
// 	// 시설 타입 입력창의 값이 'null' 이면 추가 테이블을 보이지 않게 한다.
// 	var fac_type = $("add_fac_input").value();
// 	if(fac_type == "null"){
// 		alert('test......');
// 		$("#add_fac_table").css("display", "none");
// 	}
});

function insertForm(obj){
	if($(obj).parent().parent().find('input[name=type]').val() == ''){
		alert('타입을 입력해주세요');
		return false;
	}
		
	if($(obj).parent().parent().find('input[name=value]').val() == ''){
		alert('값을 입력해주세요.');
		return false;
	}
	
	var break_yn = true;
	$('input[name=value]').each(function(i){
		if($(obj).parent().parent().find('input[name=value]').val() == $(this).val() && $(this).attr('data-type') == 'update'){
			alert('이미 존재하는 코드입니다.');
			break_yn = false;
		}
	});

	if($(obj).parent().find('input[name=value]').val().length > 255){
		alert('입력한 내용이 너무 깁니다.');
		break_yn = false;
	}
	if(break_yn)
		document.insert_form.submit();
}

function updateForm(obj){
	if($(obj).parent().find('input[name=value]').val() == ''){
		alert('값을입력해주세요.');
		$(obj).parent().find('input[name=value]').val()
		return false;
	}
	
	var break_yn = true;
	$('input[name=value]').each(function(i){
		if($(obj).parent().parent().find('input[name=value]').val() == $(this).val() && $(this).attr('data-type') == 'update' && $(this).attr('data-idx') != $(obj).parent().find('input[name=value]').attr('data-idx')){
			alert('이미 존재하는 코드입니다.');
			break_yn = false;
		}
	});
	
	if($(obj).parent().find('input[name=value]').val().length > 255){
		alert('입력한 내용이 너무 깁니다.');
		break_yn = false;
	}
	
	if(break_yn){
		$(obj).parent().attr('action','/crm/fac/update.do');
		$(obj).parent().submit();
	}
}

function deleteForm(obj){
	if(!confirm('삭제하시겠습니까?'))
		return false;
	
	$(obj).parent().attr('action','/crm/fac/delete.do');
	$(obj).parent().submit();
}

function newType(obj){
	$(obj).parent().find('input[name=type]').attr('readonly',false);
	$(obj).parent().find('input[name=type]').val('');
	$(obj).remove();
	$(obj).parent().find('input[name=type]').focus();
}
</script>


<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
<section id="contentArea">
	<h3>대관관리 <span>></span> 시설관리</h3>
	<section class="sect_nonetit">
		<form name="searchForm" action="/crm/fac/listFacility.do" method="post">
			<div class="brd_p">
				<label>시설 타입</label>
				<select name="searchType">
					<option value="" selected="selected">선택</option>
					<c:forEach var="result" items="${codes}" varStatus="status">
						<option value="${result.type }" <c:if test="${vo.searchType == result.type}">selected</c:if>>${result.type }</option>
					</c:forEach>
				</select>
			</div>
		</form>
		
		<h5>시설명</h5>
		<table class="adm_tbl2">
			<caption>수정</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${resultList }" varStatus="status">
					<tr>
						<c:if test="${status.index == 0 }">
						<th scope="row" rowspan="${fn:length(resultList) }">리스트</th>
						</c:if>
						<td class="left">
							<form name="form" action="/crm/fac/.do" method="post">
								<input type="hidden" name="idx" value="${result.idx }"/>
								<input type="hidden" name="type" value="${result.type}"/>
								<input type="text" name="value" value="${result.value}" data-type="update" data-idx="${status.index }" class="wd60per"/>
								<!-- <label>순서 : </label> -->
								<input type="hidden" name="sorted_no" value="${result.sorted_no}" size="2" />
								<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
									<button onclick="javascript:updateForm(this);return false;" class="btn2">저장</button>
									<button onclick="javascript:deleteForm(this);return false;" class="btn2">삭제</button>
								</sec:authorize>
							</form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
		


		<h5>시설 추가</h5>
		<form name="insert_form" action="/crm/fac/insert.do" method="post">
			<table id="add_fac_table" class="adm_tbl2" >
				<caption>추가</caption>
					<colgroup>
						<col width="27%">
						<col>
					</colgroup>
					<tbody id="append_tag">
						<tr>
							<th>시설 타입</th>
							<td class="left"><input id="type" type="text" name="type" value="" id="add_fac_input" readonly /></td>
							<!-- <button onclick="javascript:newType(this);return false;">새로만들기</button> -->
						</tr>
						<tr>
							<th>시설 명 </th>
							<td class="left"><input id="appendTag" type="text" name="value"  data-type="insert"  class="wd70per"/>
							<button onclick="javascript:insertForm(this);return false;" class="btn2">저장</button></td>						
						</tr>
	
					</tbody>
			</table>
		</form>								
		
	</section>
</section>
</sec:authorize>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>