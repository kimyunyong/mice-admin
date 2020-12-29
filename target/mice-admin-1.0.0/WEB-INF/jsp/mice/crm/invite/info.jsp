<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("enter", "\n");
%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/mice/admin.css?ver=20160212">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>

$(document).ready(function(){
	$("#btnUpdate").click(function(){
		location.href = '/crm/invite/modify.do?idx=${param.idx}';
	});
});

</script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>

<style>
	table{width: 100%;}
	.left{text-align: left !important;}
	.small_btn {
	    background: #cad7e2;
	    color: #2673b5 !important;
	    border: 1px solid #3b6181;
	    font-size: 11px;
	    padding: 5px;
	    font-weight: bold;
	    line-height: 50px;
	}
	.clr_Dgray , .clr_Wgray{padding: 5px;} 
	
	p{margin: 5px 0px; color: blue; font-size: 0.8em;}
	.btn_remove{margin: 0 10px; color: #FF0000; font-size: 10px;}
	.search_new_btn{margin: 30px auto; width: 500px;}
}
</style>

<!-- contentArea -->
<section id="contentArea">
    <h3>고객DB관리<span> > </span> 뷰로유치관리 조회</h3><!-- 180104 -->
	
	<!-- sect_nonetit -->
    <section class="sect_nonetit">
		
		
		<!-- 행사정보 -->
		<h5 class="s_tit">행사정보</h5>		
		<table class="adm_tbl2" width="100%">
			<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">추진현황</th>
					<td class="left">
						${getInvite.implementation_status_val }
					</td>
					<th scope="row">국내외 여부</th>
					<td class="left">
						${getInvite.invite_character_val }
					</td>
				</tr>	
				<tr>
					<th scope="row">분류</th>
					<td class="left">
						${getInvite.invite_category_val }
					</td>
					<th scope="row">담당자</th>
					<td class="left">
						${getInvite.relation_name_val }			
					</td>
				</tr>

				<tr>
					<th scope="row">유치확정 일자</th>
					<td class="left" colspan="3">
						${getInvite.confirm_date }
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사명 (국문)</th>
					<td class="left" colspan="3">
						${getInvite.name_ko }
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사명 (영문)</th>
					<td class="left" colspan="3">
						${getInvite.name_en }
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사명 (영문약칭)</th>
					<td class="left" colspan="3">
						${getInvite.name_etc }
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사구분</th>
					<td class="left" colspan="3">
						${getInvite.event_division_val }
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사분야</th>
					<td class="left" colspan="3">
						<c:forEach var="theme" items="${getThemeList}">
							${theme.event_theme_name}
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<th scope="row">개최주기</th>
					<td class="left" colspan="3">
						${getInvite.open_period }
					</td>
				</tr>
				<tr>
					<th scope="row">행사기간</th>
					<td class="left" colspan="3">
					    ${getInvite.event_term }
					</td>
				</tr>
				<tr>
					<th scope="row">제안기간</th>
					<td class="left" colspan="3">
					    ${getInvite.sugt_st_date }
					</td>
				</tr>
				<tr>
					<th scope="row">참가규모</th>
					<td class="left" colspan="3">
						총 : ${getInvite.join_total_nation } 개국,&nbsp;${getInvite.join_total_cnt } 명<br />
						국내 : ${getInvite.join_nationals_cnt } 명 <br />
						해외 : ${getInvite.join_foreigner } 개국 ,&nbsp;${getInvite.join_foreigner_cnt } 명  <!-- 180104 -->
					</td>
				</tr>
									
				<tr>
					<th scope="row">장소</th>
					<td class="left" colspan="3">
						${getInvite.place_val}
					</td>
				</tr>
				
				<tr>
					<th scope="row">기 개최국가</th>
					<td class="left" colspan="3">${fn:replace(getInvite.etc_open_nation,enter,'<br/>')}</td>
				</tr>
				
				<tr>
					<th scope="row">개최지결정방법</th>
					<td class="left" colspan="3">
						${getInvite.decision_method }
					</td>
				</tr>
				
				<tr>
					<th scope="row">유치결정시기</th>
					<td class="left" colspan="3">
						${getInvite.decision_time }
					</td>
				</tr>

				<tr>
					<th scope="row">국제기구</th>
					<td class="left" colspan="3">
						${getInvite.organizers }
					</td>
				</tr>

				<tr>
					<th scope="row">국내기관</th>
					<td class="left" colspan="3">
						${getInvite.interior_agency_val }
					</td>
				</tr>
									
				<tr>
					<th scope="row">기타사항</th>
					<td class="left" colspan="3">
						${fn:replace(getInvite.etc_comment,enter,'<br/>')}
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사프로그램</th>
					<td class="left" colspan="3">
					    <ul id="#">
							<c:forEach items="${getEventFile}" var="file" varStatus="status">
								<li><p>- 파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a></p></li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- //행사정보 -->
	
	
		<!-- 지원내역 -->
		<h5 class="s_tit">지원내역</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" rowspan="6">지원내역</th>
						<th style="height: 20px;">유치지원</th>
						
					</tr>
					<tr>
						<td class="left">
							<ul class="left invite_cost">
								<c:forEach items="${getSupport}" var="support">
									<li>금액 : ${support.invite_cost }<fmt:formatNumber type="currency" currencySymbol="￦" value="" /> 원  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ${support.invite_cost_etc} <br /></li>
								</c:forEach>
								
							</ul>
						</td>
					</tr>
					<tr>
						<th style="height: 20px;">홍보지원</th>
					</tr>
					<tr>					
						<td class="left">
							<ul class="left invite_promotion_cost">
								<c:forEach items="${getPromotion}" var="promotion">
									<li>금액 : ${promotion.invite_cost}<fmt:formatNumber type="currency" currencySymbol="￦" value="" /> 원  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ${promotion.invite_cost_etc} <br /></li>
								</c:forEach>
							</ul>
						</td>
					</tr>
					<tr>
						<th style="height: 20px;">개최지원</th>
					</tr>
					<tr>
						<td class="left">
							<ul class="left invite_open_cost">
								<c:forEach items="${getOpen}" var="open">
									<li>금액 : ${open.invite_cost}<fmt:formatNumber type="currency" currencySymbol="￦" value="" /> 원  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ${open.invite_cost_etc} <br /></li>
								</c:forEach>
							</ul>
						</td>
					</tr>

					<tr>
						<th scope="row">제안서 첨부</th>
						<td class="left">
							<ul id="#">
								<c:forEach items="${getOfferFile}" var="file" varStatus="status">
									<li><p>- 파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a></p></li>
								</c:forEach>
							</ul>
						</td>
					</tr>
					
					<tr style="display:none">
						<th scope="row">유치실패 사유</th>
						<td class="left">
							${getInvite.open_fail_cause }
						</td>
					</tr>
				</tbody>
		</table>
		<!-- //지원내역 -->
	
	
		<!-- 통계조사 -->
<!-- 	<h5 class="s_tit"><span>통계조사</span><span style=color:red;>(진행중..)</span></h5> -->
	
			<!-- adm_tbl2 -->
<!-- 			<table class="adm_tbl2"> -->
<!-- 				<caption>상세</caption> -->
<!-- 					<colgroup> -->
<!-- 						<col width="27%"> -->
<!-- 						<col> -->
<!-- 					</colgroup> -->
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<th scope="row" rowspan="3">직접지출</th> -->
<!-- 							<td class="left"> -->
<!-- 								국내인평균 :    -->
<!-- 							</td> -->
<!-- 						</tr> -->
	
<!-- 						<tr> -->
<!-- 							<td class="left"> -->
<!-- 								해외참가자평균 :    -->
<!-- 							</td> -->
<!-- 						</tr> -->
	
<!-- 						<tr> -->
<!-- 							<td class="left"> -->
<!-- 								<ul id="#"> -->
<%-- 									<c:forEach items="${getStatsFile}" var="file" varStatus="status"> --%>
<%-- 										<li><p>- 파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a></p></li> --%>
<%-- 									</c:forEach> --%>
<!-- 								</ul> -->
<!-- 							</td> -->
<!-- 						</tr> -->
						
	
<!-- 					</tbody> -->
<!-- 			</table> -->
		<!-- //adm_tbl2 -->
		<!-- //통계조사 -->
	
	
		<!-- 주요인사연결-->
		<h5 class="s_tit">주요인사연결</h5>
		<table class="adm_tbl2 mobile_none">
			<caption>상세</caption>
			<colgroup>
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="15%">
					<col width="10%">
					<col width="12%">
					<col width="12%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col >
			</colgroup>
			<thead>
				<tr>
					<th>성명</th>
					<th>직위</th>
					<th>소속_엑셀</th>
					<th>근무처</th>
					<th>부서/학과</th>
					<th>전화</th>
					<th>휴대전화</th>
					<th>이메일</th>
					<th>주소</th>
					<th>상담내역</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${getCustomer }" var="customer">
					<tr>
						<td>
							${customer.name_ko}
						</td>
						<td>
							${customer.staff }
						</td>
						<td>
							${customer.sosoc_excel }
						</td>
						<td>
							${customer.organizer_name}
						</td>
						<td>
							${customer.unit}
						</td>
						<td>
							${d:decrypt(customer.tel_no)}
						</td>
						<td>
							${d:decrypt(customer.phone_no)}
						</td>
						<td>
							${d:decrypt(customer.email)}
						</td>
						<td>
							${customer.address}
						</td>
						<td>
							<a href="javascript:;" onclick='window.open("detail.do?idx=${param.idx}&customer_idx=${customer.idx }", "childForm", "width=1200px, height=800px, resizable = no, scrollbars = no");' class="small_btn">내역</a>
						</td>				
					</tr>
				</c:forEach>
			</tbody>
		</table>

		
		<c:forEach items="${getCustomer }" var="customer">
		<div class="mobile_list">
			<dl>
				<dt>성명</dt>
				<dd>		
					${customer.name_ko}
					<a href="javascript:;" onclick='window.open("detail.do?idx=${param.idx}&customer_idx=${customer.idx }", "childForm", "width=1200px, height=800px, resizable = no, scrollbars = no");' class="small_btn">내역</a>
				</dd>
			</dl>
		
			<dl>
				<dt>직위</dt>
				<dd>${customer.staff }</dd>
			</dl>
			<dl>
				<dt>소속_엑셀</dt>
				<dd>${customer.sosoc_excel }</dd>
			</dl>
			<dl>
				<dt>근무처</dt>
				<dd>${customer.organizer_name}</dd>
			</dl>
		
			<dl>
				<dt>부서/학과</dt>
				<dd>${customer.unit}</dd>
			</dl>
			<dl>
				<dt>전화</dt>
				<dd>${d:decrypt(customer.tel_no)}</dd>
			</dl>
			<dl>
				<dt>휴대전화</dt>
				<dd>${d:decrypt(customer.phone_no)}</dd>
			</dl>
		
			<dl>
				<dt>이메일</dt>
				<dd>${d:decrypt(customer.email)}</dd>
			</dl>
		
			<dl>
				<dt>주소</dt>
				<dd>	${customer.address}</dd>
			</dl>
			<dl>
				<dt>비고</dt>
				<dd>.</dd>
			</dl>	
		</div>	
		</c:forEach>
		<!-- //주요인사연결-->
		
		
		<!-- 유치실패사유 -->
		<h5 class="s_tit">유치실패사유</h5>
		<table class="adm_tbl2">
			<tr>
				<th scope="row" style="width:27%">내용</th>
				<td class="left">
					${fn:replace(getInvite.open_fail_cause,enter,'<br/>')}
				</td>
			</tr>
		</table>
		<!-- //유치실패사유 -->

				
	
		<!-- 담당자 -->
		<h5 class="s_tit">담당자</h5>
		<table class="adm_tbl2">
			<tr>
				<th scope="row" style="width:27%">유치담당</th>
				<td class="left">
					${fn:replace(getInvite.manager1,enter,'<br/>')}
				</td>
			</tr>
			<tr>
				<th scope="row" style="width:27%">개최지원 담당(CVB Level)</th>
				<td class="left">
					${fn:replace(getInvite.manager2,enter,'<br/>')}
				</td>
			</tr>
			<tr>
				<th scope="row" style="width:27%">대관담당(Venue Level)</th>
				<td class="left">
					${fn:replace(getInvite.manager3,enter,'<br/>')}
				</td>
			</tr>
			
		</table>
	    <!-- //담당자 -->

	    				

		<!-- 버튼 위치(s) -->
		<div class="search_new_btn">
				<a id="btnUpdate" role="button" class="btn1 clr_Wgray">수정</a>
				<a href="/crm/invite/delete.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">삭제</a>
				<a href="/crm/invite/list.do" role="button" class="btn1 clr_Wgray">목록</a>
		</div>
		<!--// 버튼 위치(e) -->

        
	</section>
	<!-- //sect_nonetit -->

</section>
    