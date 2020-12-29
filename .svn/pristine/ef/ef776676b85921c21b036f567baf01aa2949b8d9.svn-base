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

	function fnSearch(){
	    document.listForm.submit();
	}
	$(document).ready(function(){
		$('#searchCondition').on('change', function(){
			if($(this).val() == 1){
				$('#sKey1').hide();
				$('#sKey1').val('');
				$('#sKey2').show();
			}
			else{
				$('#sKey1').show();
				$('#sKey2').hide();
				$('#sKey2').val('');
			}
		});
		
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리 <span>></span> 휴일관리</h3>
	<section class="sect_nonetit">
	<h4>정보</h4>
	<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
	<form name="listForm" action="<c:url value='/sym/cal/EgovRestdeList.do'/>" method="post">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		<div class="brd_p">

		<div class="search_sort_type">
			<select name="searchCondition" class="brdSelect1" id="searchCondition" >
				<option value=''>--선택하세요--</option>
				<option value="1" <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>휴일일자</option>
				<option value="2" <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>휴일명</option>
			</select>
			<input name="searchKeyword" id="sKey1"  type="text" size="35" value="${searchVO.searchKeyword}"  maxlength="35" id="searchKeyword" onkeypress="press(event);">
			<input name="searchKeyword" id="sKey2" class="datepicker" style="display:none"  type="text" size="35" value="${searchVO.searchKeyword}"  maxlength="35" id="searchKeyword" onkeypress="press(event);">
			</div>


			<div class="search_btn_type">
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fnSearch();">조회</a>
				
			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
				<a class="btn2 clrGrad_Wgray" href="/sym/cal/EgovRestdeRegist.do">등록</a>
			</sec:authorize>
		</div>	
		</div>
		
	</form>

	<table class="adm_tbl2" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="30%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">휴일일자</th>
				<th scope="col">휴일명</th>
		    	
		  	</tr>
		</thead>
		<tbody>
			<c:choose>
			<c:when test="${fn:length(resultList) > 0}">
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td><a href="/sym/cal/EgovRestdeModify.do?restdeNo=${result.restdeNo }"><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></a></td>
					<td><a href="/sym/cal/EgovRestdeModify.do?restdeNo=${result.restdeNo }"><c:out value="${result.restdeDe}" /></a></td>
					<td><a href="/sym/cal/EgovRestdeModify.do?restdeNo=${result.restdeNo }">${result.restdeNm}</a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<td colspan="4"><spring:message code="common.nodata.msg" /></td>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	<div align="center">
		<div>
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fnLinkPage" />
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
