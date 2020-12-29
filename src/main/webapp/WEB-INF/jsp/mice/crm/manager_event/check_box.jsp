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

<c:set var="resultArry" value="${fn:split(result,',') }"/>
	<c:forEach var="item" items="${resultList}" varStatus="status">
		<c:set var="chk_val" value="" />
		<c:forEach items="${resultArry}" var="vals" >
			 <c:if test="${vals == item.cate_no}" >
			     <c:set var="chk_val" value="T" />
			 </c:if>
		</c:forEach> 
		<input type="checkbox" name="${input_name}" value="${item.cate_no}" <c:if test="${chk_val == 'T'}">checked</c:if> />${d:decrypt(item.cate_name) }
	</c:forEach>	


<c:if test="${vo.input_type=='checkbox_view'}">
	<c:forEach var="item" items="${resultList}" varStatus="status">
		<c:set var="chk_val" value="" />
		<c:forEach items="${fn:split(result,',')}" var="vals" >
		     <c:if test="${vals == item.cate_no}" >
		     	<c:set var="chk_val" value="T" />
		     </c:if>
		</c:forEach> 
		<c:if test="${chk_val == 'T'}">${d:decrypt(item.cate_name) },</c:if> 
	</c:forEach>
</c:if>	





