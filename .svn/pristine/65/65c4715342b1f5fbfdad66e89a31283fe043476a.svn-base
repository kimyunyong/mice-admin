<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('#form').attr('action','/crm/organizer/list.do');
			$('#form').attr('method','get');
			$('#form').submit();
		});
		$('#btnRegist').on('click',function(){
			location.href='/crm/organizer/insert.do';
		});
		
		$('#btnExcelDownload').on('click',function(){
			$('#form').attr('action','/crm/organizer/excel_download.do');
			$('#form').attr('method','post');
			$('#form').submit();
			$('#form').attr('action','/crm/organizer/list.do');
			$('#form').attr('method','get');
		})
		
		$('#btnExcelUpload').on('click',function(){
			$('#form input[name=excel]').click();
		});
		
		$('#form input[name=excel]').change(function(){
			
			if($(this).val() != ''){
				$('#form').attr('action','/crm/organizer/excel_upload.do');
				$('#form').attr('method','post');
				$('#form').submit();
			}
				
		});

		//항목 수정
		$('#btnGradeUpdate').on('click',function(){
			$("#form_grade").action="/crm/organizer/list_grade_action.do";
			$("#form_grade").submit();
			//$('input[name=excel]').click();
		});
		
		
		
	});
	function fnLinkPage(i){
		$('input[name=pageIndex]').val(i);
		$('#form').submit();
	}
</script>
<script>
$(document).ready(function(){
	$("#form input").keydown(function (key) {
		if(key.keyCode == 13){
			document.form.submit();
		}
	});	
	$("#form select[name=searchType]").change(function () {
		
		document.form.submit();
		
	});	
});
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
			$("select[name=search_crm_event_idx] option").remove();
	    	$("select[name=search_crm_event_idx]").append(response);
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
	    		$("#search_event_cate_"+str+" option").remove();
	    		$("#search_event_cate_"+str).append(response);
		}
	});	
}

//참가업체분류, 제품서비스, 세부품목 목록
function chkManagerEventList2(crm_idx, cate_code, input_type, depth, parent, result){
	
	if(depth == undefined) depth = "";
	if(parent == undefined) parent = "";
	if(result == undefined) result = "";
	
	var params = "crm_event_idx="+crm_idx+"&cate_code="+cate_code+"&searchDepth="+depth+"&result="+result;
	params=params+"&input_name=search_event_cate_"+cate_code+"List&input_type="+input_type;
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
			
	    		$("#search_event_cate_"+cate_code+"List").html(response);
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
		$("select[name=search_crm_event_idx] option").remove()
		$("#search_event_cate_biz1 option").remove();
		$("#search_event_cate_biz2 option").remove();
		$("#search_event_cate_biz3 option").remove();
		$("#search_event_cate_serviceList").html("");
		$("#search_event_cate_itemList").html("");
	}else if(val == "all"){
		$("#search_event_cate_biz1 option").remove();
		$("#search_event_cate_biz2 option").remove();
		$("#search_event_cate_biz3 option").remove();
		$("#search_event_cate_serviceList").html("");
		$("#search_event_cate_itemList").html("");
	}else if(val == "biz1"){
		$("#search_event_cate_biz2 option").remove();
		$("#search_event_cate_biz3 option").remove();
	}else if(val == "biz2"){
		$("#search_event_cate_biz3 option").remove();
	}
}
//행사정보선택시 
$(document).ready(function(){
	
	//행사구분 선택
	$("input[name=search_manager_event]").change(function(){
		if( $(this).val() == "N"){
			chkManagerEventChangeRemove("load");
		}else if( $(this).val() == "M"){
			chkEventList($(this).val());
		}
	});
	
	//이벤트 목록
	$("select[name=search_crm_event_idx]").change(function(){
		chkManagerEventChangeRemove("all");
		if($(this).val() !=  ''){
			chkManagerEventChangeAll( $(this).val() );
		}
	});
	
	//업체분류1
	$("select[name=search_event_cate_biz1]").change(function(){
		if($(this).val() !=  ''){
			chkManagerEventChangeRemove("biz1");
			chkManagerEventList( $("select[name=search_crm_event_idx]").val(), "biz", "select",2, $(this).val());
		}
	});
	
	//업체분류2
	$("select[name=search_event_cate_biz2]").change(function(){
		if($(this).val() !=  ''){
			chkManagerEventChangeRemove("biz2");
			chkManagerEventList($("select[name=search_crm_event_idx]").val(), "biz", "select",3, $(this).val());
		}
	});	
});	
</script>
<script>
$(document).ready(function(){ 
//	chkEventList($("input[name=search_manager_event]:checked").val(),'${vo.search_crm_event_idx}');
///	chkManagerEventList( '${vo.search_crm_event_idx}', "biz", "select", 1, '', '${vo.search_event_cate_biz1}');
//	chkManagerEventList( '${vo.search_crm_event_idx}', "biz", "select", 2, '${vo.search_event_cate_biz1}', '${vo.search_event_cate_biz2}');
//	chkManagerEventList( '${vo.search_crm_event_idx}', "biz", "select", 3, '${vo.search_event_cate_biz2}', '${vo.search_event_cate_biz3}');
	//chkManagerEventList( '${vo.search_crm_event_idx}', "service", "checkbox", 1, '', '');
	//chkManagerEventList( '${vo.search_crm_event_idx}', "item", "checkbox", 1, '', '');

});		
</script>
<script>
$(document).ready(function(){
	chkManagerForm( $("input[name=search_manager_event]:checked").val() );
	
	$("input[name=search_manager_event]").click(function(){
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
		$(".manager_tr").find("input[type=checkbox]").prop("checked","");
		$(".manager_tr").find("select option").prop("selected",false);
		$(".manager_tr").css("display","none");	
		
		//$(".manager_form").each(function(){
		//	$(this).attr("name",$(this).attr("title"));	
		//});		
	}	
}
</script>	


<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>고객DB관리 <span>></span> 주관전시관리</h3>
	<title>고객DB관리 <span>></span> 주관전시관리</title>
	<section class="sect_nonetit">
		<h4>주관전시관리</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>



		<form name="form" id="form" action="/crm/organizer/list.do" method="get" enctype="multipart/form-data">
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>

		
		<div class="brd_p mb0">
			<div class="search_sort_type">
				<input type="file" name="excel" style="width:0px;height:0px; border:none;"/>
				<dl>
					<dt>기관단체명</dt>
					<dd><input class="brdSelect1 mobile-input01" name="searchName" type="text"  class="wd40per" value='<c:out value="${vo.searchName}"/>' maxlength="35"  title="검색어 입력"></dd>
				</dl>

				<dl>
					<dt>기관구분</dt>
					<dd>
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchType" />
						<c:param name="type" value="주최자구분" />
						<c:param name="result" value="${vo.searchType }"/>
						</c:import>
					</dd>
				</dl>

				<dl>
					<dt>주소</dt>
					<dd><input class="brdSelect1 mobile-input01" name="searchAddress" type="text" class="wd40per"  value='<c:out value="${d:decrypt(vo.searchAddress)}"/>' maxlength="35"  title="검색어 입력"></dd>
				</dl>

				<dl>
					<dt>담당자</dt>
					<dd><input class="brdSelect1 mobile-input01" name="search_manager_nm" type="text" class="wd40per"  value='<c:out value="${d:decrypt(vo.search_manager_nm)}"/>' maxlength="35"  title="검색어 입력">
				</dl>
			</div>
			
	
			<table  class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">행사구분</th>
						<td class="left">
							<input type="radio" name="search_manager_event" value="N" <c:if test="${vo.search_manager_event == 'N'}"> checked </c:if> />일반기업
							<input type="radio" name="search_manager_event" value="M" <c:if test="${vo.search_manager_event == 'M'}"> checked </c:if> />주관행사 참가업체
							<input type="radio" name="search_manager_event" value=""  <c:if test="${vo.search_manager_event == '' }"> checked </c:if> />전체
						</td>
					</tr>
					
					
					
					
					
					<tr class="manager_tr">
						<th scope="row">행사정보</th>
						<td class="left">
							
							<select name="search_crm_event_idx">
							<c:if test="${vo.search_manager_event == 'M'}">
							<c:import url="/crm/manager_event/select_event_list.do" charEncoding="utf-8">
								<c:param name="crm_event_idx" value="${vo.search_crm_event_idx }" />
								<c:param name="manager_event" value="M" />
								<c:param name="result" value="${vo.search_crm_event_idx }"/>
							</c:import>		
							</c:if>		
							</select>

						</td>
					</tr>			
					<tr class="manager_tr">
						<th scope="row">참가업체분류</th>
						<td class="left">
			
							<select name="search_event_cate_biz1" id="search_event_cate_biz1">
							<c:import url="/crm/manager_event/select_box.do" charEncoding="utf-8">
								<c:param name="crm_event_idx" value="${vo.search_crm_event_idx }" />
								<c:param name="cate_code" value="biz" />
								<c:param name="searchDepth" value="1" />
								<c:param name="searchParent" value="0" />
								<c:param name="result" value="${vo.search_event_cate_biz1 }"/>
							</c:import>								
							</select>
		
							<select name="search_event_cate_biz2" id="search_event_cate_biz2">
							<c:import url="/crm/manager_event/select_box.do" charEncoding="utf-8">
								<c:param name="crm_event_idx" value="${vo.search_crm_event_idx }" />
								<c:param name="cate_code" value="biz" />
								<c:param name="searchDepth" value="2" />
								<c:param name="searchParent" value="${vo.search_event_cate_biz1 }" />
								<c:param name="result" value="${vo.search_event_cate_biz2 }"/>
							</c:import>								
							</select>
							
							<select name="search_event_cate_biz3" id="search_event_cate_biz3">
							<c:import url="/crm/manager_event/select_box.do" charEncoding="utf-8">
								<c:param name="crm_event_idx" value="${vo.search_crm_event_idx }" />
								<c:param name="cate_code" value="biz" />
								<c:param name="searchDepth" value="3" />
								<c:param name="searchParent" value="${vo.search_event_cate_biz2 }" />
								<c:param name="result" value="${vo.search_event_cate_biz3 }"/>
							</c:import>								
							</select>
							
						</td>
					</tr>
					<tr class="manager_tr">
						<th scope="row">제품서비스</th>
						<td class="left">
						
							<div id="search_event_cate_serviceList">
								<c:import url="/crm/manager_event/check_box.do" charEncoding="utf-8">
									<c:param name="crm_event_idx" value="${vo.search_crm_event_idx }" />
									<c:param name="cate_code" value="service" />
									<c:param name="searchDepth" value="1" />
									<c:param name="input_name" value="search_event_cate_serviceList" />
									<c:param name="result" value="${vo.search_event_cate_serviceList}"/>
								</c:import>			
							</div>	
							
						</td>
					</tr>
					<tr class="manager_tr">
						<th scope="row">세부품목</th>
						<td class="left">
							
							<div id="search_event_cate_itemList">
								<c:import url="/crm/manager_event/check_box.do" charEncoding="utf-8">
									<c:param name="crm_event_idx" value="${vo.search_crm_event_idx }" />
									<c:param name="cate_code" value="item" />
									<c:param name="searchDepth" value="1" />
									<c:param name="input_name" value="search_event_cate_itemList" />
									<c:param name="result" value="${vo.search_event_cate_itemList}"/>
								</c:import>	
							</div>
						</td>
					</tr>
						
					
					<tr class="manager_tr">
						<th scope="row">참가기관 중요도</th>
						<td class="left">
								<c:import url="/crm/code/select_box_val.do" charEncoding="utf-8">
									<c:param name="name" value="search_org_import" />
									<c:param name="type" value="기관_참가기관중요도" />
									<c:param name="li" value="N" />
									<c:param name="result" value="${vo.search_org_import}"/>
								</c:import>
						</td>
					</tr>
					<tr class="manager_tr">
						<th scope="row">참가의향 등급</th>
						<td class="left">
								<c:import url="/crm/code/select_box_val.do" charEncoding="utf-8">
									<c:param name="name" value="search_org_grade" />
									<c:param name="type" value="기관_참가의향등급" />
									<c:param name="li" value="N" />
									<c:param name="result" value="${vo.search_org_grade}"/>
								</c:import>	
						</td>
					</tr>
					<tr class="manager_tr">
						<th scope="row">진행단계</th>
						<td class="left">
								<c:import url="/crm/code/select_box_val.do" charEncoding="utf-8">
									<c:param name="name" value="search_org_step" />
									<c:param name="type" value="기관_진행단계" />
									<c:param name="li" value="N" />
									<c:param name="result" value="${vo.search_org_step}"/>
								</c:import>		
						</td>
					</tr>
											
					
					
				</tbody>
			</table>	
			
	
			<div class="search_new_btn2">
						<a class="n_btn03 mobilebtn01" id="btnSearch">검색</a>
						<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
							<a class="n_btn03 mobilebtn01" id="btnRegist">등록</a>
						</sec:authorize>
			</div>
	
			<div class="btn_right_area pb0 mobile_btn_wd100" >
						<a class="sbtn01" id="btnExcelDownload">엑셀다운로드</a>
						<a class="sbtn01" id="btnExcelUpload">엑셀업로드</a>
						<a href='/excel_template/organizers_sample_template.xls' class="sbtn01" id="btnExcelUpload">엑셀양식 다운받기</a>
						<a class="sbtn01" id="btnGradeUpdate">목록수정</a>
			</div>

		</div>

		</form>




		<form name="form_grade" id="form_grade" action="/crm/organizer/list_grade_action.do" method="post">
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		
		<!-- 웹, 탭에서만 보임 -->
		<table  class="adm_tbl2 mobile_none" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col />
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">기관단체명</th>
					<!-- >th scope="col">기관구분</th>
			    	<th scope="col">대표전화</th -->
			    	
					<th scope="col">업체담당자</th>
					<th scope="col">담당자연락처</th>
			    	<th scope="col">담당자 E-mail</th>
			    	
			    	<th scope="col">참가기관 중요도</th>
			    	<th scope="col">참가의향 등급</th>
			    	<th scope="col">진행단계</th>
			    	
			    	<th scope="col">참가업체분류</th>
			    	<th scope="col">담당자</th>
			    	<!--th scope="col">작성자</th -->
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<input type="hidden" name="idxList" value="${result.idx}"/>
			<tr>
				<td>${result.idx }</td>
				<td><a href="/crm/organizer/info.do?idx=${result.idx}">${result.name_ko }&nbsp;&nbsp;</a></td>
				<!-- td>${result.type_name}</td>
				<td>${d:decrypt(result.tel_no) }</td -->
				
				<td>${d:decrypt(result.biz_man)}</td>
				<td>${d:decrypt(result.biz_man_phone)}</td>
				<td>${d:decrypt(result.biz_man_email)}</td>
				
				<td>
				
						<c:if test="${result.manager_event== 'N' || result.manager_event== ''}">
							<input type="hidden" name="org_importList" value="${result.org_import}" />
						</c:if>
						<c:if test="${result.manager_event== 'M'}">
							<c:import url="/crm/code/select_box_val.do" charEncoding="utf-8">
								<c:param name="name" value="org_importList" />
								<c:param name="type" value="기관_참가기관중요도" />
								<c:param name="li" value="N" />
								<c:param name="result" value="${result.org_import}"/>
							</c:import>		
						</c:if>		
				
				</td>
				<td>
						<c:if test="${result.manager_event== 'N'  || result.manager_event== ''}">
							<input type="hidden" name="org_gradeList" value="${result.org_grade}" />
						</c:if>
						<c:if test="${result.manager_event== 'M'}">
							<c:import url="/crm/code/select_box_val.do" charEncoding="utf-8">
								<c:param name="name" value="org_gradeList" />
								<c:param name="type" value="기관_참가의향등급" />
								<c:param name="li" value="N" />
								<c:param name="result" value="${result.org_grade}"/>
							</c:import>		
						</c:if>		
				</td>
				<td>
						<c:if test="${result.manager_event== 'N'  || result.manager_event== ''}">
							<input type="hidden" name="org_stepList" value="${result.org_step}"/>
						</c:if>
						<c:if test="${result.manager_event== 'M'}">
							<c:import url="/crm/code/select_box_val.do" charEncoding="utf-8">
								<c:param name="name" value="org_stepList" />
								<c:param name="type" value="기관_진행단계" />
								<c:param name="li" value="N" />
								<c:param name="result" value="${result.org_step}"/>
							</c:import>		
						</c:if>		
				</td>
				
				<td>
					${result.event_cate_biz1_str} 
					<c:if test="${fn:length(result.event_cate_biz2_str) > 0}">
						> ${result.event_cate_biz2_str}
					</c:if>
					<c:if test="${fn:length(result.event_cate_biz3_str) > 0}">
						> ${result.event_cate_biz3_str}
					</c:if>
				</td>
				<td>${d:decrypt(result.manager_nm) }</td>
				<!--td>${d:decrypt(result.user_nm) }</td -->
			</tr>
			 </c:forEach>
			 </tbody>
			
		</table>
		<!-- 웹, 탭에서만 보임 -->
		</form>






		<!--모바일 에서만 보임 -->
		<c:forEach var="result" items="${resultList}" varStatus="status">
			
			<div class="mobile_list">
			<!-- 	<dl>
					<dt>순번</dt>
					<dd>${result.idx }</dd>
				</dl> -->
				<dl>
					<dt>기관단체명</dt>
					<dd><a href="/crm/organizer/info.do?idx=${result.idx}">${result.name_ko }</a></dd>
				</dl>
				<dl>
					<dt>구분</dt>
					<dd>${result.type_name}</dd>
				</dl>
				<dl>
					<dt>업체담당자</dt>
					<dd>${d:decrypt(result.biz_man) }</dd>
				</dl>
				<dl>
					<dt>담당자연락처</dt>
					<dd>${d:decrypt(result.biz_man_phone) }</dd>
				</dl>
				<dl>
					<dt>담당자E-mail</dt>
					<dd>${d:decrypt(result.biz_man_email) }</dd>
				</dl>
				
				<dl>
					<dt>참가기관 중요도</dt>
					<dd>${result.org_import}</dd>
				</dl>
				<dl>
					<dt>참가의향 등급</dt>
					<dd>${result.org_grade}</dd>
				</dl>
				<dl>
					<dt>진행단계</dt>
					<dd>${result.org_step}</dd>
				</dl>				
				
				<!-- dl>
					<dt>대표전화</dt>
					<dd>${d:decrypt(result.tel_no) }</dd>
				</dl -->
				<dl>
					<dt>참가업체분류</dt>
					<dd>
						${result.event_cate_biz1_str} 
						<c:if test="${fn:length(result.event_cate_biz2_str) > 0}">
							> ${result.event_cate_biz2_str}
						</c:if>
						<c:if test="${fn:length(result.event_cate_biz3_str) > 0}">
							> ${result.event_cate_biz3_str}
						</c:if>
					</dd>
				</dl>
				<dl>
					<dt>담당자</dt>
					<dd>${d:decrypt(result.manager_nm) }</dd>
				</dl>
				<!-- dl>
					<dt>작성자</dt>
					<dd>${d:decrypt(result.user_nm) }</dd>
				</dl -->
			
			</div>

		 </c:forEach>
		<!-- 모바일에서만 보임 -->



			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fnLinkPage" />
			    </div>
			</div>
			
			
			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
