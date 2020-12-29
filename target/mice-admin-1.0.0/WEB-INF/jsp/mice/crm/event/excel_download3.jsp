<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%//<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<%

Date date = new Date();
SimpleDateFormat dd = new SimpleDateFormat("yyyyMMdd");
SimpleDateFormat hh = new SimpleDateFormat("hhmmss");
String day = dd.format(date);
String hour = hh.format(date);
//String filename = "totalsearch_"+request.getAttribute("searchExcel").toString()+"_"+day+""+hour;
//String searchExcel = request.getParameter("searchExcel");
String filename2 = "엑셀_통계현황"+"_"+day+"_"+hour;


response.setHeader("Content-Disposition","attachment;filename="+new String(filename2.getBytes("KSC5601"),"8859_1")+".xls");
response.setHeader("Content-Description", "event excel download");
//response.setContentType("application/vnd.ms-excel");
%>



		<table border="1" >
			<thead>
			  <tr>
				<th>순번</th>
				<th>번호</th>
				<th>등록일자</th>
				<th>추진현황</th>
				<th>확정일자</th>
				<th>담당자</th>
				<th>행사명(국문)</th>
				<th>행사명(영문)</th>
				<th>행사명(기타)</th>
				<th>장소</th>

				<th>대관시설</th>
				<th>대관가능면적</th>
				<th>대관가능매출(원)</th>
				<th>대관유무</th>
				<th>대관면적/일(㎡)</th>
				<th>대관기간(일)</th>
				<th>전체대관면적(㎡)</th>
				<th>실내전시실대관면적(㎡)</th>
				<th>임대매출(원)</th>
				<th>대관시작일</th>

				<th>대관종료일</th>
				<th>행사시작일</th>
				<th>행사종료일</th>
				<th>행사유형</th>
				<th>행사성격</th>
				<th>행사구분</th>
				<th>외국인수</th>
				<th>내국인수</th>
				<th>전체참가자수</th>
				<th>전시부스</th>

				<th>전시면적</th>
				<th>참가국수</th>
				<th>관련국제기구</th>
				<th>주최기관</th>
				<th>주최기관 담당자</th>
				<th>주관기관</th>
				<th>주관기관 담당자</th>
				<th>홈페이지</th>
				<th>공개여부</th>
				<th>견적금액</th>

				<th>견적제출일</th>
				<th>총매출액</th>
				<th>임대매출</th>
				<th>식음매출</th>
				<th>AV 및 렌탈 매출</th>
				<th>관리비 매출</th>
				<th>매출예상액</th>
			  </tr>
			  </thead>
			  <tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			  <tr>
				<th>${result.idx}</th>
				<th>${result.reg_date}</th>
				<th>${result.implementation_status_name}</th>
				<th>${result.confirm_date}</th>
				<th>${result.attract_staff_name}</th>
				<th>${result.name_ko}</th>
				<th>${result.name_en}</th>
				<th>${result.name_etc}</th>
				<th>${result.place_name}</th>
				<th>${result.facility_text_description}</th>

				<th>${result.rent_area_value}</th>
				<th>${result.rent_cost_value}</th>
				<th>${result.rent_yn_value}</th>
				<th>${result.rent_area_day_value}</th>
				<th>${result.rent_day_value}</th>
				<th>${result.rent_all_area_value}</th>
				<th>${result.rent_inner_area_value}</th>
				<th>${result.rent_cost}</th>
				<th>${result.rent_st_date}</th>
				<th>${result.rent_ed_date}</th>

				<th>${result.event_st_date}</th>
				<th>${result.event_ed_date}</th>
				<th>${result.event_type_name}</th>
				<th>${result.event_scale_name}</th>
				<th>${result.event_division_name}</th>
				<th>${result.join_foreigner_cnt}</th>
				<th>${result.join_nationals_cnt}</th>
				<th>${result.join_personal_cnt}</th>
				<th>${result.booth_cnt}</th>
				<th>${result.exhibition_scale}</th>

				<th>${result.participating_states_cnt}</th>
				<th>${result.organizers_3}</th>
				<th>${result.organizers_1_name}</th>
				<th>${result.manager_1_name}</th>
				<th>${result.organizers_2_name}</th>
				<th>${result.manager_2_name}</th>
				<th>${result.homepage}</th>
				<th>${result.view_yn}</th>
				<th>${result.estimate_cost}</th>
				<th>${result.estimate_date}</th>

				<th>${result.total_cost}</th>
				<th>${result.rent_cost}</th>
				<th>${result.food_cost}</th>
				<th>${result.av_rental_cost}</th>
				<th>${result.manager_cost}</th>
				<th>${result.sales_cost}</th>
			  </tr>
		</c:forEach>

			  </tbody>
			</table>
			