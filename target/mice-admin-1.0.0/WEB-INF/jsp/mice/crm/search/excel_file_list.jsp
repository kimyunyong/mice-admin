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
<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
if (request.getProtocol().equals("HTTP/1.1")) 
        response.setHeader("Cache-Control", "no-cache"); 
%>   
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<!-- 180124 --><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=10, minimum-scale=1, user-scalable=yes"><!-- //180124 -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mice/admin.css?ver=20160212'/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/reset.css?ver=20160212"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/mice/admin.css?ver=20160212"/>">
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="/css/mice/desktop.css" rel="stylesheet" type="text/css"   media="screen and (min-width:1024px)">
<link href="/css/mice/pad.css" rel="stylesheet" type="text/css" media="screen and (min-width:641px) and (max-width:1023px)">
<link href="/css/mice/mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:640px)">
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">

<title>상 담 내 역</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn_delete').on('click',function(){
			if(!confirm('삭제하시겠습니까?'))
				return false;
			$("input[name=redirect_url]").val( $("input[name=redirect_url2]").val() );
			$('form').submit();
		});
	});
</script>


<script>

function chkReset(frm){
		$(form).find("input[name=searchEvtName]").val("");
		$(form).find("input[name=searchSdate]").val("");
		$(form).find("input[name=searchEdate]").val("");
}

function chkSearch(frm){
	
	if( $(form).find("input[name=searchSdate]").val() != "" && $(form).find("input[name=searchEdate]").val() == ""){
		alert("종료날짜를 선택하시기 바랍니다.");
		return;
	}
	
	if( $(form).find("input[name=searchSdate]").val() == "" && $(form).find("input[name=searchEdate]").val() != ""){
		alert("시작날짜를 선택하시기 바랍니다.");
		return;
	}
	if( $(form).find("input[name=searchSdate]").val() > $(form).find("input[name=searchEdate]").val()){
		alert("시작날짜는 종료날짜보다 작아야합니다.");
		return;
	}
	$(form).find("input[name=pageIndex]").val(1);
	$(form).attr('action','/crm/search/excel_file_list.do');
	$(form).attr('method','get');
	$(form).submit();
}

function chkDelete(frm){
	
	if( $(frm).find("input[name=searchNum]").is(":checked") == false){
		alert("항목을 1개 이상 선택하시기 바랍니다.");
		return 
	}

	if( confirm("삭제하시겠습니까? 삭제는 목록은 복구 불가능합니다.") ==false ){
		return;
	}
	
	$(frm).attr('action','/crm/search/excel_file_delete.do');
	$(frm).attr('method','get');
	$(form).submit();
	
}
function fnLinkPage(pageno){
	$('input[name=pageIndex]').val(pageno);
	$('form[name=form]').submit();
}
function chkSelectAll(frm){
	if( $(frm).find("input[name=chkAll]").is(":checked") == true ){
		$(frm).find("input[name=searchNum]").prop("checked", true);
	}else{
		$(frm).find("input[name=searchNum]").prop("checked", false);
	}
}
</script> 



</head>

<body style="padding:20px; box-sizing:border-box;">


	<h5 class="s_tit">${d:decrypt(loginVO.name)}님의 엑셀다운로드 목록 <h5>

	
<!-- 웹, 패드에서 보이는 리스트 -->
<div class="">	
		<form name="form"  action="/crm/search/excel_file_list.do" method="get" enctype="multipart/form-data" onsubmit="return true;">
		<input name="excel" type="hidden" />
		<input name="pageIndex" type="hidden" value="${vo.pageIndex}"/>
		<input name="searchOrder" type="hidden" value="${vo.searchOrder}" />
		<input name="searchExcel" type="hidden" value="${vo.searchExcel}" />
		
	
		<!-- earch_new_wrap -->
		<div class="search_new_wrap">

			<dl class="inwidth01">
				<dt>제목명</dt>
				<dd><input type='text' name="searchEvtName"  value="${vo.searchEvtName}" /></dd>
			</dl>
			<dl class="inwidth01">
				<dt>다운로드 기간</dt>
				<dd>
				<input type='text' class="wd35per mobile50per datepicker" name="searchSdate" value="${vo.searchSdate}">
				 ~ 
				
				<input type='text' class="wd35per  mobile50per datepicker" name="searchEdate" value="${vo.searchEdate}">
				
				</dd>
				
			</dl>
		</div>
		<!-- //earch_new_wrap -->




		<!-- search_new_btn -->
		<div class="search_new_btn ">
			<a href="javascript:chkReset(document.form);" class="n_btn01">리셋</a>
			<a href="javascript:chkSearch(document.form);" class="n_btn02">검색</a>
			<a href="javascript:chkDelete(document.form);" class="n_btn02">삭제</a>
		</div>


		<div class="wordnoti_area float_l pt10">
		
		총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>


		

		<table class="adm_tbl25 " summary="명함, 기관단체, 대관신청 내역목록입니다.">
			<!-- 171222 -->
			<colgroup>
				<col width="10%"/>
				<col width="20%"/>
				<col />
			</colgroup>
			<!-- //171222 -->


			<thead>
			  <tr>
				<th><input type="checkbox" name="chkAll" value="" onclick="javascript:chkSelectAll(document.form);" /></th>
				<th>순번</th>
				<th>다운로드 제목/등록일</th>
			  </tr>
			  </thead>
			  <tbody>

				  
		<c:forEach var="result" items="${resultList}" varStatus="status">
		<c:set value = "${fn:length(result.eventSubContList)}" var="top_cnt" />
		<c:if test="${top_cnt==0 || top_cnt ==1 }">
			  <tr>
			  	<th><input type="checkbox" name="searchNum" value="${result.idx}" /></th>
				<td>
				<c:out value="${ (( resultListCnt - ((vo.pageIndex-1)*vo.recordCountPerPage) ) - status.count)+1}"/>
				</td>
				<td class="left">
					${result.search_title}(총 ${result.search_cnt} 건)
					&nbsp;<a href="/crm/search/excel_file_down.do?idx=${result.idx}">[파일받기]</a>
					<br/>${result.reg_date}
				</td>					

			  </tr>
		</c:if>
		</c:forEach>
			  </tbody>
			</table>
		</form>
		
		
		<div id="pagination_info" align="center">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
		</div>			

</div>		
<!-- //웹, 패드에서 보이는 리스트 -->





</body>
</html>