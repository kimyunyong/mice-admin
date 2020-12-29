<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>

// web
function fnLinkPage(pageno){
	
	var flag = $('form[name=frm_top_search] input[name=flag]').val();
	if($('form[name=frm_top_search] input[name=flag]').val() == '0'){
		$('form[name=frm_top_search]').attr('action','/crm/search/list.do');
		$('form[name=frm_top_search] input[name=pageIndex]').val(pageno);
		//$('form[name=frm_top_search]').submit();
		document.frm_top_search.submit();
	}else if($('form[name=frm_top_search] input[name=flag]').val() == '1'){
		$('form[name=form]').attr('action','/crm/search/list.do');
		$('form[name=form] input[name=pageIndex]').val(pageno);
		//$('form[name=form]').submit();
		document.form.submit();
	}
}	
	
// mobile
function fnLinkPage_mobile(pageno){	
	if($('form[name=frm_top_search] input[name=flag]').val() == '0'){
		$('form[name=frm_top_search]').attr('action','/crm/search/list.do');
		$('form[name=frm_top_search] input[name=pageIndex]').val(pageno);
		$('form[name=frm_top_search]').submit();
		document.frm_top_search.submit();
	}else if($('form[name=frm_top_search] input[name=flag]').val() == '1'){
		$('form[name=form_mobile]').attr('action','/crm/search/list.do');
		$('form[name=form_mobile] input[name=pageIndex]').val(pageno);
		$('form[name=form_mobile]').submit();
		document.form_mobile.submit();
	}
}	
	

function chkOrder(frm, val){
	$(frm).attr('action','/crm/search/list.do');
	$(frm).attr('method','get');
	$(frm).find("input[name=searchOrder]").val(val);
	frm.submit();
}	


function chkExcel(frm, val, flag){
	
	if(flag == 1){
		if(val == "select"){
			if( $(frm).find("input[name=searchNum]").is(":checked") == false){
				alert("항목을 1개 이상 선택하시기 바랍니다.");
				return 
			}
		}
	}
	if( confirm("엑셀파일로드시 파일을 저장하시겠습니까?") == true && $(frm).find("input[name=search_title]").val() == ""){
		if( $(frm).find("input[name=search_title]").val() == ""){
			alert("엑셀 파일명을 입력하세요");
			return;
		}
	}

	if(flag == 0){
		
		//선택항목 배열로 가져오기
		var params_num = "";
		$(frm).find("input[name=searchNum]").each(function(){
			if( $(this).is(":checked") == true){
				params_num = params_num + "&searchNum=" + $(this).val();
			}
		});
			
		$(document.frm_top_search).find("input[name=search_title]").val( $(frm).find("input[name=search_title]").val() );		
		$(document.frm_top_search).find("input[name=searchExcel]").val(val);		
		$(document.frm_top_search).attr('action','/crm/search/excel_download2.do?searchNum='+params_num);
		$(document.frm_top_search).attr('method','post');
		document.frm_top_search.submit();
		$(frm).find("input[name=search_title]").val("");
		
		
	}else{
		$(frm).find("input[name=searchExcel]").val(val);		
		$(frm).attr('action','/crm/search/excel_download2.do');
		$(frm).attr('method','post');
		frm.submit();
		$(frm).find("input[name=search_title]").val("");
	}
	

	
}		
function chkSMS(frm, val, flag){
	
	if(val == "select"){
		if( $(frm).find("input[name=searchNum]").is(":checked") == false){
			alert("항목을 1개 이상 선택하시기 바랍니다.");
			return 
		}
	}
	
	var params = "";
	
	//상단검색 여부 체크
	if(flag == 0){
		
		//선택항목 배열로 가져오기
		var params_num = "";
		$(frm).find("input[name=searchNum]").each(function(){
			if( $(this).is(":checked") == true){
				params_num = params_num + "&searchNum=" + $(this).val();
			}
		});
		
		$(document.frm_top_search).find("input[name=searchExcel]").val(val);		
		params = $(document.frm_top_search).serialize() + params_num;
		
	}else{
		$(frm).find("input[name=searchExcel]").val(val);		
		params = $(frm).serialize(); 
	}
	window.open("/crm/search/sms_msg.do?"+params, "sms", "width=800px, height=750px, resizable=yes, scrollbars=yes");
	
}

function chkNumVal(val){
	var str = "";
	$('input:checkbox[name='+val+']').each(function(idx) {
	   
		if($(this).is(':checked')){
	  	 	if(idx != 0) str += ",";
			str += ($(this).val());
	    }
	});
	return str;
} 

function chkReset(frm){
	
		$(frm).find("input[name=searchOrder]").val("");
		$(frm).find("input[name=searchExcel]").val("");		
		$(frm).find("input[name=searchUserName]").val("");
		$(frm).find("input[name=searchUserPosition]").val("");
		$(frm).find("input[name=searchUserAddr]").val("");
		$(frm).find("input[name=searchUserEtc]").val("");		
		$(frm).find("input[name=searchSosoc]").val("");		
		$(frm).find("input[name=searchSosoc_excel]").val("");
		$(frm).find("input[name=searchArea]").val("");
		$(frm).find("input[name=searchDepartment]").val("");
		
		$(frm).find("input[name=searchEvtName]").val("");
		$(frm).find("input[name=searchSdate]").val("");
		$(frm).find("input[name=searchEdate]").val("");
		$(frm).find("input[name=searchRegName]").val("");
		
		//$(frm).find("input[name=searchOrgList]").prop("selected",false);
		//$(frm).find("input[name=searchEvtThemeList]").prop("selected",false);
		
		$(frm).find("select[name=searchOrgList] option").prop("selected",false);
		$(frm).find("select[name=searchEvtThemeList] option").prop("selected",false);
		
		$(frm).find("input[name=searchNewsLetter]").prop("checked",false);
		$(frm).find("input[name=searchCountry]").prop("checked",false);
		$(frm).find("input[name=chkAll]").prop("checked",false);
		$(frm).find("input[name=searchNum]").prop("checked",false);
}

function chkSearch(frm){
	
	if( $(frm).find("input[name=searchSdate]").val() != "" && $(frm).find("input[name=searchEdate]").val() == ""){
		alert("종료날짜를 선택하시기 바랍니다.");
		return;
	}
	
	if( $(frm).find("input[name=searchSdate]").val() == "" && $(frm).find("input[name=searchEdate]").val() != ""){
		alert("시작날짜를 선택하시기 바랍니다.");
		return;
	}
	if( $(frm).find("input[name=searchSdate]").val() > $(frm).find("input[name=searchEdate]").val()){
		alert("시작날짜는 종료날짜보다 작아야합니다.");
		return;
	}
	$(frm).find("input[name=pageIndex]").val(1);
	$(frm).attr('action','/crm/search/list.do');
	$(frm).attr('method','get');
	frm.submit();
}

function chkSelectAll(frm){
	if( $(frm).find("input[name=chkAll]").is(":checked") == true ){
		$(frm).find("input[name=searchNum]").prop("checked", true);
	}else{
		$(frm).find("input[name=searchNum]").prop("checked", false);
	}
}

function chkSelectOrgAll(frm){
	if( $(frm).find("input[name=org_all]").is(":checked") == true ){
		$(frm).find("input[name=searchOrgList]").prop("checked", true);
	}else{
		$(frm).find("input[name=searchOrgList]").prop("checked", false);
	}		
}
function chkSelectThemeAll(frm){
	if( $(frm).find("input[name=theme_all]").is(":checked") == true ){
		$(frm).find("input[name=searchEvtThemeList]").prop("checked", true);
	}else{
		$(frm).find("input[name=searchEvtThemeList]").prop("checked", false);
	}
}

function chkForm(frm){
	$(frm).attr('action', '/crm/search/list.do');
	$(frm).attr('method', 'get');
	$(frm).find("input[name=pageIndex]").val(1);
	frm.submit();

}
function chkExcelList(){
	window.open("/crm/search/excel_file_list.do", "excel_file", "width=600px, height=800px, resizable=yes, scrollbars=yes");
}
</script>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	$("#pagination_info").find("a").attr("href","javascript:;");
	$("#pagination_info_mobile").find("a").attr("href","javascript:;");	

	var str1 = "form[name=form] input[name=searchUserName], form[name=form] input[name=searchUserPosition]";
	str1 = str1 + ",form[name=form] input[name=searchUserAddr],form[name=form] input[name=searchUserEtc]";
	str1 = str1 + ",form[name=form] input[name=searchSosoc],  form[name=form] input[name=searchSosoc_excel]";
	str1 = str1 + ",form[name=form] input[name=searchArea], form[name=form] input[name=searchEmail]";
	str1 = str1 + ",form[name=form] input[name=searchEvtName], form[name=form] input[name=searchRegName]";
	$(str1).keydown(function (key) {
		if(key.keyCode == 13){
			chkForm(document.form);
		}
	});	
	

	var str2 = "form[name=form_mobile] input[name=searchUserName], form[name=form_mobile] input[name=searchUserPosition]";
	str2 = str2 + ",form[name=form_mobile] input[name=searchUserAddr], form[name=form_mobile] input[name=searchUserEtc]";
	str2 = str2 + ",form[name=form_mobile] input[name=searchSosoc], form[name=form_mobile] input[name=searchSosoc_excel]";
	str2 = str2 + ",form[name=form_mobile] input[name=searchArea], form[name=form_mobile] input[name=searchEmail]";
	str2 = str2 + ",form[name=form_mobile] input[name=searchEvtName],form[name=form_mobile] input[name=searchRegName]";
	$(str2).keydown(function (key) {
		if(key.keyCode == 13){
			chkForm(document.form_mobile);
		}
	});	
	
	
});
</script>
<script>
//웹 스크립트
$(document).scroll(function () {
	//Show element after user scrolls 800px
	//var y = $(this).scrollTop();
	//if (y > 150) {
	//	$('#mobile_btn_in').fadeOut();
	//} else {
	//	$('#mobile_btn_in').fadeIn();
	//}
});

//모바일 스크립트
$(document).ready(function(){
$(".accor_list").hide(); 
$("a.reveal").click(function(){
  $(this).toggleClass("active").next().slideToggle("fast");
  
  if ($.trim($(this).text()) === '펼쳐보기') {
      $(this).text('닫기');
  } else {
      $(this).text('펼쳐보기');        
  }
  
  return false; 
});
$("a[href='" + window.location.hash + "']").parent(".reveal").click();
});


</script>




<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>통합검색</h3>
	<section class="sect_nonetit">
	
	<!-- header의 통합 검색을 위한 form -->
	<form name="frm_top_search" method="get" action = "/crm/search/list.do">
		<input type="hidden" name="flag" value="${flag }" />
		<input type="hidden" name="pageIndex" value="${vo.pageIndex}"/>
		<input type="hidden" name="searchUserName" value="${vo.searchUserName}" />
		<input type="hidden" name="searchUserPosition" value="${vo.searchUserPosition}" />
		<input type="hidden" name="searchUserAddr" value="${vo.searchUserAddr}" />
		<input type="hidden" name="searchUserEtc" value="${vo.searchUserEtc}" />
		<input type="hidden" name="searchSosoc" value="${vo.searchSosoc}" />
		<input type="hidden" name="searchSosoc_excel" value="${vo.searchSosoc_excel}" />
		<input type="hidden" name="searchEmail" value="${vo.searchEmail}" />
		<input type="hidden" name="searchEvtName" value="${vo.searchEvtName}" />
		
		<input type="hidden" name="searchArea" value="${vo.searchArea}" />
		<input type="hidden" name="searchRegName" value="${vo.searchRegName}" />
		<input type="hidden" name="search_title" value="" />
		<input type="hidden" name="searchExcel" value="" />
	</form>
	<!-- header의 통합 검색을 위한 form  -->

	
<!-- 웹, 패드에서 보이는 리스트 -->
<div class="mobile_none">	
	<form name="form"  action="/crm/search/list.do" method="get" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="flag" value="${flag}" />
		<input type="hidden" name="excel" />
		<input type="hidden" name="pageIndex" value="${vo.pageIndex}"/>
		<input type="hidden" name="searchOrder" value="${vo.searchOrder}" />
		<input type="hidden" name="searchExcel" value="${vo.searchExcel}" />
		
	
		<!-- earch_new_wrap -->
		<div class="search_new_wrap">

			<dl class="inwidth01">
				<dt>고객성명</dt>
				<dd><input type='text' name="searchUserName"  value="<c:if test="${flag eq '1'}">${vo.searchUserName}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>고객직책</dt>
				<dd><input type='text' name="searchUserPosition"  value="<c:if test="${flag eq '1'}">${vo.searchUserPosition}</c:if>" /></dd>
			</dl>			
			<dl class="inwidth01">
				<dt>고객주소</dt>
				<dd><input type='text' name="searchUserAddr"  value="<c:if test="${flag eq '1'}">${vo.searchUserAddr}</c:if>" /></dd>
			</dl>	
			<dl class="inwidth01">
				<dt>특기사항</dt>
				<dd><input type='text' name="searchUserEtc"  value="<c:if test="${flag eq '1'}">${vo.searchUserEtc}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>기관명</dt>
				<dd><input type='text' name="searchSosoc"  value="<c:if test="${flag eq '1'}">${vo.searchSosoc}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>기관명엑셀</dt>
				<dd><input type='text' name="searchSosoc_excel"  value="<c:if test="${flag eq '1'}">${vo.searchSosoc_excel}</c:if>" /></dd>
			</dl>	
			<dl class="inwidth01">
				<dt>기관지역</dt>
				<dd><input type='text' name="searchArea"  value="<c:if test="${flag eq '1'}">${vo.searchArea}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>이메일</dt>
				<dd><input type='text' name="searchEmail"  value="<c:if test="${flag eq '1'}">${vo.searchEmail}</c:if>" /></dd>
			</dl>
						
			<dl class="inwidth01">
				<dt>기관구분</dt>
				<dd>
					<!-- <input type="checkbox" name="org_all" id="org_all" value=""  onclick="javascript:chkSelectOrgAll(document.form);"/> 전체 -->
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchOrgList" />
						<c:param name="type" value="주최자구분" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchOrgList}"/>
					</c:import>
																
				</dd>
			</dl>
			<dl class="inwidth01">
				<dt>행사명</dt>
				<dd><input type='text' name="searchEvtName"  value="<c:if test="${flag eq '1'}">${vo.searchEvtName}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>행사분야</dt>
				<dd>
					<!-- <input type="checkbox" name="theme_all" id="theme_all" value="" onclick="javascript:chkSelectThemeAll(document.form);"/> 전체 -->
					<ul class="checkbox_list">
					</ul>
					
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchEvtThemeList" />
						<c:param name="type" value="행사분야" />
						<c:param name="li" value="Y" />
						<c:param name="result" value="${vo.searchEvtThemeList}"/>
					</c:import>
								
				</dd>
			</dl>
			<dl class="inwidth01">
				<dt>행사개최<br class="pad_show mobile_show">년도</dt>
				<dd>
				<input type='text' class="wd35per datepicker" name="searchSdate" value="${vo.searchSdate}">
				 ~ 
				<input type='text' class="wd35per datepicker" name="searchEdate" value="${vo.searchEdate}">
				</dd>
			</dl>
			<dl class="inwidth01">
				<dt>하이코<br class="mobile_show">담당</dt>
				<dd><input type='text'  name="searchRegName"  value="<c:if test="${flag eq '1'}">${vo.searchRegName}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>뉴스레터<br class="mobile_show">수신여부</dt>
				<dd>
					  <input type="radio" name="searchNewsLetter" value="Y" <c:if test="${vo.searchNewsLetter=='Y'}"> checked</c:if> />
					  <label for="radio">Y</label>
					  
					  <input type="radio" name="searchNewsLetter" value="N" <c:if test="${vo.searchNewsLetter=='N'}"> checked</c:if>/>
					  <label for="radio2">N</label>
					  
					  <input type="radio" name="searchNewsLetter" value="null"  <c:if test="${vo.searchNewsLetter=='null'}"> checked</c:if>/>
					  <label for="radio3">미등록</label>
					  
					  <input type="radio" name="searchNewsLetter" value=""  <c:if test="${empty fn:trim(vo.searchNewsLetter) }"> checked</c:if>/>
					  <label for="radio3">전체</label>
				</dd>
			</dl>

			<dl class="inwidth01">
				<dt>내/외국인</dt>
				<dd>
						<input type="radio" name="searchCountry" value="내국인" <c:if test="${vo.searchCountry=='내국인'}"> checked</c:if> /> 내국인
						<input type="radio" name="searchCountry" value="외국인" <c:if test="${vo.searchCountry=='외국인'}"> checked</c:if> /> 외국인
  
					
					  <input type="radio" name="searchCountry" value="" <c:if test="${empty fn:trim(vo.searchCountry) }"> checked</c:if>/>
					  <label for="radio3">전체</label>	
				</dd>
			</dl>




		</div>
		<!-- //earch_new_wrap -->





		<!-- search_new_btn -->
		<div class="search_new_btn mobile_none">
			<a href="javascript:chkReset(document.form);" class="n_btn01">리셋</a>
			<a href="javascript:chkSearch(document.form);" class="n_btn02">검색</a>
		</div>

		<div class="btn_right_area">
		
			엑셀파일명 : <input type='text'  name="search_title"  value="" />
			<a href="javascript:chkExcelList();" class="sbtn01"  id="btnExcelAll">엑셀 목록</a>
			

			
			<a href="javascript:chkExcel(document.form,'select','${flag}');" class="sbtn01"  id="btnExcelSelect">선택항목 엑셀다운로드</a><c:if test="${flag eq '1'}"></c:if>
			<a href="javascript:chkSMS(document.form,'select','${flag}');" class="sbtn01"  id="btnExcelSelect">선택항목 문자보내기</a>
			
			<a href="javascript:chkExcel(document.form,'search','${flag}');" class="sbtn01"  id="btnExcelSearch">검색항목 엑셀다운로드</a>
			<a href="javascript:chkSMS(document.form,'search','${flag}');" class="sbtn01"  id="btnExcelSearch">검색항목 문자보내기</a>
			
			<a href="javascript:chkExcel(document.form,'all','${flag}');" class="sbtn01"  id="btnExcelAll">전체 엑셀다운로드</a>
			<a href="javascript:chkSMS(document.form,'all','${flag}');" class="sbtn01"  id="btnExcelAll">전체 문자보내기</a>
			
		</div>
		<!-- //search_new_btn -->

		<div class="wordnoti_area float_l pt10">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>



		

		<table class="adm_tbl25 mobile_none" summary="명함, 기관단체, 대관신청 내역목록입니다.">
			<colgroup>
				<col width="3%"/>
				<col width="5%"/>
				<col />
				<col width="6%"/>
				<col width="6%"/>
				
				<col width="10%"/>
				<col width="6%"/>
				<col width="11%"/>
				
				<col width="6%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="6%"/>
			</colgroup>

			<thead>
			  <tr>
				<th><input type="checkbox" name="chkAll" value="" onclick="javascript:chkSelectAll(document.form);" checked/></th>
				<th>순번</th>
				<th>
					
					<div class="updown_select">고객성명 및<br>연락처
					<ul>
						<li><a href="javascript:chkOrder(document.form,'name_asc');">▲</a></li>
						<li><a href="javascript:chkOrder(document.form,'name_desc');" >▼</a></li>
					</ul>
					</div>
					
				</th>
				<th>특기사항</th>				
				<th>내/외국인</th>				
				
				<th>기관명</th>
				<th>기관주소</th>
				<th>행사명<br>(개최시작일 <br>~종료일)</th>
				<th>담당자</th>
				<th>기관구분</th>
				<th>행사분야</th>
				
				<th>뉴스레터<br>수신여부</th>
				
			  </tr>
			  </thead>
			  <tbody>

				  
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<c:set value = "${fn:length(result.eventSubContList)}" var="top_cnt" />
		<c:if test="${top_cnt==0 || top_cnt ==1 }">
			  <tr>
			  	<th><input type="checkbox" name="searchNum" value="${result.cus_idx}" checked/></th>
				<td><c:out value="${ (( resultListCnt - ((vo.pageIndex-1)*vo.recordCountPerPage) ) - status.count)+1}"/></td>
				<td>
					<strong class="name"><a href="/crm/customer/info.do?idx=${result.cus_idx}"  target="_blank">${result.name_ko}</a>
					<c:if test="${result.position != '' && result.position != NULL}">(${result.position})</c:if>
					<c:if test="${result.department != '' && result.department != NULL}">(${result.department})</c:if>
					<c:if test="${result.email != '' && result.email != NULL}">(${result.email})</c:if>
					</strong>
					
					<p class="detail_i_st01"><i class="fa fa-phone iconin01" aria-hidden="true" ></i>${result.tel_no}</p>
					<p class="detail_i_st01"><i class="fa fa-mobile iconin02" aria-hidden="true"></i>${d:decrypt(result.phone_no)}</p>
					<p class="detail_i_st01"><i class="fa fa-envelope-o iconin03" aria-hidden="true"></i>${d:decrypt(result.email) }</p>
					<p>${result.address_ko}</p>
				</td>
				<td>${result.etc}</td>					
				<td>${result.country}</td>				
				
				<c:if test="${top_cnt == 0}">
				<td><c:if test="${result.sosoc_excel != '' && result.sosoc_excel != NULL}">(${result.sosoc_excel})</c:if></td>
				<td></td>
				<td></td>
				<td>${result.reg_name}</td>
				<td></td>
				<td></td>
				</c:if>
				
				<c:if test="${top_cnt ==1}">
				<c:forEach var="result2" items="${result.eventSubContList}" varStatus="no">
				<td>
					<a href="/crm/organizer/info.do?idx=${result2.org_idx}"  target="_blank">
					${result2.oraganizer_name}
					</a>
					<c:if test="${result.sosoc_excel != '' && result.sosoc_excel != NULL}">(${result.sosoc_excel})</c:if>
				</td>
				<td>${result2.org_address_ko}</td>
				<td>
					<a href="/crm/event/info.do?idx=${result2.event_idx}"  target="_blank">
					${result2.event_name}<br/>
					${result2.event_st_date}~<br/>
					${result2.event_ed_date}
					</a>
				</td>
				<td>${result.reg_name}</td>
				<td>${result2.org_type_name}</td>
				<td>${result2.event_theme_name}</td>
				</c:forEach>
				</c:if>
				
				<td class="newsletter_y">${result.newsletter}</td>
				
			  </tr>
			  <!-- 
			  <tr>
				<td colspan="12" class="hrarea"></td>
			  </tr>
			   -->
		</c:if>
		<c:if test="${top_cnt>1 }">
			  <tr>
			  	<th rowspan="${top_cnt}"><input type="checkbox" name="searchNum" value="${result.cus_idx}" /></th>
				<td rowspan="${top_cnt}"><c:out value="${(vo.pageIndex-1) * vo.recordCountPerPage + status.count}"/></td>
				<td rowspan="${top_cnt}">
					<strong class="name"><a href="/crm/customer/info.do?idx=${result.cus_idx}" target="_blank">${result.name_ko}</a>
					<c:if test="${result.position != '' && result.sosoc_excel != NULL}">(${result.position})</c:if>
					</strong>
					<p class="detail_i_st01"><i class="fa fa-phone iconin01" aria-hidden="true" ></i>${result.tel_no}</p>
					<p class="detail_i_st01"><i class="fa fa-mobile iconin02" aria-hidden="true"></i>${d:decrypt(result.phone_no)}</p>
					<p class="detail_i_st01"><i class="fa fa-envelope-o iconin03" aria-hidden="true"></i>${d:decrypt(result.email)}</p>
					<p>${result.address_ko}</p>
				</td>
				<td rowspan="${top_cnt}">${result.etc}</td>					
				<td rowspan="${top_cnt}">${result.country}</td>				
				
				
			  <c:forEach begin="0" end="0"  varStatus="no">
				<td>
					<a href="/crm/organizer/info.do?idx=${result.eventSubContList[no.current].org_idx}"  target="_blank">
					${result.eventSubContList[no.current].oraganizer_name}
					</a>
					<c:if test="${result.sosoc_excel != '' && result.sosoc_excel != NULL}">(${result.sosoc_excel})</c:if>
				</td>
			  	<td>${result.eventSubContList[no.current].org_address_ko}</td>
				<td>
					<a href="/crm/event/info.do?idx=${result.eventSubContList[no.current].event_idx}"  target="_blank">
					${result.eventSubContList[no.current].event_name}<br/>
					${result.eventSubContList[no.current].event_st_date}~<br/>
					${result.eventSubContList[no.current].event_ed_date}
					</a>
				</td>
				<td>${result.reg_name}</td>
				<td>${result.eventSubContList[no.current].org_type_name}</td>
				<td>${result.eventSubContList[no.current].event_theme_name}</td>
			  </c:forEach>
			  
			  
				<td rowspan="${top_cnt}" class="newsletter_y">${result.newsletter}</td>			  
			  </tr>	
			  
			  
			  <c:forEach begin="1" end="${fn:length(result.eventSubContList)-1}" varStatus="no">
			  <tr>
				<td>
					<a href="/crm/organizer/info.do?idx=${result.eventSubContList[no.current].org_idx}"  target="_blank">
					${result.eventSubContList[no.current].oraganizer_name}
					</a>
					<c:if test="${result.sosoc_excel != '' && result.sosoc_excel != NULL}">(${result.sosoc_excel})</c:if>
				</td>			  
			  	<td>${result.eventSubContList[no.current].org_address_ko}</td>
				<td>
					<a href="/crm/event/info.do?idx=${result.eventSubContList[no.current].event_idx}"  target="_blank">
					${result.eventSubContList[no.current].event_name}<br/>
					${result.eventSubContList[no.current].event_st_date}~<br/>
					${result.eventSubContList[no.current].event_ed_date}
					</a>
				</td>
				<td>${result.reg_name}</td>
				<td>${result.eventSubContList[no.current].org_type_name}</td>
				<td>${result.eventSubContList[no.current].event_theme_name}</td>
			  </tr>
			  </c:forEach>
			  <!-- 
			  <tr>
				<td colspan="12" class="hrarea"></td>
			  </tr>	
			   -->			  
		</c:if>
		</c:forEach>


			  </tbody>
			</table>
		</form>
		
		
		<div id="pagination_info" align="center">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
		</div>			

</div>		
<!-- //웹, 패드에서 보이는 리스트 -->




<!-- 모바일에서만 보이는 리스트 -->
<div class="mobile_show">
	<form name="form_mobile"  action="/crm/search/list.do" method="get" enctype="multipart/form-data" onsubmit="return false;">
		<input type="hidden" name="flag" value="${flag}" />
		<input type="hidden" name="excel" />
		<input type="hidden" name="pageIndex" value="${vo.pageIndex}"/>
		<input type="hidden" name="searchOrder" value="${vo.searchOrder}" />
		<input type="hidden" name="searchExcel" value="${vo.searchExcel}" />

		<!-- earch_new_wrap -->
		<div class="search_new_wrap">


			<dl class="inwidth01">
				<dt>고객 성명</dt>
				<dd><input type='text' name="searchUserName"  value="<c:if test="${flag eq '1'}">${vo.searchUserName}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>고객직책</dt>
				<dd><input type='text' name="searchUserPosition"  value="<c:if test="${flag eq '1'}">${vo.searchUserPosition}</c:if>" /></dd>
			</dl>			
			<dl class="inwidth01">
				<dt>고객주소</dt>
				<dd><input type='text' name="searchUserAddr"  value="<c:if test="${flag eq '1'}">${vo.searchUserAddr}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>특기사항</dt>
				<dd><input type='text' name="searchUserEtc"  value="<c:if test="${flag eq '1'}">${vo.searchUserEtc}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>기관명</dt>
				<dd><input type='text' name="searchSosoc"  value="<c:if test="${flag eq '1'}">${vo.searchSosoc}</c:if>" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>기관명엑셀</dt>
				<dd><input type='text' name="searchSosoc_excel"  value="<c:if test="${flag eq '1'}">${vo.searchSosoc_excel}</c:if>" /></dd>
			</dl>	
			<dl class="inwidth01">
				<dt>기관지역</dt>
				<dd><input type='text' name="searchArea"  value="<c:if test="${flag eq '1'}">${vo.searchArea}</c:if>" /></dd>
			</dl>	
			<dl class="inwidth01">
				<dt>이메일</dt>
				<dd><input type='text' name="searchEmail"  value="<c:if test="${flag eq '1'}">${vo.searchEmail}</c:if>" /></dd>
			</dl>
					
			<dl class="inwidth02">
				<dt>기관구분</dt>
				<dd>
					
					<!-- <input type="checkbox" name="org_all" id="org_all" value=""  onclick="javascript:chkSelectOrgAll(document.form_mobile);" /> 전체 -->
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchOrgList" />
						<c:param name="type" value="주최자구분" />
						<c:param name="li" value="N" />
						<c:param name="result" value="${vo.searchOrgList }"/>
					</c:import>
																
				</dd>
			</dl>
			
			<dl class="inwidth01">
				<dt>행사명</dt>
				<dd><input type='text' name="searchEvtName"  value="<c:if test="${flag eq '1'}">${vo.searchEvtName}</c:if>" /></dd>
			</dl>


			<dl class="inwidth02">
				<dt>행사분야</dt>
				<dd>
					<!-- 
					<input type="checkbox" name="theme_all" id="theme_all" value=""  onclick="javascript:chkSelectThemeAll(document.form_mobile);" /> 전체
					<ul class="checkbox_list">
					</ul>
					 -->
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchEvtThemeList" />
						<c:param name="type" value="행사분야" />
						<c:param name="li" value="Y" />
						<c:param name="result" value="${vo.searchEvtThemeList }"/>
					</c:import>
								
				</dd>
			</dl>
			
			<dl class="inwidth02">
				<dt>행사개최<br class="pad_show mobile_show">년도</dt>
				<dd>
				<input type='text' class="wd35per mobile52per datepicker" name="searchSdate" value="${vo.searchSdate}">
				 	<!-- 180122 --><p class="mobile_peroid"> ~ </p><!-- //180122 -->
				<input type='text' class="wd35per  mobile52per datepicker" name="searchEdate" value="${vo.searchEdate}">
				</dd>
			</dl>	
			<dl class="inwidth01">
				<dt >하이코<br class="mobile_show">담당</dt>
				<dd><input type='text'  name="searchRegName"  value="<c:if test="${flag eq '1'}">${vo.searchRegName}</c:if>" /></dd>
			</dl>
			
					
			<dl class="inwidth01">
				<dt>뉴스레터<br class="mobile_show">수신여부</dt>
				<dd>
					  <input type="radio" name="searchNewsLetter" value="Y" <c:if test="${vo.searchNewsLetter=='Y'}"> checked</c:if> />
					  <label for="radio">Y</label>
					  
					  <input type="radio" name="searchNewsLetter" value="N" <c:if test="${vo.searchNewsLetter=='N'}"> checked</c:if>/>
					  <label for="radio2">N</label>
					  
					  <input type="radio" name="searchNewsLetter" value="null"  <c:if test="${vo.searchNewsLetter=='null'}"> checked</c:if>/>
					  <label for="radio3">미등록</label>
					  
					  <input type="radio" name="searchNewsLetter" value=""  <c:if test="${vo.searchNewsLetter==''}"> checked</c:if>/>
					  <label for="radio3">전체</label>
				</dd>
			</dl>
			<dl class="inwidth01">
				<dt>내/외국인</dt>
				<dd>
					
						<input type="radio" name="searchCountry" value="내국인" <c:if test="${vo.searchCountry=='내국인'}"> checked</c:if> /> 내국인
						<input type="radio" name="searchCountry" value="외국인" <c:if test="${vo.searchCountry=='외국인'}"> checked</c:if> /> 외국인
  
					
					  <input type="radio" name="searchCountry" value="" <c:if test="${vo.searchCountry==''}"> checked</c:if>/>
					  <label for="radio3">전체</label>											  
				</dd>
			</dl>

		</div>
		<!-- //earch_new_wrap -->



		<!-- search_new_btn -->
		<div class="search_new_btn ">
			<a href="javascript:chkReset(document.form_mobile);" class="n_btn01 mobilebtn01" id="btnReset_mobile">리셋</a>
			<a href="javascript:chkSearch(document.form_mobile);" class="n_btn02 mobilebtn01" id="btnSearch_mobile">검색</a>
			
			<dl class="exel_list">
				<dt><input type='text'  name="search_title"  value="" placeholder="엑셀파일명"/></dt>
				<dd><a href="javascript:chkExcelList();" class="sbtn01"  id="btnExcelAll">엑셀 목록</a></dd>
			</dl>

			<a href="javascript:chkExcel(document.form_mobile,'select','${flag}');" class="sbtn01 mobilebtn02"  id="btnExcelSelect">선택 항목 엑셀 다운로드</a>
			<a href="javascript:chkSMS(document.form_mobile,'select','${flag}');" class="sbtn01 mobilebtn02"  id="btnExcelSelect">선택 항목 문자 보내기 </a>

		
			<a href="javascript:chkExcel(document.form_mobile,'search','${flag}');" class="sbtn01 mobilebtn02"  id="btnExcelSearch">검색 항목 엑셀 다운로드</a>
			<a href="javascript:chkSMS(document.form_mobile,'search','${flag}');" class="sbtn01 mobilebtn02"  id="btnExcelSearch">검색 항목 문자 보내기 </a>


			<a href="javascript:chkExcel(document.form_mobile,'all','${flag}');" class="sbtn01 mobilebtn02"  id="btnExcelAll">전체 항목 엑셀 다운로드</a>
			<a href="javascript:chkSMS(document.form_mobile,'all','${flag}');" class="sbtn01 mobilebtn02"  id="btnExcelAll">전체 항목 문자 보내기  </a>
			
			
		</div>
		<!-- //search_new_btn -->
		
		
		<!-- search_new_btn -->
		<div class="search_new_btn" id="mobile_btn_in">
			<a href="javascript:chkReset(document.form_mobile);" class="n_btn01" id="btnReset2_mobile">리셋</a>
			<a href="javascript:chkSearch(document.form_mobile);" class="n_btn02" id="btnSearch2_mobile">검색</a>
		</div>
		<!-- //search_new_btn -->
		
	
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<input type="checkbox" name="chkAll" value="" onclick="javascript:chkSelectAll(document.form_mobile);" checked /> 전체선택
	

		<div class="mobile_list3">
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<c:set value = "${fn:length(result.eventSubContList)}" var="top_cnt" />	


		<table class="adm_tbl25" summary="명함, 기관단체, 대관신청 내역목록입니다.">
			<colgroup>
				<col style="width:10%">
				<col style="width:70%">
				<col style="width:20%">
			<colgroup>

			<thead>
				<tr>
					<th></th>
					<th>성명</th>
					<th>기관명</th>
				</tr>
			</thead>

			<tbody>
			<tr>
				<td><input type="checkbox" name="searchNum" value="${result.cus_idx}"  checked /></td>
				<td>
					${result.name_ko}
					<c:if test="${result.position != '' && result.position != NULL}">(${result.position})</c:if>
					<c:if test="${result.email != '' && result.email != NULL}">(${result.email})</c:if>
					<p class="detail_i_st01"><i class="fa fa-phone iconin01" aria-hidden="true" ></i><a href="tel:${result.tel_no}">${result.tel_no}</a></p>
					<p class="detail_i_st01"><i class="fa fa-mobile iconin02" aria-hidden="true"></i><a href="tel:${d:decrypt(result.phone_no)}">${d:decrypt(result.phone_no)}</a></p>
				</td>
				<td>
					<c:forEach var="result2" items="${result.eventSubContList}" varStatus="no">
						<a href="/crm/organizer/info.do?idx=${result2.org_idx}"  target="_blank">
						${result2.oraganizer_name}
						</a>
						<br/>						
					</c:forEach>
					<c:if test="${result.sosoc_excel != '' && result.sosoc_excel != NULL}">(${result.sosoc_excel})</c:if>
				</td>
			</tr>
			</tbody>
			</table>



			<a href="javascript:;" class="reveal">펼쳐보기</a>
			
			<!-- accor_list -->
			<div class="accor_list">
			
				<c:set value = "${fn:length(result.eventSubContList)}" var="top_cnt" />
				<c:if test="${top_cnt==0}">
					<div class="inner_list">
						<dl>
							<dt>기관주소</dt>
							<dd>${result2.org_address_ko} </dd>
						</dl>
						<dl>
							<dt>행사명(개최년도)</dt>
							<dd></dd>
						</dl>
						<dl>
							<dt>하이코 담당자</dt>
							<dd>${result.reg_name}</dd>
						</dl>
						<dl>
							<dt>기관구분</dt>
							<dd>${result2.org_type_name}</dd>
						</dl>
						<dl>
							<dt>행사분야</dt>
							<dd>${result2.event_theme_name}</dd>
						</dl>
						<dl>
							<dt>내/외국인 </dt>
							<dd>${result.country}</dd>
						</dl>					
						<dl>
							<dt>뉴스레터 수신여부 </dt>
							<dd>${d:decrypt(result.newsletter) }</dd>
						</dl>
						<dl>
							<dt>특기사항 </dt>
							<dd>${result.etc}</dd>
						</dl>						
						
					</div>				
				</c:if>
			
				<c:if test="${top_cnt > 0}">
				<c:forEach var="result2" items="${result.eventSubContList}" varStatus="no">
					<div class="inner_list">
						<dl>
							<dt>기관주소</dt>
							<dd>${result2.org_address_ko} </dd>
						</dl>
						<dl>
							<dt>행사명(개최년도)</dt>
							<dd>${result2.event_name}/<br/>${result2.event_ed_date}~<br/>${result2.event_ed_date}</dd>
						</dl>
						<dl>
							<dt>하이코 담당자</dt>
							<dd>${result.reg_name}</dd>
						</dl>
						<dl>
							<dt>기관구분</dt>
							<dd>${result2.org_type_name}</dd>
						</dl>
						<dl>
							<dt>행사분야</dt>
							<dd>${result2.event_theme_name}</dd>
						</dl>
						<dl>
							<dt>내/외국인 </dt>
							<dd>${result.country}</dd>
						</dl>					
						<dl>
							<dt>뉴스레터 수신여부 </dt>
							<dd>${d:decrypt(result.newsletter) }</dd>
						</dl>	
						<dl>
							<dt>특기사항 </dt>
							<dd>${result.etc}</dd>
						</dl>	
					</div>
				</c:forEach>
				</c:if>
				
				
			</div>
			<!-- accor_list -->
			
	
		</c:forEach>
		</div>

		</form>
		
		<div id="pagination_info_mobile" align="center" class="mobile_padding_bottom">
		    <div>
		        <ui:pagination paginationInfo = "${paginationInfo}"
		            type="text"
		            jsFunction="fnLinkPage_mobile"
		            />
		    </div>
		</div>			

		
</div>		
<!-- //모바일에서만 보이는 리스트 -->			
					



			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>