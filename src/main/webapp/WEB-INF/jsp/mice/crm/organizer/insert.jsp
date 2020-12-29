<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


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
	.red { color:red; }
</style>
<script type="text/javaScript" language="javascript">
$(document).ready(function(){
	$('#btnSave').on('click',function(){

		if($("input[name=manager_event]").is(":checked") == false){
			$("input[name=manager_event]")[0].focus();
			alert("행사구분을 선택하세요");
			return false;
		}	
		if($("select[name=type_idx]").val() == ""){
			alert("기관구분을 선택하세요");
			$("select[name=type_idx]").focus();
			return false;
		}			
		$('form').submit();
	});
	
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 name_en : { maxlength:100},
			 name_etc : { maxlength:100},			 
			 name_ko : { required: true, minlength:2,maxlength:100},
	 		 tel_no : { minlength:9,maxlength:20},
	 		 type_idx :  { required: true},
	 		 national : { maxlength:100},
	 		 city : { maxlength:100},
	 		 zip_code : {maxlength:20},
	 		 address_ko : { minlength:2,maxlength:255},
	 		 address_en : { maxlength:255},
	 		 tel_no : {maxlength:255},
	 		 fax : { maxlength:20},
	 		 homepage : { maxlength:255},
	 	     email : { email:true,maxlength:100}
		 }
	 });
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}
</script>

<script>
//이벤트 목록
function chkEventList(evt_kind, result){
	
	if(evt_kind != "M") return false;
	if(result == undefined) result = "";
	var params = "input_name=crm_event_idx&manager_event=M&result="+result;
	
	$.ajax({
		url: '/crm/manager_event/select_event_list.do', //url
		type: 'POST', //post,get,등..전송방식
		dataType: 'html',//데이타 타입
		data: params,
		error: function(json){ //실패시 실행 함수
			//alert( "실패였습니다.11");
		},
		success: function(response){ //성공시 실행함수
			$("select[name=crm_event_idx] option").remove();
	    	$("select[name=crm_event_idx]").append(response);
		}
	});	
}
//참가업체분류, 제품서비스, 세부품목 목록
function chkManagerEventList(crm_idx, cate_code, input_type, depth, parent, result){
	
	if(depth == undefined) depth = "";
	if(parent == undefined) parent = "";
	if(result == undefined) result = "";
	
	var params = "crm_event_idx="+crm_idx+"&cate_code="+cate_code+"&searchDepth="+depth+"&result="+result;
	params=params+"&input_name=event_cate_"+cate_code+"&input_type="+input_type;
	if(parent != undefined) params = params + "&searchParent="+parent;

	$.ajax({
		url: '/crm/manager_event/select_box.do', //url
		type: 'POST', //post,get,등..전송방식
		dataType: 'html',//데이타 타입
		data: params,
		error: function(json){ //실패시 실행 함수
			//alert( "실패였습니다.22");
		},
		success: function(response){ //성공시 실행함수
	    		var str = cate_code + depth;
	    		$("#event_cate_"+str+" option").remove();
	    		$("#event_cate_"+str).append(response);
		}
	});	
}


//참가업체분류, 제품서비스, 세부품목 목록
function chkManagerEventList2(crm_idx, cate_code, input_type, depth, parent, result){
	
	if(depth == undefined) depth = "";
	if(parent == undefined) parent = "";
	if(result == undefined) result = "";
	
	var params = "crm_event_idx="+crm_idx+"&cate_code="+cate_code+"&searchDepth="+depth+"&result="+result;
	params=params+"&input_name=event_cate_"+cate_code+"List&input_type="+input_type;
	if(parent != undefined) params = params + "&searchParent="+parent;

	$.ajax({
		url: '/crm/manager_event/check_box.do', //url
		type: 'POST', //post,get,등..전송방식
		dataType: 'html',//데이타 타입
		data: params,
		error: function(json){ //실패시 실행 함수
			//alert( "실패였습니다.33");
		},
		success: function(response){ //성공시 실행함수
	    		$("#event_cate_"+cate_code+"List").html(response);
		}
	});	
}

function chkManagerEventChangeAll(crm_idx){
	//alert( crm_idx );
	chkManagerEventList(crm_idx, "biz", "select",1);
	chkManagerEventList2(crm_idx, "service", "checkbox",1);
	chkManagerEventList2(crm_idx, "item", "checkbox",1);
}
function chkManagerEventChangeRemove(val){
	if(val == "load"){
		$("select[name=crm_event_idx] option").remove()
		$("#event_cate_biz1 option").remove();
		$("#event_cate_biz2 option").remove();
		$("#event_cate_biz3 option").remove();
		$("#event_cate_serviceList").html("");
		$("#event_cate_itemList").html("");
	}else if(val == "all"){
		$("#event_cate_biz1 option").remove();
		$("#event_cate_biz2 option").remove();
		$("#event_cate_biz3 option").remove();
		$("#event_cate_serviceList").html("");
		$("#event_cate_itemList").html("");
	}else if(val == "biz1"){
		$("#event_cate_biz2 option").remove();
		$("#event_cate_biz3 option").remove();
	}else if(val == "biz2"){
		$("#event_cate_biz3 option").remove();
	}
}
//행사정보선택시 
$(document).ready(function(){
	
	//행사구분 선택
	$("input[name=manager_event]").change(function(){
		if( $(this).val() == "N"){
			chkManagerEventChangeRemove("load");
		}else if( $(this).val() == "M"){
			chkEventList($(this).val());
		}
	});
	
	//이벤트 목록
	$("select[name=crm_event_idx]").change(function(){
		chkManagerEventChangeRemove("all");
		if($(this).val() !=  ''){
			chkManagerEventChangeAll( $(this).val() );
		}
	});
	
	//업체분류1
	$("select[name=event_cate_biz1]").change(function(){
		if($(this).val() !=  ''){
			chkManagerEventChangeRemove("biz1");
			chkManagerEventList( $("select[name=crm_event_idx]").val(), "biz", "select",2, $(this).val());
		}
	});
	
	//업체분류2
	$("select[name=event_cate_biz2]").change(function(){
		if($(this).val() !=  ''){
			chkManagerEventChangeRemove("biz2");
			chkManagerEventList($("select[name=crm_event_idx]").val(), "biz", "select",3, $(this).val());
		}
	});	
});	
</script>
<script>
$(document).ready(function(){
	chkManagerForm( $("input[name=manager_event]:checked").val() );
	$("input[name=manager_event]").click(function(){
		chkManagerForm($(this).val());
	});
});
function chkManagerForm(val){
	if( val == "M" ){
		$(".manager_tr").css("display","");
		
		//$(".manager_form").each(function(){
		//	$(this).attr("name","")	
		//});
		
	}else{
		$(".manager_tr").find("input[type=text]").val("");
		$(".manager_tr").find("input[type=radio]").prop("checked","");
		$(".manager_tr").css("display","none");	
		
		//$(".manager_form").each(function(){
		//	$(this).attr("name",$(this).attr("title"));	
		//});		
	}	
}
</script>		
		
			
			
		

<section id="contentArea">
	<h3>고객DB관리 <span>></span> 기관단체관리 <span>></span> 등록</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/crm/organizer/insert_action.do" enctype="multipart/form-data">
			

		<span class="red">(*)</span> 필수입력사항입니다.
		<h5 class="s_tit">주관행사정보</h5>
		<table  class="adm_tbl2">
		<caption>상세</caption>
			<colgroup>
				<col width="24%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">행사구분<span class="red">(*)</span></th>
					<td class="left">
						<input type="radio" name="manager_event" value="N" />일반기업
						<input type="radio" name="manager_event" value="M" />주관행사 참가업체
					</td>
				</tr>
							
							
							
							
							
				<tr class="manager_tr">
					<th scope="row">기관종류</th>
					<td class="left">
						<c:import url="/crm/code/radio_box_val.do" charEncoding="utf-8">
							<c:param name="name" value="org_kind" />
							<c:param name="type" value="기관_기관종류" />
							<c:param name="li" value="N" />
							<c:param name="result" value=""/>
						</c:import>
					</td>
				</tr>	
				<tr class="manager_tr">
					<th scope="row">행사정보</th>
					<td class="left">
						<select name="crm_event_idx">
						</select>				
					</td>
				</tr>			
				<tr class="manager_tr">
					<th scope="row">참가업체분류</th>
					<td class="left">
						<select name="event_cate_biz1" id="event_cate_biz1">
						</select>
	
						<select name="event_cate_biz2" id="event_cate_biz2">
						</select>
						
						<select name="event_cate_biz3" id="event_cate_biz3">
						</select>
					</td>
				</tr>
				<tr class="manager_tr">
					<th scope="row">제품서비스</th>
					<td class="left">
						<div id="event_cate_serviceList">
						</div>	
						<input type="hidden" name="event_cate_serviceList" value="" />						
					</td>
				</tr>
				
				<tr class="manager_tr">
					<th scope="row">세부품목</th>
					<td class="left">
						<div id="event_cate_itemList">
						</div>
						<input type="hidden" name="event_cate_itemList" value="" />	
					</td>
				</tr>	
				
				
				
			</tbody>
		</table>	
		
		
		<h5 class="s_tit">기관단체명</h5>
		<table  class="adm_tbl2">
		<caption>상세</caption>
			<colgroup>
				<col width="24%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">국문<span class="red">(*)</span></th>
					<td class="left">
						<input name="name_ko" type="text"style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">영문</th>
					<td class="left">
						<input name="name_en" type="text" style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">기타</th>
					<td class="left">
						<input name="name_etc" type="text" />
					</td>
				</tr>
			</tbody>
		</table>



		<h5 class="s_tit">기본정보</h5>
		<table  class="adm_tbl2">
		<caption>상세</caption>
			<colgroup>
				<col width="24%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">기관구분<span class="red">(*)</span></th>
					<td class="left">
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="type_idx" />
							<c:param name="type" value="주최자구분" />
						</c:import>
					</td>
				</tr>
				<tr>
					<th scope="row">국가</th>
					<td class="left">
						<input name="national" type="text"  maxlength="50" />
					</td>
				</tr>
				<tr>
					<th scope="row">우편번호</th>
					<td class="left">
						<input id="zip_postcode" name="zip_code" type="text" class="wd60per" />
						<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
					</td>
				</tr>
				<tr>
					<th scope="row">주소(국문)</th>
					<td class="left">
						<input id="zip_address_ko" name="address_ko" type="text"   maxlength="200" style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">주소(영문)</th>
					<td class="left">
						<input id="zip_address_en" name="address_en" type="text"   maxlength="200" style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대표자</th>
					<td class="left">
						<input name="ceo_name" type="text" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대표자 연락처</th>
					<td class="left">
						<input name="ceo_phone" type="text" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th scope="row">업체담당자</th>
					<td class="left">
						<input name="biz_man" type="text" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th scope="row">업체담당자 연락처</th>
					<td class="left">
						<input name="biz_man_phone" type="text" maxlength="50"/>
					</td>
				</tr>	
				<tr>
					<th scope="row">업체담당자 E-mail</th>
					<td class="left">
						<input name="biz_man_email" type="text" maxlength="50"/>
					</td>
				</tr>												
				
				<tr>
					<th scope="row">대표전화</th>
					<td class="left">
						<input name="tel_no" type="text"  maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th scope="row">FAX</th>
					<td class="left">
						<input name="fax" type="text"  maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대표 <br class="mobile_show">E-mail</th>
					<td class="left">
						<input name="email" type="text"  maxlength="200"/>
					</td>
				</tr>
				<tr>
					<th scope="row">홈페이지</th>
					<td class="left">
						<input name="homepage" type="text"  maxlength="200"/>
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td class="left">
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="manager_id" />
							<c:param name="result" value="myid" />
						</c:import>
					</td>
				</tr>
				
				
				
				
				
				
				
				<tr class="manager_tr">
					<th scope="row">참기기관 중요도</th>
					<td class="left">
						<c:import url="/crm/code/radio_box_val.do" charEncoding="utf-8">
							<c:param name="name" value="org_import" />
							<c:param name="type" value="기관_참가기관중요도" />
							<c:param name="li" value="N" />
							<c:param name="result" value=""/>
						</c:import>
					</td>
				</tr>
				<tr class="manager_tr">
					<th scope="row">참가의향등급</th>
					<td class="left">
						<c:import url="/crm/code/radio_box_val.do" charEncoding="utf-8">
							<c:param name="name" value="org_grade" />
							<c:param name="type" value="기관_참가의향등급" />
							<c:param name="li" value="N" />
							<c:param name="result" value=""/>
						</c:import>
					</td>
				</tr>
				<tr class="manager_tr">
					<th scope="row">진행단계</th>
					<td class="left">
						<c:import url="/crm/code/radio_box_val.do" charEncoding="utf-8">
							<c:param name="name" value="org_step" />
							<c:param name="type" value="기관_진행단계" />
							<c:param name="li" value="N" />
							<c:param name="result" value=""/>
						</c:import>
					</td>
				</tr>	
				<tr class="manager_tr">
					<th scope="row">과거전시회 이력</th>
					<td class="left">
						<input name="org_exhi_history" type="text"  maxlength="200"/>
					</td>
				</tr>					
				<tr class="manager_tr">
					<th scope="row">전시회 참가 경로</th>
					<td class="left">
						<c:import url="/crm/code/radio_box_val.do" charEncoding="utf-8">
							<c:param name="name" value="org_exhi_path" />
							<c:param name="type" value="기관_전시회참가경로" />
							<c:param name="li" value="N" />
							<c:param name="result" value=""/>
						</c:import>
					</td>
				</tr>	
				
				
					
								
			</tbody>
		</table>

	
		<h5 class="s_tit">추가정보</h5>
		<textarea name="comment" rows="4" cols="80"></textarea>
			
			
		</form>
	
		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="/crm/organizer/insert.do" role="button" class="btn1 clr_Wgray">취소</a>
				<a href="<c:url value='/crm/organizer/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				
			</div>
		</div>
		<!--// 버튼 위치(e) -->
		
		
	
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>