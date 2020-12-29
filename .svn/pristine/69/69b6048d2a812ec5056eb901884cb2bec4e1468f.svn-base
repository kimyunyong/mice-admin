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
String searchExcel = request.getParameter("searchExcel");
String filename = "totalsearch"+"_"+searchExcel+"_"+day+"_"+hour;

response.setHeader("Content-Disposition","attachment;filename="+filename+".xlsx");
response.setHeader("Content-Description", "Total Search");
response.setContentType("application/vnd.ms-excel");

%>

		<table border="1" class="adm_tbl25 mobile_none" >
			<colgroup>
				<col width="5%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				
				<col width="10%"/>
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
				<th>순번</th>
				<th>성명</th>
				<th>연락처</th>
				<th>휴대전화</th>
				<th>이메일</th>
				<th>담당자</th>
				<th>내/외국인</th>				
				
				<th>기관명</th>
				<th>기관 주소</th>
				<th>지역</th>
				<th>행사명(개최년도)</th>
				<th>행사 시작일</th>
				<th>행사종료일</th>
				<th>유치담당자</th>
				<th>주최기관</th>
				<th>행사주제</th>
				<th>뉴스레터수신여부</th>
				
			  </tr>
			  </thead>
			  <tbody>

		<c:forEach var="result" items="${resultList}" varStatus="status">
		<c:set value = "${fn:length(result.eventSubContList)}" var="top_cnt" />
		<c:if test="${top_cnt==0 || top_cnt ==1 }">
			  <tr>
				<td><c:out value="${(vo.pageIndex-1) * vo.pageSize + status.count}"/></td>
				<td>${result.name_ko}</td>
				<td>${result.tel_no}</td>
				<td>${d:decrypt(result.phone_no) }</td>
				<td>${d:decrypt(result.email) }</td>
				<td>${result.reg_name}</td>
				<td>
					<c:if test="${result.country == 'N' }">내국인</c:if>
					<c:if test="${result.country == 'F' }">외국인</c:if>
				</td>				
				
				<c:if test="${top_cnt == 0}">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</c:if>
				
				<c:if test="${top_cnt ==1}">
				<c:forEach var="result2" items="${result.eventSubContList}" varStatus="no">
					<td>${result2.oraganizer_name}</td>
					<td>${result2.org_address_ko}</td>
					<td>${result2.org_address_ko_full}</td>
					<td>${result2.event_name}</td>
					<td>${result2.event_st_date}</td>
					<td>${result2.event_ed_date}</td>										
					<td>${result2.event_staff_name}</td>
					<td>${result2.org_type_name}</td>
					<td>${result2.event_theme_name}</td>
				</c:forEach>
				</c:if>
				
				<td class="newsletter_y">${result.newsletter}</td>
				
			  </tr>
		</c:if>
		<c:if test="${top_cnt>1 }">
			  <tr>
				<td rowspan="${top_cnt}"><c:out value="${(vo.pageIndex-1) * vo.pageSize + status.count}"/></td>
				<td rowspan="${top_cnt}">${result.name_ko}</td>
				<td rowspan="${top_cnt}">${result.tel_no}</td>
				<td rowspan="${top_cnt}">${d:decrypt(result.phone_no) }</td>
				<td rowspan="${top_cnt}">${d:decrypt(result.email) }</td>
				<td rowspan="${top_cnt}">${result.reg_name}</td>
				<td rowspan="${top_cnt}">
					<c:if test="${result.country == 'N' }">내국인</c:if>
					<c:if test="${result.country == 'F' }">외국인</c:if>
				</td>				
				
			  <c:forEach begin="0" end="0" varStatus="no">
				<td>${result.eventSubContList[no.current].oraganizer_name}</td>
			  	<td>${result.eventSubContList[no.current].org_address_ko}</td>
			  	<td>${result.eventSubContList[no.current].org_address_ko_full}</td>
				<td>${result.eventSubContList[no.current].event_name}</td>
				<td>${result.eventSubContList[no.current].event_st_date}</td>
				<td>${result.eventSubContList[no.current].event_ed_date}</td>
				<td>${result.eventSubContList[no.current].event_staff_name}</td>
				<td>${result.eventSubContList[no.current].org_type_name}</td>
				<td>${result.eventSubContList[no.current].event_theme_name}</td>
			  </c:forEach>
				
				<td rowspan="${top_cnt}" class="newsletter_y">${result.newsletter}</td>
			  </tr>	
			  
			  
			  <c:forEach begin="1" end="${fn:length(result.eventSubContList)-1}" varStatus="no">
			  <tr>
				<td>${result.eventSubContList[no.current].oraganizer_name}</td>			  
			  	<td>${result.eventSubContList[no.current].org_address_ko}</td>
			  	<td>${result.eventSubContList[no.current].org_address_ko_full}</td>
				<td>${result.eventSubContList[no.current].event_name}</td>
				<td>${result.eventSubContList[no.current].event_st_date}</td>
				<td>${result.eventSubContList[no.current].event_ed_date}</td>								
				<td>${result.eventSubContList[no.current].event_staff_name}</td>
				<td>${result.eventSubContList[no.current].org_type_name}</td>
				<td>${result.eventSubContList[no.current].event_theme_name}</td>
			  </tr>
			  </c:forEach>
			  		  
		</c:if>
		</c:forEach>


			  </tbody>
			</table>
			

			