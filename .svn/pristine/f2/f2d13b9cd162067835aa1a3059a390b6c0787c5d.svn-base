<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
%>   

<c:forEach var="item" items="${resultList}" varStatus="status">
<ul>
	<li>
		<label style="padding-right:5px"><a href="/cmm/fms/FileDown.do?atchFileId=${item.file_id }&fileSn=">${item.file_name }</a></label>
		<c:if test="${delete == 'Y' }">
		<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
			<input type="hidden" name="file_id"/><a href="javascript:deleteFile(this, '${item.idx}');" class="btn2 clrGrad_Wgray">삭제</a>
		</sec:authorize>
		</c:if>
	</li>
</ul>
</c:forEach>