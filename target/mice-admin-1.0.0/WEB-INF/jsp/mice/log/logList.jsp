<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

	function fn_egov_select_sysLog(pageNo){
		var fromDate = $('input[name=searchBgnDe]').val();
		var toDate = $('input[name=searchEndDe]').val();

		if(fromDate > toDate) {
	        alert("종료일자는 시작일자보다  이후날짜로 선택하세요.");
	        return false;
	    } else {
				document.listForm.pageIndex.value = pageNo;
				document.listForm.action = "<c:url value='/sym/log/lgm/SelectSysLogList.do'/>";
				document.listForm.submit();
	    }
	}
	
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리 <span>></span> 로그관리</h3>
	<section class="sect_nonetit">
		<h4>로그 목록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form:form name="listForm" action="<c:url value='/uat/uap/selectLoginPolicyList.do' />" method="post">
		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		<div class="brd_p">



				<label class="open" for="brdSelect1">조회기간</label>
				<input class="brdSelect1 datepicker" name="searchBgnDe" type="text" size="10" value="${searchVO.searchBgnDe}" placeholder="시작일 입력" />
				<label for="searchEndDeView">~</label>
			    <input class="brdSelect1 datepicker" name="searchEndDe" type="text" size="10" value="${searchVO.searchEndDe}" placeholder="종료일 입력" />  
				<label class="open" style="padding-left:10px"" for="brdSelect2">처리구분</label>
				<input name="searchWrd" type="text" size="15" value="<c:out value='${searchVO.searchWrd}'/>"  maxlength="15" id="searchWrd" title="검색단어입력" placeholder="처리구분을 입력해주세요">
				<label class="open"  style="padding-left:10px" for="brdSelect3">요청자</label>
				<input name="searchUserId" type="text" size="20" value="<c:out value='${searchVO.searchUserId}'/>" maxlength=20" id="searchUserId" title="검색 아이디입력" placeholder="아이디를 입력해주세요"/>
				<div class="btn_areaR">
					<a class="btn2 clrGrad_Wgray" onclick="javascript:fn_egov_select_sysLog('1')">조회</a>
				</div>						
		</div>		
			
		<table class="adm_tbl2" summary="요청ID, 발생일자, 메소드명, 처리구분, 처리시간, 요청자의 정보를 보여주는 시스템 로그 목록 테이블이다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="8%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="12%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
			    	<th scope="col">요청 ID</th>
			    	<th scope="col">발생일자</th>
			    	<th scope="col">메소드명</th>
			    	<th scope="col">처리구분</th>
			    	<th scope="col">처리시간</th>
			    	<th scope="col">요청자</th>
			    	<th scope="col">상세보기</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
			    	<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
			    	<td><c:out value="${result.requstId}"/></td>
			    	<td><c:out value="${result.occrrncDe}"/></td>
			    	<td><c:out value="${result.methodNm}"/></td>
			    	<td><c:out value="${result.processSeCodeNm}"/></td>
			    	<td><c:out value="${result.processTime}"/></td>
			    	<td><c:out value="${result.userId}"/>(<c:out value="${d:decrypt(result.rqsterNm)}"/>)</td>
			    	
			    <td><a href="/sym/log/lgm/InqireSysLog.do?requstId=<c:out value="${result.requstId}"/>" class="btn2 clrGrad_Wgray nyroModal">상세보기</a></td>
			    
			  </tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>

			
			<c:if test="${!empty searchVO.pageIndex }">
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="default"
			            jsFunction="fn_egov_select_sysLog"
			            />
			    </div>
			    <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
			    </div>
			</div>
			</c:if>
			<input type="hidden" name="authorCode"/>
			<input type="hidden" name="authorCodes"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
			<input type="hidden" name="searchCondition"/>
			</form:form>
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>