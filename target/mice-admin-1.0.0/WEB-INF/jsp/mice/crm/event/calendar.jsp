<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			
			//$('#searchForm input[name=pop]').value="";
			//$('#searchForm').target="";
			//$('#searchForm').action="/crm/event/calendar.do";
			//$('#searchForm').submit();
			chkSubmit();
		});
		
		
		$('#goto_move1').on('click',function(){
			
			//$('#searchForm').submit();
			chkSubmit();
		});
		
		$('#goto_today').on('click', function(){
			var dt = parseInt($(this).attr('data-date'));
			$('select[name=searchYear]').val(dt);
			$('select[name=searchMonth]').val(dt);
			//$('#searchForm').submit();
			chkSubmit();
			
		})
		
		if($.getUrlVar('searchYear') == undefined){
			//$('#searchForm').submit();
			chkSubmit();
			
		}


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

//추진현황 글자색 변경
$(document).ready(function(){
	/*
		#f85151	레드
		#0272c9	파랑
		#38983a	초록
		#999	회색
	*/
	//추진현황
	$("input[name=searchImplementsStatusList]").each(function(idx){
		var val = $(this).val();
		if( val == "1"){
			$(".searchImplementsStatusList"+val).css("color","#f85151");	
		}else if(val == "4"){
			$(".searchImplementsStatusList"+val).css("color","#000");	
			$(".searchImplementsStatusList"+val).append("(<span style='color:#0272c9'>일반</span>, <span style='color:#38983a'>내부</span>)");	
		}else if(val == "5"){
			$(".searchImplementsStatusList"+val).css("color","#999");
		}
	});
	/*
	//행사구분
	$("input[name=searchEventDivisionList]").each(function(idx){
		var val = $(this).val();
		if( val == "22"){
			$(".searchEventDivisionList"+val).css("color","#0272c9");	
		}else {
			$(".searchEventDivisionList"+val).css("color","#38983a");	
		}
	});
	*/
	
});

</script>

<script>
function winOpen(){
	//var params = $("#searchForm").serialize();
	//window.open('/crm/event/calendar.do?pop=Y&'+params,'calendar','width=1024,height=768,menubar=no,status=yes,toolbar=no');
	
	window.open('','calendar','width=1024,height=768,menubar=no,status=yes,toolbar=no');
	document.searchForm.pop.value = "Y";
	document.searchForm.target = "calendar";
	document.searchForm.action = "/crm/event/calendar.do?pop=Y";
	document.searchForm.submit();
}
</script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
    <h3>대관관리<span>></span> 월별현황</h3>
    <section class="sect_nonetit">
        <h4>행사정보</h4>
        
        
		<form name="searchForm" id="searchForm" action="/crm/event/calendar.do" method="GET">
		<input type="hidden" name="pop" value="" />
		
<script>
function chkSubmit(){
	document.searchForm.pop.value = "";
	document.searchForm.target = "";
	document.searchForm.action = "/crm/event/calendar.do?";
	document.searchForm.submit();

}
function preYear(yy, mm){
	$("select[name=searchYear]").val(yy);
	chkSubmit();
}
function preMonth(yy, mm){
	$("select[name=searchYear]").val(yy);
	$("select[name=searchMonth]").val(mm);
	chkSubmit();
}

function nextYear(yy, mm){
	$("select[name=searchYear]").val(yy);
	chkSubmit();
}
function nextMonth(yy, mm){
	$("select[name=searchYear]").val(yy);
	$("select[name=searchMonth]").val(mm);
	chkSubmit();
}
</script>
			
			<!-- calendar_toppper -->
			<div class="calendar_toppper ">
				<p><a onclick="javascript:preYear(${result.searchYear - 1 });"><!--${result.searchYear - 1 }년--><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></p>
				<p><a onclick="javascript:preMonth(${result.searchMonth == 1 ? result.searchYear - 1 : result.searchYear},${result.searchMonth == 1 ? 12 : result.searchMonth - 1 })"><i class="fa fa-angle-left" aria-hidden="true"></i></a></p>
				<p class="calander_now">${result.searchYear }년 ${result.searchMonth}월</p>
				<p><a onclick="javascript:nextMonth(${result.searchMonth == 12 ? result.searchYear + 1 : result.searchYear},${result.searchMonth == 12 ? 1 : result.searchMonth + 1 })"><i class="fa fa-angle-right" aria-hidden="true"></i></a></p>
				<p><a onclick="javascript:nextYear(${result.searchYear + 1 })"><!-- ${result.searchYear + 1 }년</a> --><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></p>
					
					<%-- <td><a style="font-size:25px" href="/crm/event/calendar.do?searchYear=${result.searchYear }&searchMonth=${result.searchMonth + 1}">다음달</a></td>
					<td><a style="font-size:25px" href="/crm/event/calendar.do?searchYear=${result.searchYear + 1 }&searchMonth=${result.searchMonth}">${result.searchYear + 1 }년</a></td> --%>
			</div>
			<!-- //calendar_toppper -->
		
	
	
	
			<div class="search_cal_wrap">
				<fmt:formatDate var="date" value="${toDay}" pattern="yyyy" />
				<select name="searchYear">
					<c:forEach var="val" begin="2010" end="2030" varStatus="status">
						
						<option value="${val }" <c:if test="${val == result.searchYear }">selected</c:if>>${val }</option>
					</c:forEach>
				</select>
				<select name="searchMonth">
					<fmt:formatDate var="date" value="${toDay}" pattern="MM" />
					<c:forEach var="val" begin="01" end="12" varStatus="status">
						
						<option value="${val }" <c:if test="${val == result.searchMonth }">selected</c:if>>${val }</option>
					</c:forEach>
				</select>
				<c:set var="imst" value="[1,2,4]" />
				<c:set var="dvi" value="[7,8,21,22,23]" />
				<a id="goto_move1" class="inbtn">이동</a><!-- 180111 --><!-- <br class="mobile_show"><br class="mobile_show"> --><!-- //180111 -->
				<a id="goto_today"  class="inbtn"data-date="${date }">오늘보기</a>

			</div>




			
			<h5 class="s_tit">검색조건</h5>
			
			<!-- search_sort_type -->
			<div class="search_sort_type2">
			
				<dl>
					<dt>기준</dt>
					<dd>
						<select name="searchOrderby">
							<option value="0" <c:if test="${result.searchOrderby == 0 }">selected</c:if>>대관일 기준</option>
							<option value="1" <c:if test="${result.searchOrderby == 1 }">selected</c:if>>행사일 기준</option>
						</select>
					</dd>
				</dl>
				<!-- 171213삭제
				<dl>
					<dt>장소</dt>
					<dd>
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
									<c:param name="name" value="searchPlaceIdx" />
									<c:param name="type" value="장소" />
									<c:param name="result" value="${result.searchPlaceIdx }"/>
								</c:import>
					</dd>
				</dl> -->
				<!-- //171213삭제 -->
			
			
				<c:if test="${auth == 'ENT'}">
					<input type="hidden" name="searchImplementsStatusList" value="2" />
					<input type="hidden" name="searchImplementsStatusList" value="4" />
				</c:if>
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
				<dl>
					<dt>추진현황</dt>
					<dd>
						<c:choose>
						<c:when test="${fn:length(result.searchImplementsStatusList) > 0}">
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="searchImplementsStatusList" />
							<c:param name="type" value="추진현황" />
							<c:param name="li" value="Y" />
							<c:param name="result" value="${result.searchImplementsStatusList }"/>
						</c:import>
						</c:when>
						<c:otherwise>
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="searchImplementsStatusList" />
							<c:param name="type" value="추진현황" />
							<c:param name="li" value="N" />
							<c:param name="result" value="${imst }"/>
						</c:import>
						</c:otherwise>
						</c:choose>
					</dd>
				</dl>
				</sec:authorize>
				
				<dl>
					<dt>행사구분</dt>
					<dd>
							<c:choose>
								<c:when test="${fn:length(result.searchImplementsStatusList) > 0}">
								<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
									<c:param name="name" value="searchEventDivisionList" />
									<c:param name="type" value="행사구분" />
									<c:param name="li" value="N" />
									<c:param name="result" value="${result.searchEventDivisionList }"/>
								</c:import>
								</c:when>
								<c:otherwise>
								<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
									<c:param name="name" value="searchEventDivisionList" />
									<c:param name="type" value="행사구분" />
									<c:param name="li" value="N" />
									<c:param name="result" value="[7,8,21,22,23]"/>
								</c:import>
								</c:otherwise>
								</c:choose>
					</dd>
				</dl>
			
			</div>
			<!-- //search_sort_type -->

			<div class="search_new_btn">
				<a id="btnSearch" class="n_btn03 ">검색</a>
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
				<a class="n_btn03 " id="btnRegist">등록</a>
				</sec:authorize>
			</div>
	
			<div class="btn_right_area mobile_none">
				<a class="sbtn01" onclick="javascript:winOpen();">캘린더 출력</a>
			</div>

		</form>



        <!-- 교육신청 달력(s) -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="calendar_tbl">
            <caption>교육일정 취소하기</caption>
            <colgroup>
                <col style="width: 14.28571428571429%">
                <col style="width: 14.28571428571429%">
                <col style="width: 14.28571428571429%">
                <col style="width: 14.28571428571429%">
                <col style="width: 14.28571428571429%">
                <col style="width: 14.28571428571429%">
                <col style="width: 14.28571428571429%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" title="일요일" class="sun">일</th>
                    <th scope="col" title="월요일">월</th>
                    <th scope="col" title="화요일">화</th>
                    <th scope="col" title="수요일">수</th>
                    <th scope="col" title="목요일">목</th>
                    <th scope="col" title="금요일">금</th>
                    <th scope="col" title="토요일" class="sat">토</th>
                </tr>
            </thead>
            <tbody>
            	<c:set var="idx" value="0"/>
            	<tr>
            	<c:if test="${resultList[0].dayweek > 1 }">
	            	<c:forEach begin="1" end="${resultList[0].dayweek - 1}" varStatus="status">
	            		<td></td>
	            		<c:set var="idx" value="${idx + 1 }"/>
	            	</c:forEach>
            	</c:if>
            	<c:forEach begin="0" end="${fn:length(resultList) - 1}" varStatus="status">
            		<c:if test="${resultList[status.current].dayweek == 1}"><tr></c:if>
            		<td>
            			<div class="day">

                            <p>${resultList[status.current].days} <span style="font-size:16px;color:red"><br/>${resultList[status.current].holiday }</span></p>
                            <div class="btn_areaC1">
                            	
                            	<c:if test="${resultList[status.current].idx != '' && resultList[status.current].idx != null}">
                            	
	                            	<c:set var="idxs" value="${fn:split(resultList[status.current].idx,'|')}"/>
	                            	<c:set var="name_kos" value="${fn:split(resultList[status.current].name_ko,'|')}"/>
	                            	<c:set var="impl_status" value="${fn:split(resultList[status.current].implementsStatusName,'|')}"/>
	                            	<c:set var="divi_status" value="${fn:split(resultList[status.current].event_division_idx,'|')}"/>
	                            
	                            	<c:forEach begin="0" end="${fn:length(idxs)-1}" varStatus="resStatus"> 
	                                	<div class="cal_inner_01">
		                                	
											<a style="<c:choose>
											<c:when test="${impl_status[resStatus.current] == '추진중' }">background:#f85151; color:#fff;</c:when>
											<c:when test="${impl_status[resStatus.current] == '유치확정' }">background:#0272c9; color:#fff;</c:when>
											<c:when test="${impl_status[resStatus.current] == '확정' && divi_status[resStatus.current] == '22' }">background:#38983a;color:#fff;</c:when>
											<c:when test="${impl_status[resStatus.current] == '확정' && divi_status[resStatus.current] != '22' }">background:#0272c9;color:#fff;</c:when>
											<c:when test="${impl_status[resStatus.current] == '실패/보류' }">background:#999; color:#555;</c:when> 
											</c:choose>" href="/crm/event/info.do?idx=${idxs[resStatus.index] }">${name_kos[resStatus.index]}
											</a>
											
											<dl class="tooltip_area">
												<dt><a href="/crm/event/info.do?idx=${idxs[resStatus.index] }">${name_kos[resStatus.index]}</a></dt>
												<dd><a href="/crm/event/info.do?idx=${idxs[resStatus.index] }">more</a></dd>
											</dl>
											
											<script>
											/*
												$(".cal_inner_01").hover(
													function() {
													   $(this).children('.tooltip_area').show();
													},
													function(){
													   $(this).children('.tooltip_area').hide();
													}
												);
											*/
											</script>
											
	                                	</div>
	                                </c:forEach>
	                                
                            	</c:if>
                            </div>
						</div>

            		</td>
            		<c:if test="${resultList[status.current].dayweek == 7}"></tr></c:if>
            		
				</c:forEach>
            	
            	
            	<c:forEach begin="${resultList[fn:length(resultList)].dayweek }" end="7" varStatus="status">
            		<td></td>
            	</c:forEach>
            	
            	</tr>
            	
                
            </tbody>
        </table>
        
        
        
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>