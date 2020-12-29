<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>
<script type="text/javascript">
_editor_area = "nttCn";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
</script>
<script type="text/javascript" src="/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js"></script>
<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">

	
$(document).ready(function(){

 

 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});

function move_edit(){
	$('form').submit();
}

function contents_delete(){
	if(!confirm('삭제하시겠습니까?'))
		return false;
	
	$('form').attr('action','/cop/bbs/deleteBoardArticle.do');
	$('form').submit();
}

</script>
<section id="contentArea">
	<h3>${brdMstrVO.bbsNm } <span>></span> 상세보기</h3>
	<section class="sect_nonetit">
		<h4>게시글 상세보기</h4>
		<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" action="/cop/bbs/forUpdateBoardArticle.do">
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
		<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
		<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
		<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
		<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
		<%-- <input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" > --%>
		   			
		<table class="adm_tbl2">
			<caption>게시글 상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<c:if test="${param.bbsId eq 'BBSMSTR_000000000001'}">						
					<tr>
						<th scope="row">구분</th>
						<td class="left">
							<c:choose><c:when test="${result.siteTp == 0}">공통</c:when><c:when test="${result.siteTp == 1}">HICO</c:when><c:when test="${result.siteTp == 2}">CVB</c:when></c:choose>
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row">언어</th>
						<td class="left">
							<c:choose><c:when test="${result.bbsLang eq 'ko'}">국문</c:when><c:when test="${result.bbsLang eq 'en'}">영문</c:when></c:choose> 
						</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<td class="left">
							${result.frstRegisterPnttm}
						</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td class="left">
							${d:decrypt(result.frstRegisterNm)}
						</td>
					</tr>
					<c:if test="${param.bbsId == 'BBSMSTR_000000000021' }">
					<tr>
						<th scope="row">분과</th>
						<td class="left">
							${result.category }
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row">제목</th>
						<td class="left">
							${result.nttSj}
						</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
					    <td class="left">
						    ${result.nttCn}
						</td>
					</tr>
				<c:if test="${param.bbsId eq 'BBSMSTR_000000000042'}">
				  	<tr>
						<th scope="row">Youtube Link</th>
						<td class="left">
							<div class="inputBox_S">
								<label for="youtube_link" class="hide">제목</label>
								${result.youtube_link }
							</div>
						</td>
					</tr>
				</c:if>
				  <c:if test="${not empty result.atchFileId}">
				  <tr>
						<th scope="row">첨부파일<br class="mobile_show">목록</th>
						<td class="left">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.atchFileId}" />
							</c:import>
						</td>
				  </tr>
				  </c:if>								
			</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
	                <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
					<c:if test="${fn:contains(loginVO.id,result.ntcrId)}">
						<a onclick="javascript:move_edit();" role="button" class="btn1 clr_Wgray">수정</a>
					</c:if>
					
						<a onclick="javascript:contents_delete();" role="button" class="btn1 clr_Wgray">삭제</a>
					
					<a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=${param.bbsId }'/>" role="button" class="btn1 clr_Wgray">목록</a>				
                    </sec:authorize>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		</form:form>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
