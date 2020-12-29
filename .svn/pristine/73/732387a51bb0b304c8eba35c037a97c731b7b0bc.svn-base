<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>

<table class="adm_tbl2">
	<caption>상세</caption>
	<colgroup>
		<col width="27%">
	</colgroup>
		<c:if test="${check == 1}">
		<thead>
			<tr>
				<th colspan="2" >기관단체명</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">국문</th>
				<td class="left"><a href="/crm/organizer/info.do?idx=${result.idx}" target="_blank">${result.name_ko}</a></td>
			</tr>
			<tr>
				<th scope="row">영문</th>
				<td class="left"><a href="/crm/organizer/info.do?idx=${result.idx}" target="_blank">${result.name_en}</a></td>
			</tr>
			<tr>
				<th scope="row">기타</th>
				<td class="left">${result.name_etc }</td>
			</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="2" >기본정보</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<th scope="row">구분</th>
				<td class="left">${result.type_name }</td>
			</tr>
			<tr>
				<th scope="row">국가</th>
				<td class="left">${result.national }</td>
			</tr>
			<tr>
				<th scope="row">도시</th>
				<td class="left">${result.city }</td>
			</tr>
			<tr>
				<th scope="row">우편번호</th>
				<td class="left">${result.zip_code }</td>
			</tr>
			<tr>
				<th scope="row">주소(국문)</th>
				<td class="left">${d:decrypt(result.address_ko) }</td>
			</tr>
			<tr>
				<th scope="row">주소(영문)</th>
				<td class="left">${d:decrypt(result.address_en) }</td>
			</tr>
			<tr>
				<th scope="row">대표전화</th>
				<td class="left">${d:decrypt(result.tel_no) }</td>
			</tr>
			<tr>
				<th scope="row">FAX</th>
				<td class="left">${d:decrypt(result.fax) }</td>
			</tr>
			<tr>
				<th scope="row">대표 E-mail</th>
				<td class="left">${d:decrypt(result.email) }</td>
			</tr>
			<tr>
				<th scope="row">홈페이지</th>
				<td class="left">${result.homepage }</td>
			</tr>
			</tbody>
			<thead>
			<tr>
				<th colspan="2">추가정보</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th scope="row"></th>
				<td style="word-break: break-all">${result.comment }</td>
			</tr>
			</tbody>
			<thead>
			<tr>
				<th colspan="2">관련행사 정보</th>
			</tr>
			</thead>
			<tbody>	
			<tr id="relationEventInfo">
				<td colspan="2" class="btn_wrapper"><c:import url="/crm/organizer/event_relationlist.do"	charEncoding="utf-8">
				<c:param name="eventparam" value="${result.idx }"></c:param>
				<c:param name="organizers" value="${organizers }"></c:param>
				</c:import></td>
			</tr>
		</c:if>
		<c:if test="${check==0}">
			<tr>
				<td>관련 기관 정보가 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
</table>
