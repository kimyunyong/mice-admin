<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>

<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<script type="text/javaScript" language="javascript">
$(document).ready(function(){
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/crm/customer/delete_action.do?idx=${param.idx}');
	});
	
	$('#type').val($('select[name=searchType]').val())
	
	if($('#type').val() != '')
		$('#type').attr('readonly', true);
	
	$('select[name=searchType]').change(function(){
		if($('select[name=searchType]').val() != '')
			$('form[name=searchForm]').submit();
	});
	
	$('#appendTag').focus();
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
		$(obj).parent().parent().submit();
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
		$(obj).parent().attr('action','/crm/code/update.do');
		$(obj).parent().submit();
	}
}

function deleteForm(obj){
	if(!confirm('삭제하시겠습니까?'))
		return false;
	
	$(obj).parent().attr('action','/crm/code/delete.do');
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
	<h3>대관관리 <span>></span> 시설관리 <span>></span> 시설등록</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="searchForm" action="/crm/code/info.do" method="post">
			<div class="brd_p">
				<label>종류</label>
				<select name="searchType">
						<option value=""></option>
					<c:forEach var="result" items="${codes }" varStatus="status">
						<option value="${result.type }" <c:if test="${vo.searchType == result.type}">selected</c:if>>${result.type }</option>
					</c:forEach>
				</select>
			</div>
		</form>
		
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" colspan="2">코드</th>
					</tr>
					<c:forEach var="result" items="${resultList }" varStatus="status">
					<tr>
						<c:if test="${status.index == 0 }">
						<th scope="row" rowspan="${fn:length(resultList) }">수정</th>
						</c:if>
						<td>
							<form name="form" action="/crm/code/info_action.do" method="post">
								
								<input type="hidden" name="idx" value="${result.idx }"/>
								<input type="hidden" name="type" value="${result.type}"/>
								<label>코드 : </label>
								<input type="text" name="value" value="${result.value}" data-type="update" data-idx="${status.index }" size="100"/>
								<!-- <label>순서 : </label> -->
								<input type="hidden" name="sorted_no" value="${result.sorted_no}" size="2"/>
								<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
								<button onclick="javascript:updateForm(this);return false;">저장</button>
								<button onclick="javascript:deleteForm(this);return false;">삭제</button>
								</sec:authorize>
							</form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1" style="padding-left:15px;padding-top:15px">
			<caption>상세</caption>
			<colgroup>
				<col width="15%">
				<col width="85%">
			</colgroup>
			<tbody id="append_tag">
				<tr>
					<th scope="row">추가</th>
					<td>
						<form name="form" action="/crm/code/info_insert.do" method="post">
							<div>
								<label style="width:40px;margin-right:13px">종류 :</label>
								<input id="type" type="text" name="type" value="" />
								<!-- <button onclick="javascript:newType(this);return false;">새로만들기</button> -->
							</div>
							<div style="padding-top:5px;padding-bottom:5px;">
								<label style="width:40px;margin-right:25px">값 : </label>
								<input id="appendTag" type="text" name="value"  data-type="insert" size="100"/>
								<button onclick="javascript:insertForm(this);return false;">저장</button>
							</div>
						</form>								
					</td>	
				</tr>
			</tbody>
		</table>		
	</section>
</section>
</sec:authorize>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>