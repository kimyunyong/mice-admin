<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
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
		
		location.replace('/cvb/archive/info_delete_action.do?idx=${param.idx}');
	});
 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});


</script>
<section id="contentArea">
	<h3>경주사진아카이브관리 <span>></span> 아카이브관리</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
<!-- 		<div style="padding-bottom:5px;"><b style="font-size:18px">주최자</b></div>
		 -->		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="30%" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" >작성자</th>
						<td class="text_left">
							${result.writer_id}
						</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<td class="text_left">
							${result.reg_date}
						</td>
					</tr>
					<tr>
						<th scope="row">분류</th>
						<td class="text_left">
						<c:forEach var="result" items="${resultCodeList}" varStatus="status">
					   		<input type="checkbox" name="checker" value="${result.idx}" onclick="javascript:$('#checkAll').attr('checked',false);" <c:if test="${result.checked == true}">checked</c:if>>${result.code_name}
					   </c:forEach>
						</td>
					</tr>
					<tr>
						<th scope="row">제목(국문)</th>
						<td class="text_left">
							${result.title_ko}
						</td>
					</tr>					
					<tr>
						<th scope="row">제목(영문)</th>
						<td class="text_left">
							${result.title_en}
						</td>
					</tr>
					<tr>
						<th scope="row">키워드(국문)</th>
						<td class="text_left">

							${result.keyword_ko}
						</td>
					</tr>
					<tr>
						<th scope="row">키워드(영문)</th>
						<td class="text_left">

							${result.keyword_en}
						</td>
					</tr>
					<tr>
						<th scope="row">내용(국문)</th>
						<td class="text_left">

							${result.comment_ko}
						</td>
					</tr>
					<tr>
						<th scope="row">내용(영문)</th>
						<td>
							${result.comment_en}
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td class="text_left">
							<img src="<c:url value='/com/image/image_info.do'/>?name=${result.thumb_min_file_path}&ext=${result.file_ext}"/>
						</td>
					</tr>															
				</tbody>
			</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center p20">
					<a id="btnEdit" role="button" class="btn1 clr_Wgray" href="/cvb/archive/info_insert.do?mode=edit&idx=${result.idx }">수정</a>
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
					<a href="<c:url value='/cvb/archive/info_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>