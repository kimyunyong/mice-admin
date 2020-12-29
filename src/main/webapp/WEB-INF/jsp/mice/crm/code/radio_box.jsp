<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="col" 	uri="/WEB-INF/tlds/custom_1.tld" %>
<c:set var="checker" value="${fn:split(result,',') }"/>

	<c:forEach var="item" items="${resultList }" varStatus="status">
		<c:if test="${li != 'N' }"><li></c:if>
			<input name="${name }" type="radio" value="${item.idx }"
			<c:forEach var="res" items="${checker}" varStatus="st">
				<c:if test="${res == item.idx }">checked</c:if>
			</c:forEach>
			/>${item.value }
		<c:if test="${li != 'N' }"></li></c:if>
	</c:forEach>	
	
</ul>