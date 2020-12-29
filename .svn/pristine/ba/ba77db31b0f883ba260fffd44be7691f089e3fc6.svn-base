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

	<c:if test="${fn:length(resultList) > 0}">
		<option value="">==선택하세요==</option>
	</c:if>
	<c:forEach var="item" items="${resultList}" varStatus="status">
		<option value="${item.cate_no}" <c:if test="${item.cate_no == result}">selected</c:if>>${d:decrypt(item.cate_name) }</option>
	</c:forEach>




