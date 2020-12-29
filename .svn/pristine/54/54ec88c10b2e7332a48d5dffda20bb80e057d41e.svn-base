<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').submit();
		});
		
		
		$('#goto_move1').on('click',function(){
			$('form').submit();
		});
		
		$('#goto_today').on('click', function(){
			var dt = parseInt($(this).attr('data-date'));
			$('select[name=searchYear]').val(dt);
			$('select[name=searchMonth]').val(dt);
			$('form').submit();
		})
		
		//if($.getUrlVar('searchYear') == undefined){
		//	$('form').submit();
		//}


		$('#btnRegist').on('click',function(){
			location.href='/crm/event/insert.do';
		});



	});
	
	$.extend({
	    getUrlVars: function(){
	        var vars = [], hash;
	        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	        for(var i = 0; i < hashes.length; i++) {
	            hash = hashes[i].split('=');
	            vars.push(hash[0]);
	            vars[hash[0]] = hash[1];
	        }
	        return vars;
	    },
	    getUrlVar: function(name) {
	        return $.getUrlVars()[name];
	    }
	});
</script>
<script>
  
  </script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
    <h3>대관관리> 월별현황</h3>
    <section class="sect_nonetit">
        <h4>행사정보</h4>
        
		<div style="font-size:x-large;padding-bottom:10px">월별 캘린더</div>
		<form name="searchForm" action="/crm/event/eventStatus.do" method="GET">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl2">
            <caption>캘린더 검색</caption>
            <colgroup>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>      
			</colgroup>
			<tbody>

<script>
function chkDateDay(val){
	var frm = document.searchForm;
	
	if(val == "P"){
		frm.searchToday.value = frm.searchPreDay.value;
		
	}else{
		frm.searchToday.value = frm.searchNextDay.value;
	}
	frm.searchPreDay.value = "";
	frm.searchNextDay.value = "";
	frm.submit();
}
function chkWeek(val){
	var frm = document.searchForm;
	frm.searchViewChk.value = val;
	frm.searchPreDay.value = "";
	frm.searchNextDay.value = "";
	frm.submit();
}
//javascript:$('select[name=searchMonth]').val('${result.searchMonth == 1 ? 12 : result.searchMonth - 1 }');$('select[name=searchYear]').val('${result.searchMonth == 1 ? result.searchYear - 1 : result.searchYear}');$('form').submit()

$(document).rady(function(){
	$("")
	
});
</script>				
				
<input type="hidden" name="searchPreDay" value="${result.searchPreDay}" />
<input type="hidden" name="searchNextDay" value="${result.searchNextDay}" />
<input type="hidden" name="searchViewChk" value="${result.searchViewChk}" />
							
	
			<tr style="height:50px;">
				<td><a style="font-size:25px" onclick="javascript:chkDateDay('P');">이전달</a></td>
				<td style="font-size:25px">
				
					${result.searchToday }
				</td>
				<td>				
				<a style="font-size:25px" onclick="javascript:chkDateDay('N');">다음달</a>				
				</td>
				
			</tr>
			
			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
			<tr>
				<th scope="row">날자검색</th>
				<td colspan="2">
				
					<input type="input" name="searchToday" value="${result.searchToday}" />
					
				</td>
			</tr>
			</sec:authorize>
			
			<tr>
				<th scope="row">달력구분</th>
				<td colspan="2">

					<a href="javascript:chkWeek('W');">주별보기(이번주)</a>
					<a href="javascript:chkWeek('D');">일별보기(오늘날짜)</a>
					<a href="javascript:chkWeek('M');">월별보기</a>
				
				</td>
			</tr>
			<tr>
				<td colspan="3">
				
				<a id="btnSearch" class="btn2 clrGrad_Wgray">검색</a>
				
 				</td>
			</tr>

			</tbody>
		</table>
		</form>
        <br>
        
		yyyymmdd=${result.yyyymmdd}__________<br/>
		dayweek= ${result.dayweek}__________<br/>
		monthweek = ${result.monthweek}__________<br/>

		searchToday = ${result.searchToday}<br/>
		searchPreDay = ${result.searchPreDay}<br/>
		searchNextDay = ${result.searchNextDay}<br/>
		searchViewChk = ${result.searchViewChk}<br/>
		       
        <!-- 교육신청 달력(s) -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="calendar_tbl">
            <caption>교육일정 취소하기</caption>
            <colgroup>
                <col/><col/> <col/>
                <col/><col/> <col/>
                <col/><col/> <col/>
                <col/><col/> <col/>
                <col/><col/> <col/>
                <col/><col/> <col/>
                <col/><col/> <col/>
            </colgroup>
            <thead>
                <tr>
                	<th>시설</th>
                	<c:forEach var="result_week" items="${resultWeek}" varStatus="status">
                	<th scope="col" title="일요일" colspan="3">
                		 ${result_week.yyyymmdd}<br/>
                		 ${result_week.dayweek}
                	</th>
                	</c:forEach>
                </tr>
            </thead>
            
            <tbody>
            	<c:forEach var="result" items="${resultList}" varStatus="status">
            	<tr>
            		<td>
            			${result.type_ko}<br/>
						${result.value}
            		</td>
            		
            		<c:forEach var="result2" items="${result.day_arr}" varStatus="no">
            		
            		<c:if test="${result2 > 1}"><c:set var="bgcolor" value="background:red;"/></c:if>
            		<c:if test="${result2 == 0}"><c:set var="bgcolor" value=""/></c:if>
            		
            		<td style='${bgcolor}'>
 						${result2}
            		</td>
            		</c:forEach>
            	</tr>
				</c:forEach>
            </tbody>
            
        </table>
        
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>