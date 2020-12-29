<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>

<c:set var="sPath" value="${pageContext.request.requestURI}" />
<script>
function remove_partners_attach_file(element, file_id, crm_event_idx, write_condition_tf){
	if (confirm("삭제 하시겠습니까?") == true){
		$.ajax({
	        url:'/crm/order/deletePartnersFile.do',
	        type:'get',
	        dataType: 'json',
	        data:{file_id:file_id, crm_event_idx:crm_event_idx, crm_event_idx:crm_event_idx, write_condition_tf:write_condition_tf},
	        success:function(data){
	        	if(data != null){
	        		alert("삭제 완료");
		        	element.parentNode.remove();
	        	}        	
	        }
	    });
	}else{
	    return;
	}
}

</script>

<style>
 	h5{margin: 15px 10px 10px 10px;}
 	table{width: 100%;} 
	.common_margin_top{margin-top: 20px;}
 	.clr_Dgray , .clr_Wgray{padding: 5px; } 
 	p{margin: 5px 0px; color: blue;}
	.btn_remove{margin: 0 10px; color: #FF0000; font-size: 10px;}
	/* textarea.autosize { min-height: 50px; } */
	.bn_ul1 li{ float:left;   }
	.bn_ul2 li{ float:left;   }
	.bn_ul3 li{ float:left; width:150px;  }
</style>

<script type="text/javascript">
    $(document).ready(function(){
        $('.datepicker2').each(function () {
            $(this).datepicker({
              //showOn: "button",
              //buttonImage: "images/btn_cal.png",
              buttonImageOnly: true,
              //buttonText: "날짜 선택",
              buttonClass: "find_date",
              dateFormat: "yy.mm.dd",
              dayNames: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
              dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
              dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
              monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
              monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
              prevText: "이전달",
              nextText: "다음달",
              showOtherMonths: true,
              showMonthAfterYear: true,
		      changeMonth : true,
		      changeYear : true,
              beforeShowDay: function (day, year) {
                var result;
                switch (day.getDay()) {
                  case 0: // 일요일?
                    result = [true, "ui-date-sunday"];
                    break;
                  case 6: // 토요일?
                    result = [true, "ui-date-saturday"];
                    break;
                  default:
                    result = [true, ""];
                    break;
                }
                return result;
              }
            });
            $('.ui-datepicker-calendar > thead td.ui-datepicker-week-end:last-child a').addClass('ui-date-saturday');
          });    	
    });
</script>
<script>
$(document).ready(function(){
	//$("textarea.autosize").on('keydown keyup', function () {
	//	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	//});
	$("textarea.autosize").height(1).height( $("textarea.autosize").prop('scrollHeight')+12 );
	
	$(document).on("keydown keyup",'textarea.autosize',function(){
		 $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});	
})
</script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>



<section id="contentArea">


	<h3>대관관리<span>></span>이벤트오더관리<span>></span>상세</h3>
	<section class="sect_nonetit">


<!-- 웹패드만 보임 -->
<form name="form" id="form" action="/crm/order/insert.do" method="post" enctype="multipart/form-data">
<div class="mobile_none" >

		<input type="hidden" name="crm_event_idx" value="${param.crm_event_idx }" />
		<input type="hidden" name="idx" value="${getOrder.idx }" />
		<input type="hidden" name="name_ko" value="${getOrder.name_ko }" />
		<input type="hidden" name="rent_st_date" value="${getOrder.rent_st_date }" />
		<input type="hidden" name="rent_ed_date" value="${getOrder.rent_ed_date }" />
		<input type="hidden" name="event_st_date" value="${getOrder.event_st_date }" />
		<input type="hidden" name="event_ed_date" value="${getOrder.event_ed_date }" />
		
		<input type="hidden" name="organizers_1" value="${getOrder.organizers_1}" />
		<input type="hidden" name="organizers_2" value="${getOrder.organizers_2}" />
		<input type="hidden" name="event_staff_id" value="${getOrder.event_staff_id}" />
		

		<h5 class="s_tit">행사정보</h5>
		<table width="100%" class="adm_tbl2 table_left" >
			<colgroup>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th>행사명</th>
				<td>${getOrder.name_ko}</td>
			</tr>
			<tr>
				<th>대관기간</th>
				<td>
					${getOrder.rent_st_date} ~ ${getOrder.rent_ed_date }
				</td>
			</tr>
			<tr>
				<th>주최기관</th>
				<td>
					${getOrder.organizers_1_name}
				</td>
			</tr>
			<tr>
				<th>행사기간</th>
				<td>
					${getOrder.event_st_date} ~ ${getOrder.event_ed_date }
				</td>
			</tr>	
			<tr>
				<th>이벤트오더 번호</th>
				<td>
					<input type="text" name="order_no" maxlength="50" value="${getOrder.order_no}" maxlength="50" />
				</td>
			</tr>
			<tr>
				<th>행사인원</th>
				<td>
					<input type="text" name="join_personal_cnt" maxlength="50" value="${getOrder.join_personal_cnt}" maxlength="50" />
				</td>
			</tr>										
		</table>
		



		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="a" <c:if test="${fn:contains(getOrder.view_chk,'a')}"> checked="checked" </c:if>/> 
		행사장 정보 ( 전체 참가자 수 : ${getOrder.join_personal_cnt} 명 )</h5>
		<table class="adm_tbl2 table_info" name="table_info" id="table_info">
		<colgroup>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col />
			<col width="8%"/>
			<col width="15%"/>
			<col width="8%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">행사기간</th>
				<th scope="col">장소</th>
				<th scope="col">시간</th>
				<th scope="col">세팅종류</th>
				<th scope="col">인원(수용)</th>
				<th scope="col">비고</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${getFacList}" var="fac" varStatus="status">
			<input type="hidden" name="cate_index" value="${status.count }" />
				<tr>
					<td>
						<c:choose>
							<c:when test="${empty fac.p_rent_st_date}">
							<input type="text" name="p_rent_st_dateArr" size="10"  class="datepicker2" value="${getOrder.rent_st_date}"/> ~ <input type="text" name="p_rent_ed_dateArr" size="10"  class="datepicker2" value="${getOrder.rent_ed_date}"/>
							</c:when>
							<c:otherwise>
							<input type="text" name="p_rent_st_dateArr" size="10"  class="datepicker2" value="${fac.p_rent_st_date}"/> ~ <input type="text" name="p_rent_ed_dateArr" size="10"  class="datepicker2" value="${fac.p_rent_ed_date}"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<textarea name="placeArr" class="autosize">${fac.place}</textarea>
					</td>
					<td>
						<textarea name="rent_timeArr" class="autosize">${fac.rent_time}</textarea>
					</td>
					<td>
						<textarea name="rent_settingArr" class="autosize">${fac.rent_setting}</textarea>
					</td>
					<td>
						<textarea name="personal_cntArr" class="autosize">${fac.personal_cnt}</textarea>
					</td>
					<td>
						<textarea name="etc_textArr" class="autosize">${fac.etc_text}</textarea>
					</td>
					<td>
						<input type="button" name="delRow" value="삭제" title="행삭제" value="" class="small_btn" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<p class="right pb20"><input type="button" value="+ 행사장 추가하기" class="btn2 clrGrad_Wgray" id="addRow" name="addRow"/></p>




		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="b" <c:if test="${fn:contains(getOrder.view_chk,'b')}"> checked="checked" </c:if>/> 
		행사장 참고 사항</h5>
		<textarea name="event_comment" class="autosize">${getOrder.event_comment }</textarea>
		
		<table class="indetail">
			<colgroup>
				<col width="27%" />
				<col />
			</colgroup>
			<tr>
			<th class="center">첨부파일(이미지만 등록가능)</th>
				<td>
					<ul id="hall_order_file" class="hall_order_file">
						<li><input name="hall_order_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('hall_order_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>
				</td>
			</tr>
		</table>
		<c:forEach items="${getHallFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a>
			<a href="javascript:void(0)" onclick="remove_partners_attach_file(this, '${file.atch_file_id }', '${param.crm_event_idx }', '${param.write_condition_tf }')" class="btn_remove">*삭제</a></p>
		</c:forEach>

		
		
				
		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="c" <c:if test="${fn:contains(getOrder.view_chk,'c')}"> checked="checked" </c:if>/> 
		현수막 / 배너 </h5>
		<table  class="indetail">
		<colgroup>
			<col width="27%;">
			<col>
		</colgroup>
			<tr>
				<th>외부 현수막</th>
				<td>
					<input type="checkbox" name="out_gate1_tf" value="1" <c:if test='${getOrder.out_gate1_tf.equals("1")}'>checked="checked"</c:if> /> Gate1
					<input type="checkbox" name="out_under_access_tf" value="1" <c:if test='${getOrder.out_under_access_tf.equals("1")}'>checked="checked"</c:if> />지하 진입로
					<input type="checkbox" name="out_gate2_tf" value="1" <c:if test='${getOrder.out_gate2_tf.equals("1")}'>checked="checked"</c:if> />Gate2
					<input type="checkbox" name="out_gate3_tf" value="1" <c:if test='${getOrder.out_gate3_tf.equals("1")}'>checked="checked"</c:if> />Gate3
					<input type="checkbox" name="out_gate4_tf" value="1" <c:if test='${getOrder.out_gate4_tf.equals("1")}'>checked="checked"</c:if> />Gate4
					<input type="checkbox" name="out_big_left_tf" value="1" <c:if test='${getOrder.out_big_left_tf.equals("1")}'>checked="checked"</c:if> />대형(좌)
					<input type="checkbox" name="out_big_right_tf" value="1" <c:if test='${getOrder.out_big_right_tf.equals("1")}'>checked="checked"</c:if> />대형(우)
					<input type="checkbox" name="out_center_crossing_tf" value="1" <c:if test='${getOrder.out_center_crossing_tf.equals("1")}'>checked="checked"</c:if> />센터사거리
					<input type="checkbox" name="out_light_banner_tf" value="1" <c:if test='${getOrder.out_light_banner_tf.equals("1")}'>checked="checked"</c:if> />가로등배너
					<input type="checkbox" name="out_none_tf" value="1" <c:if test='${getOrder.out_none_tf.equals("1")}'>checked="checked"</c:if> /> 없음
					<input type="checkbox" name="out_etc_tf" value="1" <c:if test='${getOrder.out_etc_tf.equals("1")}'>checked="checked"</c:if> /> 기타
					<input type="text" name="out_etc_text" value="${getOrder.out_etc_text }" />
				</td>
			</tr>
			<tr>
				<th>내부 현수막</th>
				<td>
					<input type="checkbox" name="in_ju_tf" value="1" <c:if test='${getOrder.in_ju_tf.equals("1")}'>checked="checked"</c:if> /> 주령구
					<input type="checkbox" name="in_center_road_tf" value="1" <c:if test='${getOrder.in_center_road_tf.equals("1")}'>checked="checked"</c:if> />중앙로비
					<input type="checkbox" name="in_3_1_tf" value="1" <c:if test='${getOrder.in_3_1_tf.equals("1")}'>checked="checked"</c:if> />3-1(유리벽면)
					<input type="checkbox" name="in_3_2_tf" value="1" <c:if test='${getOrder.in_3_2_tf.equals("1")}'>checked="checked"</c:if> />3-2(2층안내데스크)
					<input type="checkbox" name="in_3_3_tf" value="1" <c:if test='${getOrder.in_3_3_tf.equals("1")}'>checked="checked"</c:if> />3-3(300B)
					<input type="checkbox" name="in_3_4_tf" value="1" <c:if test='${getOrder.in_3_4_tf.equals("1")}'>checked="checked"</c:if> />3-4(300B)
					<input type="checkbox" name="in_3_5_tf" value="1" <c:if test='${getOrder.in_3_5_tf.equals("1")}'>checked="checked"</c:if> />3-5(300C)
					<input type="checkbox" name="in_etc_tf" value="1" <c:if test='${getOrder.in_etc_tf.equals("1")}'>checked="checked"</c:if> />기타
					<input type="text" name="in_etc_text" value="${getOrder.in_etc_text }" />
				</td>
			</tr>
			<tr>
				<th>전자 현수막</th>
				<td>
					<input type="checkbox" name="kaosk_tf" value="1" <c:if test='${getOrder.kaosk_tf.equals("1")}'>checked="checked"</c:if> />카오스크
					<input type="checkbox" name="el_fir_multi_tf" value="1" <c:if test='${getOrder.el_fir_multi_tf.equals("1")}'>checked="checked"</c:if> />1층 멀티비전
					<input type="checkbox" name="el_fir_guid_tf" value="1" <c:if test='${getOrder.el_fir_guid_tf.equals("1")}'>checked="checked"</c:if> />1층 안내데스크 상단
					<input type="checkbox" name="el_fir_office_tf" value="1" <c:if test='${getOrder.el_fir_office_tf.equals("1")}'>checked="checked"</c:if> />1층 회의실 입구
					<input type="checkbox" name="el_hall_1_a_tf" value="1" <c:if test='${getOrder.el_hall_1_a_tf.equals("1")}'>checked="checked"</c:if> />전시장 Hall 1-a
					<input type="checkbox" name="el_hall_1_b_tf" value="1" <c:if test='${getOrder.el_hall_1_b_tf.equals("1")}'>checked="checked"</c:if> />전시장 Hall 1-b(비지니스 센터)<br/>
					<input type="checkbox" name="el_hall_2_tf" value="1" <c:if test='${getOrder.el_hall_2_tf.equals("1")}'>checked="checked"</c:if> />전시장 Hall 2
					<input type="checkbox" name="el_sec_office_tf" value="1" <c:if test='${getOrder.el_sec_office_tf.equals("1")}'>checked="checked"</c:if> />2층 회의실 입구
					<input type="checkbox" name="el_300a_tf" value="1" <c:if test='${getOrder.el_300a_tf.equals("1")}'>checked="checked"</c:if> />300A
					<input type="checkbox" name="el_300b_tf" value="1" <c:if test='${getOrder.el_300b_tf.equals("1")}'>checked="checked"</c:if> />300B
					<input type="checkbox" name="el_300c_tf" value="1" <c:if test='${getOrder.el_300c_tf.equals("1")}'>checked="checked"</c:if> />300C
					<input type="checkbox" name="el_thi_multi_tf" value="1" <c:if test='${getOrder.el_thi_multi_tf.equals("1")}'>checked="checked"</c:if> />3층 멀티비전
					<input type="checkbox" name="el_etc_tf" value="1" <c:if test='${getOrder.el_etc_tf.equals("1")}'>checked="checked"</c:if> />기타
					<input type="text" name="el_etc_text" value="${getOrder.el_etc_text}" />
				</td>
			</tr>
			<tr>
				<th>행사장 현수막</th>
				<td>
					<input type="text" name="ev_etc_text" value="${getOrder.ev_etc_text}" />
				</td>
			</tr>
		</table>
		




		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="d" <c:if test="${fn:contains(getOrder.view_chk,'d')}"> checked="checked" </c:if>/> 
		케이터링</h5>
		<table  class="indetail">
			<colgroup>
				<col width="27%"/>
				<col >
			</colgroup>
			<tr>
				<th>업체</th>
				<td><input type="checkbox" name="ca_hyun_tf" value="1" <c:if test='${getOrder.ca_hyun_tf.equals("1")}'>checked="checked"</c:if> />현대 호텔
				<input type="checkbox" name="ca_ro_tf" value="1" <c:if test='${getOrder.ca_ro_tf.equals("1")}'>checked="checked"</c:if> />4층 식당
				<input type="checkbox" name="ca_gle_tf" value="1" <c:if test='${getOrder.ca_gle_tf.equals("1")}'>checked="checked"</c:if> />카페
				<input type="checkbox" name="ca_etc_tf" value="1" <c:if test='${getOrder.ca_etc_tf.equals("1")}'>checked="checked"</c:if> />기타
				<input type="text" name="ca_etc_text" size="10" value="${getOrder.ca_etc_text }"/></td>
			</tr>
			<tr>
				<th>연회 행사 신청서</th>
				<td>
					<ul id="cate_order_file" class="cate_order_file">
						<li><input name="cate_order_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('cate_order_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>						
				</td>
			</tr>
		</table>
		<c:forEach items="${getCateFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a>
			<a href="javascript:void(0)" onclick="remove_partners_attach_file(this, '${file.atch_file_id }', '${param.crm_event_idx }', '${param.write_condition_tf }')" class="btn_remove">*삭제</a></p>
		</c:forEach>





		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="e" <c:if test="${fn:contains(getOrder.view_chk,'e')}"> checked="checked" </c:if>/> 
		AV 및 장비임대</h5>
		<table  class="indetail">
			<colgroup>
				<col width="15%"/>
				<col />
			</colgroup>
			<tr>
				<th class="center">확인사항</th>
				<td><textarea rows="5" cols="150" name="equipment_rent_comment"  class="autosize" style="width:100%;">${getOrder.equipment_rent_comment }</textarea></td>
			</tr>
		</table>

		


		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="f" <c:if test="${fn:contains(getOrder.view_chk,'f')}"> checked="checked" </c:if>/> 
		업무별 담당자 연락처</h5>
		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">유치담당자</th>
				<th scope="col">소속</th>
				<td>HICO</td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="user_nm" value="${getOrder.user_nm }" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="user_staff" value="${getOrder.user_staff }" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="user_tel" value="${getOrder.user_tel }" /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">행사담당자</th>
				<th scope="col">소속</th>
				<td>HICO</td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_4_name"  <c:if test='${empty getOrder.manager_4_name}'>value="박서준"</c:if> <c:if test='${not empty getOrder.manager_4_name}'>value="${getOrder.manager_4_name}"</c:if> /> </td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_4_staff"  <c:if test='${empty getOrder.manager_4_staff}'>value="과장"</c:if><c:if test='${not empty getOrder.manager_4_staff}'> value="${getOrder.manager_4_staff }"</c:if> /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_4_tel"   <c:if test='${empty getOrder.manager_4_tel}'>value="010-2864-2828"</c:if> <c:if test='${not empty getOrder.manager_4_tel}'> value="${getOrder.manager_4_tel }"</c:if> /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">AV장비</th>
				<th scope="col">소속</th>
				<td><input type="text" name="organizers_3_name"  value="${getOrder.organizers_3_name}" /></td>
			</tr>

			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_3_name"  value="${getOrder.manager_3_name}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_3_staff" value="${getOrder.manager_3_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_3_tel"    value="${getOrder.manager_3_tel}" /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4" >주관사</th>
				<th scope="col">소속</th>
				<td><input type="text" name="organizers_2_name" value="${getOrder.organizers_2_name}" /></td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_2_name" value="${getOrder.manager_2_name}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_2_staff" value="${getOrder.manager_2_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_2_tel" value="${getOrder.manager_2_tel }" /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th scope="col" rowspan="4">주최자/대행사</th>
				<th scope="col">소속</th>
				<td><input type="text" name="organizers_1_name" value="${getOrder.organizers_1_name}" /></td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_1_name" value="${getOrder.manager_1_name}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_1_staff" value="${getOrder.manager_1_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_1_tel" value="${getOrder.manager_1_tel}" /></td>
			</tr>
			</tbody>
		</table>




		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="g" <c:if test="${fn:contains(getOrder.view_chk,'g')}"> checked="checked" </c:if>/> 
		특기사항</h5>
		<textarea rows="10" cols="120" name="etc_comment"  class="autosize" style="width:100%;"><c:if test="${not empty param.write_condition_tf}">${getOrder.etc_comment}</c:if></textarea>
		

		

		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="h" <c:if test="${fn:contains(getOrder.view_chk,'h')}"> checked="checked" </c:if>/> 
		첨부파일</h5>
		<table class="indetail">
			<colgroup>
				<col width="27%" />
				<col />
			</colgroup>
			<tr>
			<th class="center">첨부파일</th>
				<td>
					<ul id="etc_order_file" class="etc_order_file">
						<li><input name="etc_order_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('etc_order_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>
				</td>
			</tr>
		</table>
		<c:forEach items="${getEtcFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>
			파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a>
				<a href="javascript:void(0)" onclick="remove_partners_attach_file(this, '${file.atch_file_id }', '${param.crm_event_idx }', '${param.write_condition_tf }')" class="btn_remove">*삭제</a></p>
		</c:forEach>



		
		<h5 class="s_tit">작성현황</h5>
		<table class="indetail">
			<tr>
				<td class="pt20 pb20">
					<input type="radio" name="write_condition_tf" value="1" <c:if test='${getOrder.write_condition_tf.equals("1")}'>checked="checked"</c:if> checked="checked" /> 작성중
					<input type="radio" name="write_condition_tf" value="2" <c:if test='${getOrder.write_condition_tf.equals("2")}'>checked="checked"</c:if> /> 확정
					<input type="radio" name="write_condition_tf" value="3" <c:if test='${getOrder.write_condition_tf.equals("3")}'>checked="checked"</c:if> />	취소			
				</td>
			</tr>
		</table>




		<div id="btn_layout" class="btn_area">
			<input type="button"  value="페이지 인쇄" onclick="window.print()" class="btn1 clrGrad_Wgray" />
			<input type="button"   value="Report 인쇄" onclick="fn_report_print()" class="btn1 clrGrad_Wgray" />
			<!--<input type="button" class="btn2 clrGrad_Wgray" value="작성중 저장" onclick="fn_save()"/>	-->
			<button id="btnSave" class="btn1 clrGrad_Wgray">저장</button>										
			<a href="<c:url value='/crm/order/list.do'/>" class="btn1 clrGrad_Wgray">목록</a>
		</div>


		<div id="hidden_layout" class="hidden_layout" style="display:none;"></div>



</div>
</form>
<!-- //웹패드만 보임 -->








<!-- 모바일만 보임 -->

<form name="form_mobile" id="form_mobile" action="/crm/order/insert.do" method="post" enctype="multipart/form-data">
<div class="mobile_show">

		<input type="hidden" name="crm_event_idx" value="${param.crm_event_idx }" />
		<input type="hidden" name="idx" value="${getOrder.idx }" />
		<input type="hidden" name="name_ko" value="${getOrder.name_ko }" />
		<input type="hidden" name="rent_st_date" value="${getOrder.rent_st_date }" />
		<input type="hidden" name="rent_ed_date" value="${getOrder.rent_ed_date }" />
		<input type="hidden" name="event_st_date" value="${getOrder.event_st_date }" />
		<input type="hidden" name="event_ed_date" value="${getOrder.event_ed_date }" />
		
		<input type="hidden" name="organizers_1" value="${getOrder.organizers_1}" />
		<input type="hidden" name="organizers_2" value="${getOrder.organizers_2}" />
		
		<input type="hidden" name="event_staff_id" value="${getOrder.event_staff_id}" />
		
		
		
		<h5 class="s_tit">행사정보</h5>
		<table width="100%" class="adm_tbl2 table_left" >
			<colgroup>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th>행사명</th>
				<td>${getOrder.name_ko}</td>
			</tr>
			<tr>
				<th>대관기간</th>
				<td>
					${getOrder.rent_st_date} ~ ${getOrder.rent_ed_date }
				</td>
			</tr>
			<tr>
				<th>주체기관</th>
				<td>
					${getOrder.organizers_1_name}
				</td>
			</tr>
			<tr>
				<th>행사기간</th>
				<td>
					${getOrder.event_st_date} ~ ${getOrder.event_ed_date }
				</td>
			</tr>			
		</table>
		
		
		
		
		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="a" <c:if test="${fn:contains(getOrder.view_chk,'a') }"> checked="checked" </c:if>/> 
		행사장 정보 ( 전체 참가자 수 : ${getOrder.join_personal_cnt} 명 )</h5>
		<div class="table_info_wrap">
		
		<c:forEach items="${getFacList }" var="fac" varStatus="status">
		<input type="hidden" name="cate_index" value="${status.count }" />
		
			<div class="mobile_list table_info"  name="table_info">
				<dl>
					<dt>행사기간</dt>
					<dd>
						<c:choose>
							<c:when test="${empty fac.p_rent_st_date}">
							<input type="text" name="p_rent_st_dateArr" class="wd45per datepicker" value="${getOrder.rent_st_date}"/> ~ <input type="text" name="p_rent_ed_dateArr" class="wd45per datepicker" value="${getOrder.rent_ed_date}"/>
							</c:when>
							<c:otherwise>
							<input type="text" name="p_rent_st_dateArr" class="wd45per datepicker" value="${fac.p_rent_st_date}"/> ~ <input type="text" name="p_rent_ed_dateArr" class="wd45per datepicker" value="${fac.p_rent_ed_date}"/>
							</c:otherwise>
						</c:choose>
					</dd>
				</dl>		
				<dl>
					<dt>장소</dt>
					<dd>
						<textarea name="placeArr" class="autosize">${fac.placeArr}</textarea>
					</dd>
				</dl>
				<dl>
					<dt>시간</dt>
					<dd>
						<textarea name="rent_timeArr" class="autosize">${fac.rent_time}</textarea>
					</dd>
				</dl>	
				<dl>
					<dt>세팅종류</dt>
					<dd>
						<textarea name="rent_settingArr" class="autosize">${fac.rent_setting}</textarea>
					</dd>
				</dl>
				<dl>
					<dt>인원(수용)</dt>
					<dd>
						<textarea name="personal_cntArr" class="autosize">${fac.personal_cnt}</textarea>
					</dd>
				</dl>
				<dl>
					<dt>비고</dt>
					<dd>
						<textarea name="etc_textArr" class="autosize">${fac.etc_text}</textarea>
					</dd>
				</dl>
				<p><input type="button" name="delRow" value="삭제" title="행삭제" value="" class="small_btn wd100per size13 mt10" /></p>
			</div>
			
		</c:forEach>
		
		</div>
		<p class="right pb20"><input type="button" value="+ 행사장 추가하기" class="btn2 clrGrad_Wgray" id="addRow" name="addRow"/></p>




		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="b" <c:if test="${fn:contains(getOrder.view_chk,'b')}"> checked="checked" </c:if>/> 
		행사장 참고 사항</h5>
		<table class="indetail">
			<colgroup>
				<col width="27%" />
				<col />
			</colgroup>
			<tr>
			<th class="center">첨부파일</th>
				<td>
					<ul id="hall_order_file" class="hall_order_file">
						<li><input name="hall_order_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('hall_order_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>
				</td>
			</tr>
		</table>		
		<textarea name="event_comment" class="autosize">${getOrder.event_comment }</textarea>
		
		

		
		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="c" <c:if test="${fn:contains(getOrder.view_chk,'c')}"> checked="checked" </c:if>/> 
		현수막 / 배너 </h5>
		<table  class="indetail">
		<colgroup>
			<col width=" 27%;">
			<col>
		</colgroup>
			<tr>
				<th>외부 현수막</th>
				<td>
					<input type="checkbox" name="out_gate1_tf" value="1" <c:if test='${getOrder.out_gate1_tf.equals("1")}'>checked="checked"</c:if> /> Gate1
					<input type="checkbox" name="out_under_access_tf" value="1" <c:if test='${getOrder.out_under_access_tf.equals("1")}'>checked="checked"</c:if> />지하 진입로
					<input type="checkbox" name="out_gate2_tf" value="1" <c:if test='${getOrder.out_gate2_tf.equals("1")}'>checked="checked"</c:if> />Gate2
					<input type="checkbox" name="out_gate3_tf" value="1" <c:if test='${getOrder.out_gate3_tf.equals("1")}'>checked="checked"</c:if> />Gate3
					<input type="checkbox" name="out_gate4_tf" value="1" <c:if test='${getOrder.out_gate4_tf.equals("1")}'>checked="checked"</c:if> />Gate4
					<input type="checkbox" name="out_big_left_tf" value="1" <c:if test='${getOrder.out_big_left_tf.equals("1")}'>checked="checked"</c:if> />대형(좌)
					<input type="checkbox" name="out_big_right_tf" value="1" <c:if test='${getOrder.out_big_right_tf.equals("1")}'>checked="checked"</c:if> />대형(우)
					<input type="checkbox" name="out_center_crossing_tf" value="1" <c:if test='${getOrder.out_center_crossing_tf.equals("1")}'>checked="checked"</c:if> />센터사거리
					<input type="checkbox" name="out_light_banner_tf" value="1" <c:if test='${getOrder.out_light_banner_tf.equals("1")}'>checked="checked"</c:if> />가로등배너
					<input type="checkbox" name="out_none_tf" value="1" <c:if test='${getOrder.out_none_tf.equals("1")}'>checked="checked"</c:if> /> 없음
					<input type="checkbox" name="out_etc_tf" value="1" <c:if test='${getOrder.out_etc_tf.equals("1")}'>checked="checked"</c:if> /> 기타
					<input type="text" name="out_etc_text" value="${getOrder.out_etc_text }" />
				</td>
			</tr>
			<tr>
				<th>내부 현수막</th>
				<td>
					<input type="checkbox" name="in_ju_tf" value="1" <c:if test='${getOrder.in_ju_tf.equals("1")}'>checked="checked"</c:if> /> 주령구
					<input type="checkbox" name="in_center_road_tf" value="1" <c:if test='${getOrder.in_center_road_tf.equals("1")}'>checked="checked"</c:if> />중앙로비
					<input type="checkbox" name="in_3_1_tf" value="1" <c:if test='${getOrder.in_3_1_tf.equals("1")}'>checked="checked"</c:if> />3-1(유리벽면)
					<input type="checkbox" name="in_3_2_tf" value="1" <c:if test='${getOrder.in_3_2_tf.equals("1")}'>checked="checked"</c:if> />3-2(2층안내데스크)
					<input type="checkbox" name="in_3_3_tf" value="1" <c:if test='${getOrder.in_3_3_tf.equals("1")}'>checked="checked"</c:if> />3-3(300B)
					<input type="checkbox" name="in_3_4_tf" value="1" <c:if test='${getOrder.in_3_4_tf.equals("1")}'>checked="checked"</c:if> />3-4(300B)
					<input type="checkbox" name="in_3_5_tf" value="1" <c:if test='${getOrder.in_3_5_tf.equals("1")}'>checked="checked"</c:if> />3-5(300C)
					<input type="checkbox" name="in_etc_tf" value="1" <c:if test='${getOrder.in_etc_tf.equals("1")}'>checked="checked"</c:if> />기타
					<input type="text" name="in_etc_text" value="${getOrder.in_etc_text }" />
				</td>
			</tr>
			<tr>
				<th>전자 현수막</th>
				<td>
					<input type="checkbox" name="kaosk_tf" value="1" <c:if test='${getOrder.kaosk_tf.equals("1")}'>checked="checked"</c:if> />카오스크
					<input type="checkbox" name="el_fir_multi_tf" value="1" <c:if test='${getOrder.el_fir_multi_tf.equals("1")}'>checked="checked"</c:if> />1층 멀티비전
					<input type="checkbox" name="el_fir_guid_tf" value="1" <c:if test='${getOrder.el_fir_guid_tf.equals("1")}'>checked="checked"</c:if> />1층 안내데스크 상단
					<input type="checkbox" name="el_fir_office_tf" value="1" <c:if test='${getOrder.el_fir_office_tf.equals("1")}'>checked="checked"</c:if> />1층 회의실 입구
					<input type="checkbox" name="el_hall_1_a_tf" value="1" <c:if test='${getOrder.el_hall_1_a_tf.equals("1")}'>checked="checked"</c:if> />전시장 Hall 1-a
					<input type="checkbox" name="el_hall_1_b_tf" value="1" <c:if test='${getOrder.el_hall_1_b_tf.equals("1")}'>checked="checked"</c:if> />전시장 Hall 1-b(비지니스 센터)
					<input type="checkbox" name="el_hall_2_tf" value="1" <c:if test='${getOrder.el_hall_2_tf.equals("1")}'>checked="checked"</c:if> />전시장 Hall 2
					<input type="checkbox" name="el_sec_office_tf" value="1" <c:if test='${getOrder.el_sec_office_tf.equals("1")}'>checked="checked"</c:if> />2층 회의실 입구
					<input type="checkbox" name="el_300a_tf" value="1" <c:if test='${getOrder.el_300a_tf.equals("1")}'>checked="checked"</c:if> />300A
					<input type="checkbox" name="el_300b_tf" value="1" <c:if test='${getOrder.el_300b_tf.equals("1")}'>checked="checked"</c:if> />300B
					<input type="checkbox" name="el_300c_tf" value="1" <c:if test='${getOrder.el_300c_tf.equals("1")}'>checked="checked"</c:if> />300C
					<input type="checkbox" name="el_thi_multi_tf" value="1" <c:if test='${getOrder.el_thi_multi_tf.equals("1")}'>checked="checked"</c:if> />3층 멀티비전
					<input type="checkbox" name="el_etc_tf" value="1" <c:if test='${getOrder.el_etc_tf.equals("1")}'>checked="checked"</c:if> />기타
					<input type="text" name="el_etc_text" value="${getOrder.el_etc_text}" />
				</td>
			</tr>
			<tr>
				<th>행사장 현수막</th>
				<td>
					<input type="text" name="ev_etc_text" value="${getOrder.ev_etc_text}" />
				</td>
			</tr>
		</table>
		



		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="d" <c:if test="${fn:contains(getOrder.view_chk,'d')}"> checked="checked" </c:if>/> 
		케이터링</h5>
		<table  class="indetail">
			<colgroup>
				<col width="27%"/>
				<col >
			</colgroup>
			<tr>
				<th>업체</th>
				<td><input type="checkbox" name="ca_hyun_tf" value="1" <c:if test='${getOrder.ca_hyun_tf.equals("1")}'>checked="checked"</c:if> />현대 호텔
				<input type="checkbox" name="ca_ro_tf" value="1" <c:if test='${getOrder.ca_ro_tf.equals("1")}'>checked="checked"</c:if> />4층식당
				<input type="checkbox" name="ca_gle_tf" value="1" <c:if test='${getOrder.ca_gle_tf.equals("1")}'>checked="checked"</c:if> />카페
				<input type="checkbox" name="ca_etc_tf" value="1" <c:if test='${getOrder.ca_etc_tf.equals("1")}'>checked="checked"</c:if> />기타
				<input type="text" name="ca_etc_text" size="10" value="${getOrder.ca_etc_text }"/></td>
			</tr>
			<tr>
				<th>연회 행사 신청서</th>
				<td>
					<ul id="cate_order_file" class="cate_order_file">
						<li><input name="cate_order_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('cate_order_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>						
				</td>
			</tr>
		</table>
		<c:forEach items="${getEventFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a>
			<a href="javascript:void(0)" onclick="remove_partners_attach_file(this, '${file.atch_file_id }', '${param.crm_event_idx }', '${param.write_condition_tf }')" class="btn_remove">*삭제</a></p>
		</c:forEach>




		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="e" <c:if test="${fn:contains(getOrder.view_chk,'e')}"> checked="checked" </c:if>/> 
		AV 및 장비임대</h5>
		<table  class="indetail">
			<colgroup>
				<col width="15%"/>
				<col />
			</colgroup>
			<tr>
				<th class="center">확인사항</th>
				<td><textarea rows="5" cols="150" name="equipment_rent_comment"  class="autosize" style="width:100%;">${getOrder.equipment_rent_comment }</textarea></td>
			</tr>
		</table>




		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="f" <c:if test="${fn:contains(getOrder.view_chk,'f')}"> checked="checked" </c:if>/> 
		업무별 담당자 연락처</h5>
		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">유치담당자</th>
				<th scope="col">소속</th>
				<td>HICO</td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="user_nm" value="${getOrder.user_nm}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="user_staff" value="${getOrder.user_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="user_tel" value="${getOrder.user_tel}" /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">행사담당자</th>
				<th scope="col">소속</th>
				<td>HICO</td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_4_name"  <c:if test='${empty getOrder.manager_4_name}'>value="박서준"</c:if> <c:if test='${not empty getOrder.manager_4_name}'>value="${getOrder.manager_4_name}"</c:if> /> </td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_4_staff"   <c:if test='${empty getOrder.manager_4_staff}'>value="과장"</c:if><c:if test='${not empty getOrder.manager_4_staff}'> value="${getOrder.manager_4_staff }"</c:if> /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_4_tel"   <c:if test='${empty getOrder.manager_4_tel}'>value="010-2864-2828"</c:if> <c:if test='${not empty getOrder.manager_4_tel}'> value="${getOrder.manager_4_tel }"</c:if> /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">AV장비</th>
				<th scope="col">소속</th>
				<td><input type="text" name="organizers_3_name" value="${getOrder.organizers_3_name}" /></td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_3_name"  value="${getOrder.manager_3_name}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_3_staff" value="${getOrder.manager_3_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_3_tel" value="${getOrder.manager_3_tel}" /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tr>
				<th scope="col" rowspan="4">주관사</th>
				<th scope="col">소속</th>
				<td><input type="text" name="organizers_2_name"  value="${getOrder.organizers_2_name}" /></td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_2_name"  value="${getOrder.manager_2_name}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_2_staff"  value="${getOrder.manager_2_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_5_tel" <c:if test='${empty getOrder.manager_5_tel}'>value="010-2864-2828"</c:if> value="${getOrder.manager_5_tel }" /></td>
			</tr>
		</table>

		<table width="100%"  class="adm_tbl2 table_left">
			<colgroup>
				<col width="27%"/>
				<col width="27%"/>
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th scope="col" rowspan="4">주최자/대행사</th>
				<th scope="col">소속</th>
				<td><input type="text" name="organizers_1_name" style="text-align:left;" value="${getOrder.organizers_1_name}" /></td>
			</tr>
			<tr>
				<th scope="col">이름</th>
				<td><input type="text" name="manager_1_name" style="text-align:left;" value="${getOrder.manager_1_name}" /></td>
			</tr>
			<tr>
				<th scope="col">직함</th>
				<td><input type="text" name="manager_1_staff" style="text-align:left;" value="${getOrder.manager_1_staff}" /></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td><input type="text" name="manager_1_tel" style="text-align:left;" value="${getOrder.manager_1_tel}" /></td>
			</tr>
			</tbody>
		</table>





		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="g" <c:if test="${fn:contains(getOrder.view_chk,'g')}"> checked="checked" </c:if>/> 
		특기사항</h5>
		<textarea rows="10" cols="120" name="etc_comment" class="autosize" style="width:100%;"><c:if test="${not empty param.write_condition_tf}">${getOrder.etc_comment}</c:if></textarea>
		


		
		<h5 class="s_tit"><input type="checkbox" name="view_chk" value="h" <c:if test="${fn:contains(getOrder.view_chk,'h')}"> checked="checked" </c:if>/> 
		첨부파일</h5>
		<table class="indetail">
			<colgroup>
				<col width="27%" />
				<col />
			</colgroup>
			<tr>
			<th class="center">첨부파일</th>
				<td>
					<ul id="etc_order_file" class="etc_order_file">
						<li><input name="etc_order_file" type="file" /><button style="padding-left:5px" class="btn2 clrGrad_Wgray" onclick="javascript:append_file_tag('etc_order_file',$(this).parent().find('input').attr('data-idx'));return false;">추가</button></li>
					</ul>
				</td>
			</tr>
		</table>
		<c:forEach items="${getEtcFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>
			파일 ${status.count} : <a href="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=">${file.orignl_file_nm}</a>
				<a href="javascript:void(0)" onclick="remove_partners_attach_file(this, '${file.atch_file_id }', '${param.crm_event_idx }', '${param.write_condition_tf }')" class="btn_remove">*삭제</a></p>
		</c:forEach>



		
		<h5 class="s_tit">작성현황</h5>
		<table class="indetail">
			<tr>
				<td class="pt20 pb20">
					<input type="radio" name="write_condition_tf" value="1" <c:if test='${getOrder.write_condition_tf.equals("1")}'>checked="checked"</c:if> /> 작성중
					<input type="radio" name="write_condition_tf" value="2" <c:if test='${getOrder.write_condition_tf.equals("2")}'>checked="checked"</c:if> /> 확정
					<input type="radio" name="write_condition_tf" value="3" <c:if test='${getOrder.write_condition_tf.equals("3")}'>checked="checked"</c:if> />	취소			
				</td>
			</tr>
		</table>



		<div id="btn_layout" class="btn_area">
			<input type="button"  value="페이지 인쇄" onclick="window.print()" class="btn1 clrGrad_Wgray" />
			<input type="button"   value="Report 인쇄" onclick="fn_report_print_mobile()" class="btn1 clrGrad_Wgray" />
			<!--<input type="button" class="btn2 clrGrad_Wgray" value="작성중 저장" onclick="fn_save()"/>	-->
			<button id="btnSave" class="btn1 clrGrad_Wgray">저장</button>										
			<a href="<c:url value='/crm/order/list.do'/>" class="btn1 clrGrad_Wgray">목록</a>
		</div>




		<div id="hidden_layout" class="hidden_layout" style="display:none;"></div>




</div>
</form>
<!-- //모바일만 보임 -->




	</section>
</section>



<script type="text/javascript">
var value1 = new Array();
var value2 = new Array();
var value3 = new Array();
var value4 = new Array();

var idx1 = new Array();
var idx2 = new Array();
var idx3 = new Array();
var idx4 = new Array();

$(document).on("change", 'select[name="typeArr"]', (function(){
		var selector = $(this).val();
	   var innerHtml1 = '';
	   var innerHtml2 = '';
	   var innerHtml3 = '';
	   var innerHtml4 = '';
	   
	   for(var i=0; i<value1.length; i++){
		   innerHtml1 +=       '<option value="'+ idx1[i]+'">'+ value1[i] +'</option>';
	   }
	   for(var i=0; i<value2.length; i++)
	      innerHtml2 +=       '<option value="'+ idx2[i]+'">'+ value2[i] +'</option>';
	      
	   for(var i=0; i<value3.length; i++)
	      innerHtml3 +=       '<option value="'+ idx3[i]+'">'+ value3[i] +'</option>';
	      
	   for(var i=0; i<value4.length; i++)
	      innerHtml4 +=       '<option value="'+ idx4[i]+'">'+ value4[i] +'</option>';
	      
	   if(selector == '1층'){
	      var place = $(this).parent().next().children();
	      place.empty();
	      place.append(innerHtml1);
	   }else if(selector == '2층'){
	      var place = $(this).parent().next().children();
	      place.empty();
	      place.append(innerHtml2);      
	   }else if(selector == '3층'){
	      var place = $(this).parent().next().children();
	      place.empty();
	      place.append(innerHtml3);      
	   }else if(selector == '기타'){
	      var place = $(this).parent().next().children();
	      place.empty();
	      place.append(innerHtml4);
	   }
	})
);

// $(document).on('change', 'select[name="typeArr"]', (function(){
//    ));



////////////////////////////// web ////////////////////////////////////////////


function callRow(val){
	var row =  '<tr>';

	    row += '	<td>';
	    row += '		<input type="text" name="p_rent_st_dateArr" size="10"  class="datepicker" value="${getOrder.rent_st_date}"/> ~ <input type="text" name="p_rent_ed_dateArr" size="10"  class="datepicker" value="${getOrder.rent_ed_date}"/>';
	    row += '	</td>';
	    row += '	<td>';
	    row += '		<textarea name="placeArr" class="autosize"></textarea>';
	    row += '	</td>';
	    row += '	<td>';
	    row += '		<textarea name="rent_timeArr" class="autosize"></textarea>';
	    row += '	</td>';
	    row += '	<td>';
	    row += '		<textarea name="rent_settingArr" class="autosize"></textarea>';
	    row += '	</td>';
	    row += '	<td>';
	    row += '		<textarea name="personal_cntArr" class="autosize"></textarea>';
	    row += '	</td>';
	    row += '	<td>';
	    row += '		<textarea name="etc_textArr" class="autosize"></textarea>';
	    row += '	</td>';
	    row += '	<td>';
	    row += '	<input type="button" name="delRow" value="삭제" title="행삭제" value="" />';
	    row += '	</td>';
	    row += '</tr>';
	    return row;
}


$("#form input[name=addRow]").click(function() {
	
	var cate_index = $("#form .table_info tbody tr:last").find('[name=cate_index]').val();
	var index = parseInt(cate_index) + 1;

	if(cate_index ==null){
		index = 1;
	}
	 
	$("#form .table_info > tbody").append(callRow(index));
	
    $(document).find("input[name=p_rent_st_dateArr]").removeClass('hasDatepicker').datepicker({dateFormat: "yy-mm-dd"});
    $(document).find("input[name=p_rent_ed_dateArr]").removeClass('hasDatepicker').datepicker({dateFormat: "yy-mm-dd"});
    

});


$(document).on("click", "#form input[name=delRow]", function(){
//	alert($(this).parents("tr").find('[name=cate_index]').val());
//	alert($(this).parents("tr").find('[name=etc_text]').val());
	$(this).parents("tr").remove();
});

function fn_save(){
	$("form[name=form]").action = "/crm/order/save.do";
	$("form[name=form]").method = "post";
	$("form[name=form]").submit();
}

function fn_report_print(){
	var url    ="/crm/order/print.do";
	var title  = "이벤트 오더";
    var selectBox = $('#form select[name="valueArr"]');
    var count = $('#form select[name="valueArr"]').length;
    var textArr = new Array();
    
    count = selectBox.length;
    
    for(i=0; i<count; i++)
    	textArr[i] = selectBox.eq(i).find(":selected").text();
	
    for(i=0; i<count; i++)
		$('#form .hidden_layout').append('<input type="text" name="textArr" value="' + textArr[i] + '"/>');
    
    window.open("", title,status);
    form.target = title;
    form.action = url;
    form.method = "post";
    form.submit();
}


////////////////////////////// mobile ////////////////////////////////////////////

function callRow_mobile(val){
	var row =  '<div class="mobile_list table_info"  name="table_info">';
	    row += '<dl>     ';
		row += '	<dt>행사기간</dt>';
	    row += '	<dd>';
	    row += '		<input type="text" name="p_rent_st_dateArr" size="10"  class="datepicker" value="${getOrder.rent_st_date}"/> ~ <input type="text" name="p_rent_ed_dateArr" size="10"  class="datepicker" value="${getOrder.rent_ed_date}"/>';
	    row += '	</dd>';
	    row += '</dl>    ';
	    row += '<dl>     ';
		row += '	<dt>장소</dt>';
	    row += '	<dd>';
	    row += '		<textarea name="placeArr" class="autosize"></textarea>';
	    row += '	</dd>';
	    row += '</dl>    ';
	    row += '<dl>     ';
		row += '	<dt>시간</dt>';
	    row += '	<dd>';
	    row += '		<textarea name="rent_timeArr" class="autosize"></textarea>';
	    row += '	</dd>';
	    row += '</dl>    ';
	    row += '<dl>     ';
		row += '	<dt>세팅종류</dt>';
	    row += '	<dd>';
	    row += '		<textarea name="rent_settingArr" class="autosize"></textarea>';
	    row += '	</dd>';
	    row += '</dl>    ';
	    row += '<dl>     ';
		row += '	<dt>인원(수용)</dt>';
	    row += '	<dd>';
	    row += '		<textarea name="personal_cntArr" class="autosize"></textarea>';
	    row += '	</dd>';
	    row += '</dl>    ';
	    row += '<dl>     ';
		row += '	<dt>비고</dt>';
	    row += '	<dd>';
	    row += '		<textarea name="etc_textArr" class="autosize"></textarea>';
	    row += '	</dd>';
	    row += '</dl>    ';
	    row += '	<p>';
	    row += '	<input type="button" name="delRow" value="삭제" title="행삭제" value="" />';
	    row += '	</p>';
	    row += '</div>';
	    
	    return row;
}


$("#form_mobile input[name=addRow]").click(function() {
	
	var cate_index = $("#form_mobile .table_info tbody tr:last").find('[name=cate_index]').val();
	var index = parseInt(cate_index) + 1;

	if(cate_index ==null){
		index = 1;
	}
	
	$("#form_mobile .table_info_wrap").append(callRow_mobile(index));

});


$(document).on("click", "#form_mobile input[name=delRow]", function(){
//	alert($(this).parents("tr").find('[name=cate_index]').val());
//	alert($(this).parents("tr").find('[name=etc_text]').val());
	$(this).parents(".table_info").remove();
});



function fn_save_mobile(){
	$("form[name=form_mobile]").action = "/crm/order/save.do";
	$("form[name=form_mobile]").method = "post";
	$("form[name=form_mobile]").submit();
}



function fn_report_print_mobile(){
	var url    ="/crm/order/print.do";
	var title  = "이벤트 오더";
    var selectBox = $('#form_mobile select[name="valueArr"]');
    var count = $('#form_mobile select[name="valueArr"]').length;
    var textArr = new Array();
    
    count = selectBox.length;
    
    for(i=0; i<count; i++)
    	textArr[i] = selectBox.eq(i).find(":selected").text();
	
    for(i=0; i<count; i++)
		$('#form_mobile .hidden_layout').append('<input type="text" name="textArr" value="' + textArr[i] + '"/>');
    
    window.open("", title,status);
    form.target = title;
    form.action = url;
    form.method = "post";
    form.submit();
}


///////////////////////////////////////////////////////////////////////////////////////

$(function() { 

	
/*
	$('.datepicker').each(function () {
		$(this).datepicker({
			//showOn: "button",
			//buttonImage: "images/btn_cal.png",
			buttonImageOnly: true,
			//buttonText: "날짜 선택",
			buttonClass: "find_date",
			dateFormat: "yy-mm-dd",
			dayNames: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
			dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
			dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
			monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
			monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
			prevText: "이전달",
			nextText: "다음달",
			showOtherMonths: true,
			showMonthAfterYear: true,
			changeMonth : true,
			changeYear : true,
			beforeShowDay: function (day, year) {
				var result;
				switch (day.getDay()) {
				  case 0: // 일요일?
				    result = [true, "ui-date-sunday"];
				    break;
				  case 6: // 토요일?
				    result = [true, "ui-date-saturday"];
				    break;
				  default:
				    result = [true, ""];
				    break;
				}
				return result;
			}
		});
        $('.ui-datepicker-calendar > thead td.ui-datepicker-week-end:last-child a').addClass('ui-date-saturday');
	});
*/


	$(document).on("click", "input[type=checkbox][name=rent_time_amArrV]", function(){
  		if($(this).is(":checked")){
  			$(this).siblings("input[name=rent_time_amArr]").val("1");
  		}else{
  			$(this).siblings("input[name=rent_time_amArr]").val("0");
  		}
	});

	$(document).on("click", "input[type=checkbox][name=rent_time_pmArrV]", function(){
  		if($(this).is(":checked")){
  			$(this).siblings("input[name=rent_time_pmArr]").val("1");
  		}else{
  			$(this).siblings("input[name=rent_time_pmArr]").val("0");
  		}
	});
	
	$(document).on("click", "input[type=checkbox][name=rent_time_nightArrV]", function(){
  		if($(this).is(":checked")){
  			$(this).siblings("input[name=rent_time_nightArr]").val("1");
  		}else{
  			$(this).siblings("input[name=rent_time_nightArr]").val("0");
  		}
	});
	
	$(document).on("click", "input[type=radio][name*=rent_settingArr]", function(){
		if ($(this).is(':checked'))
	    {
			$(this).siblings("input[type=hidden][name=rent_settingArr]").val($(this).val());
	    }

	});
	
});



function append_file_tag(tag, idx){
	$('.' + tag).append('<li><input name="' + tag + '" type="file" /><button class="btn2 clrGrad_Wgray" onclick="javascript:remove_file_tag(this);return false;">삭제</button></li>')	
}

function remove_file_tag(obj){
	$(obj).parent().remove();
}

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '" />');
	$('#' + name).append('<input type="hidden" name="' + inputfilename + '_id' + '" value="" />');
}


function fn_page_print(){
	var sw=screen.width;
    var sh=screen.height;
    var w=800;//팝업창 가로길이
    var h=600;//세로길이
    var xpos=(sw-w)/2; //화면에 띄울 위치
    var ypos=(sh-h)/2; //중앙에 띄웁니다.
 	
    pWin=window.open("","print","width=" + w +",height="+ h +",top=" + ypos + ",left="+ xpos +",status=yes,scrollbars=yes"); //동적인 새창을 띄웁니다.
    pWin.document.open(); //팝업창 오픈
    pWin.document.write(pContent); //새롭게 만든 html소스를 씁니다.
    pWin.document.close(); //클로즈
    pWin.print(); //윈도우 인쇄 창 띄우고
    pWin.close(); //인쇄가 되던가 취소가 되면 팝업창을 닫습니다.
}

</script>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>