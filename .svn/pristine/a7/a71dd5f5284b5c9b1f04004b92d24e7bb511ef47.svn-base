<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.submit();
	}

	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').attr('action','/crm/event/list.do');
			$('form').submit();
		});
		$('#btnRegist').on('click',function(){
			location.href='/crm/event/insert.do';
		});
		
		$('#btnExcelDownload').on('click',function(){
			$('form').attr('action','/crm/event/excel_download.do');
			$('form').submit();
		});
		
		$('#btnExcelDownload2').on('click',function(){
			$('form').attr('action','/crm/event/excel_download2.do');
			$('form').submit();
		});
		
		$('#btnExcelUpload').on('click',function(){
			$('input[name=excel]').click();
		});
		
		$('input[name=excel]').change(function(){
			
			if($(this).val() != ''){
				$('form').attr('action','/crm/event/excel_upload.do');
				$('form').submit();
			}
				
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
<section id="contentArea">
	<h3>대관관리 <span>></span> 대관신청관리</h3>
	<section class="sect_nonetit">
		<h4>정보</h4>
		

			
	</section>
</section>
</sec:authorize>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
