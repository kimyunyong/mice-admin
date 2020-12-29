<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>

<select name="${name }">
	<option value="">==선택하세요==</option>
<c:forEach var="item" items="${resultList }" varStatus="status">
	
	<c:if test="${item.code_name != 'E' && item.code_name != 'O'}">
	<option value="${item.code_name}" <c:if test="${item.code_name == result}">selected</c:if>>${item.value }</option>
	</c:if>
</c:forEach>
</select>