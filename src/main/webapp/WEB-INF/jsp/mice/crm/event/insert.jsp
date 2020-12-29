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
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/cmm/fms/EgovMultiFile.js'/>" ></script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">

//웹 	화면
$(document).ready(function(){
	
	$('#form_web #btnSave_web').on('click',function(){
		if($('#form_web select[name=implementation_status] option:selected').text() == '유치추진' && ($('#form_web input[name=estimate_cost]').val() == '0' || $('#form_web input[name=estimate_cost]').val() == '')){
			alert('견적금액을 입력하세요.');
			$('#form_web input[name=estimate_cost]').focus();
			return false;
		}
		
		if($('#form_web select[name=implementation_status] option:selected').text() == '유치확정' && ($('#form_web input[name=rent_cost]').val() == '0' || $('#form_web input[name=rent_cost]').val() == '')){
			alert('임대매출을 입력하세요.');
			$('#form_web input[name=rent_cost]').focus();
			return false;
		}
		
		if($('#form_web select[name=implementation_status] option:selected').text() == '개최확정' && ($('#form_web input[name=rent_cost]').val() == '0' || $('#form_web input[name=rent_cost]').val() == '')){
			alert('임대매출을 입력하세요.');
			$('#form_web input[name=rent_cost]').focus();
			return false;
		}
		$('#form_web').submit();
	});

	
	$('#form_mobile #btnSave_mobile').on('click',function(){
		if($('#form_mobile select[name=implementation_status] option:selected').text() == '유치추진' && ($('#form_mobile input[name=estimate_cost]').val() == '0' || $('#form_web input[name=estimate_cost]').val() == '')){
			alert('견적금액을 입력하세요.');
			$('#form_mobile input[name=estimate_cost]').focus();
			return false;
		}
		
		if($('#form_mobile select[name=implementation_status] option:selected').text() == '유치확정' && ($('#form_mobile input[name=rent_cost]').val() == '0' || $('#form_web input[name=rent_cost]').val() == '')){
			alert('임대매출을 입력하세요.');
			$('#form_mobile input[name=rent_cost]').focus();
			return false;
		}
		
		if($('#form_mobile select[name=implementation_status] option:selected').text() == '개최확정' && ($('#form_mobile input[name=rent_cost]').val() == '0' || $('#form_web input[name=rent_cost]').val() == '')){
			alert('임대매출을 입력하세요.');
			$('#form_mobile input[name=rent_cost]').focus();
			return false;
		}
		$('#form_mobile').submit();
	});

	
	
	 $('#form_web, #form_mobile').validate({
		 lang: 'ko',
		 rules : {
			 implementation_status : { required: true},
			 name_ko : {required:true, maxlength:100},
			 rent_facility_text : {required: true}
			 /* implementation_status : { required: true},
			 confirm_date : { required: true, date: true},
			 rent_facility_text : {required: true},
			 name_ko : {required:true, maxlength:100},
			 rent_st_date : { required : true, date: true},
			 rent_ed_date : { required: true, date: true},
			 event_st_date : { required: true, date: true},
			 event_ed_date : { required : true, date: true},
			 join_personal_cnt : { required: true, number: true},
			 join_foreigner_cnt : { required: true, number: true},
			 join_nationals_cnt : { required: true, number: true},
			 booth_cnt : { required: true, number: true},
			 exhibition_scale : { required: true, number: true},
			 participating_states_cnt : { required: true, number: true},
			 organizers_1 : { required: true},
			 organizers_2 : { required: true},
			 view_yn : { required: true},
			 estimate_date : { required : true, date : true},
			 estimate_cost : { required: true, number: true},
			 sales_cost : { required: true, number: true},
			 total_cost : { required: true, number: true},
			 rent_cost : { required: true, number: true},
			 food_cost : { required: true, number: true},
			 av_rental_cost : { required: true, number: true},
			 manager_cost : { required: true, number: true},
			 total_grant_cost : { required: true, number: true},
			 attract_grant_cost : { required: true, number: true},
			 sales_grant_cost : { required: true, number: true},
			 place_idx : { required: true} */
		 }
	 });
	 
	 $('select[name=organizers_1]').change(function(){
		var organizer_idx = $(this).val();
		if(organizer_idx == ''){
			$('.organizer_1_member').empty();
			return false;
		}
		$.ajax({
		    type: "POST",
		    url: "/crm/manager/organizer_member.do",
		    data: {
		        'organizer_idx' : organizer_idx,
		        'name' : 'manager_1',
		        'target' : 'organizer_1_member',
		    },
		    success: function (response) {
		    	$('.organizer_1_member').empty();
		        $('.organizer_1_member').append(response);
		        $('.nyroModal').nyroModal();
		    }
		});
	 });
	 
	 $('select[name=organizers_2]').change(function(){
			var organizer_idx = $(this).val();
			if(organizer_idx == ''){
				$('.organizer_2_member').empty();
				return false;
			}
			$.ajax({
			    type: "POST",
			    url: "/crm/manager/organizer_member.do",
			    data: {
			        'organizer_idx' : organizer_idx,
			        'name' : 'manager_2',
			        'target' : 'organizer_2_member',
			    },
			    success: function (response) {
			    	$('.organizer_2_member').empty();
			        $('.organizer_2_member').append(response);
			        $('.nyroModal').nyroModal();
			    }
			});
		 });
	 
	 $('select[name=place_idx]').change(function(){
		 if($('select[name=place_idx] option:selected').text() == 'HICO')
		 	$('.rent_facility').show();
		 else
			$('.rent_facility').hide();
	 });
	 

	$('input[name=rent_cost]').change(function(){
		setTotalCost();
	});
	$('input[name=food_cost]').change(function(){
		setTotalCost();
	});
	$('input[name=av_rental_cost]').change(function(){
		setTotalCost();
	});
	$('input[name=manager_cost]').change(function(){
		setTotalCost();
	});

	$('input[name=held_grant_cost]').change(function(){
		setTotalGrantCost();
	});
	$('input[name=attract_grant_cost]').change(function(){
		setTotalGrantCost();
	});
	$('input[name=sales_grant_cost]').change(function(){
		setTotalGrantCost();
	});
	
	$('input[name=join_foreigner_cnt]').change(function(){
		total_join_person_cnt($(this).val() == '' ? 0 : $(this).val(), $('input[name=join_nationals_cnt]').val() == '' ? 0 : $('input[name=join_nationals_cnt]').val());
	});
	
	$('input[name=join_nationals_cnt]').change(function(){
		total_join_person_cnt($(this).val() == '' ? 0 : $(this).val(), $('input[name=join_foreigner_cnt]').val() == '' ? 0 : $('input[name=join_foreigner_cnt]').val());
	});
	
});
$(document).ready(function(){
	//$('select[name=place_idx]').val(11);
	$('.rent_facility').show();
});

function total_join_person_cnt(join_foreigner_cnt, join_national_cnt){
	try{
		$('input[name=join_personal_cnt]').val(parseInt(join_foreigner_cnt)+parseInt(join_national_cnt));
	}catch(e){
		
	}
}

function on_search_layer(obj){
	$('#search_layer').bPopup({position:['auto',150]});
	$('#search_layer').attr('data-id',$(obj).attr('data-id'));
	$('input[name=search_organizer_name]').focus();
	
}
function setTotalGrantCost(){
	$('input[name=total_grant_cost]').val(parseInt($('input[name=held_grant_cost]').val()) + parseInt($('input[name=attract_grant_cost]').val()) + parseInt($('input[name=sales_grant_cost]').val()));
}
function setTotalCost(){
	$('input[name=total_cost]').val(parseInt($('input[name=rent_cost]').val()) + parseInt($('input[name=food_cost]').val()) + parseInt($('input[name=av_rental_cost]').val()) + parseInt($('input[name=manager_cost]').val()));
}	

function append_file_tag(tag, idx){
	$('.' + tag).append('<li><input name="' + tag + '" type="file" /><button class="btn2 clrGrad_Wgray" onclick="javascript:remove_file_tag(this);return false;">삭제</button></li>')	
}

function remove_file_tag(obj){
	$(obj).parent().remove();
}

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('.' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('.' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}

</script>


<script>
//추가기관 - 추가
function plus_append(obj){
	
	var form_id = $(obj).parents("form").attr("id");
	var att = $("#"+form_id).find(".org_plus_wrap > li:first").clone();
	
	$("#"+form_id).find(".org_plus_wrap").append(att);
	$("#"+form_id).find(".org_plus_wrap span").last().find(".plus_org_member option:not( option:eq(0) )").remove(); 
	$("#"+form_id).find(".org_plus_wrap span").last().find("a").remove(); 
	$("#"+form_id).find(".org_plus_wrap select[name=plus_org]").last().find("option").removeAttr("selected");
	$("#"+form_id).find(".org_plus_wrap button").last().after("<button class='btn2 clrGrad_Wgray' name='plus_append_del' >삭제</button>"); 

	//아이디 재정의
	plus_chkid();
	
 }
//추가기관 - 클래스명 재정의 
function plus_chkid(){
	$(".org_plus_wrap li").each(function(idx){
		
		var org_id = "plus_org"+idx;
		var mem_id = "plus_org_member"+idx;
		var data_id = $(this).find("select[name=plus_org] option:selected").val();
		var link_url = "/crm/event/addCustomer.do?name=plus_org_member&target="+mem_id+"&time=&data-id="+data_id;
		
		//alert(mem_id+"___"+mem_id);
		//alert("link_url="+link_url+",wrap_id="+wrap_id);
		$(this).find("select[name=plus_org]").attr("class", org_id );		
		$(this).find(".plus_org_search").attr("data-id", org_id );		
		$(this).find("span").attr("class", mem_id );		
		$(this).find("span").attr("id", mem_id );		
		$(this).find("span").find("a").attr("href", link_url);
		
		
	});
}

//추가기관 
$(document).ready(function(){
	
	//추가기관 삭제
	$(document).on("click",".org_plus_wrap button[name=plus_append_del]",function(idx){
		var idx = $(".org_plus_wrap button[name=plus_append_del]").index(this);
		$(this).parent("li").remove();
 		
		//아이디 재정의
		plus_chkid();
		
	});

	
	//추가기관 - 기관 선택시
	$(document).on("change",".org_plus_wrap li select[name=plus_org]",function(){
	
		//var len = $("#org_plus_wrap li .plus_org").length-1;
		var idx = $(".org_plus_wrap li select[name=plus_org]").index(this);
	 	var organizer_idx = $("select[name=plus_org] option:selected").eq(idx).val();
	 	
		if(organizer_idx == ""){
			var str = "<select name='plus_org_member' class='plus_org_member' ><option value='''>==선택하세요==</option></select>"
	    	$('.org_plus_wrap span').eq(idx).html("").append(str);
			//$(".plus_org_member").eq(idx).empty();
			return false;
		}
		
		$.ajax({
			url: '/crm/manager/organizer_member.do', //url
			type: 'POST', //post,get,등..전송방식
			dataType: 'html',//데이타 타입
			data: 'organizer_idx='+organizer_idx+'&name=plus_org_member&target=',
			error: function(json){ //실패시 실행 함수
				alert( "실패였습니다.");
			},
			success: function(response){ //성공시 실행함수
		    	$('.org_plus_wrap span').eq(idx).empty();
		    	$('.org_plus_wrap span').eq(idx).html(response);
		    	
		    	plus_chkid();
		    	
		    	$('.nyroModal').nyroModal();
			},
		});			
	});	
	
});	


$(document).ready(function(){
	//대관시설 전체선택
	$("#rent_facility_all").click(function(){
		if( $(this).is(":checked") == true ){
			$("input[name=rent_facility_text]").prop("checked", true );
		}else{
			$("input[name=rent_facility_text]").prop("checked", false );
		}			
	});
});	

</script>		



<section id="contentArea">
	<h3>대관관리 <span>></span> 행사정보 <span>></span> 등록</h3>
	<section class="sect_nonetit">
	<h4>상세보기</h4>


<!-- 웹,패드에서 보이는 내용 -->
<div class="mobile_none">
		<form name="form" id="form_web" method="post" action="/crm/event/insert_action.do" enctype="multipart/form-data">
		<input type="hidden" name="place_idx" value="11" />
		




		<h5 class="s_tit">행사구분</h5>
		<table width="100%"class="adm_tbl2 table_left">
			<caption>상세</caption>
				<colgroup>
					<col width="10%">
					<col width="90%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">구분</th>
						<td class="left" >
							
							<input type="radio" name="manager_event" value="N" checked />일반
							<input type="radio" name="manager_event" value="M" />주관행사
							
							<br/><span style="font-size:11px;color:blue;">* 주관행사 분류등록은 내용보기에서 가능.</span>
							
						</td>
					</tr>

			</tbody>
		</table>





	


		<h5 class="s_tit">행사정보1</h5>

		<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col>
				<col width="18%">
				<col width="18%">
				<col width="18%">
				<col width="18%">
				<col width="18%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">추진현황</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="implementation_status" />
							<c:param name="type" value="추진현황" />
							<c:param name="result" value="1" />
						</c:import>
					</td>
					<th scope="row">확정일자</th>
					<td colspan="3"  class="left">
						<%-- <input name="confirm_date" type="text" class="datepicker" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> --%>
						<input name="confirm_date" type="text" class="datepicker" value="" size="9" readonly/>
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(국문)</th>
					<td colspan="5"  class="left">
						<input name="name_ko" type="text" size="100" style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(영문)</th>
					<td colspan="5" class="left">
						<input name="name_en" type="text" size="100" style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(기타)</th>
					<td colspan="5" class="left">
						<input name="name_etc" type="text" size="100"/>
					</td>
				</tr>	


				<tr id="rent_facility" class="rent_facility" style="display:none;vertical-align:top">
					<th scope="row">대관시설</th>
					<td class="left">
						<input type="checkbox" name="rent_facility_all" id="rent_facility_all" value="1" />전체선택
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="1층" />
						</c:import>
					</td>
					<td class="left">
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="2층" />
						</c:import>							
					</td>
					<td class="left">
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="3층" />
						</c:import>
					</td>
					<td colspan="2" class="left">
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="기타" />
						</c:import>
					</td>
					
				</tr>	
				<tr>
					<th scope="row">대관기간</th>
					<td colspan="2"  class="left">
						<%-- <input name="rent_st_date" type="text" class="datepicker wd45per" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> ~
						<input name="rent_ed_date" type="text" class="datepicker wd45per" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> --%>
						<input name="rent_st_date" type="text" class="datepicker wd45per" value="" size="9" readonly/> ~
						<input name="rent_ed_date" type="text" class="datepicker wd45per" value="" size="9" readonly/>
					</td>
					<th scope="row">행사기간</th>
					<td colspan="2">
						<input name="event_st_date" type="text" class="datepicker wd45per" value="" size="9" readonly/> ~
						<input name="event_ed_date" type="text" class="datepicker wd45per" value="" size="9" readonly/>
						<%-- <input name="event_st_date" type="text" class="datepicker" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> ~
						<input name="event_ed_date" type="text" class="datepicker" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> --%>
					</td>
				</tr>


				<tr>

					<th scope="row"><span class="esicon">*</span>행사구분</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_division_idx" />
							<c:param name="type" value="행사구분" />
						</c:import>
					</td>


					<th scope="row">행사유형</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_type_idx" />
							<c:param name="type" value="행사유형구분" />
						</c:import>							
					</td>
					<th scope="row">행사성격</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_scale_idx" />
							<c:param name="type" value="행사성격" />
						</c:import>							
					</td>
				</tr>	
				<tr>
					<th scope="row"><span class="esicon">*</span>행사분야</th>
					<td class="left" colspan="5">


					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="event_theme" />
						<c:param name="type" value="행사분야" />
						<c:param name="li" value="N" />
						<c:param name="result" value=""/>
					</c:import>	
					
					<input type="hidden" name="event_theme" value="0" />		
		

					</td>
				</tr>	

				<tr>
					<th scope="row">전체참가자수</th>
					<td class="left">
						<input name="join_personal_cnt" type="number" value="0"/>
					</td>
					<th scope="row">외국인수</th>
					<td class="left">
						<input name="join_foreigner_cnt" type="number" value="0"/>
					</td>
					<th scope="row">내국인수</th>
					<td class="left">
						<input name="join_nationals_cnt" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">전시부스</th>
					<td class="left">
						<input name="booth_cnt" type="number" value="0"/>
					</td>
					<th scope="row">전시면적</th>
					<td class="left">
						<input name="exhibition_scale" type="number" value="0"/>
					</td>
					<th scope="row">참가국수</th>
					<td class="left">
						<input name="participating_states_cnt" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">주최기관</th>
					<td class="left" colspan="2">
						<select name="organizers_1" style="width:200px">
							<option value="">==선택하세요==</option>
							<c:forEach var="result" items="${organizerList }" varStatus="status">
								<option value="${result.idx }">${result.name_ko }</option>
							</c:forEach>
						</select>
						<a onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
					</td>
					<th scope="row">담당자</th>
					<td colspan="2" id="organizer_1_member" class="organizer_1_member left">
					</td>
				</tr>

				<tr>
					<th scope="row">주관기관</th>
					<td class="left" colspan="2">
						<select name="organizers_2" style="width:200px">
							<option value="">==선택하세요==</option>
							<c:forEach var="result" items="${organizerList }" varStatus="status">
								<option value="${result.idx }">${result.name_ko }</option>
							</c:forEach>
						</select>
						<a onclick="on_search_layer(this);" data-id="organizers_2" role="button" class="btn1 clr_Wgray" >조회</a>
					</td>
					<th scope="row">담당자</th>
					<td colspan="2" id="organizer_2_member"  class="organizer_2_member left">
					</td>
				</tr>

										


<input type="hidden" name="plus_org__" value="" />
<input type="hidden" name="plus_org_member__" value="" />
				


				<tr>
					<th scope="row">추가기관</th>
					<td class="left" colspan="4">


			
						<ul class = "org_plus_wrap">

							<li class="left">
								
								기관
								<select name="plus_org" class="plus_org0" style="width:200px">
									<option value="">==선택하세요==</option>
									<c:forEach var="item" items="${organizerList }" varStatus="status2">
										<option value="${item.idx }" >${item.name_ko }</option>
									</c:forEach>									
								</select>
								<a onclick="on_search_layer(this);" data-id="plus_org0" role="button" class="btn1 clr_Wgray plus_org_search" >조회</a>&nbsp; 
								
								담당자
								<span class="plus_org_member_wrap0" >

									<select name="plus_org_member" class="plus_org_member" style="width:200px">
										<option value="">==선택하세요==</option>
									</select>																		
											
								</span>
								
								<button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:plus_append(this);return false;">추가</button>
								
							</li>				
						</ul>
					
					</td>
				</tr>
			
				<tr>
					<th scope="row">관련국제기구</th>
					<td  class="left">
						<input name="organizers_3" type="text"/>
					</td>
					<th scope="row">공개여부</th>
					<td  class="left">
						<select name="view_yn">
							<option value="">==선택하세요==</option>
							<option value="Y">공개</option>
							<option value="N">비공개</option>
						</select>
					</td>
					<th scope="row">홈페이지</th>
					<td class="left">
						<input name="homepage" type="text"/>
					</td>
				</tr>	
	
				
			</tbody>
		</table>


		<h5 class="s_tit" >행사정보2</h5>

		<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col>
				<col width="30%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">견적제출일</th>
					<td class="left">
						<input name="estimate_date" class="datepicker" type="text" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/>
					</td>
					<th scope="row">견적금액</th>
					<td  class="left">
						<input name="estimate_cost"  type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">매출예상액</th>
					<td  class="left">
						<input name="sales_cost"  type="number" value="0"/>
					</td>
					<th scope="row">총매출액</th>
					<td class="left">
						<input name="total_cost" type="number" value="0" readonly/>
					</td>
				</tr>
				<tr>
					<th scope="row">임대매출</th>
					<td class="left">
						<input name="rent_cost" type="number" value="0"/>
					</td>
					<th scope="row">식음매출</th>
					<td  class="left">
						<input name="food_cost" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">AV 및 렌탈 매출</th>
					<td class="left">
						<input name="av_rental_cost" type="number" value="0"/>
					</td>
					<th scope="row">관리비 매출</th>
					<td   class="left">
						<input name="manager_cost" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">총지원금</th>
					<td class="left">
						<input name="total_grant_cost" type="number" value="0" readonly/>
					</td>
					<th scope="row">개최지원금</th>
					<td  class="left">
						<input name="held_grant_cost" type="number" value="0"/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">유치지원금</th>
					<td class="left">
						<input name="attract_grant_cost" type="number" value="0"/>
					</td>
					<th scope="row">홍보지원금</th>
					<td class="left">
						<input name="sales_grant_cost" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">유치담당자</th>
					<td class="left">
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="attract_staff_id" />
							<c:param name="result" value="myid" />
						</c:import>
					</td>
					<th scope="row">행사담당자</th>
					<td  class="left">
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_staff_id" />
							<c:param name="result" value="myid" />
						</c:import>						
					</td>
				</tr>
	
	
	
				<tr>
					<th scope="row">견적서</td>
					<td colspan="3" class="left">
						<ul id="partners_attach_file" class="partners_attach_file">
							<li><input name="partners_attach_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('partners_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
						</ul>
						
					</td>
				</tr>
				<tr>
					<td colspan="4" class="left">
						<textarea name="partners_comment" style="width:100%" rows="6"></textarea>
						<input type="hidden" name="posblAtchFileNumber" value="10" />
					</td>
				</tr>	
				
				

				<tr>
					<th scope="row">기타</td>
					<td colspan="3" class="left">
						<ul id="etc_attach_file" class="etc_attach_file">
							<li>
								<input name="etc_attach_file" type="file" />
								<button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('etc_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button>
							</li>
						</ul>
						
					</td>
				</tr>
				<tr>
					<td colspan="4"  class="left">
						<textarea name="etc_comment" style="width:100%" rows="6"></textarea>
					</td>
				</tr>
				
					
	
	
				
				
			</tbody>
		</table>


		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<a id="btnSave_web" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="/crm/event/insert.do" role="button" class="btn1 clr_Wgray">취소</a>
				<a href="<c:url value='/crm/event/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
			</div>
		</div>
		<!--// 버튼 위치(e) -->



		</form>
	
</div>
<!-- //웹,패드에서만 보임 -->




<!--모바일에서 보이는 내용 -->
<div class="mobile_show">

		<h5 class="s_tit">행사정보1</h5>
		
		<form name="form_mobile" id="form_mobile" method="post" action="/crm/event/insert_action.do" enctype="multipart/form-data">
		<input type="hidden" name="place_idx" value="11" />
		
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
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="implementation_status" />
							<c:param name="type" value="추진현황" />
							<c:param name="result" value="1" />
						</c:import>
					</td>
				</tr>
				<tr>
					<th scope="row">확정일자</th>
					<td class="left">
						<%-- <input name="confirm_date" type="text" class="datepicker" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> --%>
						<input name="confirm_date" type="text" class="datepicker" value="" size="9" readonly/>
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(국문)</th>
					<td  class="left">
						<input name="name_ko" type="text" size="100" style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(영문)</th>
					<td class="left">
						<input name="name_en" type="text" size="100" style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">행사명(기타)</th>
					<td class="left">
						<input name="name_etc" type="text" size="100"/>
					</td>
				</tr>	

				<tr id="rent_facility" style="display:none;vertical-align:top">
					<th scope="row">대관시설</th>
					<td class="left">
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="1층" />
						</c:import>
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="2층" />
						</c:import>							
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="3층" />
						</c:import>
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="rent_facility_text" />
							<c:param name="type" value="기타" />
						</c:import>
					</td>
				</tr>	
				<tr>
					<th scope="row">대관기간</th>
					<td  class="left">
						<%-- <input name="rent_st_date" type="text" class="datepicker wd45per" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> ~
						<input name="rent_ed_date" type="text" class="datepicker wd45per" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> --%>
						<input name="rent_st_date" type="text" class="datepicker wd45per" value="" size="9" readonly/> ~
						<input name="rent_ed_date" type="text" class="datepicker wd45per" value="" size="9" readonly/>
					</td>
				</tr>	
				<tr>
					<th scope="row">행사기간</th>
					<td>
						<input name="event_st_date" type="text" class="datepicker wd45per" value="" size="9" readonly/> ~
						<input name="event_ed_date" type="text" class="datepicker wd45per" value="" size="9" readonly/>
						<%-- <input name="event_st_date" type="text" class="datepicker" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> ~
						<input name="event_ed_date" type="text" class="datepicker" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/> --%>
					</td>
				</tr>


				<tr>

					<th scope="row"><span class="esicon">*</span>행사구분</th>	
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_division_idx" />
							<c:param name="type" value="행사구분" />
						</c:import>
					</td>
				</tr>
				<tr>


					<th scope="row">행사유형</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_type_idx" />
							<c:param name="type" value="행사유형구분" />
						</c:import>							
					</td>
				</tr>
				<tr>
					<th scope="row">행사성격</th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="event_scale_idx" />
							<c:param name="type" value="행사성격" />
						</c:import>							
					</td>
				</tr>
				


				<tr>
					<th scope="row"><span class="esicon">*</span>행사분야</th>
					<td class="left">



					<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
						<c:param name="name" value="event_theme" />
						<c:param name="type" value="행사분야" />
						<c:param name="li" value="N" />
						<c:param name="result" value=""/>
					</c:import>			
		
					</td>
				</tr>	

				<tr>
					<th scope="row">전체참가자수</th>
					<td class="left">
						<input name="join_personal_cnt" type="number" value="0"/>
					</td>
				</tr>					
				<tr>
					<th scope="row">외국인수</th>
					<td class="left">
						<input name="join_foreigner_cnt" type="number" value="0"/>
					</td>
				</tr>					
				<tr>
					<th scope="row">내국인수</th>
					<td class="left">
						<input name="join_nationals_cnt" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">전시부스</th>
					<td class="left">
						<input name="booth_cnt" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">전시면적</th>
					<td class="left">
						<input name="exhibition_scale" type="number" value="0"/>
					</td>
				</tr>
				<tr>

					<th scope="row">참가국수</th>
					<td class="left">
						<input name="participating_states_cnt" type="number" value="0"/>
					</td>
				</tr>
				<tr>
					<th scope="row">주최기관</th>
					<td class="left" class="organizers_1">
						<select name="organizers_1"  class="wd60per">
							<option value="">==선택하세요==</option>
							<c:forEach var="result" items="${organizerList }" varStatus="status">
								<option value="${result.idx }">${result.name_ko }</option>
							</c:forEach>
						</select>
						<a onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td id="organizer_1_member" class="organizer_1_member left">
					</td>
				</tr>
				<tr>
					<th scope="row">주관기관</th>
					<td class="left" class="organizers_2">
						<select name="organizers_2" class="wd60per">
							<option value="">==선택하세요==</option>
							<c:forEach var="result" items="${organizerList }" varStatus="status">
								<option value="${result.idx }">${result.name_ko }</option>
							</c:forEach>
						</select>
						<a onclick="on_search_layer(this);" data-id="organizers_2" role="button" class="btn1 clr_Wgray" >조회</a>
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td id="organizer_2_member"  class="organizer_2_member left">
					</td>
				</tr>
				
				<tr>
					<th scope="row">추가기관</th>
					<td class="left">

						<ul class = "org_plus_wrap">
							<li class="left">
								기관
								<select name="plus_org" class="plus_org0" style="width:200px">
									<option value="">==선택하세요==</option>
									<c:forEach var="item" items="${organizerList }" varStatus="status2">
										<option value="${item.idx }" >${item.name_ko }</option>
									</c:forEach>									
								</select>
								<a onclick="on_search_layer(this);" data-id="plus_org0" role="button" class="btn1 clr_Wgray plus_org_search" >조회</a>&nbsp; 
								</br>
								
								담당자
								<span class="plus_org_member_wrap0" >
									<select name="plus_org_member" class="plus_org_member" style="width:200px">
										<option value="">==선택하세요==</option>
									</select>																		
								</span>
								</br>
								
								<button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:plus_append(this);return false;">추가</button>
							</li>
						</ul>
					
					</td>
				</tr>
			

				
				
				
				
				
				
				<tr>
					<th scope="row">관련국제기구</th>
					<td  class="left">
						<input name="organizers_3" type="text"/>
					</td>
				</tr>
				<tr>
					<th scope="row">공개여부</th>
					<td  class="left">
						<select name="view_yn">
							<option value="">==선택하세요==</option>
							<option value="Y">공개</option>
							<option value="N">비공개</option>
						</select>
					</td>
				</tr>
				<tr>

					<th scope="row">홈페이지</th>
					<td class="left">
						<input name="homepage" type="text"/>
					</td>
				</tr>	
			</tbody>
		</table>


		<h5 class="s_tit">행사정보2</h5>

		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">견적제출일</th>
						<td class="left">
							<input name="estimate_date" class="datepicker" type="text" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" size="9" readonly/>
						</td>
					</tr>
					<tr>
						<th scope="row">견적금액</th>
						<td  class="left">
							<input name="estimate_cost"  type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">매출예상액</th>
						<td  class="left">
							<input name="sales_cost"  type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">총매출액</th>
						<td class="left">
							<input name="total_cost" type="number" value="0" readonly/>
						</td>
					</tr>
					<tr>
						<th scope="row">임대매출</th>
						<td class="left">
							<input name="rent_cost" type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">식음매출</th>
						<td  class="left">
							<input name="food_cost" type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">AV 및 렌탈 매출</th>
						<td class="left">
							<input name="av_rental_cost" type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">관리비 매출</th>
						<td class="left">
							<input name="manager_cost" type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">총지원금</th>
						<td class="left">
							<input name="total_grant_cost" type="number" value="0" readonly/>
						</td>
					</tr>
					<tr>
						<th scope="row">개최지원금</th>
						<td  class="left">
							<input name="held_grant_cost" type="number" value="0"/>
						</td>
					</tr>
					<tr>
						<th scope="row">유치지원금</th>
						<td class="left">
							<input name="attract_grant_cost" type="number" value="0"/>
						</td>	
					</tr>

					<tr>
						<th scope="row">유치담당자</th>
						<td class="left">
							<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
								<c:param name="name" value="attract_staff_id" />
								<c:param name="result" value="myid" />
							</c:import>
						</td>
					</tr>
					<tr>
						<th scope="row">행사담당자</th>
						<td  class="left">
							<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
								<c:param name="name" value="event_staff_id" />
								<c:param name="result" value="myid" />
							</c:import>						
						</td>
					</tr>
					<tr>
						<th scope="row">견적서</td>
						<td>
							<ul id="partners_attach_file" class="partners_attach_file">
								<li><input name="partners_attach_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('partners_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
							</ul>	
						</td>
					</tr>
					<tr>
						<td colspan="2">

							<textarea name="partners_comment" style="width:100%" rows="6"></textarea>
							<input type="hidden" name="posblAtchFileNumber" value="10" />
					
						</td>
					</tr>		
							
					<tr>
						<th scope="row">기타</td>
						<td  class="left">
							<ul id="etc_attach_file" class="etc_attach_file">
								<li><input name="etc_attach_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('etc_attach_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td colspan="2"  class="left">
							<textarea name="etc_comment" rows="6"></textarea>
						</td>
					</tr>
					
					
					
				</tbody>
		</table>

	


		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<a id="btnSave_mobile" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="/crm/event/insert.do" role="button" class="btn1 clr_Wgray">취소</a>
				<a href="<c:url value='/crm/event/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
			</div>
		</div>
		<!--// 버튼 위치(e) -->


		</form>
	
</div>
<!-- //모바일에서만 내용 보임 -->




		<%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>