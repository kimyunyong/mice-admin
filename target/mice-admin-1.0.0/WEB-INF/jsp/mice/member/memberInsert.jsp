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

<c:choose>
	<c:when test="${param.action eq 'adminRegist' }">
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 emailAdres : { required: true, email: true},
	 		 password2 : { equalTo : 'input[name=password]'}
		 }
	 });
	</c:when>
	<c:when test="${param.action eq 'entRegist' }">
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 applcntEmailAdres : { required: true, email: true},
			 entrprsMberPassword2 : { equalTo : 'input[name=entrprsMberPassword]'}
		 }
	 });
	</c:when>
	<c:when test="${param.action eq 'nomalRegist' }">
	 $('form').validate({
		 lang: 'ko',
		 rules : {
			 mberEmailAdres : { required: true, email: true},
	 		 password2 : { equalTo : 'input[name=password]'}
		 }
	 });
	</c:when>
</c:choose>


 $('#btnSave').on('click', function(){
     $.ajax({
         type: "POST",
         url: "/member/idDuplicate.do?id=" + $('#id').val(),
         data: {},
         dataType: "text",
         success: function (response) {
			
        	 if(response == "N"){
        		 alert('이미 사용중인 아이디입니다.');
        		 
        		 return false;
        	 }
        		 
        	 $('form').submit();
         }
     });
	 
 });
 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});


</script>
<section id="contentArea">
	<h3>계정관리 <span>></span> <c:choose> <c:when test="${param.action eq 'entRegist'}">협력사 등록</c:when><c:when test="${param.action eq 'nomalRegist'}">회원등록</c:when><c:otherwise>직원등록</c:otherwise></c:choose> <span>></span> 등록</h3>
	<section class="sect_nonetit">
			<c:choose>
				<c:when test="${param.action eq 'adminRegist' }">
					<%@ include file="/WEB-INF/jsp/mice/member/insert/admin.jsp" %>
				</c:when>
				<c:when test="${param.action eq 'entRegist' }">
					<%@ include file="/WEB-INF/jsp/mice/member/insert/ent.jsp" %>
				</c:when>
				<c:when test="${param.action eq 'nomalRegist' }">
					<%@ include file="/WEB-INF/jsp/mice/member/insert/nomal.jsp" %>
				</c:when>
			</c:choose>		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>