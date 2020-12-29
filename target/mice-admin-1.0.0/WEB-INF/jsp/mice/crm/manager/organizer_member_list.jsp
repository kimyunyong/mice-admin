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


<c:if test="${name=='plus_org_member'}">
	<c:if test="${fn:length(resultList)==0}">
		<select name="${name}"  class="${name}">
		<option value="">==선택하세요==</option>
		</select>
		<c:if test="${result !=0}">
		<a class="nyroModal btn2 clrGrad_Wgray" href="/crm/event/addCustomer.do?name=${name}&target=${target}&time=${hhmmss}&data-id=${dataid}">신규등록</a>
		</c:if>
	</c:if>
	<c:if test="${fn:length(resultList)>0}">
		<select name="${name}" class="${name}">
			<option value="">==선택하세요==</option>
			<c:forEach var="item" items="${resultList }" varStatus="status">
				<option value="${item.idx }" <c:if test="${item.idx == result}">selected</c:if>>${d:decrypt(item.name_ko)} (${d:decrypt(item.phone_no) })</option>
			</c:forEach>
		</select>
		<a class="nyroModal btn2 clrGrad_Wgray" href="/crm/event/addCustomer.do?name=${name}&target=${target}&time=${hhmmss}&data-id=${dataid}">신규등록</a>
	</c:if>
</c:if>
<c:if test="${name!='plus_org_member'}">
	<c:if test="${fn:length(resultList)==0}">
		<div>조회된 내용이 없습니다. <a class="nyroModal btn2 clrGrad_Wgray" href="/crm/event/addCustomer.do?name=${name}&target=${target}&time=${hhmmss}&data-id=${dataid}">신규등록</a></div>
	</c:if>
	<c:if test="${fn:length(resultList) > 0 }">
		<select name="${name }">
			<option value="">==선택하세요==</option>
			<c:forEach var="item" items="${resultList }" varStatus="status">
				<option value="${item.idx }" <c:if test="${item.idx == result}">selected</c:if>>${d:decrypt(item.name_ko)} (${d:decrypt(item.phone_no) })</option>
			</c:forEach>
		</select>
		<a class="nyroModal btn2 clrGrad_Wgray" href="/crm/event/addCustomer.do?name=${name}&target=${target}&time=${hhmmss}&data-id=${dataid}">신규등록</a>
	</c:if>
</c:if>



