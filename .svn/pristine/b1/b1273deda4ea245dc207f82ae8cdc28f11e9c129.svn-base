<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$.jqplot.config.enablePlugins = true;
        var s1 = [2, 6, 7, 10, 10, 10, 10, 10, 10, 10, 10, 10];
        var s2 = [2, 6, 7, 10, 10, 10, 10, 10, 10, 10, 10, 10];
        var ticks = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
         
        plot1 = $.jqplot('chart1', [s1,s2], {
            // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
            animate: !$.jqplot.use_excanvas,
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                pointLabels: { show: true }
            },
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks
                }
            },
            highlighter: { show: false }
        });
     
        $('#chart1').bind('jqplotDataClick', 
            function (ev, seriesIndex, pointIndex, data) {
                $('#info1').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
            }
        );
	});
</script>
<script type="text/javascript" src="/plugin/jqplot/dist/jquery.jqplot.js"></script>
<script type="text/javascript" src="/plugin/jqplot/dist/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/plugin/jqplot/dist/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="/plugin/jqplot/dist/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/plugin/jqplot/dist/plugins/jqplot.pointLabels.js"></script>
<link rel="stylesheet" type="text/css" href="/plugin/jqplot/dist/jquery.jqplot.css" />

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>컨벤션CRM관리 > 통계</h3>
	<section class="sect_nonetit">
		<h4>정보</h4>
		<form name="form" action="/crm/event/list.do" method="post" enctype="multipart/form-data">
		<input name="excel" type="file" style="width:0px"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		<table width="100%" cellpadding="8" class="adm_tbl2" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="10%"/>
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">장소</th>
				<td>
					<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="searchPlaceIdx" />
						<c:param name="type" value="장소" />
						<c:param name="result" value="${vo.searchPlaceIdx }"/>
					</c:import>
				</td>
				<th scope="row">담당자</th>
				<td>
					<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
						<c:param name="name" value="attract_staff_id" />
						<c:param name="result" value="myid" />
					</c:import>
				</td>
				<th scope="row">통계 기간</th>
				<td>
					<input name="searchStasticsStartDate" type="text" class="datepicker" size="9" value="${vo.searchRentStartDate }"/> ~
					<input name="searchStasticsEndDate" type="text" class="datepicker" size="9" value="${vo.searchRentEndDate }"/>
				</td>
				<td>
					<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</td>
			</tr>
			</tbody>
		</table>
		</form>
		<br/>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="adm_tbl1">
			<caption>상세</caption>
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">전체참가자수</th>
					<td style="text-align: right"></td>
					<th scope="row">외국인수</th>
					<td style="text-align: right"></td>
					<th scope="row">내국인수</th>
					<td style="text-align: right"></td>
					<th scope="row"></th>
					<td style="text-align: right"></td>
				</tr>
				<tr>
					<th scope="row">전시부스</th>
					<td style="text-align: right"></td>
					<th scope="row">전시면적</th>
					<td style="text-align: right"></td>
					<th scope="row"></th>
					<td style="text-align: right"></td>
					<th scope="row"></th>
					<td style="text-align: right"></td>
				</tr>
				<tr>
					<th scope="row">임대매출</th>
					<td style="text-align: right"></td>
					<th scope="row">식음매출</th>
					<td style="text-align: right"></td>
					<th scope="row">AV 및 렌탈매출</th>
					<td style="text-align: right"></td>
					<th scope="row">관리비 매출</th>
					<td style="text-align: right"></td>
				</tr>
				<tr>
					<th scope="row">총매출</th>
					<td style="text-align: right"></td>
					<th scope="row">가동률(면적)</th>
					<td style="text-align: right"></td>
					<th scope="row">가동률(매출)</th>
					<td style="text-align: right"></td>
					<th scope="row">견적금액</th>
					<td style="text-align: right"></td>
				</tr>
				<tr>
					<th scope="row">가동률(실내전시장면적)</th>
					<td style="text-align: right"></td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="adm_tbl1">
			<tbody>
				<tr>
					<th>행사장별 가동률
					</th>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<tbody>
								<tr>
									<th>101</th>
									<td></td>
									<th>201</th>
									<td></td>
									<th>300A</th>
									<td></td>
								</tr>
								<tr>
									<th>102</th>
									<td></td>
									<th>202</th>
									<td></td>
									<th>300B</th>
									<td></td>
								</tr>
								<tr>
									<th>103</th>
									<td></td>
									<th>203</th>
									<td></td>
									<th>300C</th>
									<td></td>
								</tr>
								<tr>
									<th>104</th>
									<td></td>
									<th>204</th>
									<td></td>
									<th>3층 로비</th>
									<td></td>
								</tr>
								<tr>
									<th>105</th>
									<td></td>
									<th>205</th>
									<td></td>
									<th>3층 VIP대기실</th>
									<td></td>
								</tr>
								<tr>
									<th>106</th>
									<td></td>
									<th>206</th>
									<td></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>실내전시실 A</th>
									<td></td>
									<th>S207 (구VIP1)</th>
									<td></td>
									<th>4층 레스토랑</th>
									<td></td>
								</tr>
								<tr>
									<th>실내전시실 B</th>
									<td></td>
									<th>S208 (구VIP2)</th>
									<td></td>
									<th>4층 라운지</th>
									<td></td>
								</tr>
								<tr>
									<th>실외전시장</th>
									<td></td>
									<th>2층 로비</th>
									<td></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>1층 로비</th>
									<td></td>
									<th>2층 회의라운지</th>
									<td></td>
									<th>주최자 사무실 11</th>
									<td></td>
								</tr>
								<tr>
									<th>1층 회의 라운지</th>
									<td></td>
									<th>2층 VIP라운지</th>
									<td></td>
									<th>주최자 사무실 22</th>
									<td></td>
								</tr>
								<tr>
									<th>1층 VIP대기실</th>
									<td></td>
									<th></th>
									<td></td>
									<th>주최자 사무실 33</th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="adm_tbl1">
			<tbody>
				<tr>
					<th>월별 현황
					</th>
				</tr>
				<tr>
					<td>
					<div id="chart1" style="width:100%; height:260px;">
					</div>
					<p id ="info1"></p>
					</td>
				</tr>
			</tbody>
		</table>
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>