<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${fn:length(resultList) > 0 }">
<ul>
<c:forEach var="result" items="${resultList}" varStatus="status">
		<li>${result.name_ko }</li>
</c:forEach>
</ul>
</c:if>