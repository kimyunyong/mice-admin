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
<section id="contentArea">
	<h3><!-- 컨벤션CRM관리 -->시스템관리 <span>></span> 코드관리</h3>
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
		<h5>수정</h5>
		
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col>
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${resultList }" varStatus="status">
					<tr>
						<td class="left">
							<form name="form" action="/crm/code/update.do" method="post">
								<input type="hidden" name="idx" value="${result.idx }"/>
								<input type="hidden" name="type" value="${result.type}"/>
								<input type="hidden" name="sorted_no" value="${result.sorted_no}"/>

								<label>이름 값 : </label>
								<input type="text" name="value" value="${result.value}" data-type="update" data-idx="${status.index }" class="wd30per" />
								
								<c:if test = "${result.type == '상담형태'}">
									<br/>
									
									<label>코드명 : </label>
									<input type="text" name="code_name" value="${result.code_name}" class="wd30per"/><br/>
									
									<label>코드 구분 :  </label>
									<input type="text" name="code_item" value="${result.code_item}" class="wd30per"/><br/>
									
									<label>링크주소 :  </label>
									<input type="text" name="link_url" value="${result.link_url}" class="wd30per"/><br/>
								</c:if>
								
								
								<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
								<button onclick="javascript:updateForm(this);return false;" class="btn2">저장</button>
								<button onclick="javascript:deleteForm(this);return false;" class="btn2">삭제</button>
								</sec:authorize>
							</form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
		


		<h5>추가</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col>
				</colgroup>
				<tbody id="append_tag">
					<tr>
							<td class="left">
								<form name="form" action="/crm/code/info_insert.do" method="post">
									<div>
										<label style="width:40px;margin-right:13px">종류 :</label>
										<input id="type" type="text" name="type" value="" class="wd30per"  />
										<!-- <button onclick="javascript:newType(this);return false;">새로만들기</button> -->
									</div>
									<div style="padding-top:5px;padding-bottom:5px;">
										<label style="width:40px;margin-right:25px">이름 값 : </label>
										<input id="appendTag" type="text" name="value"  data-type="insert"  class="wd30per" />
									</div>
									
									<c:if test = "${result.type == '상담형태'}">
									<div style="padding-top:5px;padding-bottom:5px;">
										<label style="width:40px;margin-right:25px">코드명 : </label>
										<input id="code_name" type="text" name="code_name"  data-type="insert"  class="wd30per" />
									</div>									
									<div style="padding-top:5px;padding-bottom:5px;">
										<label style="width:40px;margin-right:25px">코드 구분 : </label>
										<input id="code_item" type="text" name="code_item"  data-type="insert"  class="wd30per" />
									</div>		
									<div style="padding-top:5px;padding-bottom:5px;">
										<label style="width:40px;margin-right:25px">링크주소 : </label>
										<input id="etc_value" type="text" name="link_url"  data-type="insert"  class="wd30per" />
									</div>
									</c:if>	
																											
									<div style="padding-top:5px;padding-bottom:5px;">
										<button onclick="javascript:insertForm(this);return false;" class="btn2">저장</button>
									</div>	
																		
									
								</form>								
							</td>
						
					</tr>
				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<%-- <div class="btn_area">
				<div class="center">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
					<a href="/crm/customer/edit.do?idx=${result.idx}" role="button" class="btn1 clr_Wgray">수정</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
				</sec:authorize>
					<a href="<c:url value='/crm/customer/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div> --%>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>