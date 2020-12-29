<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

	
	
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리 <span>></span> PV/UV 정보</h3>
	<section class="sect_nonetit">
		<h4>로그 목록</h4>
		<table class="adm_tbl2" summary="요청ID, 발생일자, 메소드명, 처리구분, 처리시간, 요청자의 정보를 보여주는 시스템 로그 목록 테이블이다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구분(PV)</th>
			    	<th scope="col">1월</th>
			    	<th scope="col">2월</th>
			    	<th scope="col">3월</th>
			    	<th scope="col">4월</th>
			    	<th scope="col">5월</th>
			    	<th scope="col">6월</th>
			    	<th scope="col">7월</th>
			    	<th scope="col">8월</th>
			    	<th scope="col">9월</th>
			    	<th scope="col">10월</th>
			    	<th scope="col">11월</th>
			    	<th scope="col">12월</th>
			    	<th scope="col">계</th>
			  	</tr>
			</thead>
			<tbody>
				<tr>
					<td>CVB PV</td>
			    	<td>${JAN.CVB_PV }</td>
			    	<td>${FEB.CVB_PV }</td>
			    	<td>${MAR.CVB_PV }</td>
			    	<td>${APR.CVB_PV }</td>
			    	<td>${MAY.CVB_PV }</td>
			    	<td>${JUN.CVB_PV }</td>
			    	<td>${JUL.CVB_PV }</td>
			    	<td>${AUG.CVB_PV }</td>
			    	<td>${SEP.CVB_PV }</td>
			    	<td>${OCT.CVB_PV }</td>
			    	<td>${NOV.CVB_PV }</td>
			    	<td>${DEC.CVB_PV }</td>
			    	<td>${JAN.CVB_PV + FEB.CVB_PV + MAR.CVB_PV + APR.CVB_PV + MAY.CVB_PV + MAY.CVB_PV + JUN.CVB_PV + JUL.CVB_PV + AUG.CVB_PV + SEP.CVB_PV + OCT.CVB_PV + NOV.CVB_PV + DEC.CVB_PV }</td>
			  	</tr>
			  	<tr>
					<td>HICO PV</td>
			    	<td>${JAN.HICO_PV }</td>
			    	<td>${FEB.HICO_PV }</td>
			    	<td>${MAR.HICO_PV }</td>
			    	<td>${APR.HICO_PV }</td>
			    	<td>${MAY.HICO_PV }</td>
			    	<td>${JUN.HICO_PV }</td>
			    	<td>${JUL.HICO_PV }</td>
			    	<td>${AUG.HICO_PV }</td>
			    	<td>${SEP.HICO_PV }</td>
			    	<td>${OCT.HICO_PV }</td>
			    	<td>${NOV.HICO_PV }</td>
			    	<td>${DEC.HICO_PV }</td>
			    	<td>${JAN.HICO_PV + FEB.HICO_PV + MAR.HICO_PV + APR.HICO_PV + MAY.HICO_PV + MAY.HICO_PV + JUN.HICO_PV + JUL.HICO_PV + AUG.HICO_PV + SEP.HICO_PV + OCT.HICO_PV + NOV.HICO_PV + DEC.HICO_PV }</td>
			  	</tr>
			  	<tr>
					<td>계</td>
			    	<td>${JAN.CVB_PV + JAN.HICO_PV }</td>
			    	<td>${FEB.CVB_PV + FEB.HICO_PV }</td>
			    	<td>${MAR.CVB_PV + MAR.HICO_PV }</td>
			    	<td>${APR.CVB_PV + APR.HICO_PV }</td>
			    	<td>${MAY.CVB_PV + MAY.HICO_PV }</td>
			    	<td>${JUN.CVB_PV + JUN.HICO_PV }</td>
			    	<td>${JUL.CVB_PV + JUL.HICO_PV }</td>
			    	<td>${AUG.CVB_PV + AUG.HICO_PV }</td>
			    	<td>${SEP.CVB_PV + SEP.HICO_PV }</td>
			    	<td>${OCT.CVB_PV + OCT.HICO_PV }</td>
			    	<td>${NOV.CVB_PV + NOV.HICO_PV }</td>
			    	<td>${DEV.CVB_PV + DEC.HICO_PV }</td>
			    	<td>${JAN.CVB_PV + FEB.CVB_PV + MAR.CVB_PV + APR.CVB_PV + MAY.CVB_PV + MAY.CVB_PV + JUN.CVB_PV + JUL.CVB_PV + AUG.CVB_PV + SEP.CVB_PV + OCT.CVB_PV + NOV.CVB_PV + DEC.CVB_PV + JAN.HICO_PV + FEB.HICO_PV + MAR.HICO_PV + APR.HICO_PV + MAY.HICO_PV + MAY.HICO_PV + JUN.HICO_PV + JUL.HICO_PV + AUG.HICO_PV + SEP.HICO_PV + OCT.HICO_PV + NOV.HICO_PV + DEC.HICO_PV }</td>
			  	</tr>
			 </tbody>
		</table>
		<table width="100%" style="margin-top:5px;" cellpadding="8" class="adm_tbl2" summary="요청ID, 발생일자, 메소드명, 처리구분, 처리시간, 요청자의 정보를 보여주는 시스템 로그 목록 테이블이다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구분(UV)</th>
			    	<th scope="col">1월</th>
			    	<th scope="col">2월</th>
			    	<th scope="col">3월</th>
			    	<th scope="col">4월</th>
			    	<th scope="col">5월</th>
			    	<th scope="col">6월</th>
			    	<th scope="col">7월</th>
			    	<th scope="col">8월</th>
			    	<th scope="col">9월</th>
			    	<th scope="col">10월</th>
			    	<th scope="col">11월</th>
			    	<th scope="col">12월</th>
			    	<th scope="col">계</th>
			  	</tr>
			</thead>
			<tbody>
			  	<tr>
					<td>CVB UV</td>
			    	<td>${JAN.CVB_UV }</td>
			    	<td>${FEB.CVB_UV }</td>
			    	<td>${MAR.CVB_UV }</td>
			    	<td>${APR.CVB_UV }</td>
			    	<td>${MAY.CVB_UV }</td>
			    	<td>${JUN.CVB_UV }</td>
			    	<td>${JUL.CVB_UV }</td>
			    	<td>${AUG.CVB_UV }</td>
			    	<td>${SEP.CVB_UV }</td>
			    	<td>${OCT.CVB_UV }</td>
			    	<td>${NOV.CVB_UV }</td>
			    	<td>${DEC.CVB_UV }</td>
			    	<td>${JAN.CVB_UV + FEB.CVB_UV + MAR.CVB_UV + APR.CVB_UV + MAY.CVB_UV + MAY.CVB_UV + JUN.CVB_UV + JUL.CVB_UV + AUG.CVB_UV + SEP.CVB_UV + OCT.CVB_UV + NOV.CVB_UV + DEC.CVB_UV }</td>
			  	</tr>
			  	<tr>
					<td>HICO UV</td>
			    	<td>${JAN.HICO_UV }</td>
			    	<td>${FEB.HICO_UV }</td>
			    	<td>${MAR.HICO_UV }</td>
			    	<td>${APR.HICO_UV }</td>
			    	<td>${MAY.HICO_UV }</td>
			    	<td>${JUN.HICO_UV }</td>
			    	<td>${JUL.HICO_UV }</td>
			    	<td>${AUG.HICO_UV }</td>
			    	<td>${SEP.HICO_UV }</td>
			    	<td>${OCT.HICO_UV }</td>
			    	<td>${NOV.HICO_UV }</td>
			    	<td>${DEC.HICO_UV }</td>
			    	<td>${JAN.HICO_UV + FEB.HICO_UV + MAR.HICO_UV + APR.HICO_UV + MAY.HICO_UV + MAY.HICO_UV + JUN.HICO_UV + JUL.HICO_UV + AUG.HICO_UV + SEP.HICO_UV + OCT.HICO_UV + NOV.HICO_UV + DEC.HICO_UV }</td>
			  	</tr>
			  	<tr>
					<td>계</td>
			    	<td>${JAN.CVB_UV + JAN.HICO_UV }</td>
			    	<td>${FEB.CVB_UV + FEB.HICO_UV }</td>
			    	<td>${MAR.CVB_UV + MAR.HICO_UV }</td>
			    	<td>${APR.CVB_UV + APR.HICO_UV }</td>
			    	<td>${MAY.CVB_UV + MAY.HICO_UV }</td>
			    	<td>${JUN.CVB_UV + JUN.HICO_UV }</td>
			    	<td>${JUL.CVB_UV + JUL.HICO_UV }</td>
			    	<td>${AUG.CVB_UV + AUG.HICO_UV }</td>
			    	<td>${SEP.CVB_UV + SEP.HICO_UV }</td>
			    	<td>${OCT.CVB_UV + OCT.HICO_UV }</td>
			    	<td>${NOV.CVB_UV + NOV.HICO_UV }</td>
			    	<td>${DEV.CVB_UV + DEC.HICO_UV }</td>
			    	<td>${JAN.CVB_UV + FEB.CVB_UV + MAR.CVB_UV + APR.CVB_UV + MAY.CVB_UV + MAY.CVB_UV + JUN.CVB_UV + JUL.CVB_UV + AUG.CVB_UV + SEP.CVB_UV + OCT.CVB_UV + NOV.CVB_UV + DEC.CVB_UV + JAN.HICO_UV + FEB.HICO_UV + MAR.HICO_UV + APR.HICO_UV + MAY.HICO_UV + MAY.HICO_UV + JUN.HICO_UV + JUL.HICO_UV + AUG.HICO_UV + SEP.HICO_UV + OCT.HICO_UV + NOV.HICO_UV + DEC.HICO_UV}</td>
			  	</tr>
			 </tbody>
		</table>
		<form name="listForm" action="<c:url value='/log/info.do' />" method="get">
		<div class="brd_p" style="margin-top:50px">
				<label class="open" for="brdSelect1">조회기간</label>
				<input class="brdSelect1 datepicker" name="searchStartDate" type="text" size="10" value="${vo.searchStartDate}" placeholder="시작일 입력" />
				<label for="searchEndDeView">~</label>
			    <input class="brdSelect1 datepicker" name="searchEndDate" type="text" size="10" value="${vo.searchEndDate}" placeholder="종료일 입력" />  
				<div class="btn_areaR">
					<a class="btn2 clrGrad_Wgray" onclick="javascript:$('form').submit();">조회</a>
				</div>						
		</div>		
		</form>
		<table width="100%" cellpadding="8" class="adm_tbl2" summary="요청ID, 발생일자, 메소드명, 처리구분, 처리시간, 요청자의 정보를 보여주는 시스템 로그 목록 테이블이다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">CVB UV</th>
			    	<th scope="col">CVB PV</th>
			    	<th scope="col">HICO UV</th>
			    	<th scope="col">HICO PV</th>
			  	</tr>
			</thead>

			<tbody>
				<tr>
			    	<td>${vo.CVB_UV }</td>
			    	<td>${vo.CVB_PV }</td>
			    	<td>${vo.HICO_UV }</td>
			    	<td>${vo.HICO_PV }</td>
			  	</tr>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>
			
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>