<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<% pageContext.setAttribute("LF", "\n"); %>
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
		
		location.replace('/crm/organizer/delete_action.do?idx=${param.idx}');
	});
});
function eventCall(obj){
	var target = event.target.id;
	var t = target+"tbl";
    $("#"+t).fadeToggle();
	if(obj.innerHTML =="+"){
		obj.innerHTML = "-";
	}else{
		obj.innerHTML = "+";    		
	}
}
</script>
<script>
function win_open(url){
	window.open(url, "", "width=1200px, height=800px, resizable=yes, scrollbars=yes");
}
</script>

<section id="contentArea">
	<h3>고객DB관리 <span>></span> 기관단체관리 <span>></span> 상세</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>

		
		
		<h5 class="s_tit">주관행사정보</h5>
		<table  class="adm_tbl2">
		<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">행사구분</th>
					<td class="left">
							<c:if test="${result.manager_event == 'N'}">일반기업</c:if>
							<c:if test="${result.manager_event == 'M'}">주관행사 참가업체</c:if>
					</td>
				</tr>
				
				
							
			<c:if test="${result.manager_event == 'M'}" >
				<tr>
					<th scope="row">기관종류</th>
					<td class="left">

						${result.org_kind}
						
					</td>
				</tr>	
				<tr>
					<th scope="row">행사정보</th>
					<td class="left">
						${result.crm_event_idx_str}
					</td>
				</tr>			
				<tr>
					<th scope="row">참가업체분류</th>
					<td class="left">
						${result.event_cate_biz1_str} 
						<c:if test="${fn:length(result.event_cate_biz2_str) > 0}">
							> ${result.event_cate_biz2_str}
						</c:if>
						<c:if test="${fn:length(result.event_cate_biz3_str) > 0}">
							> ${result.event_cate_biz3_str}
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">제품서비스</th>
					<td class="left">
						${result.event_cate_serviceList_str}
					</td>
				</tr>
				<tr>
					<th scope="row">세부품목</th>
					<td class="left">
						${result.event_cate_itemList_str}
					</td>
				</tr>	
			</c:if>
				
				
				
				
			</tbody>
		</table>	
		
			
		
			<h5>기관단체명</h5>
			<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">국문</th>
					<td class="left">
						${result.name_ko }
					</td>
				</tr>
				<tr>
					<th scope="row">영문</th>
					<td class="left">
						${result.name_en }
					</td>
				</tr>
				<tr>
					<th scope="row">기타</th>
					<td class="left">
						${result.name_etc }
					</td>
				</tr>
			</tbody>
			</table>
					
			
			<h5>기본정보</h5>
			<table  class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">기관구분</th>
					<td class="left">
						${result.type_name }
					</td>
				</tr>
				<tr>
					<th scope="row">국가</th>
					<td class="left">
						${result.national}
					</td>
				</tr>
			<!-- 					
				<tr>
					<th scope="row">도시</th>
					<td class="left">
						${result.city }
					</td>
				</tr> 
			-->
				<tr>
					<th scope="row">우편번호</th>
					<td class="left">
						${d:decrypt(result.zip_code) }
					</td>
				</tr>
				<tr>
					<th scope="row">주소(국문)</th>
					<td class="left">
						${d:decrypt(result.address_ko) }
					</td>
				</tr>
				<tr>
					<th scope="row">주소(영문)</th>
					<td class="left">
						${d:decrypt(result.address_en) }
					</td>
				</tr>
				
				
				
				<tr>
					<th scope="row">대표자</th>
					<td class="left">
						${d:decrypt(result.ceo_name) }
					</td>
				</tr>	
				
				<tr>
					<th scope="row">대표자 연락처</th>
					<td class="left">
						${d:decrypt(result.ceo_phone) }
					</td>
				</tr>					
								
				
				<tr>
					<th scope="row">업체담당자</th>
					<td class="left">
						${d:decrypt(result.biz_man) }
					</td>
				</tr>	
				
				
				<tr>
					<th scope="row">업체담당자 연락처</th>
					<td class="left">
						${d:decrypt(result.biz_man_phone) }
					</td>
				</tr>	
				<tr>
					<th scope="row">업체담당자 E-mail</th>
					<td class="left">
						${d:decrypt(result.biz_man_email)}
					</td>
				</tr>												
				
				
				<tr>
					<th scope="row">대표전화</th>
					<td class="left">
						${d:decrypt(result.tel_no) }
					</td>
				</tr>
				<tr>
					<th scope="row">FAX</th>
					<td class="left">
						${d:decrypt(result.fax) }
					</td>
				</tr>
				<tr>
					<th scope="row">대표 <br class="mobile_show">E-mail</th>
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
					<th scope="row">담당자</th>
					<td class="left">
						${result.manager_nm }
					</td>
				</tr>
				
				
			<c:if test="${result.manager_event == 'M'}" >
				<tr>
					<th scope="row">참기기관 중요도</th>
					<td class="left">
						${result.org_import}
					</td>
				</tr>
				<tr>
					<th scope="row">참가의향등급</th>
					<td class="left">
						${result.org_grade}
					</td>
				</tr>
				<tr>
					<th scope="row">진행단계</th>
					<td class="left">
						${result.org_step}
					</td>
				</tr>
				<tr>
					<th scope="row">과거전시회 이력</th>
					<td class="left">
						${result.org_exhi_history}
					</td>
				</tr>					
				<tr>
					<th scope="row">전시회 참가 경로</th>
					<td class="left">
						${result.org_exhi_path}
					</td>
				</tr>
			</c:if>
				
						
						
								
				
				
			</tbody>
			</table>

	
			<h5>추가정보</h5>
			<table  class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col>
			</colgroup>
			<tbody>
				<tr>
					<td class="left">
						${fn:replace(result.comment,LF,'<br/>')}
					</td>
				</tr>
			</tbody>
			</table>
			<br/><br/>
			
	
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl2">
				<thead>
						<tr><th colspan="2">관련인력 정보</th></tr>
				</thead>
				<tbody>
						<tr id="relationInfomation">
							<td class="padding_none" colspan="2">
							<c:import url="/crm/organizer/customer_relationlist.do"	charEncoding="utf-8">
							<c:param name="organizer_idx" value="${result.idx }" />
							</c:import>
							</td>
						</tr>
					</tbody>
				<thead>
				<tr><th colspan="2">관련행사 정보</th></tr>
				</thead>
				<tbody>
					<tr id="relationEventInfo">
						<td colspan="2">
						
						<c:import url="/crm/organizer/event_relationlist.do"	charEncoding="utf-8">
						<c:param name="eventparam" value="${result.idx }"></c:param>
						</c:import>
						
						</td>
					</tr>
				</tbody>
			</table>



			<h5>유치활동</h5>	
			<c:import url="/crm/event/promotion_list.do" charEncoding="utf-8">
				<c:param name="parent_idx" value="${result.idx }" />
				<c:param name="promotion_type" value="O"/>
			</c:import>



			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
					<a href="javascript:win_open('/crm/event/promotion_insert.do?idx=${result.idx }&promotion_type=O&today=${toDay}&redirect_url2=${requestScope['javax.servlet.forward.request_uri']}?idx=${result.idx}&redirect_url=/crm/event/promotion_end.do');" class="nyroModal_ btn1 clr_Wgray">현황입력</a>
					<a href="/crm/organizer/edit.do?idx=${result.idx}" role="button" class="btn1 clr_Wgray">수정</a>
				</sec:authorize>
				<!--c:if test="${loginVO.id == result.reg_id}"-->
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
				</sec:authorize>
				<!--/c:if-->
				<a href="<c:url value='/crm/organizer/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>