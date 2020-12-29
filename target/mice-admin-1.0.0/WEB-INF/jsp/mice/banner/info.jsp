<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


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
		
		location.replace('/${site}/banner/${type}/banner_delete_action.do?idx=${param.idx}');
	});
});
	
</script>
<section id="contentArea">
	<h3>메인관리 <span>></span><c:choose><c:when test="${site == 'cvb' && type == '1' }">CVB 메인비주얼관리</c:when><c:when test="${site == 'cvb' && type == '4' }">CVB 팝업관리</c:when><c:when test="${type == '3' }">공통배너관리</c:when><c:when test="${site == 'cvb' && type == '5' }">CVB 행사배너 1 관리</c:when>
	<c:when test="${site == 'cvb' && type == '6' }">CVB 행사배너 2 관리</c:when><c:when test="${site == 'hico' && type == '1' }">HICO 메인비주얼관리</c:when><c:when test="${site == 'hico' && type == '2' }">HICO 배너관리</c:when><c:when test="${site == 'hico' && type == '4' }">HICO 팝업관리</c:when></c:choose><span>></span> 상세</h3>
	<section class="sect_nonetit">
		<table  class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
				<tbody>
					<tr>
						<th scope="row">순번</th>
						<td class="left">
							${result.sort_no }
						</td>
					</tr>
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
						<th scope="row">설명(국문)</th>
						<td class="left">
							${result.comment_ko}
						</td>
					</tr>
					<tr>
						<th scope="row">설명(영문)</th>
						<td class="left">
							${result.comment_en }
						</td>
					</tr>
					<tr>
						<th scope="row">URL(국문)</th>
						<td class="left">
							${result.url_ko }을  <c:choose><c:when test="${result.url_ko_window == '_blank' }">새창에서 열기</c:when><c:when test="${result.url_ko_window == '_self' }">현재창에서 열기</c:when></c:choose>
						</td>
					</tr>
					<tr>
						<th scope="row">URL(영문)</th>
						<td class="left">
							${result.url_en }을  <c:choose><c:when test="${result.url_en_window == '_blank' }">새창에서 열기</c:when><c:when test="${result.url_en_window == '_self' }">현재창에서 열기</c:when></c:choose>
						</td>
					</tr>					
					<tr>
						<th scope="row">기간</th>
						<td class="left">
							${fn:substring(result.view_st_date, 0, 16)} 
							~ 
							${fn:substring(result.view_ed_date, 0, 16)}
						</td>
					</tr>
					<c:if test="${type == 4 }">
					<tr>
						<th scope="row">크기/위치</th>
						<td class="left">
							크기 : ${result.popup_width } * ${result.popup_height }px/위치 : ${result.popup_left } * ${result.popup_top }px 
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row">게시상태</th>
						<td class="left">
							${result.view_status }
						</td>
					</tr>
					<tr>
						<th scope="row">이미지<br class="mobile_show">(공통)</th>
						<td class="left">
							<img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id }" class="wd100per" />
						</td>
					</tr>
					<tr>
						<th scope="row">이미지<br class="mobile_show">(영문)</th>
						<td class="left">
							<img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id_en }" class="wd100per"/>
						</td>
					</tr>				

				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
					<a href="/${site}/banner/${type}/banner_edit.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">수정</a>
				
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
					<a href="<c:url value='/${site}/banner/${type}/banner_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				</sec:authorize>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>