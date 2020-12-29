<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.submit();
	}

	
	$(document).ready(function(){
		$('#btnSave').on('click',function(){
			if($('input[name=restdeDe]').val() == ''){
				alert('휴일일자를 선택해주세요.');
				return false;
			}
			
			if($('input[name=restdeNm]').val() == ''){
				alert('휴일명을 입력해주세요..');
				return false;
			}
			$('form[name=form]').submit();
		});
		
		$('#btnDelete').on('click',function(){
			if(!confirm("삭제하시겠습니까?"))
				return fase;
			
			location.href = '/sym/cal/EgovRestdeRemove.do?restdeNo=${vo.restdeNo}';
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리 <span>></span> 휴일관리 <span>></span> 등록</h3>
	<section class="sect_nonetit">
	<h4>정보</h4>
	<form name="form" action="<c:choose><c:when test="${fn:length(vo.restdeDe) > 0 }"><c:url value='/sym/cal/EgovRestdeModify.do'/></c:when><c:otherwise><c:url value='/sym/cal/EgovRestdeRegist.do'/></c:otherwise></c:choose>" method="post">
		<c:if test="${fn:length(vo.restdeDe) > 0 }">
			<input type="hidden" name="restdeNo" value="${vo.restdeNo}" />
			<input type="hidden" name="cmd" value="Modify" />
		</c:if>


		<h5 class="s_tit">휴일등록</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">휴일일자</th>
						<td class="left">
							<input type="text" class="datepicker" name="restdeDe" value="${vo.restdeDe }" readonly/>
						</td>
					</tr>
					<tr>
						<th scope="row">휴일명</th>
						<td class="left">
							<input name="restdeNm" type="text" value="${vo.restdeNm }"/>
						</td>
					</tr>
					<tr style="display:none;">
						<th scope="row">휴일설명</th>
						<td class="left">
							<textarea name="restdeDc" rows="3"  title="휴일설명">.</textarea>
						</td>
					</tr>
					<tr style="display:none">
						<th scope="row">휴일구분</th>
						<td class="left">
							<select style="" name="restdeSeCode" title="휴일구분">
						    	<c:forEach var="item" items="${restdeCode}" >
						    		<option value="${item.code }">${item.codeNm }</option>
						    	</c:forEach>
					      	</select>
						</td>
					</tr>
				</tbody>
		</table>
		</form>


			<!-- 버튼 위치(s) -->
			<div class="search_new_btn">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
					<c:if test="${fn:length(vo.restdeDe) > 0 }">
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
					</c:if>
					</sec:authorize>
					<a href="/sym/cal/EgovRestdeRegist.do" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/sym/cal/EgovRestdeList.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
			</div>
			<!--// 버튼 위치(e) -->
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
