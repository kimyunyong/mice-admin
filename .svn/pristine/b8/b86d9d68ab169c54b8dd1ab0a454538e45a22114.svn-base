<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">
$(document).ready(function(){

 $('form').validate({
	 lang: 'ko',
	 rules : {
		 emailAdres : { required: true, email: true},
 		 password2 : { equalTo : 'input[name=password]'}
	 }
 });
 
 $('#btnSave').on('click', function(){
	
	 $('form').submit();
 });
 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});


</script>
<section id="contentArea">
	<h3>계정관리 <span>></span> <c:choose> <c:when test="${param.action eq 'entRegist'}">협력사 등록</c:when><c:when test="${param.action eq 'nomalRegist'}">회원등록</c:when><c:otherwise>직원등록</c:otherwise></c:choose> <span>></span><!-- 171221 --> 상세</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<c:choose>
		<c:when test="${param.action eq 'adminRegist' }">
			<%@ include file="/WEB-INF/jsp/mice/member/detail/admin.jsp" %>
		</c:when>
		<c:when test="${param.action eq 'entRegist' }">
			<%@ include file="/WEB-INF/jsp/mice/member/detail/ent.jsp" %>
		</c:when>
		<c:when test="${param.action eq 'nomalRegist' }">
			<%@ include file="/WEB-INF/jsp/mice/member/detail/nomal.jsp" %>
		</c:when>
		</c:choose>		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>