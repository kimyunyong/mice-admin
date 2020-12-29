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

	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').attr('action','/crm/event/list.do');
			$('form').submit();
		});
		$('#btnRegist').on('click',function(){
			location.href='/crm/event/insert.do';
		});
		
		$('#btnExcelDownload').on('click',function(){
			$('form').attr('action','/crm/event/excel_download.do');
			$('form').submit();
		});
		
		$('#btnExcelDownload2').on('click',function(){
			$('form').attr('action','/crm/event/excel_download2.do');
			$('form').submit();
		});
		
		$('#btnExcelUpload').on('click',function(){
			$('input[name=excel]').click();
		});
		
		$('input[name=excel]').change(function(){
			
			if($(this).val() != ''){
				$('form').attr('action','/crm/event/excel_upload.do');
				$('form').submit();
			}
				
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>컨벤션CRM관리 > 대관신청관리</h3>
	<section class="sect_nonetit">
		<h4>정보</h4>
		
		<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
		<form name="form" action="/crm/event/list.do" method="get" enctype="multipart/form-data">
		<%-- <sec:authorize ifAnyGranted="ROLE_COWORK">
			<input type="hidden" name="cowork" value="1" />
		</sec:authorize> --%>
		<input name="excel" type="file" style="width:0px"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		<table width="900px" cellpadding="8" class="adm_tbl2" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="13%"/>
				<col width="20%"/>
				<col width="13%"/>
				<col width="20%"/>
				<col width="13%"/>
				<col width="20%"/>
			</colgroup>
			<tbody>
			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
			<tr>
				<th scope="row">추진현황</th>
				<td colspan="5">
					<div style="float:left">
					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchImplementsStatusList" />
						<c:param name="type" value="추진현황" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchImplementsStatusList }"/>
					</c:import>
					</div>
				</td>
			</tr>
			</sec:authorize>
			<tr>
				<th scope="row">행사구분</th>
				<td colspan="5">
					<div style="float:left">
					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchEventDivisionList" />
						<c:param name="type" value="행사구분" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchEventDivisionList }"/>
					</c:import>
					</div>
				</td>
				
			</tr>
			<tr>
				<th scope="row">장소</th>
				<td>
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchPlaceIdx" />
						<c:param name="type" value="장소" />
						<c:param name="result" value="${vo.searchPlaceIdx }"/>
					</c:import>
				</td>
				<th scope="row">담당자</th>
				<td colspan="3">
					<div style="float:left">
					<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchRegId" />
						<c:param name="result" value="${vo.searchRegId }"/>
					</c:import>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">대관기간</th>
				<td>
					<input name="searchRentStartDate" type="text" class="datepicker" size="9" value="${vo.searchRentStartDate }" style="width:80px" readonly/> ~
					<input name="searchRentEndDate" type="text" class="datepicker" size="9" value="${vo.searchRentEndDate }" style="width:80px" readonly/>
				</td>
				<th scope="row">행사기간</th>
				<td colspan="3">
					<input name="searchEventStartDate" type="text" class="datepicker" size="9" value="${vo.searchEventStartDate }" readonly/> ~
					<input name="searchEventEndDate" type="text" class="datepicker" size="9" value="${vo.searchEventEndDate }" readonly/>
				</td>
			</tr>
			<tr>
				<th scope="row">전체참가자수</th>
				<td>
					<div style="float:left">
						<input name="searchJoinPersonalMinCount" type="number" value="${vo.searchJoinPersonalMinCount }" style="width:30px"> ~
						<input name="searchJoinPersonalMaxCount" type="number" value="${vo.searchJoinPersonalMaxCount }" style="width:30px">
					</div> 
				</td>
				<th scope="row">내국인수</th>
				<td>
					<div style="float:left">
						<input name="searchJoinNationalsMinCount" type="number" style="width:30px" value="${vo.searchJoinNationalsMinCount }"> ~
						<input name="searchJoinNationalsMaxCount" type="number" style="width:30px" value="${vo.searchJoinNationalsMaxCount }">
					</div> 
				</td>
				<th scope="row">외국인수</th>
				<td>
					<div style="float:left">
						<input name="searchJoinForeignerMinCount" type="number" style="width:30px" value="${vo.searchJoinForeignerMinCount }"> ~
						<input name="searchJoinForeignerMaxCount" type="number" style="width:30px" value="${vo.searchJoinForeignerMaxCount }">
					</div> 
				</td>
			</tr>
			<tr>
				<th scope="row">전시면적</th>
				<td>
					<div style="float:left">
						<input name="searchExhibitionScaleMinCount" type="number" style="width:30px" value="${vo.searchExhibitionScaleMinCount }"> ~
						<input name="searchExhibitionScaleMaxCount" type="number" style="width:30px" value="${vo.searchExhibitionScaleMaxCount }">
					</div> 
				</td>
				<th scope="row">참가국수</th>
				<td colspan="3">
					<div style="float:left">
						<input name="searchParticipatingStatesMinCount" type="number" style="width:30px" value="${vo.searchParticipatingStatesMinCount }"> ~
						<input name="searchParticipatingStatesMaxCount" type="number" style="width:30px" value="${vo.searchParticipatingStatesMaxCount }">
					</div> 
				</td>
			</tr>
			<tr>
				<th scope="row">유치지원금</th>
				<td>
					<div style="float:left">
						<input name="searchAttractGrantMinCost" type="number" style="width:30px" value="${vo.searchAttractGrantMinCost }"> ~
						<input name="searchAttractGrantMaxCost" type="number" style="width:30px" value="${vo.searchAttractGrantMaxCost }">
					</div> 
				</td>
				<th scope="row">홍보지원금</th>
				<td>
					<div style="float:left">
						<input name="searchSalesGrantMinCost" type="number" style="width:30px" value="${vo.searchSalesGrantMinCost }"> ~
						<input name="searchSalesGrantMaxCost" type="number" style="width:30px" value="${vo.searchSalesGrantMaxCost }">
					</div> 
				</td>
				<th scope="row">개최지원금</th>
				<td>
					<div style="float:left">
						<input name="searchHeldGrantMinCost" type="number" style="width:30px" value="${vo.searchHeldGrantMinCost }"> ~
						<input name="searchHeldGrantMaxCost" type="number" style="width:30px" value="${vo.searchHeldGrantMaxCost }">
					</div> 
				</td>
			</tr>
			<tr>
				<th scope="row">주최기관</th>
				<td colspan="2">
					<select name="searchOrganizers_1" style="float:left;width:200px">
						<option value=""></option>
						<c:forEach var="result" items="${organizerList }" varStatus="status">
							<option value="${result.idx }" <c:if test="${vo.searchOrganizers_1 == result.idx }">selected</c:if>>${result.name_ko }</option>
						</c:forEach>
					</select>	
				</td>
				<th scope="row">주관기관</th>
				<td colspan="2">
					<select name="searchOrganizers_2" style="float:left;width:200px">
						<option value=""></option>
						<c:forEach var="result" items="${organizerList }" varStatus="status">
							<option value="${result.idx }"  <c:if test="${vo.searchOrganizers_2 == result.idx }">selected</c:if>>${result.name_ko }</option>
						</c:forEach>
					</select>					
				</td>
			</tr>
			<tr>
				<th scope="row">대관시설</th>
				<td>
					<c:import url="/crm/code/select_box_facility.do" charEncoding="utf-8">
						<c:param name="name" value="searchRentFacility" />
						<c:param name="result" value="${vo.searchRentFacility }"/>
					</c:import>
				</td>
				<th scope="row">행사명</th>
				<td colspan="2">
					<input type="text" name="searchEventName" style="width:100%" value="${vo.searchEventName }" />
				</td>
				<td>
					<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align:left;margin-left:15px">
					<pre style="font-weight:bold"">전체참가자수 : <fmt:formatNumber>${SummaryTotalParticipant }</fmt:formatNumber>명		외국인수 : <fmt:formatNumber>${SummaryForeigner }</fmt:formatNumber>명		내국인수 : <fmt:formatNumber>${SummaryNational }</fmt:formatNumber>명

전시부스 : <fmt:formatNumber>${SummaryBooth }</fmt:formatNumber>개			전시면적 : <fmt:formatNumber>${SummaryExhibitionScale }</fmt:formatNumber>㎥			견적금액 : <fmt:formatNumber>${SummaryEstimateCost }</fmt:formatNumber>원

임대매출 : <fmt:formatNumber>${SummaryRentCost }</fmt:formatNumber>원		식음매출 : <fmt:formatNumber>${SummaryFoodCost }</fmt:formatNumber>원		AV및렌탈매출 : <fmt:formatNumber>${SummaryAVCost }</fmt:formatNumber>원		관리비매출 : <fmt:formatNumber>${SummaryManageCost }</fmt:formatNumber>원

총매출 : <fmt:formatNumber>${SummaryTotalCost }</fmt:formatNumber>원		가동률(면적) : ${SummaryArea} %		가동률(매출) : ${SummaryAreaCost  }%		

가동률(실내전시장면적) : ${SummaryInnerArea } %
					</pre>
				</td>
			</tr>
			</tbody>
		</table>
		</form>
		</sec:authorize>
		<h4 style="padding-top:15px">검색결과</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<table width="100%" cellpadding="8" class="adm_tbl2" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">행사명</th>
					<th scope="col">주최기관</th>
			    	<th scope="col">행사기간</th>
			    	<th scope="col">장소</th>
			    	<th scope="col">참가자수</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>${result.idx }</td>
				<td><a href="/crm/event/info.do?idx=${result.idx}">${result.name_ko }</a></td>
				<td>${result.organizers_1_name}</td>
				<td>${result.event_st_date }~${result.event_ed_date }</td>
				<td>${result.place_name }</td>
				<td>${result.join_personal_cnt }</td>
			</tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="10"></td>
			  </tr>
			</table>
			
			
			<div align="center">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>
			<div align="center" style="padding-top:30px">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
					<a class="btn2 clrGrad_Wgray" id="btnExcelUpload">엑셀업로드</a>
					<a href='/excel_template/events_upload_template.xls' class="btn2 clrGrad_Wgray">엑셀양식 다운받기</a>
					<a id="btnExcelDownload" class="btn2 clrGrad_Wgray">엑셀다운로드</a>
					<a id="btnExcelDownload2" class="btn2 clrGrad_Wgray">엑셀다운로드 2</a>
					<a class="btn2 clrGrad_Wgray" id="btnRegist">등록</a>
				</sec:authorize>
			</div>
			</td>
			</tr>
			</table>
			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>