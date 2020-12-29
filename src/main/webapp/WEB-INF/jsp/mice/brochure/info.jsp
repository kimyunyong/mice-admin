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
		
		location.replace('/cvb/brochure/delete_action.do?idx=${param.idx}');
	});
});
	
</script>
<section id="contentArea">
	<h3>콘텐츠관리 <span>></span> 유관기관관리<span>></span> 상세</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목(국문)</th>
						<td class="left">
							${result.title_ko }
						</td>
					</tr>
					<tr>
						<th scope="row">제목(영문)</th>
						<td class="left">
							${result.title_en }
						</td>
					</tr>
					<tr>
						<th scope="row">내용(국문)</th>
						<td class="left">
							${fn:replace(result.comment_ko,enter,'<br/>') }
						</td>
					</tr>
					<tr>
						<th scope="row">내용(영문)</th>
						<td class="left">
							${fn:replace(result.comment_en,enter,'<br/>') }
						</td>
					</tr>
					<tr>
						<th scope="row">이미지</th>
						<td class="left">
							<img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id }" class="wd100per"/>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td class="left">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.attach_file_id}" />
							</c:import>
						</td>
					</tr>
				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
					<a href="/cvb/brochure/edit.do?idx=${result.idx}" role="button" class="btn1 clr_Wgray">수정</a>
				
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
				
					<a href="<c:url value='/cvb/brochure/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				</sec:authorize>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>