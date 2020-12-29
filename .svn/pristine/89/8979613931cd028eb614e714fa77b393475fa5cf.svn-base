<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<%
	pageContext.setAttribute("enter", "\n");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${getOrder.name_ko}</title>
<style>
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 700;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 300;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype');
}


body {
  font-family: 'NanumBarunGothic', sans-serif; 
}

* {margin:0px; padding:0px;}
.order_wrap { width:670px; color:#000; lettrer-spacing:0px;   }
p { color:#000; font-size:12px; line-height:auto; }
.bigtitle {font-size:25px;font-weight:bold; color:#000;}
.left { text-align:left; }
.center { text-align:center; }
.right { text-align:right; }
.order_wrap { font-size:12px;}
h5 {margin:30px 0px 0px 0px; line-height:30px;
	font-size: 14px;
	line-height: 1.5;
	font-weight: bold;
	letter-spacing: -1px;
}
.table_style1 { border: solid 1px #000; width:100%; border-collapse:collapse; border-spacing:0; padding:0; width:100%; border-collapse:collapse; border-spacing:0;}
.table_style1 th {  border-bottom:1px solid #000; border-right:1px solid #000; font-size:12px;color:#000; padding:0px; margin:0px; height:20px; background:#ededed; text-align:center; width:90px; font-weight:bold;} 
.table_style1 td { border-right:1px solid #000 !important; border-bottom:1px solid #000 !important; font-size:12px !important; color:#000; padding:3px 5px; text-align:center; }

.table_style2 { border: solid 1px #000; width:100%; border-collapse:collapse; border-spacing:0; padding:0; width:100%; border-collapse:collapse; border-spacing:0;}
.table_style2 th {  border-bottom:1px solid #000; border-right:1px solid #000; font-size:12px;color:#000; padding:0px; margin:0px; height:20px; background:#ededed; text-align:center; width:90px; font-weight:bold;} 
.table_style2 td { border-right:1px solid #000 !important; border-bottom:1px solid #000 !important; font-size:12px !important; color:#000; padding:3px 5px; text-align:left; }


.box011_st {
    border: 1px solid #000;
    padding: 10px;
    box-sizing: border-box;
    font-size:12px; line-height:17px;
    width: 100%; color:#000; 
}
.event_img img {max-width:670px;}
</style>
</head>

<body>


<table width="670px" border="0" cellspacing="0" cellpadding="10">
<tr>
<td>



		<table style="width:100%;">
		<tr>
		  <td width="33%"><img src="/images/mice/new/logo.jpg" alt="" style="height:55px;">
		  <td width="33%" align="center"><p class="bigtitle">EVENT  ORDER</p></td>
		  <td width="33%" align="right" >
			  
			  <p>EO No:${getOrder.order_no}</p>
			  <p><fmt:formatDate value="${toDay}" type="DATE" dateStyle="FULL" /></p>
			  
		  </td>
		</tr>
		</table>




		<table  class="table_style2">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>			
		<tr>
			<th class="subject">행사명</th>
			<td colspan="3" class="left">${getOrder.name_ko}</td>
		</tr>
		<tr>
			<th class="subject">주최기관</th>
			<td class="left">${getOrder.organizers_1_name }</td>
			<th class="subject1">대관기간</th>
			<td class="left"><c:if test='${not empty getOrder.rent_st_date }'> ${getOrder.rent_st_date} ~ ${getOrder.rent_ed_date } </c:if></td>
		</tr>
		<tr>
			<th class="subject">행사일자</th>
			<td class="left"><c:if test='${not empty getOrder.event_st_date}'> ${getOrder.event_st_date } ~ ${getOrder.event_ed_date } </c:if></td>
			<th class="subject1">행사인원</th>
			<td class="left">${getOrder.join_personal_cnt } 명 </td>
		</tr>
		<!--  
		<tr>
			<td class="subject">주최기관 담당자</td>
			<td class="content3">${getOrder.manager_1_name } </td>
			<td class="content4">${getOrder.manager_1_tel} </td>
			<td class="subject1">내부 담당자</td>
			<td class="content3">${getOrder.user_nm} </td>
			<td class="content4">${getOrder.user_tel} </td>
		</tr>
		-->
		</table>




	<c:if test="${fn:contains(getOrder.view_chk,'a')}">
		<h5>행사장 정보</h5>
		<table class="table_style1">
		<colgroup>
			<col width="15%">
			<col width="15%">
			<col width="15%">
			<col width="30%">
			<col width="10%">
			<col width="15%">
		</colgroup>		
		<thead>
		 <tr>
		   <th>행사기간</th>
		   <th>장소</th>
		   <th>시간</th>
		   <th>세팅종류</th>
		   <th>수용(인원)</th>
		   <th>비고</th>
		 </tr>
		</thead>
		<tbody>
		 <c:forEach items="${getFacList }" var="fac" varStatus="status">
			 <tr>                        
			   <td >
				<c:choose>
					<c:when test="${empty fac.p_rent_st_date}">
						${getOrder.rent_st_date}~<br />${getOrder.rent_ed_date}&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
						${fac.p_rent_st_date}~<br />${fac.p_rent_ed_date}&nbsp;&nbsp;
				</c:otherwise>
				</c:choose>
			  </td>
			   <td>${fn:replace(fac.place,enter,'<br/>')}</td>  
			   <td>${fn:replace(fac.rent_time,enter,'<br/>')}</td>
			   <td>${fn:replace(fac.rent_setting,enter,'<br/>')}</td>
			   <td>${fn:replace(fac.personal_cnt,enter,'<br/>')}</td>
			   <td>${fn:replace(fac.etc_text,enter,'<br/>')}</td>
			 </tr>
		 </c:forEach>
		</tbody>
		</table>
 	</c:if>



	<c:if test="${fn:contains(getOrder.view_chk,'b')}">
		<h5> 행사장 참고 사항</h5>
		<div class="box011_st">${fn:replace(getOrder.event_comment,enter,'<br/>')} </div><br/>
		<div class="event_img">
		<c:forEach items="${getHallFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;파일 ${status.count} : ${file.orignl_file_nm}</p>
			<img src="/cmm/fms/FileDown.do?atchFileId=${file.atch_file_id}&fileSn=" class="wd100per" />
		</c:forEach>
		</div>
 	</c:if>




	<c:if test="${fn:contains(getOrder.view_chk,'c')}">			
		<h5> 현수막 / 배너</h5>
		<table class="table_style1 wd100per mt0">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
		</colgroup>		
		  <tr>
			<th>외부 현수막</th>
			<td style="text-align:left !important; padding-left:5px"><c:if test='${getOrder.out_gate1_tf.equals("1")}'>*Gate1 </c:if>
			  <c:if test='${getOrder.out_under_access_tf.equals("1")}'>*지하 진입로 </c:if>
			  <c:if test='${getOrder.out_gate2_tf.equals("1")}'>*Gate2 </c:if>
			  <c:if test='${getOrder.out_gate3_tf.equals("1")}'>*Gate3 </c:if>
			  <c:if test='${getOrder.out_gate4_tf.equals("1")}'>*Gate4 </c:if>
			  <c:if test='${getOrder.out_big_left_tf.equals("1")}'>*대형(좌) </c:if>
			  <c:if test='${getOrder.out_big_right_tf.equals("1")}'>*대형(우) </c:if>
			  <c:if test='${getOrder.out_center_crossing_tf.equals("1")}'>*센터사거리 </c:if>
			  <c:if test='${getOrder.out_light_banner_tf.equals("1")}'>*가로등배너 </c:if>
			  <c:if test='${getOrder.out_none_tf.equals("1")}'>*없음 </c:if>
			  &nbsp;<br>
			  <c:if test='${getOrder.out_etc_tf.equals("1")}'>*${getOrder.out_etc_text }</c:if>
			</td>
			<th>내부 현수막</th>
			<td style="text-align:left !important; padding-left:5px"><c:if test='${getOrder.in_ju_tf.equals("1")}'>*주령구 </c:if>
			  <c:if test='${getOrder.in_center_road_tf.equals("1")}'>*중앙로비 </c:if>
			  <c:if test='${getOrder.in_3_1_tf.equals("1")}'>*3-1(유리벽면) </c:if>
			  <c:if test='${getOrder.in_3_2_tf.equals("1")}'>*3-2(2층안내데스크) </c:if>
			  <c:if test='${getOrder.in_3_3_tf.equals("1")}'>*3-3(300B) </c:if>
			  <c:if test='${getOrder.in_3_4_tf.equals("1")}'>*3-4(300B) </c:if>
			  <c:if test='${getOrder.in_3_5_tf.equals("1")}'>*3-5(300C) </c:if>
			  &nbsp;<br>
			  <c:if test='${getOrder.in_etc_tf.equals("1")}'>*${getOrder.in_etc_text }</c:if>
			</td>
		  </tr>
		  <tr>
			<th>전자 현수막</th>
			<td style="text-align:left !important; padding-left:5px"><c:if test='${getOrder.kaosk_tf.equals("1")}'>*카오스크</c:if>
			  <c:if test='${getOrder.el_fir_multi_tf.equals("1")}'>*1층 멀티비전 </c:if>
			  <c:if test='${getOrder.el_fir_guid_tf.equals("1")}'>*1층 안내데스크 상단 </c:if>
			  <c:if test='${getOrder.el_fir_office_tf.equals("1")}'>*1층 회의실 입구 </c:if>
			  <c:if test='${getOrder.el_hall_1_a_tf.equals("1")}'>*전시장 Hall 1-a</c:if>
			  <c:if test='${getOrder.el_hall_1_b_tf.equals("1")}'>*전시장 Hall 1-b(비지니스 센터)</c:if><br/>
			  <c:if test='${getOrder.el_hall_2_tf.equals("1")}'>*전시장 Hall 2 </c:if>
			  <c:if test='${getOrder.el_sec_office_tf.equals("1")}'>*2층 회의실 입구 </c:if>
			  <c:if test='${getOrder.el_300a_tf.equals("1")}'>*300A </c:if>
			  <c:if test='${getOrder.el_300b_tf.equals("1")}'>*300B </c:if>
			  <c:if test='${getOrder.el_300c_tf.equals("1")}'>*300C </c:if>
			  <c:if test='${getOrder.el_thi_multi_tf.equals("1")}'>*3층 멀티비전 </c:if><br>
			  <c:if test='${getOrder.el_etc_tf.equals("1")}'>*${getOrder.el_etc_text}</c:if>
			</td>
			<th>행사장 현수막</th>
			<td style="text-align:left !important; padding-left:10px"> ${getOrder.ev_etc_text}</td>
		  </tr>
		</table>
 	</c:if>


				

	<c:if test="${fn:contains(getOrder.view_chk,'d')}">			
		<h5>케이터링</h5>
		<div class="box011_st"> -업체 :
			<c:if test='${getOrder.ca_hyun_tf.equals("1")}'>현대 호텔,</c:if>
			<c:if test='${getOrder.ca_ro_tf.equals("1")}'>4층식당,</c:if>
			<c:if test='${getOrder.ca_gle_tf.equals("1")}'>카페</c:if>
			&nbsp;&nbsp; <br>
			*기타 : ${fn:replace(getOrder.ca_etc_text,enter,'<br/>')}
		</div>
		<c:forEach items="${getCateFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i>&nbsp;파일 ${status.count} : ${file.orignl_file_nm}</p>
		</c:forEach>                 
 	</c:if>




	<c:if test="${fn:contains(getOrder.view_chk,'e')}">
		<h5> AV 및 장비임대 관련 사항</h5>
		<div class="box011_st">${fn:replace(getOrder.equipment_rent_comment,enter,'<br/>')}</div>
 	</c:if>




	<c:if test="${fn:contains(getOrder.view_chk,'f')}">
		<h5>업무별 담당자 연락처</h5>
		<table class="table_style1">
		<colgroup>
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		</colgroup>
		<thead>
		  <tr>
			<th>유치담당 소속</th>
			<th>유치담당자 이름</th>
			<th>유치담당자 직함</th>
			<th>유치담당자 연락처</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
			<td>HICO</td>
			<td>${getOrder.user_nm }</td>
			<td>${getOrder.user_staff }</td>
			<td>${getOrder.user_tel }</td>
		  </tr>
		</tbody>
		</table>
				
		<table class="table_style1">
		<colgroup>
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		</colgroup>
		<thead>
		   <tr>
			 <th width="25%">행사담당 소속</th>
			 <th width="25%">행사담당자 이름</th>
			 <th width="25%">행사담당자 직함</th>
			 <th width="25%">행사담당자 연락처</th>
		   </tr>
		</thead>
		<tbody>
		   <tr>
			 <td>HICO</td>
			 <td><c:if test='${empty getOrder.manager_4_name }'> 박서준</c:if>${getOrder.manager_4_name}</td>
			 <td><c:if test='${empty getOrder.manager_4_staff }'> 과장</c:if>${getOrder.manager_4_staff}</td>
			 <td><c:if test='${empty getOrder.manager_4_name }'> 010-2864-2828</c:if>${getOrder.manager_4_tel }</td>
		   </tr>
		</tbody>
		</table>
				
		<table class="table_style1">
		<colgroup>
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		</colgroup>
		<thead>
		   <tr>
			 <th width="25%">AV장비 소속</th>
			 <th width="25%">AV장비 담당자</th>
			 <th width="25%">AV장비 담당 직함</th>
			 <th width="25%">AV장비 전화번호</th>
		   </tr>
		</thead>
		<tbody>
		<tr>
		   <td>${getOrder.organizers_3_name }</td>
		   <td>${getOrder.manager_3_name }</td>
		   <td>${getOrder.manager_3_staff }</td>
		   <td>${getOrder.manager_3_tel }</td>
		</tr>
		</tbody>
		</table>
				
		<table class="table_style1">
		<colgroup>
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		</colgroup>
		<thead>
		   <tr>
			 <th width="25%">주관사 소속</th>
			 <th width="25%">주관사 담당자</th>
			 <th width="25%">주관사 담당 직함</th>
			 <th width="25%">주관사 전화번호</th>
		   </tr>
		</thead>
		<tbody>
		<tr>
		   <td>${getOrder.organizers_2_name }</td>
		   <td>${getOrder.manager_2_name }</td>
		   <td>${getOrder.manager_2_staff }</td>
		   <td>${getOrder.manager_2_tel }</td>
		</tr>
		</tbody>
		</table>
				
		<table class="table_style1">
		<colgroup>
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		  <col width="25%">
		</colgroup>
		<thead>
			<tr>
			  <th>주최자/대행사 소속</th>
			  <th>주최자/대행사 담당자</th>
			  <th>주최자/대행사 담당 직함</th>
			  <th>주최자/대행사 전화번호</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>${getOrder.organizers_1_name }</td>
			<td>${getOrder.manager_1_name }</td>
			<td>${getOrder.manager_1_staff }</td>
			<td>${getOrder.manager_1_tel }</td>
		</tr>
		<tbody>
		</table>
 	</c:if>
		 
			 


	<c:if test="${fn:contains(getOrder.view_chk,'g')}">			
		<h5>특기사항</h5>
		<div class="box011_st"><c:if test="${not empty param.write_condition_tf}">${fn:replace(getOrder.etc_comment,enter,'<br/>')}</c:if></div>
 	</c:if>



	<c:if test="${fn:contains(getOrder.view_chk,'h')}">			
		<h5>첨부파일</h5>
		<c:forEach items="${getEtcFile}" var="file" varStatus="status">
			<p class="file_list">- <i class="fa fa-file-o" aria-hidden="true"></i> 파일 ${status.count} : ${file.orignl_file_nm}</p>
		</c:forEach>
 	</c:if>
 	
 	



</td>
</tr>
</table>



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"/></script>
<script type="text/javascript">

$(function() { 
	$( document ).ready(function() {
		window.print();
	});
});

</script>

</body>
</html>