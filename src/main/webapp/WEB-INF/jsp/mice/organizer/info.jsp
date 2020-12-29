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
		
		location.replace('/cvb/organizer/delete_action.do?idx=${param.idx}&org_tp=${param.org_tp }');
	});
});
	
</script>
<section id="contentArea">
	<h3><c:choose><c:when test="${param.org_tp == '0' }">콘텐츠관리 > 컨벤션서비스업체관리 > 상세</c:when><c:when test="${param.org_tp == '1' }">콘텐츠관리 <span>></span> 유관기관관리 <span>></span> 상세</c:when><c:when test="${param.org_tp == '4' }">얼라이언스관리 <span>></span> 얼라이언스관리 <span>></span> 상세</c:when></c:choose></h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<table  class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">작성자</th>
						<td class="left">
							${result.user_nm }(${result.reg_id })
						</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<td class="left">
							${result.reg_date}
						</td>
					</tr>
					<c:if test="${param.org_tp == '4' }">
					<tr>
						<th scope="row">분과</th>
						<td class="left">
							${result.sub_type}
						</td>
					</tr>
					</c:if>
					<c:if test="${param.org_tp == '0' }">
					<tr>
						<th scope="row">분류</th>
						<td class="left">
							${result.type}
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row">업체명<br class="mobile_show">(국문)</th>
						<td class="left">
							${result.organizer_name_ko }
						</td>
					</tr>
					<tr>
						<th scope="row">업체명<br class="mobile_show">(영문)</th>
						<td class="left">
							${result.organizer_name_en }
						</td>
					</tr>
					<tr>
						<th scope="row">주소<br class="mobile_show">(국문)</th>
						<td class="left">
							${d:decrypt(result.address_ko) }
						</td>
					</tr>
					<tr>
						<th scope="row">주소<br class="mobile_show">(영문)</th>
						<td class="left">
							${d:decrypt(result.address_en) }
						</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td class="left">
							${d:decrypt(result.tel_no) }
						</td>
					</tr>
					<tr>
						<th scope="row">팩스번호</th>
						<td class="left">
							${d:decrypt(result.fax_no) }
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td class="left">
							${d:decrypt(result.email) }
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							${result.homepage }
						</td>
					</tr>
					<tr>
						<th scope="row">로고</th>
						<td class="left">
							<img src="/cmm/fms/getImage.do?atchFileId=${result.logo_file_id }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">설명</th>
						<td class="left">
							${result.comment }
						</td>
					</tr>
				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
					<a href="/cvb/organizer/edit.do?idx=${result.idx}&org_tp=${param.org_tp }" role="button" class="btn1 clr_Wgray">수정</a>
			
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
				
					<a href="<c:url value='/cvb/organizer/list.do?org_tp=${param.org_tp }'/>" role="button" class="btn1 clr_Wgray">목록</a>
					</sec:authorize>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>