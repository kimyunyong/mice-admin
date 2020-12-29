<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<jsp:useBean id="toDay" class="java.util.Date" />

<style type="text/css">
  @media print { @page rotated {size:landscape} }
  .BreakAfter { page-break-after: always; }
  body { font-size:8px}
  
.c_tit { text-align:center; font-size:18px; font-weight:bold; font-wegiht:bold; color:#000; line-height:25px;  }
.calendar_tbl .cal_inner_01{ font-size:10px; }

table.calendar_tbl2 thead th{
	font-size:14px; 
	font-weight:bold;
	text-align: center;
	background: #666; 
	padding:10px 0px;
	color:#fff;
	border: 1px solid #666;
}
table.calendar_tbl2 tbody td{
	padding:5px;
	border: 1px solid #e1e1e1;
	background-color: #fff;
	vertical-align: top;
	height:90px;
	min-height: 133px;
}
.day p { color:#000; font-size:10px; font-weight:bold; }
.day span { font-size:6px; color:red; font-weight:normal;}
.cal_inner_01 { font-size:8px; }
</style> 

<script>
 $(document).ready(function(){
	 offBreak(); 
 });
function offBreak() {
//oPrgrph.style.pageBreakAfter="";
window.print();
}

</script>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="">
			<tbody>
			<tr>
				<td class="c_tit">${result.searchYear }년 ${result.searchMonth}월</td>
			</tr>
			</tbody>
		</table>



        <table width="100%" border="1" cellpadding="0" cellspacing="0" class="calendar_tbl2">
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
                    <th scope="col" title="일요일">일</th>
                    <th scope="col" title="월요일">월</th>
                    <th scope="col" title="화요일">화</th>
                    <th scope="col" title="수요일">수</th>
                    <th scope="col" title="목요일">목</th>
                    <th scope="col" title="금요일">금</th>
                    <th scope="col" title="토요일">토</th>
                </tr>
            </thead>
            <tbody>
            	<c:set var="idx" value="0"/>
            	<c:set var="dayWeekLoop" value="0"/>
            	<tr>
            	<c:if test="${resultList[0].dayweek > 1 }">
	            	<c:forEach begin="1" end="${resultList[0].dayweek - 1}" varStatus="status">
	            		<td></td>
	            		<c:set var="idx" value="${idx + 1 }"/>
	            	</c:forEach>
            	</c:if>
            	<c:forEach begin="0" end="${fn:length(resultList) - 1}" varStatus="status">
            		<c:choose>
            		<c:when test="${resultList[status.current].dayweek == 1 && dayWeekLoop == '1'}"><tr id="oPrgrph" style="page-break-after:always"></c:when>
            		<c:when test="${resultList[status.current].dayweek == 1 && dayWeekLoop != '1'}"><tr></c:when>
            		</c:choose>
            		<c:if test="${resultList[status.current].dayweek == 1}">
            			<c:set var="dayWeekLoop" value="${dayWeekLoop + 1 }"/>
            		</c:if>
            		<td>
            			<div class="day">
                            <p>${resultList[status.current].days} <span>${resultList[status.current].holiday }</span></p>
                            <div class="btn_areaC1">
                            	<c:if test="${resultList[status.current].idx != '' && resultList[status.current].idx != null}">
	                            	<c:set var="idxs" value="${fn:split(resultList[status.current].idx,'|') }"/>
	                            	<c:set var="name_kos" value="${fn:split(resultList[status.current].name_ko,'|') }"/>
	                            	<c:set var="impl_status" value="${fn:split(resultList[status.current].implementsStatusName,'|') }"/>
	                            	<c:forEach begin="0" end="${fn:length(idxs) }" varStatus="resStatus"> 
	                                	<div class="cal_inner_01">
	                                	${name_kos[resStatus.index]}
	                                	</div>
	                                </c:forEach>
                                </c:if>
                            </div>
                        </div>
            		</td>
            		<c:if test="${resultList[status.current].dayweek == 7}"></tr></c:if>
            		<c:set var="last_week" value="${resultList[status.current].dayweek}" />
				</c:forEach>
            	

            	<c:forEach begin="${last_week+1}" end="7" varStatus="status">
            		<td></td>
            	</c:forEach>
            	
            	</tr>
            	
                
            </tbody>
        </table>
        
               	  
        