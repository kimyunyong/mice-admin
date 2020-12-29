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
	
		//검색
		$('#btnSearch').on('click',function(){
			$('#form').attr('action','/crm/event/list.do');
			$('#form').submit();
		});
		
		$('#btnSearch_mobile').on('click',function(){
			$('#form_mobile').attr('action','/crm/event/list.do');
			$('#form_mobile').submit();
		});	

		//등록
		$('#btnRegist, #btnRegist_mobile').on('click',function(){
			location.href='/crm/event/insert.do';
		});	
		
		//엑셀업로드-웹
		$('#form #btnExcelUpload').on('click',function(){
			$('#form input[name=excel]').click();
		});		
		$('#form input[name=excel]').change(function(){
			if($(this).val() != ''){
				$('#form').attr('action','/crm/event/excel_upload.do');
				$('#form').attr('method','post');
				$('#form').submit();
			}
		});
		
		//엑셀업로드-모바일
		$('#form_mobile #btnExcelUpload_mobile').on('click',function(){
			$('#form_mobile input[name=excel]').click();
		});			
		$('#form_mobile input[name=excel]').change(function(){
			if($(this).val() != ''){
				$('#form_mobile').attr('action','/crm/event/excel_upload.do');
				$('#form_mobile').attr('method','post');
				$('#form_mobile').submit();
			}
		});
		
		
	});

	
	
function chkExcelDownload1(obj){
	$(obj).attr('action','/crm/event/excel_download.do');
	$(obj).submit();
}	

function chkExcelDownload2(obj, str){
	$(obj).find("input[name=searchFloor]").val(str);
	$(obj).attr('action','/crm/event/excel_download2.do');
	$(obj).submit();
}	

function chkExcelDownload3(obj, str){
	$(obj).find("input[name=searchFloor]").val(str);
	$(obj).attr('action','/crm/event/excel_download3.do');
	$(obj).submit();
}	

</script>
<script>
function on_search_layer(obj){
	$('#search_layer').bPopup({position:['auto',150]});
	$('#search_layer').attr('data-id',$(obj).attr('data-id'));
	$('input[name=search_organizer_name]').focus();
}
</script>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	var str1 = "#form input[name=searchEventName]";
	$(str1).keydown(function (key) {
		if(key.keyCode == 13){
			$('#form').submit();
		}
	});	
	

	var str2 = "#form_mobile input[name=searchEventName]";
	$(str2).keydown(function (key) {
		if(key.keyCode == 13){
			$('#form_mobile').submit();
		}
	});	
		
});
</script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
<section id="contentArea">
	<h3>대관관리 <span>></span> 대관신청관리</h3>
	<section class="sect_nonetit">
		<h4>정보</h4>
		

<!-- 웹,패드에서만 보이는 서칭조건 -->
<div class="mobile_none">

		<form name="form" id="form" action="/crm/event/list.do" method="get" enctype="multipart/form-data">
		<%-- <sec:authorize ifAnyGranted="ROLE_COWORK">
			<input type="hidden" name="cowork" value="1" />
		</sec:authorize> --%>
		<input name="excel" type="file" style="width:0px"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		<input name="searchFloor" type="hidden" value=""/>



		<table  class="adm_tbl2 " summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
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
			
				<tr>
				<th scope="row">행사구분</th>
				<td colspan="5" class="left">	

							<input type="radio" name="search_manager_event" value="N" <c:if test="${vo.search_manager_event == 'N'}"> checked </c:if> />일반
							<input type="radio" name="search_manager_event" value="M" <c:if test="${vo.search_manager_event == 'M'}"> checked </c:if>/>주관행사
							<input type="radio" name="search_manager_event" value=""  <c:if test="${vo.search_manager_event== '' }"> checked </c:if>/>전체
					
					
				</td>
			</tr>		
			
			<tr>
				<th scope="row">추진현황</th>
				<td colspan="5" class="left">					
					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchImplementsStatusList" />
						<c:param name="type" value="추진현황" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchImplementsStatusList}"/>
					</c:import>
					
				</td>
			</tr>
			
			<tr>
				<th scope="row">행사구분</th>
				<td colspan="5" class="left">
					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchEventDivisionList" />
						<c:param name="type" value="행사구분" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchEventDivisionList}"/>
					</c:import>
				</td>
				
			</tr>

			<tr>
<!-- 				<th scope="row">장소</th>
				<td class="left">
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchPlaceIdx" />
						<c:param name="type" value="장소" />
						<c:param name="result" value="${vo.searchPlaceIdx }"/>
					</c:import>
				</td> -->
				<th scope="row">담당자</th>
				<td  class="left" colspan="5">
					<div >
					<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchRegId" />
						<c:param name="result" value="${vo.searchRegId }"/>
					</c:import>
					</div>
				</td>
			</tr>


			<tr>
				<th scope="row">대관기간</th>
				<td class="left">
					<input name="searchRentStartDate" type="text" class="datepicker wd40per"  value="${vo.searchRentStartDate }"  readonly/> ~
					<input name="searchRentEndDate" type="text" class="datepicker wd40per"  value="${vo.searchRentEndDate }" readonly/>
				</td>
				<th scope="row">행사기간</th>
				<td colspan="3" class="left">
					<input name="searchEventStartDate" type="text" class="datepicker wd40per"  value="${vo.searchEventStartDate }" readonly/> ~
					<input name="searchEventEndDate" type="text" class="datepicker wd40per" value="${vo.searchEventEndDate }" readonly/>
				</td>
			</tr>
			
			
			<tr>
				<th scope="row">전체참가자수</th>
				<td class="left">
						<input name="searchJoinPersonalMinCount" type="number" value="${vo.searchJoinPersonalMinCount }"  class="wd40per"> ~
						<input name="searchJoinPersonalMaxCount" type="number" value="${vo.searchJoinPersonalMaxCount }"   class="wd40per">
				</td>
				<th scope="row">내국인수</th>
				<td class="left">
						<input name="searchJoinNationalsMinCount" type="number"  value="${vo.searchJoinNationalsMinCount }" class="wd40per"> ~
						<input name="searchJoinNationalsMaxCount" type="number"  value="${vo.searchJoinNationalsMaxCount }" class="wd40per">
				</td>
				<th scope="row">외국인수</th>
				<td class="left">
						<input name="searchJoinForeignerMinCount" type="number"  class="wd40per" value="${vo.searchJoinForeignerMinCount }"> ~
						<input name="searchJoinForeignerMaxCount" type="number"  class="wd40per" value="${vo.searchJoinForeignerMaxCount }">
				</td>
			</tr>
			<tr>
				<th scope="row">전시면적</th>
				<td class="left">
						<input name="searchExhibitionScaleMinCount" type="number"  class="wd40per" value="${vo.searchExhibitionScaleMinCount }"> ~
						<input name="searchExhibitionScaleMaxCount" type="number"  class="wd40per" value="${vo.searchExhibitionScaleMaxCount }">
				</td>
				<th scope="row">참가국수</th>
				<td class="left" colspan="3">
						<input name="searchParticipatingStatesMinCount" type="number" class="wd40per"  value="${vo.searchParticipatingStatesMinCount }"> ~
						<input name="searchParticipatingStatesMaxCount" type="number" class="wd40per"  value="${vo.searchParticipatingStatesMaxCount }">
				</td>
			</tr>
			<tr>
				<th scope="row">유치지원금</th>
				<td class="left">
						<input name="searchAttractGrantMinCost" type="number" class="wd40per"  value="${vo.searchAttractGrantMinCost }"> ~
						<input name="searchAttractGrantMaxCost" type="number" class="wd40per"  value="${vo.searchAttractGrantMaxCost }">
				</td>
				<th scope="row">홍보지원금</th>
				<td class="left">
						<input name="searchSalesGrantMinCost" type="number" class="wd40per" value="${vo.searchSalesGrantMinCost }"> ~
						<input name="searchSalesGrantMaxCost" type="number" class="wd40per" value="${vo.searchSalesGrantMaxCost }">
				</td>
				<th scope="row">개최지원금</th>
				<td class="left">
						<input name="searchHeldGrantMinCost" type="number" class="wd40per"  value="${vo.searchHeldGrantMinCost }"> ~
						<input name="searchHeldGrantMaxCost" type="number" class="wd40per"  value="${vo.searchHeldGrantMaxCost }">
				</td>
			</tr>
			
			
			
			
			
			<tr>
				<th scope="row">주최기관</th>
				<td colspan="2" class="left">
				
					<select name="searchOrganizers_1"  class="wd80per">
						<option value=""></option>
						<c:forEach var="result" items="${organizerList }" varStatus="status">
							<option value="${result.idx }" <c:if test="${vo.searchOrganizers_1 == result.idx }">selected</c:if>>${result.name_ko }</option>
						</c:forEach>
					</select>
					<a onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
						
				</td>
				<th scope="row">주관기관</th>
				<td colspan="2" class="left">
				
					<select name="searchOrganizers_2"  class="wd80per">
						<option value=""></option>
						<c:forEach var="result" items="${organizerList }" varStatus="status">
							<option value="${result.idx }"  <c:if test="${vo.searchOrganizers_2 == result.idx }">selected</c:if>>${result.name_ko }</option>
						</c:forEach>
					</select>					
					<a onclick="on_search_layer(this);" data-id="organizers_2" role="button" class="btn1 clr_Wgray" >조회</a>
					
				</td>
			</tr>
			<tr>
				<th scope="row">대관시설</th>
				<td class="left">
					<c:import url="/crm/code/select_box_facility.do" charEncoding="utf-8">
						<c:param name="name" value="searchRentFacility" />
						<c:param name="result" value="${vo.searchRentFacility }"/>
					</c:import>
				</td>
				<th scope="row">행사명</th>
				<td colspan="3" class="left">
					<input type="text" name="searchEventName" value="${vo.searchEventName}" />
				</td>

			</tbody>
		</table>



		<div class="search_new_btn2">
				<a class="n_btn03" id="btnSearch">검색</a>
				<a class="n_btn03" id="btnRegist">등록</a>
		</div>


		<div class="btn_right_area" >
			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
				<a class="sbtn01" id="btnExcelUpload">엑셀업로드</a>
				<a href='/excel_template/events_upload_template.xls' class="sbtn01">엑셀양식다운</a>
				<a href="javascript:chkExcelDownload1('#form');" id="btnExcelDownload" class="sbtn01">엑셀다운</a>
				<a href="javascript:chkExcelDownload2('#form');" id="btnExcelDownload2" class="sbtn01">엑셀다운2</a>
				<!-- <a href="javascript:chkExcelDownload3('#form');" id="btnExcelDownload3" class="sbtn01">엑셀다운3</a> -->
			</sec:authorize>
		</div>
		

		</form>
	
  

</div>		
<!-- //웹,패드에서만 보이는 서칭조건 -->


<!-- 모바일에서만 보이는 서칭조건 -->
<div class="mobile_show">


		<form name="form_mobile" id="form_mobile" action="/crm/event/list.do" method="get" enctype="multipart/form-data">
		<%-- <sec:authorize ifAnyGranted="ROLE_COWORK">
			<input type="hidden" name="cowork" value="1" />
		</sec:authorize> --%>
		<input name="excel" type="file" style="width:0px"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		<input name="searchFloor" type="hidden" value=""/>


		<table  class="adm_tbl2 " summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="27%"/>
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">추진현황</th>
				<td class="left mobile-checkbox">					
					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchImplementsStatusList" />
						<c:param name="type" value="추진현황" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchImplementsStatusList }"/>
					</c:import>
					
				</td>
			</tr>
			<tr>
				<th scope="row">행사구분</th>
				<td  class="left mobile-checkbox">
					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchEventDivisionList" />
						<c:param name="type" value="행사구분" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchEventDivisionList }"/>
					</c:import>
				</td>
			</tr>


		<!-- 	<tr>
				<th scope="row">장소</th>
				<td class="left">
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchPlaceIdx" />
						<c:param name="type" value="장소" />
						<c:param name="result" value="${vo.searchPlaceIdx }"/>
					</c:import>
				</td>
			</tr> -->



			<tr>
				<th scope="row">담당자</th>
				<td  class="left" >
					<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchRegId" />
						<c:param name="result" value="${vo.searchRegId }"/>
					</c:import>
				</td>
			</tr>
			<tr>
				<th scope="row">대관기간</th>
				<td class="left">
					<input name="searchRentStartDate" type="text" class="datepicker wd40per"  value="${vo.searchRentStartDate }"  readonly/> ~
					<input name="searchRentEndDate" type="text" class="datepicker wd40per"  value="${vo.searchRentEndDate }" readonly/>
				</td>
			</tr>
			<tr>
				<th scope="row">행사기간</th>
				<td class="left">
					<input name="searchEventStartDate" type="text" class="datepicker wd40per"  value="${vo.searchEventStartDate }" readonly/> ~
					<input name="searchEventEndDate" type="text" class="datepicker wd40per" value="${vo.searchEventEndDate }" readonly/>
				</td>
			</tr>
			
			
			
			<tr>
				<th scope="row">전체<br>참가자수</th>
				<td class="left">
						<input name="searchJoinPersonalMinCount" type="number" value="${vo.searchJoinPersonalMinCount }"  class="wd40per"> ~
						<input name="searchJoinPersonalMaxCount" type="number" value="${vo.searchJoinPersonalMaxCount }"   class="wd40per">
				</td>
			</tr>
			<tr>

				<th scope="row">내국인수</th>
				<td class="left">
						<input name="searchJoinNationalsMinCount" type="number"  value="${vo.searchJoinNationalsMinCount }" class="wd40per"> ~
						<input name="searchJoinNationalsMaxCount" type="number"  value="${vo.searchJoinNationalsMaxCount }" class="wd40per">
				</td>
			</tr>
			<tr>

				<th scope="row">외국인수</th>
				<td class="left">
						<input name="searchJoinForeignerMinCount" type="number"  class="wd40per" value="${vo.searchJoinForeignerMinCount }"> ~
						<input name="searchJoinForeignerMaxCount" type="number"  class="wd40per" value="${vo.searchJoinForeignerMaxCount }">
				</td>
			</tr>
			<tr>
				<th scope="row">전시면적</th>
				<td class="left">
						<input name="searchExhibitionScaleMinCount" type="number"  class="wd40per" value="${vo.searchExhibitionScaleMinCount }"> ~
						<input name="searchExhibitionScaleMaxCount" type="number"  class="wd40per" value="${vo.searchExhibitionScaleMaxCount }">
				</td>
			</tr>
			<tr>
				<th scope="row">참가국수</th>
				<td class="left">
						<input name="searchParticipatingStatesMinCount" type="number" class="wd40per"  value="${vo.searchParticipatingStatesMinCount }"> ~
						<input name="searchParticipatingStatesMaxCount" type="number" class="wd40per"  value="${vo.searchParticipatingStatesMaxCount }">
				</td>
			</tr>
			<tr>
				<th scope="row">유치지원금</th>
				<td class="left">
						<input name="searchAttractGrantMinCost" type="number" class="wd40per"  value="${vo.searchAttractGrantMinCost }"> ~
						<input name="searchAttractGrantMaxCost" type="number" class="wd40per"  value="${vo.searchAttractGrantMaxCost }">
				</td>
			</tr>
			<tr>

				<th scope="row">홍보지원금</th>
				<td class="left">
						<input name="searchSalesGrantMinCost" type="number" class="wd40per" value="${vo.searchSalesGrantMinCost }"> ~
						<input name="searchSalesGrantMaxCost" type="number" class="wd40per" value="${vo.searchSalesGrantMaxCost }">
				</td>
			</tr>
			<tr>
				<th scope="row">개최지원금</th>
				<td class="left">
						<input name="searchHeldGrantMinCost" type="number" class="wd40per"  value="${vo.searchHeldGrantMinCost }"> ~
						<input name="searchHeldGrantMaxCost" type="number" class="wd40per"  value="${vo.searchHeldGrantMaxCost }">
				</td>
			</tr>
			
			
			
			<tr>
				<th scope="row">주최기관</th>
				<td  class="left search_btn_mobile">
					<select name="searchOrganizers_1"  class="wd90per">
						<option value=""></option>
						<c:forEach var="result" items="${organizerList }" varStatus="status">
							<option value="${result.idx }" <c:if test="${vo.searchOrganizers_1 == result.idx }">selected</c:if>>${result.name_ko }</option>
						</c:forEach>
					</select>	
					<a onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
				</td>
			</tr>
			<tr>
				<th scope="row">주관기관</th>
				<td class="left search_btn_mobile">
					<select name="searchOrganizers_2"  class="wd90per">
						<option value=""></option>
						<c:forEach var="result" items="${organizerList }" varStatus="status">
							<option value="${result.idx }"  <c:if test="${vo.searchOrganizers_2 == result.idx }">selected</c:if>>${result.name_ko }</option>
						</c:forEach>
					</select>	
					<a onclick="on_search_layer(this);" data-id="organizers_2" role="button" class="btn1 clr_Wgray" >조회</a>
									
				</td>
			</tr>
			<tr>
				<th scope="row">대관시설</th>
				<td class="left">
					<c:import url="/crm/code/select_box_facility.do" charEncoding="utf-8">
						<c:param name="name" value="searchRentFacility" />
						<c:param name="result" value="${vo.searchRentFacility }"/>
					</c:import>
				</td>
			</tr>
			<tr>
				<th scope="row">행사명</th>
				<td  class="left">
					<input type="text" name="searchEventName" value="${vo.searchEventName }" />
				</td>

			</tbody>
		</table>
		
		
		
		<div class="search_new_btn" style="padding-bottom:0px;">
				<a class="n_btn03" id="btnSearch_mobile">검색</a>
				<a class="n_btn03" id="btnRegist_mobile">등록</a>
		</div>



		<div class="search_new_btn" >
			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
				<a class="sbtn01" id="btnExcelUpload_mobile">엑셀업로드</a>
				<a href='/excel_template/events_upload_template.xls' class="sbtn01">엑셀양식다운</a>
				<a href="javascript:chkExcelDownload1('#form_mobile');" id="btnExcelDownload_mobile" class="sbtn01">엑셀다운</a>
				<a href="javascript:chkExcelDownload2('#form_mobile');" id="btnExcelDownload2_mobile" class="sbtn01">엑셀다운2</a>
				<!-- <a href="javascript:chkExcelDownload3('#form_mobile');" id="btnExcelDownload3_mobile" class="sbtn01">엑셀다운3</a> -->
			</sec:authorize>
		</div>


		</form>
	
 
		
		
</div>		
<!-- //모바일에서만 보이는 서칭조건 -->



      
		<h4 style="padding-top:15px">검색결과</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>


<!-- 웹,패드에서만 보이는 테이블 -->
		<table class="adm_tbl2 mobile_none" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col />
				<col width="20%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">행사명</th>
					<th scope="col">주최기관</th>
			    	<th scope="col">행사기간</th>
			    	<th scope="col">유치담당자</th>
			    	<th scope="col">참가자수</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>${result.idx }</td>
				<td><a href="/crm/event/info.do?idx=${result.idx}&pageIndex=${vo.pageIndex}">${result.name_ko }</a></td>
				<td>${result.organizers_1_name}</td>
				<td>${result.event_st_date }~${result.event_ed_date }</td>
				<td><!--${result.place_name }!--> ${d:decrypt(result.attract_staff_name) }(${result.attract_staff_id }) </td>
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

<!-- //웹,패드에서만 보이는 테이블 -->



<!-- 모바일에서만 보이는 결과 -->
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="mobile_list">
				<dl>
					<dt>구분</dt>
					<dd>${result.idx }</dd>
				</dl>

				<dl>
					<dt>행사명</dt>
					<dd><a href="/crm/event/info.do?idx=${result.idx}&pageIndex=${vo.pageIndex}">${result.name_ko }</a></dd>
				</dl>

				<dl>
					<dt>주최기관</dt>
					<dd>${result.organizers_1_name}</dd>
				</dl>

				<dl>
					<dt>행사기간</dt>
					<dd>${result.event_st_date }~${result.event_ed_date }</dd>
				</dl>

				<dl>
					<dt>장소</dt>
					<dd>${result.place_name }</dd>
				</dl>
				<dl>
					<dt>참가자수</dt>
					<dd>${result.join_personal_cnt }</dd>
				</dl>
			</div>
			 </c:forEach>

<!-- //모바일에서만 보이는 결과 -->



			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="10"></td>
			  </tr>
			</table>
			
			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>


		<%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
			
	</section>
</section>
</sec:authorize>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
