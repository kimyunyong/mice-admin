<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<jsp:useBean id="toDay" class="java.util.Date" />

<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>



<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>

<c:if test="${loginVO.id == result.reg_id}">	
<script type="text/javaScript" language="javascript">
$(document).ready(function(){
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		location.href = '/crm/event/delete_action.do?idx=${param.idx}';
	});	
});
</script>
</c:if>

<script type="text/javaScript" language="javascript">

function eventCall(obj){
	var target = event.target.id;
	var t = target+"tbl";
    $("#"+t).fadeToggle();
	if(obj.innerHTML =="+"){
		obj.innerHTML = "";
		obj.innerHTML = "-";
	}else{
		obj.innerHTML = "";
		obj.innerHTML = "+";    		
	}
};

function deleteFile(obj, delete_idx){
	$.ajax({
	    type: "POST",
	    url: "/crm/event/delete_attach_file.do",
	    data: {
	        idx : delete_idx
	    },
	    success: function (response) {
	    	location.reload();
	    }
	});
}

function deletePromotionFile(obj, delete_idx){
	$.ajax({
	    type: "POST",
	    url: "/crm/promotion/delete_attach_file.do",
	    data: {
	        idx : delete_idx
	    },
	    success: function (response) {
	    	$(obj).parent().remove();
	    	location.reload();
	    }
	});
}
</script>
<script>
function win_open(url){
	window.open(url, "", "width=1200px, height=800px, resizable=yes, scrollbars=yes");
}
</script>		
				
<script>
//참가업체분류, 제품.서비스, 세부품목 
$(document).ready(function(){
	chkManagerEventList($("input[name=idx]").val(), "biz");
	chkManagerEventList($("input[name=idx]").val(), "service");
	chkManagerEventList($("input[name=idx]").val(), "item");
});	
function chkManagerEventList(crm_idx, cate_code){
	$.ajax({
		url: '/crm/manager_event/list.do', //url
		type: 'POST', //post,get,등..전송방식
		dataType: 'html',//데이타 타입
		data: "crm_event_idx="+crm_idx+"&cate_code="+cate_code,
		error: function(json){ //실패시 실행 함수
			//alert( "실패였습니다.");
		},
		success: function(response){ //성공시 실행함수
	    	$("#manager_cate_"+cate_code).html(response);
	    	$('.nyroModal').nyroModal();
		},
	});	
}
</script>	



<section id="contentArea">
	<h3>대관관리<span>></span> 대관신청관리  <span>></span> 상세</h3>
	<section class="sect_nonetit">

<!-- 웹,패드만 보이는 화면 행사정보-->
<div class="mobile_none">



		<form name="form" id="form_web" method="post" action="/crm/event/edit_action.do" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${result.idx}"/>
		<input type="hidden" name="place_idx" value="${result.place_idx}" />	
		</form>
		
		<h5 class="s_tit">행사구분</h5>
		<table width="100%"class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="12%">
					<col width="88%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">구분</th>
						<td class="left" >
							
							<c:if test="${result.manager_event == 'N'}">일반</c:if>
							<c:if test="${result.manager_event == 'M'}">주관행사</c:if>
							
							<br/><span style="font-size:11px;color:blue;">* 등록, 수정에서 주관행사 선택시 분류등록 가능.</span>

							
						</td>
					</tr>
					<c:if test="${result.manager_event =='M'}">
					<tr>
						<th scope="row">참가업체분류</th>
						<td>
					
							<div id="manager_cate_biz">

							</div>	
														
						</td>
					</tr>
					<tr>
						<th scope="row">제품/서비스</th>
						<td>
							<div id="manager_cate_service">

							</div>																
						</td>
					</tr>
					<tr>
						<th scope="row">세부품목</th>
						<td>
							<div id="manager_cate_item">

							</div>										
						</td>
					</tr>
					</c:if>
			</tbody>
		</table>


		<h5 class="s_tit">행사정보1</h5>
		<table class="adm_tbl2 ">
			<caption>상세</caption>
			<colgroup>
				<col width="12%">
				<col width="21%">
				<col width="12%">
				<col width="21%">
				<col width="12%">
				<col width="22%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">추진현황</th>
					<td class="left">
						${result.implementation_status_name }
					</td>
					<th scope="row">확정일자</th>
					<td colspan="3" class="left">
						${result.confirm_date }
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(국문)</th>
					<td colspan="5" class="left">
						${result.name_ko }
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(영문)</th>
					<td colspan="5" class="left">
						${result.name_en }
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(기타)</th>
					<td colspan="5" class="left">
						${result.name_etc }
					</td>
				</tr>					
	
				<tr id="rent_facility" <c:if test="${result.place_name != 'HICO' }"></c:if>>
					<th scope="row">대관시설</th>
					<td colspan="5" class="left">
						<c:if test="${codeResult.get('f1') ne ''}">
							<b>1층 : </b>${codeResult.get("f1")}
						</c:if>
						<c:if test="${codeResult.get('f2') ne ''}">
							<c:if test="${codeResult.get('f1') ne ''}">
								<br>
							</c:if>
							<b>2층 : </b>${codeResult.get("f2")}
						</c:if>
						<c:if test="${codeResult.get('f3') ne ''}">
							<c:if test="${codeResult.get('f1') ne '' || codeResult.get('f2') ne ''}">
								<br>
							</c:if>
							<b>3층 : </b>${codeResult.get("f3")}
						</c:if>
						<c:if test="${codeResult.get('f4') ne ''}">
							<c:if test="${codeResult.get('f1') ne '' || codeResult.get('f2') ne '' || codeResult.get('f3') ne ''}">
								<br>
							</c:if>
							<b>부대시설 : </b>${codeResult.get("f4")}
						</c:if>
					</td>
				</tr>	
				<tr>
					<th scope="row">대관기간</th>
					<td colspan="1" class="left">
						${result.rent_st_date } ~ ${result.rent_ed_date }
					</td>
					<th scope="row">행사기간</th>
					<td colspan="3" class="left">
						${result.event_st_date } ~ ${result.event_ed_date }
					</td>
				</tr>
				<tr>
					<th scope="row">행사구분</th>
					<td class="left">
						${result.event_division_name }
					</td>
					<th scope="row">행사유형</th>
					<td class="left">
						${result.event_type_name }							
					</td>
					<th scope="row">행사성격</th>
					<td class="left">
						${result.event_scale_name }							
					</td>
				</tr>	
				
				<tr>
					<th scope="row"><span class="esicon"></span>행사분야</th>
					<td class="left" colspan="5">

						${result.event_theme_name}

					</td>
				</tr>	
								
				<tr>
					<th scope="row">전체참가자수</th>
					<td class="left">
						<fmt:formatNumber value="${result.join_personal_cnt}" pattern="#,###" />
					</td>
					<th scope="row">외국인수</th>
					<td class="left">
						<fmt:formatNumber value="${result.join_foreigner_cnt}" pattern="#,###" />
					</td>
					<th scope="row">내국인수</th>
					<td class="left">
						<fmt:formatNumber value="${result.join_nationals_cnt}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">전시부스</th>
					<td class="left">
						<fmt:formatNumber value="${result.booth_cnt}" pattern="#,###" />
					</td>
					<th scope="row">전시면적</th>
					<td class="left">
						<fmt:formatNumber value="${result.exhibition_scale}" pattern="#,###" />
					</td>
					<th scope="row">참가국수</th>
					<td class="left">
						<fmt:formatNumber value="${result.participating_states_cnt}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">주최기관</th>
					<td class="left">
						${result.organizers_1_name }
						<c:if test="${fn:length(result.organizers_1_name) > 0 }">
						<a href="/crm/organizer/info.do?idx=${result.organizers_1 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
					<th scope="row">담당자</th>
					<td colspan="3" id="organizer_1_member" class="left">
						${d:decrypt(result.manager_1_name) }
						&nbsp; ${d:decrypt(result.manager_1_position) }
						&nbsp; ${d:decrypt(result.manager_1_tel_no) }
						&nbsp; ${d:decrypt(result.manager_1_phone_no) }
						&nbsp; ${d:decrypt(result.manager_1_email) }
						
						<c:if test="${fn:length(d:decrypt(result.manager_1_name)) > 0 }">
						<a href="/crm/customer/info.do?idx=${result.manager_1 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">주관기관</th>
					<td class="left">
						${result.organizers_2_name }
						<c:if test="${fn:length(result.organizers_2_name) > 0 }">
							<a href="/crm/organizer/info.do?idx=${result.organizers_2 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
					<th scope="row">담당자</th>
					<td colspan="3" id="organizer_2_member" class="left">
						${d:decrypt(result.manager_2_name) }
						&nbsp; ${d:decrypt(result.manager_2_position) }	
						&nbsp; ${d:decrypt(result.manager_2_tel_no) }
						&nbsp; ${d:decrypt(result.manager_2_phone_no) }
						&nbsp; ${d:decrypt(result.manager_2_email) }
						
						<c:if test="${fn:length(d:decrypt(result.manager_2_name)) > 0 }">
							<a href="/crm/customer/info.do?idx=${result.manager_2 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
				</tr>
				
				
	
	
				<tr>
					<th scope="row">추가기관</th>
					<td colspan="5">
					
						<ul class = "org_plus_wrap">
							<c:forEach var="org_result" items="${orgPlusList}" varStatus="status">
							<li class="left">
								
								<c:if test="${org_result.organizer_idx != '0' }">
									${org_result.organizer_name} &nbsp;&nbsp;
									<a href="/crm/organizer/info.do?idx=${org_result.organizer_idx }" role="button" class="btn1 clr_Wgray" target="_blank" >상세보기</a>
								</c:if>
								<c:if test="${org_result.customer_idx != '0' }">
									/ &nbsp; ${org_result.customer_name} 
									&nbsp; ${org_result.customer_position}  
									&nbsp; ${org_result.customer_tel_no} 
									&nbsp; ${org_result.customer_phone_no} 
									&nbsp; ${org_result.customer_email} 
									<a href="/crm/customer/info.do?idx=${org_result.customer_idx }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
								</c:if>
								
							</li>
							</c:forEach>					
						</ul>
					
					</td>

				</tr>	
				
				
				
				<tr>
					<th scope="row">관련국제기구</th>
					<td class="left">
						${result.organizers_3 }
					</td>
					<th scope="row">공개여부</th>
					<td class="left">
						${result.view_yn }
					</td>
					<th scope="row">홈페이지</th>
					<td class="left">
						${result.homepage }
					</td>
				</tr>	
			</tbody>
		</table>



		<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
		<h5 class="s_tit">행사정보2</h5>

		<table class="adm_tbl2 ">
			<caption>상세</caption>
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">견적제출일</th>
					<td class="left">
						${result.estimate_date }
					</td>
					<th scope="row">견적금액</th>
					<td class="left">
						<fmt:formatNumber value="${result.estimate_cost}" pattern="#,###" />
					</td>
					
				</tr>
				<tr>
					<th scope="row">매출예상액</th>
					<td class="left">
						<fmt:formatNumber value="${result.sales_cost}" pattern="#,###" />
					</td>
					<th scope="row">총매출액</th>
					<td class="left">
						<fmt:formatNumber value="${result.total_cost}" pattern="#,###" />
					</td>
					
				</tr>
				<tr>
					<th scope="row">임대매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.rent_cost}" pattern="#,###" />
					</td>
					<th scope="row">식음매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.food_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">AV 및 렌탈 매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.av_rental_cost}" pattern="#,###" />
					</td>
					<th scope="row">관리비 매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.manager_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">총지원금</th>
					<td class="left">
						<fmt:formatNumber value="${result.total_grant_cost}" pattern="#,###" />
					</td>
					<th scope="row">개최지원금</th>
					<td class="left">
						<fmt:formatNumber value="${result.held_grant_cost}" pattern="#,###" />
					</td>
				</tr>
				
				<tr>
					<th scope="row">유치지원금</th>
					<td class="left">
						<fmt:formatNumber value="${result.attract_grant_cost}" pattern="#,###" />
					</td>
					<th scope="row">홍보지원금</th>
					<td class="left" >
						<fmt:formatNumber value="${result.sales_grant_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">유치담당자</th>
					<td class="left">
						${d:decrypt(result.attract_staff_name) }(${result.attract_staff_id })
					</td>
					<th scope="row">행사담당자</th>
					<td class="left">
						${d:decrypt(result.event_staff_name) }(${result.event_staff_id })
					</td>
				</tr>

				
				<tr>
					<th scope="row">견적서</td>
					<td colspan="3" class="left">
						<c:import url="/crm/event/attach_file_list.do" charEncoding="utf-8">
							<c:param name="event_idx" value="${result.idx }" />
							<c:param name="type" value="partners_attach_file"/>
							<c:param name="show_delete_btn" value="N"/>
						</c:import>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="left">
						<pre>${result.partners_comment }</pre>
					</td>
				</tr>					
				
				<tr>
					<th scope="row">기타</td>
					<td colspan="3" class="left">
						<c:import url="/crm/event/attach_file_list.do" charEncoding="utf-8">
							<c:param name="event_idx" value="${result.idx }" />
							<c:param name="type" value="etc_attach_file"/>
							<c:param name="show_delete_btn" value="N"/>
						</c:import>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="left">
						<pre>${result.etc_comment }</pre>
						
					</td>
				</tr>				

				<!-- 
				<tr>
					<th colspan="6" style="text-align: center">주최 기관</th></tr>
					<c:if test="${result.organizers_1!=''}">
						<tr id="relationInfoOrganizer1">
							<td colspan="6"><c:import url="/crm/customer/organizer_info.do"	charEncoding="utf-8">
							<c:param name="organizer_idx" value="${result.organizers_1 }" />
							<c:param name="organizers" value="1" />
							</c:import></td>
						</tr>
						<tr><th colspan="6" style="text-align:left">관련인력 정보</th></tr>
						<tr id="relationInfoCustomer1">
							<td colspan="6"><c:import url="/crm/organizer/customer_relationlist.do"	charEncoding="utf-8">
							<c:param name="organizer_idx" value="${result.organizers_1 }" />
							</c:import></td>
						</tr>
					</c:if>
					<c:if test="${result.organizers_1== ''}">
						<tr>
							<td colspan="6" style="text-align: center">관련 주최 기관이 없습니다.</td>
						</tr>
					</c:if>
				<tr>
					<th colspan="6" style="text-align: center">주관 기관</th></tr>
					<c:if test="${result.organizers_2!=''}">
						<tr id="relationInfoOrganizer2">
							<td colspan="6"><c:import url="/crm/customer/organizer_info.do"	charEncoding="utf-8">
							<c:param name="organizer_idx" value="${result.organizers_2 }" />
							<c:param name="organizers" value="2" />
							</c:import></td>
						</tr>
						<tr><th colspan="6" style="text-align:left">관련인력 정보</th></tr>
						</tr>
						<tr id="relationInfoCustomer2">
							<td colspan="6"><c:import url="/crm/organizer/customer_relationlist.do"	charEncoding="utf-8">
							<c:param name="organizer_idx" value="${result.organizers_2 }" />
							</c:import></td>
						</tr>
					</c:if>
					<c:if test="${result.organizers_2== ''}">
						<tr>
							<td colspan="6" style="text-align: center">관련 주관 기관이 없습니다.</td>
						</tr>
					</c:if>
					 -->
				
			</tbody>
		</table>
		
		</sec:authorize>
		
		
		
</div>
<!-- //웹,패드만 보이는 화면 행사정보-->


<!-- 모바일만 보이는 화면 행사정보-->
<div class="mobile_show">

		
		<h5 class="s_tit">행사구분</h5>
		<table width="100%"class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">구분</th>
						<td class="left" >
							
							<c:if test="${result.manager_event == 'N'}">일반</c:if>
							<c:if test="${result.manager_event == 'M'}">주관행사</c:if>
							
						</td>
					</tr>

			</tbody>
		</table>

		<h5 class="s_tit">행사정보1</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">추진현황</th>
					<td class="left">
						${result.implementation_status_name }
					</td>
				</tr>
				<tr>
					<th scope="row">확정일자</th>
					<td  class="left">
						${result.confirm_date }
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(국문)</th>
					<td  class="left">
						${result.name_ko }
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(영문)</th>
					<td class="left">
						${result.name_en }
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(기타)</th>
					<td class="left">
						${result.name_etc }
					</td>
				</tr>					
				<tr>
					<th scope="row">장소</th>
					<td class="left">
						${result.place_name}
					</td>
				</tr>	
				<tr id="rent_facility" <c:if test="${result.place_name != 'HICO' }"></c:if>>
					<th scope="row">대관시설</th>
					<td  class="left">
						<c:if test="${codeResult.get('f1') ne ''}">
							<b>1층 : </b>${codeResult.get("f1")}
						</c:if>
						<c:if test="${codeResult.get('f2') ne ''}">
							<c:if test="${codeResult.get('f1') ne ''}">
								<br>
							</c:if>
							<b>2층 : </b>${codeResult.get("f2")}
						</c:if>
						<c:if test="${codeResult.get('f3') ne ''}">
							<c:if test="${codeResult.get('f1') ne '' || codeResult.get('f2') ne ''}">
								<br>
							</c:if>
							<b>3층 : </b>${codeResult.get("f3")}
						</c:if>
						<c:if test="${codeResult.get('f4') ne ''}">
							<c:if test="${codeResult.get('f1') ne '' || codeResult.get('f2') ne '' || codeResult.get('f3') ne ''}">
								<br>
							</c:if>
							<b>부대시설 : </b>${codeResult.get("f4")}
						</c:if>
					</td>
				</tr>	
				<tr>
					<th scope="row">대관기간</th>
					<td class="left">
						${result.rent_st_date } ~ ${result.rent_ed_date }
					</td>
				</tr>
				<tr>
					<th scope="row">행사기간</th>
					<td class="left">
						${result.event_st_date } ~ ${result.event_ed_date }
					</td>
				</tr>
				<tr>
					<th scope="row">행사구분</th>
					<td class="left">
						${result.event_division_name }
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사분야</th>
					<td class="left">

						${result.event_theme_name}

					</td>
				</tr>	
				
				
				<tr>
					<th scope="row">행사유형</th>
					<td class="left">
						${result.event_type_name }							
					</td>
				</tr>
				<tr>
					<th scope="row">행사성격</th>
					<td class="left">
						${result.event_scale_name }							
					</td>
				</tr>					
				<tr>
					<th scope="row">전체참가자수</th>
					<td class="left">
						<fmt:formatNumber value="${result.join_personal_cnt}" pattern="#,###" />
					</td>
				</tr>					
				<tr>
					<th scope="row">외국인수</th>
					<td class="left">
						<fmt:formatNumber value="${result.join_foreigner_cnt}" pattern="#,###" />
						
					</td>
				</tr>					
				<tr>
					<th scope="row">내국인수</th>
					<td class="left">
						<fmt:formatNumber value="${result.join_nationals_cnt}" pattern="#,###" />
						
					</td>
				</tr>
				<tr>
					<th scope="row">전시부스</th>
					<td class="left">
						<fmt:formatNumber value="${result.booth_cnt}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">전시면적</th>
					<td class="left">
						<fmt:formatNumber value="${result.exhibition_scale}" pattern="#,###" />
						
					</td>
				</tr>
				<tr>
					<th scope="row">참가국수</th>
					<td class="left">
						<fmt:formatNumber value="${result.participating_states_cnt}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">주최기관</th>
					<td class="left">
						${result.organizers_1_name }
						<c:if test="${fn:length(result.organizers_1_name) > 0 }">
						<a href="/crm/organizer/info.do?idx=${result.organizers_1 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td id="organizer_1_member" class="left">
						${d:decrypt(result.manager_1_name) }
						&nbsp; ${d:decrypt(result.manager_1_position) }	
						&nbsp; ${d:decrypt(result.manager_1_tel_no) }
						&nbsp; ${d:decrypt(result.manager_1_phone_no) }
						&nbsp; ${d:decrypt(result.manager_1_email) }
												
						
						<c:if test="${fn:length(d:decrypt(result.manager_1_name)) > 0 }">
						<a href="/crm/customer/info.do?idx=${result.manager_1 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">주관기관</th>
					<td class="left">
						${result.organizers_2_name }
						<c:if test="${fn:length(result.organizers_2_name) > 0 }">
							<a href="/crm/organizer/info.do?idx=${result.organizers_2 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td  class="left" id="organizer_2_member">
						${d:decrypt(result.manager_2_name) }
						&nbsp; ${d:decrypt(result.manager_2_position) }	
						&nbsp; ${d:decrypt(result.manager_2_tel_no) }
						&nbsp; ${d:decrypt(result.manager_2_phone_no) }
						&nbsp; ${d:decrypt(result.manager_2_email) }
												
						<c:if test="${fn:length(d:decrypt(result.manager_2_name)) > 0 }">
							<a href="/crm/customer/info.do?idx=${result.manager_2 }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
						</c:if>
					</td>
				</tr>
				
	
	
				<tr>
					<th scope="row">추가기관</th>
					<td  class="left">
					
						<ul class = "org_plus_wrap">
							<c:forEach var="org_result" items="${orgPlusList}" varStatus="status">
							<li class="left">
								
								<c:if test="${org_result.organizer_idx != '0' }">
									${org_result.organizer_name} &nbsp;&nbsp;
									<a href="/crm/organizer/info.do?idx=${org_result.organizer_idx }" role="button" class="btn1 clr_Wgray" target="_blank" >상세보기</a></br>
								</c:if>
								<c:if test="${org_result.customer_idx != '0' }">
									${org_result.customer_name}&nbsp; 
									${org_result.customer_position}  
									${org_result.customer_tel_no} 
									${org_result.customer_phone_no} 
									${org_result.customer_email} 
									<a href="/crm/customer/info.do?idx=${org_result.customer_idx }" role="button" class="btn1 clr_Wgray" target="_blank">상세보기</a>
								</c:if><br/><br/>
								
							</li>							
							</c:forEach>					
						</ul>
					
					</td>

				</tr>	
				
							
				
				<tr>
					<th scope="row">관련국제기구</th>
					<td class="left">
						${result.organizers_3 }
					</td>
				</tr>
				<tr>
					<th scope="row">공개여부</th>
					<td class="left">
						${result.view_yn }
					</td>
				</tr>
				<tr>
					<th scope="row">홈페이지</th>
					<td class="left">
						${result.homepage }
					</td>
				</tr>	
				
				
			</tbody>
		</table>
				
				
				
		<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
		<h5 class="s_tit">행사정보2</h5>

		<table class="adm_tbl2 ">
		<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">견적제출일</th>
					<td class="left">
						${result.estimate_date }
					</td>
				</tr>
				<tr>
					<th scope="row">견적금액</th>
					<td class="left">
						<fmt:formatNumber value="${result.estimate_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">매출예상액</th>
					<td class="left">
						<fmt:formatNumber value="${result.sales_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">총매출액</th>
					<td class="left">
						<fmt:formatNumber value="${result.total_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">임대매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.rent_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">식음매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.food_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">AV 및 렌탈 매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.av_rental_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">관리비 매출</th>
					<td class="left">
						<fmt:formatNumber value="${result.manager_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">총지원금</th>
					<td class="left">
						<fmt:formatNumber value="${result.total_grant_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">개최지원금</th>
					<td class="left">
						<fmt:formatNumber value="${result.held_grant_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">유치지원금</th>
					<td class="left">
						<fmt:formatNumber value="${result.attract_grant_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">홍보지원금</th>
					<td class="left" >
						<fmt:formatNumber value="${result.sales_grant_cost}" pattern="#,###" />
					</td>
				</tr>
				<tr>
					<th scope="row">유치담당자</th>
					<td class="left">
						${d:decrypt(result.attract_staff_name) }(${result.attract_staff_id })
					</td>
				</tr>
				<tr>
					<th scope="row">행사담당자</th>
					<td class="left">
						${d:decrypt(result.event_staff_name) }(${result.event_staff_id })
					</td>
				</tr>
				
				
				<tr>
					<th scope="row">견적서</td>
					<td>
						<c:import url="/crm/event/attach_file_list.do" charEncoding="utf-8">
							<c:param name="event_idx" value="${result.idx }" />
							<c:param name="type" value="partners_attach_file"/>
							<c:param name="show_delete_btn" value="N"/>
						</c:import>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<pre>${result.partners_comment }</pre>
					</td>
				</tr>

				
				<tr>
					<th scope="row">기타</td>
					<td class="left">
						<c:import url="/crm/event/attach_file_list.do" charEncoding="utf-8">
							<c:param name="event_idx" value="${result.idx }" />
							<c:param name="type" value="etc_attach_file"/>
							<c:param name="show_delete_btn" value="N"/>
						</c:import>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="left">
						<pre>${result.etc_comment }</pre>
					</td>
				</tr>
			</tbody>
		</table>
		
		</sec:authorize>

</div>				
<!-- //모바일만 보이는 화면 행사정보-->




		<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
			<h5 class="s_tit">활동메모</h5>
			<input type="hidden" name="posblAtchFileNumber" value="10" />
			
			<c:import url="/crm/event/promotion_list.do" charEncoding="utf-8">
				<c:param name="parent_idx" value="${result.idx }" />
				<c:param name="promotion_type" value="E"/>
			</c:import>
			
		</sec:authorize>
		
		
		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">

                <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
                     <a href="javascript:win_open('/crm/event/promotion_insert.do?idx=${result.idx}&promotion_type=E&today=${toDay}&redirect_url2=${requestScope['javax.servlet.forward.request_uri']}?idx=${result.idx}&redirect_url=/crm/event/promotion_end.do');" class="nyroModal_ btn1 clr_Wgray">현황입력</a>
                     <a href="/crm/event/edit.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">수정</a>
                     <c:if test="${loginVO.id == result.reg_id}">
                     	<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
                     </c:if>                        
                </sec:authorize>
                <c:if test="${!empty param.pageIndex}"><a href="<c:url value='/crm/event/list.do?pageIndex=${param.pageIndex}'/>" role="button" class="btn1 clr_Wgray">목록</a></c:if>
                <c:if test="${empty param.pageIndex}"><a href="<c:url value='/crm/event/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a></c:if>
                
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
				<a href="<c:url value='/crm/order/from.do?idx=${param.idx}'/>" role="button" class="btn1 clr_Wgray">이벤트 오더</a>
				</sec:authorize>
				
			</div>
		</div>
		<!--// 버튼 위치(e) -->
		
				
		
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>