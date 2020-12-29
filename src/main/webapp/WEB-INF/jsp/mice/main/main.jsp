<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<%-- <div style="padding-left:220px;padding-top:300px">${sessionScope}</div> --%>

<script>

$(function(){
	var wid = $("body").width();
	if(wid < 1023){
		menuOpen();
	}
});

</script>

<!-- 171222 -->
<section id="contentArea">
	<section class="sect_nonetit main_visual">
		
	<img src="/images/mice/new/logo.jpg" alt="" />
			
	</section>
</section>
<!-- //171222 -->

<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>