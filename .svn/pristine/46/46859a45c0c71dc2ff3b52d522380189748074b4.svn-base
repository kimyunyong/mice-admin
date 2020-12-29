<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>

<link rel="stylesheet" type="text/css" href="/css/mice/admin.css?ver=20160212">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>

<script>
$(document).ready(function(){
	$('input[name=theme_all]').on('click',function(){
		if($('form[name=form] input[name=theme_all]').is(":checked") == true ){
			$("form[name=form] input[name=event_theme]").prop("checked", true);
		}else{
			$("form[name=form] input[name=event_theme]").prop("checked", false);
		}
	});
});

function remove_cost(element){
	$(element).parent().remove();
}

function append_cost(){
	$('.invite_cost').append('<li>' + 
		'<input type="text" class="wd12per" name="invite_cost_list" value="0"/> 원 &nbsp;&nbsp;&nbsp;' + 
		'<input type="text" class="wd40per max_none" name="invite_cost_etc_list" value=""/>' + 
		'<input type="hidden" class="wd40per max_none" name="invite_cost_type_list" value="support"/>' + 
		'<button class="btn2 clrGrad_Wgray" onclick="javascript:remove_cost(this);return false;">삭제</button>' + 
		'</li>' );
}

function append_promotion_cost(){
	$('.invite_promotion_cost').append('<li>' + 
		'<input type="text" class="wd12per" name="invite_cost_list" value="0"/> 원 &nbsp;&nbsp;&nbsp;' + 
		'<input type="text" class="wd40per max_none" name="invite_cost_etc_list" value=""/>' + 
		'<input type="hidden" class="wd40per max_none" name="invite_cost_type_list" value="promotion"/>' + 
		'<button class="btn2 clrGrad_Wgray" onclick="javascript:remove_cost(this);return false;">삭제</button>' + 
		'</li>' );
}

function append_open_cost(){
	$('.invite_open_cost').append('<li>' + 
		'<input type="text" class="wd12per" name="invite_cost_list" value="0"/> 원 &nbsp;&nbsp;&nbsp;' + 
		'<input type="text" class="wd40per max_none" name="invite_cost_etc_list" value=""/>' + 
		'<input type="hidden" class="wd40per max_none" name="invite_cost_type_list" value="open"/>' + 
		'<button class="btn2 clrGrad_Wgray" onclick="javascript:remove_cost(this);return false;">삭제</button>' + 
		'</li>' );
}

function on_search_layer(obj){
	$('#search_layer').bPopup({
		follow: [false, false],
		position: [650, 300]
	});
	$('#search_layer').attr('data-id',$(obj).attr('data-id'));
	$('input[name=search_organizer_name]').focus();
}

</script>
<script>
$(document).ready(function(){
	//$("textarea.autosize").on('keydown keyup', function () {
	//	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	//});
	$('textarea.autosize').height(1).height( $(this).prop('scrollHeight')+12 );	
	
	$(document).on("keydown keyup",'textarea.autosize',function(){
		 $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});	
})
</script>

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
	.search_new_btn{margin: 30px auto; width: 700px;}
}
</style>

<!-- contentArea -->
<section id="contentArea">
    <h3>고객DB관리<span> > </span> 뷰로유치관리 등록</h3>
	
	<!-- sect_nonetit -->
    <section class="sect_nonetit">
    
	<form name="form" method="post" action="/crm/invite/insert.do" enctype="multipart/form-data">
	<input type="hidden" name="idx" id="idx" value="-1" />
	<input type="hidden" name="flag" id="flag" value="0" />
	
	
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
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="implementation_status" />
							<c:param name="type" value="유치행사추진현황" />
							<c:param name="result" value="1" />
						</c:import>
					</td>
					<th scope="row">국내외 구분</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="invite_character" />
							<c:param name="type" value="유치행사성격" />
							<c:param name="result" value="1" />
						</c:import>
					</td>
				</tr>	
				<tr>
					<th scope="row">분류</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="invite_category" />
							<c:param name="type" value="유치행사분류" />
							<c:param name="result" value="1" />
						</c:import>
					</td>
					<th scope="row">담당자</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="relation_name" />
							<c:param name="type" value="유치행사이름" />
							<c:param name="result" value="1" />
						</c:import>
					</td>
				</tr>
	
				<tr>
					<th scope="row">유치확정 일자</th>
					<td class="left" colspan="3">
						<input type="text" class="datepicker" name="confirm_date" value="" />
					</td>
				</tr>
				
				<tr>
					<th scope="row"><span class="esicon">*</span>행사명 (국문)</th>
					<td class="left" colspan="3">
						<input type="text" name="name_ko" id="name_ko" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사명 (영문)</th>
					<td class="left" colspan="3">
						<input type="text" name="name_en" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사명 (영문약칭)</th>
					<td class="left" colspan="3">
						<input type="text" name="name_etc" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사구분</th>
					<td class="left" colspan="3">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_division_idx" />
							<c:param name="type" value="유치행사구분" />
							<c:param name="result" value="152" />
						</c:import>
					</td>
				</tr>
				
				<tr>
					<th scope="row"><span class="esicon">*</span>행사분야</th>
					<td class="left" colspan="3"> 
						<input type="checkbox" name="theme_all" /> 전체
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_theme" />
							<c:param name="type" value="행사분야" />
							<c:param name="li" value="N" />
							<c:param name="result" value=""/>
						</c:import>
						<input type="hidden" name="event_theme" value="" />
					</td>
				</tr>
									
				<tr>
					<th scope="row">개최주기</th>
					<td class="left" colspan="3">
						<input type="text" name="open_period" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사기간</th>
					<td class="left" colspan="3">
					    <input type="text" name="event_term" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">제안기간</th>
					<td class="left" colspan="3">
					    <input type="text" name="sugt_st_date" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">참가규모</th>
					<td class="left" colspan="3">
						총&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="wd15per" name="join_total_nation" value="0"/> 개국&nbsp;&nbsp;&nbsp;<input type="text" name="join_total_cnt" class="wd15per" value="0"/> 명<br />
						국내&nbsp;<input type="text" class="wd15per" name="join_nationals_cnt" value="0"/> 명 &nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
						해외&nbsp;<input type="text" class="wd15per" name="join_foreigner" value="0"/> 개국  <input type="text" class="wd15per" name="join_foreigner_cnt" value="0"/> 명 <!-- 180104 -->
					</td>
				</tr>
				
				<tr>
					<th scope="row">장소</th>
					<td class="left" colspan="3">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="place" />
							<c:param name="type" value="장소" />
							<c:param name="result" value="11"/>
						</c:import>
					</td>
				</tr>
	
				<tr>
					<th scope="row">기 개최국가</th>
					<td class="left" colspan="3">
						<textarea style="height:200px; width:100%;" name="etc_open_nation"></textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="row">개최지결정방법</th>
					<td class="left" colspan="3">
					    <input type="text" name="decision_method" value=""/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">유치결정시기</th>
					<td class="left" colspan="3">
					    <input type="text" name="decision_time" value=""/>
					</td>
				</tr>
	
				<tr>
					<th scope="row">국제기구</th>
					<td class="left" colspan="3">
					    <input type="text" name="organizers" value=""/>
					</td>
				</tr>
	
				<tr>
					<th scope="row">국내기관</th>
					<td class="left" colspan="3">
					    <select name="interior_agency" style="width:100px">
							<option value=""></option>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<option value="${result.idx }">${result.name_ko }</option>
							</c:forEach>
						</select>
						<a href="javascript:;" onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
					</td>
				</tr>
				
				<tr>
					<th scope="row">기타사항</th>
					<td class="left" colspan="3">
						<textarea style="height:200px; width:100%;" name="etc_comment" value=""></textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="row">행사프로그램</th>
					<td class="left" colspan="3">
					    <ul id="event_attach_file">
							<li><input name="event_attach_file" type="file" value=""/>
								<button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('event_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button>
							</li>
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
								<li> 
									<input type="text" class="wd12per" name="invite_cost_list" value="0"/> 원 &nbsp;&nbsp;&nbsp; 
									<input type="text" class="wd40per max_none" name="invite_cost_etc_list" value=""/>
									<input type="hidden" class="wd40per max_none" name="invite_cost_type_list" value="support"/> 
									<button class="btn2 clrGrad_Wgray" onclick="javascript:remove_cost(this);return false;">삭제</button> 
								</li> 
							</ul>
							<a href="javascript:;" onclick="javascript:append_cost();" class="btn2 clrGrad_Wgray">내역추가</a>
						</td>
						
					</tr>
					<tr>
						<th style="height: 20px;">홍보지원</th>
					</tr>
					<tr>
						<td class="left">
							<ul class="left invite_promotion_cost">
								<li> 
									<input type="text" class="wd12per" name="invite_cost_list" value="0"/> 원 &nbsp;&nbsp;&nbsp; 
									<input type="text" class="wd40per max_none" name="invite_cost_etc_list" value=""/>
									<input type="hidden" class="wd40per max_none" name="invite_cost_type_list" value="promotion"/> 
									<button class="btn2 clrGrad_Wgray" onclick="javascript:remove_cost(this);return false;">삭제</button> 
								</li>
							</ul>
							<a href="javascript:;" onclick="javascript:append_promotion_cost();" class="btn2 clrGrad_Wgray">내역추가</a>
						</td>
					</tr>
					<tr>
						<th scope="row" style="height: 20px;">개최지원</th>
					</tr>
					<tr>
						<td class="left">
							<ul class="left invite_open_cost">
								<li> 
									<input type="text" class="wd12per" name="invite_cost_list" value="0"/> 원 &nbsp;&nbsp;&nbsp; 
									<input type="text" class="wd40per max_none" name="invite_cost_etc_list" value=""/>
									<input type="hidden" class="wd40per max_none" name="invite_cost_type_list" value="open"/> 
									<button class="btn2 clrGrad_Wgray" onclick="javascript:remove_cost(this);return false;">삭제</button> 
								</li>
							</ul>
							<a href="javascript:;" onclick="javascript:append_open_cost();" class="btn2 clrGrad_Wgray">내역추가</a>
						</td>
					</tr>
					<tr>
						<th scope="row">제안서 첨부</th>
						<td class="left">
							<ul id="offer_attach_file">
								<li><input name="offer_attach_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('offer_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
							</ul>
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
	<!-- 							<td class="left">180104 -->
	<!--  								국내인평균&nbsp;&nbsp;&nbsp;<input type="text" class="wd30per" name="country_expense" value="0"/>&nbsp;&nbsp;&nbsp;원   -->
	<!-- 							</td> -->
	<!-- 							</tr> -->
	
	<!-- 						<tr> -->
	<!-- 							<td class="left">180104 -->
	<!--								해외참가자평균&nbsp;&nbsp;&nbsp;<input type="text" class="wd30per" name="foreign_expense" value="0"/>&nbsp;&nbsp;&nbsp;원   -->
	<!-- 							</td> -->
	<!-- 						</tr> -->
	
	<!-- 						<tr> -->
	<!-- 							<td class="left"> -->
	<!-- 								<ul id="stats_attach_file"> -->
	<!-- 									<li><input name="stats_attach_file" type="file" /> -->
	<!-- 									<button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('stats_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li> -->
	<!-- 								</ul> -->
	<!-- 							</td> -->
	<!-- 						</tr> -->
	<!-- 					</tbody> -->
	<!-- 			</table> -->
	<!-- //adm_tbl2 -->
		<!-- //통계조사 -->
	
	
		<!-- 주요인사연결-->
		<h5 class="s_tit">주요인사연결</h5>
		<div class="brd_p2">
		
			<div class="search_sort_type">
				<input type="text" id="person_search">
			</div>
			<div class="search_btn_type">
				<a href="javascript:;" onclick="openChild();" class="btn2 clrGrad_Wgray">조회</a>
			</div>
		</div>
	
		<p class="notice_alert">* 주요인사 부분은 명함관리와 기관단체 DB와<br class="mobile_show">연동되어 있어서 조회 버튼 클릭 하신 후,<br class="mobile_show">
		기존 인사는 성명 검색 후 추가 하실수 있으며,<br class="mobile_show">새로 추가도 가능합니다 .</p>
		
		<table class="adm_tbl2 mobile_none">
			<caption>상세</caption>
				<colgroup>
					<col width="8%">
					<col width="8%">
					<col width="15%">
					<col width="10%">
					<col width="12%">
					<col width="12%">
					<col width="15%">
					<col >			
				</colgroup>
			<thead>
				<tr>
					<th >성명</th>
					<th>직위</th>
					<th>근무처</th>
					<th>부서/학과</th>
					<th>전화</th>
					<th>휴대전화</th>
					<th>이메일</th>
					<th>주소</th>
					<th>상담내역</th>
				</tr>
			</thead>
			<tbody id="personList">
				
			</tbody>
		</table>
		<div id="personArr" style="display:none;">
				
		</div>
		<!-- //주요인사연결-->
	
	
		<!-- 유치실패사유 -->
		<h5 class="s_tit">유치실패사유</h5>
		<table class="adm_tbl2">
			<tr>
				<th scope="row" style="width:27%">유치실패 사유</th>
				<td class="left">
					<textarea name="open_fail_cause" class="autosize"></textarea>
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
					<textarea name="manager1" class="autosize"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row" style="width:27%">개최지원 담당(CVB Level)</th>
				<td class="left">
					<textarea name="manager2" class="autosize"></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row" style="width:27%">대관담당(Venue Level)</th>
				<td class="left">
					<textarea name="manager3" class="autosize"></textarea>
				</td>
			</tr>
			
		</table>
	    <!-- //담당자 -->
	
	
		<!-- 버튼 위치(s) -->
		<div class="search_new_btn mobile3_btn"><!-- //180130 -->
				<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="/crm/invite/insertForm.do" role="button" class="btn1 clr_Wgray">취소</a>
				<a href="/crm/invite/list.do" role="button" class="btn1 clr_Wgray">목록</a>
		</div>
		<!--// 버튼 위치(e) -->
	
	
	</form>
		
			
	<%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
			
	</section>
	<!-- //sect_nonetit -->
	
</section>
  
<script>
$(function(){
	$(document).ready(function(){
		$("#btnSave").click(function(){
			var name_ko = $("#name_ko").val();
			if(name_ko == ""){
				chk_name_ko();
			}else{
				document.form.submit();
			}
		});
		
		$("#person_search").on("click", function(){
			var name_ko = $("#name_ko").val();
			if(name_ko == ""){
				chk_name_ko();
			}else{
				detail();
			}
		});
	});
});

function openChild(){
	var name_ko = $('#name_ko').val();

	if(name_ko == ""){
		chk_name_ko();
		return;
	}	
    detail();
}

function chk_name_ko(){
	alert("행사명을 입력해 주세요.");
	$("#name_ko").focus();
}

function detail(){
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("customer.do",
            "childForm", "width=1000px, height=700px, resizable = no, scrollbars = no");
}

function setChildValue(idx, name_ko, staff, organizer_name, unit, tel_no, phone_no, address, email){
	if(staff == undefined && staff == null && staff == ""){
		alert('undefined');
	}
	
	var customer_idx = parseInt(idx); 
	var implementation_status = $('select[name=implementation_status]').val();
	var place = $('select[name=place]').val();
	var event_division_idx = $('select[name=event_division_idx]').val();
	var flag = $('#flag').val();
	var event_name = $('input[name=name_ko]').val();
	var event_idx = $('input[name=idx]').val();
	
	$.ajax({
        url:'/crm/invite/insertTemp.do',
        type:'post',
        dataType: 'json',
        data:{event_idx : event_idx, name_ko : name_ko, event_name : event_name, flag : flag, customer_idx : customer_idx, implementation_status : implementation_status, place : place, event_division_idx : event_division_idx},
     
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        error : function(){
            alert('등록 실패..');
        },
        success:function(data){
        	alert(name_ko + '님 등록 완료');
        	$('#flag').val(data.flag);
        	$('input[name=idx]').val(data.idx);
        	
        	$('#personList').append(
        			'<tr class="person">' +
        				'<td>'+ name_ko +
        				'<td>'+ staff +'</td>' +
        				'<td>'+ organizer_name +'</td>' +
        				'<td>'+ unit +'</td>' +
        				'<td>'+ tel_no +'</td>' +
        				'<td>'+ phone_no +'</td>' +
        				'<td>'+ email +'</td>' +
        				'<td>'+ address +'</td>' +
        				'<td><a href="javascript:;" onclick="window.open(\'detail.do?idx=' + data.idx + '&customer_idx='+ idx +' \', \'childForm\', \'width=1200px, height=800px, resizable = no, scrollbars = no\');" class="small_btn"> 내역 </td>' +
        			'</tr>'
        	);
        }
    });
	
	$('#personArr').append(
		'	<input type="text" name="idx_Arr" value="'+ idx +'"/>'
// 		'  	<input type="hidden" name="staff_Arr" /> 	' +
// 		' 	<input type="hidden" name="organizer_name_Arr" />' +		
// 		'  	<input type="hidden" name="unit_Arr" />	' +
// 		'  	<input type="hidden" name="phone_no_Arr" />' + 
// 		'  	<input type="hidden" name="tel_no_Arr" />' +
// 		'  	<input type="hidden" name="address_Arr" /> ' +
// 		'  	<input type="hidden" name="email_Arr" />'
	);
	
	
}

function append_file_tag(tag, idx){
	$('#' + tag).append('<li><input name="' + tag + '" type="file" /><button class="btn2 clrGrad_Wgray" onclick="javascript:remove_file_tag(this);return false;">삭제</button></li>')	
}

function remove_file_tag(obj){
	$(obj).parent().remove();
}
</script>
    