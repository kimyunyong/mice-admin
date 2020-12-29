<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mice/include/header.jsp"%>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp"%>
<!-- get jQuery CDN -->
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp"%>
<style>
/* 	top_search(상단 검색 영역) */
div#top_search {
	width: 100%;
	border-top: 3px solid #BAB5B1;
	border-bottom: 3px solid #BAB5B1;
	/* 		border-top: 3px solid #1F6093; */
	/*  		border-bottom: 3px solid #1F6093; */
	overflow: visible;
}

/* 	top_search table 공통 요소 */
div#top_search table td,div#top_search table th {
	height: 30px;
	border-bottom: 1px dotted #BAB5B1;
	padding: 0px 5px 0px 5px;
	z-index: 0;
}

/* 	top_search table 제목	 */
div#top_search table th {
	text-align: center;
	color: #1C436C;
	border-right: 1px dotted #BAB5B1;
}

/* 	top_search table 내용영역 */
div#top_search table td {
	position: relative;
}

/* 	top_search 각각 버튼들의 부모 영역 */
div#top_search ul li {
	float: left;
	margin: 5px;
}

/* ---- top_search button 정의  ----*/
/* 	top_search 모든 버튼 */
div#top_search ul li button {
	padding: 3px;
	/*color: #616161;*/
	font-size: 0.9em;
}

/*  top_search 모든 버튼 hover */
div#top_search ul li button:HOVER {
	color: #FFFFFF;
	background: #1C436C;
}

/* 	top_search 팀 버튼 */
div#top_search ul#team_ul li button {
	width: 270px;
}

/* 	top_search 직원 버튼 */
div#top_search ul#emp_ul li button {
	width: 165px;
}

/* 	top_search 프로젝트 버튼 */
div#top_search ul#pro_ul li button {
	width: 457px;
}

/* 	top_search 카테고리 버튼 */
div#top_search ul#cate_ul li button {
	width: 130px;
}

/* 	top_search 카테고리, 폴더1, 폴더2 버튼*/
div#top_search ul#cate_ul li button,div#top_search ul#folder_1_ul li button,div#top_search ul#folder_2_ul li button,div#top_search ul#years_ul li button
	{
	width: 130px;
}

#emp_ul,#pro_ul,#cate_ul,#years_ul,#folder_1_ul,#folder_2_ul {
	display: none;
}

/* ---- //top_search button 정의  ----*/
button#close_btn {
	width: 10%;
	border-top: 1px solid #ffffff;
	border-radius: 0% 0% 18% 18%;
	z-index: 100;
	background: #FF4040;
	margin: 0 auto;
	margin-top: -7px;
	color: #ffffff;
	/* 		position: absolute; */
}

/* ---------------------------------------------------*/
/* ---------------------------------------------------*/

/*input 영역*/
.brd_p {
	margin: 20px 0px 0px 0px;
	padding: 3px;
	margin-bottom: 3px;
	width: 100%;
	box-sizing: border-box;
	border-top: 3px solid #b7b7b7;
	border-bottom: 3px solid #b7b7b7;
	
}

/*input영역의 table*/
table.input_tbl1 tr td {
	align: center;
}
/*검색버튼*/
.btn2 {
	background: #0B365D !important;
	color: #FFFFFF !important;
}

/*input 영역 밑 하단바*/
.bar_container {
	padding: 3px 0px 3px 0px;
	margin-bottom: 3px;
	width: 100%;
	box-sizing: border-box;
	border-top: 3px solid #1A394B;
	border-bottom: 3px solid #1A394B;
}
/*하단바의 table*/
.input_tbl2 {
	background-color: #1A394B;
}

table.input_tbl2 tr td {
	padding: 7px;
	color: #ffffff;
	font-size: 0.9em;
}

table tr td span.input_spot {
	color: #CAFFFF;
	display: inline;
	font-size: 0.9em;
}

/*선택항목 다운로드 버튼*/
.btn_left_area {
	padding: 10px 0px 10px 0px;
}
/*파일 테이블의 전체 영역*/
div#file_tbl_container {
	margin: 0px 0px 20px 0px;
	width: 100%;
}

div#file_tbl_container table {
	width: 49.8%;
	float: left;
}

div#file_tbl_container table:nth-child(1) {
	margin-right: 0.4%;
}

div#file_tbl_container table tr th {
	text-align: center;
	background: #595E64;
	color: #ffffff;
	padding: 3px;
	box-sizing: border-box;
}

div#file_tbl_container table tr td {
	padding: 3px;
	box-sizing: border-box;
	border-bottom: 1px solid #CCCCCC;
}

div#file_tbl_container table tr td:nth-child(1) {
	text-align: center;
	box-sizing: border-box;
}

div#file_tbl_container table tr td:nth-child(2) {
	text-align: center;
	box-sizing: border-box;
}

div#file_tbl_container table tr td:nth-child(4) {
	text-align: center;
	box-sizing: border-box;
}

div#file_tbl_container table tr td:nth-child(5) {
	text-align: center;
	box-sizing: border-box;
}

span {
	color: #ffffff;
}

.team_selected,.emp_selected,.pro_selected,.cate_selected,.years_selected,.folder_1_selected,.folder_2_selected
	{
	color: #ffffff;
	background: #1C436C;
}

a.async{
	display: none;
}
#bpopup{
	float: center;
	text-align: center;
	
}
table#Log_tbl{
    overflow:auto;
    align: center;
	width : 450px;
	height : 450px;
    padding: 3px;
    margin: 0px 0px 25px 130px;
    box-sizing: border-box;
	border: 1px solid #CCCCCC;
}
table#Log_tbl tr{
	width:100%;
}

table#Log_tbl tr th{
	text-align: center;
	color: #1C436C;
	border-bottom: 1px dotted #BAB5B1;
}
table#Log_tbl tr td{
	text-align: center;
	border-bottom: 1px solid #CCCCCC;
}


.file_tbl{
	text-align: center;
}
</style>
<!-- 180515 -->
<section id="contentArea">
	<h3>KMS</h3>
	<!-- 180104 -->
	
	<div class="wordnoti_area">
		총 <b>${count }</b>건이 검색되었습니다.
	</div>

	<!-- 상단 검색 영역 -->
	<div id="top_search">
		<table style="width: 100%">
			<colgroup>
				<col width="5%" />
				<col width="95%"/>
			</colgroup>

			<tr>
				<th>팀</th>
				<td>
					<ul id="team_ul">
						<c:forEach var="get" items="${getTeamList}">
							<li><button onclick="choice_team(this, ${get.team_idx}, '${get.team_name }')">${get.team_name }</button></li>
						</c:forEach>
					</ul>
				</td>
			</tr>

			<tr>
				<th>직원</th>
				<td>
					<ul id="emp_ul">
					</ul>
				</td>
			</tr>
			
			<tr>
				<th>프로젝트</th>
				<td>
					<ul id="pro_ul">

					</ul>
				</td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td>
					<ul id="cate_ul">
					</ul>
				</td>
			</tr>
			
			<tr>
				<th>연도</th>
				<td>
					<ul id="years_ul">
					</ul>
				</td>
			</tr>

			<tr>
				<th>1차 폴더</th>
				<td>
					<ul id="folder_1_ul">
					</ul>
				</td>
			</tr>

			<tr>
				<th>2차 폴더</th>
				<td>
					<ul id="folder_2_ul">
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<!-- // 검색 조건 -->
	<button id="close_btn">close</button>
	<form name="form" action="/crm/kms/list.do" method="post">
		<input name="pageIndex" type="hidden"value="<c:out value='${vo.pageIndex}'/>" /> 
		
		<div class="brd_p">
			<table width="100%" class="input_tbl1" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td height="10" width="5%">업로드 기간</td>
					
					<td height="10" width="15%"><input type="text"
						class="datepicker" name="startDate" value="${vo.startDate }" /> &nbsp 부터 </td>
					
					<td height="10" width="15%"><input type="text"
						class="datepicker" name="endDate" value="${vo.endDate }" /> &nbsp 까지 </td>

					<td height="10" width="3%">팀</td>
					
					<td height="10" width="10%">
						<c:import
							url="/crm/code/select_box3.do" charEncoding="utf-8">
							<c:param name="name" value="team_idx" />
							<c:param name="type" value="팀" />
							<c:param name="result" value="${vo.team_idx }" />
						</c:import>
					</td>
					
					<td height="10" width="3%">직원</td>
					<td height="10" width="10%"><c:import
							url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="emp_idx" />
							<c:param name="result" value="${vo.emp_idx }" />
						</c:import>
					</td>

					<td height="10" width="5%">파일 명</td>
					<td height="10" width="20%"><input size="37"
						name="search_name" type="text" value="${vo.search_name }"
						maxlength="35" title="">&nbsp;&nbsp;</td>
					<td height="10" width="10%"><a class="btn2" id="btnSearch">검색</a></td>
				</tr>
			</table>
		</div>
	
		<div class="bar_container">
			<table width="100%" class="input_tbl2" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td align="left"><span class="team_span"></span> <span
						class="emp_span"></span> <span class="pro_span"></span> <span
						class="cate_span"></span> <span class="years_span"></span> <span
						class="folder_1_span"></span> <span class="folder_2_span"></span></td>
					<td align="right" class="count">총${count }개 파일</td>
				</tr>
			</table>
		</div>
	
		<div class="btn_left_area">
			<a class="sbtn01" id="btnFileDownload" onclick="javascript:downloadFile();">선택항목다운로드</a>
			<a class="sbtn01 sync" onclick="javascript:deleteFile('sync');">삭제</a>
			<a class="sbtn01 async" onclick="javascript:deleteFile('async');">삭제</a>
		</div>
			
		<div id="file_tbl_container">
			<input name="checkedIdForFileId" type="hidden" />
			
			<c:set var="num" value="${paginationInfo.totalRecordCount + paginationInfo.recordCountPerPage - paginationInfo.currentPageNo * paginationInfo.recordCountPerPage}" />
			
			<table id="file_tbl_col_1" class="file_tbl">
				<colgroup>
					<col width="3%" />
					<col width="3%" />
					<col width="10%"/>
					<col width="10%" />
					<col width="5%" />
					<col width="10%" />
					<col width="8%" />
				</colgroup>
				<tr>
					<th><input type="checkbox" name="checker"/></th>
					<th>순번</th>
					<th>파일명</th>
					<th>팀</th>
					<th>직원</th>
					<th>업로드날짜</th>
					<th>다운로드이력</th>
				</tr>
			
				<c:forEach var="file" items="${getFileList}" varStatus="status">
					<c:if test="${status.index < 10}">
						<tr>
							<td>
		                        <input name="checkField" type="checkbox"/>
		                        <input name="checkId" type="hidden" value="<c:out value='${file.atchFileId}'/>"/>
	         					<input name="file_team_idx" type="hidden" value="${file.team_idx}"/>
	         					<input name="file_emp_idx" type="hidden" value="${file.emp_idx}"/>
	         					<input name="file_team_name" type="hidden" value="${file.team_name}"/>
	         					<input name="file_orignlFileNm" type="hidden" value="${file.orignlFileNm}"/>
	                    	</td>
	                    	
							<td><c:out value="${(num) - status.index}" /></td>
							<td>${file.orignlFileNm }</td>
							<td>${file.team_name }</td>
							<td>${file.emp_name }</td>
							<td>${fn:substring(file.reg_date,0,10) }</td>
							<td><a onclick=" log_look('${file.atchFileId}');" >[보기]</a></td>
						</tr>
					</c:if>
				</c:forEach>
				
				<c:if test="${empty getFileList}">
					<tr>
						<td colspan="7">---- 검색 내역이 없습니다. ----</td>
					</tr>
				</c:if>
			</table>
			
			<table id="file_tbl_col_2" class="file_tbl">
				<colgroup>
					<col width="3%" />
					<col width="3%" />
					<col width="10%"/>
					<col width="10%" />
					<col width="5%" />
					<col width="10%" />
					<col width="8%" />
				</colgroup>
				<tr>
					<th><input type="checkbox" name="checker"/></th>
					<th>순번</th>
					<th>파일명</th>
					<th>팀</th>
					<th>직원</th>
					<th>업로드날짜</th>
					<th>다운로드이력</th>
				</tr>
				
				<c:forEach var="file" items="${getFileList}" varStatus="status">
					<c:if test="${status.index >= 10}">
						<tr>
							<td>
		                        <input name="checkField" type="checkbox"/>
		                        <input name="checkId" type="hidden" value="<c:out value='${file.atchFileId}'/>"/>
	         					<input name="file_team_idx" type="hidden" value="${file.team_idx}"/>
	         					<input name="file_emp_idx" type="hidden" value="${file.emp_idx}"/>
	         					<input name="file_team_name" type="hidden" value="${file.team_name}"/>
	         					<input name="file_orignlFileNm" type="hidden" value="${file.orignlFileNm}"/>
	                    	</td>
							<td><c:out value="${(num) - status.index}" /></td>
							<td>${file.orignlFileNm }</td>
							<td>${file.team_name }</td>
							<td>${file.emp_name }</td>
							<td>${fn:substring(file.reg_date,0,10) }</td>
							<td><a onclick=" log_look('${file.atchFileId}'); ">[보기]</a></td>
						</tr>
					</c:if>
				</c:forEach>
				
				<c:if test="${empty getFileList}">
					<tr>
						<td colspan="7">---- 검색 내역이 없습니다. ----</td>
					</tr>
				</c:if>
			</table>
			
			<div id="pagination_info" align="center">
				<div style="width: 800px; padding: 20px;" id="pagination">	<!-- 20180528 페이징이 2이상일 경우 아래로 떨어지는 현상 방지 -->
					<ui:pagination paginationInfo="${paginationInfo}" type="text"
						jsFunction="fnLinkPage" />
				</div>
			</div>
		</div>
	</form>
	
	<div id="bpopup" style="display: none; background-color: white; width: 700px; height: 600px;">
	  	<h5 class="s_tit">다운로드 내역<h5>
		<table id="Log_tbl">
					
		</table>
		<a class="btn1 clr_Wgray" id="btn_close" onclick="win_close();">닫기</a>
	</div>
</section>
<!-- // 180515 -->

<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp"%>
<script>
	//동기화 게시판 페이지 링크
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.submit();
	}
	
	// 검색 버튼
	$("#btnSearch").click(function(){
		document.form.action = "/crm/kms/list.do";
	    document.form.submit();
	});
	
	var getPositionIdx = ''; // Login 회원의 직책 인덱스
	var getUserId = '';	// Login 회원의 아이디
	var getTeamIdx = '';	// Login 회원의 팀 인덱스
	
	var curr_choice_type ='';	// 최종 선택한 폴더 타입 (팀 / 직원 / 프로 / 카테 / 연도 / 1차폴더 / 2차폴더)
	
	var curr_choice_team = '';	// 선택한 팀 인덱스
	var curr_choice_emp = '';	// 선택한 직원 인덱스
	var curr_choice_pro = '';	// 선색한 프로젝트 인덱스
	var curr_choice_years = '';	// 선택한 연도 인덱스
	var curr_choice_cate = '';	// 선택한 카테고리 인덱스
	var curr_choice_folder_1 = '';	// 선택한 1차 폴더 인덱스
	var curr_choice_folder_2 = '';	// 선택한 2차 폴더 인덱스
	
	var board_html = '';		// 게시물 출력 변수
	var board_att_html = '';	// 게시물 속성 출력 변수
	
	var curr_page = '';
	
	// selectBox  전체 선택
	$(document).ready(function(){
		$(document).on("change","input[name=checker]",function() {
			var checked = $('input[name=checker]').is(':checked');
			$('input[name=checkField]').each(function(){
				this.checked = checked;
			});
		});
	});
	
	// 비동기 파일 게시판 row개수 출력
	function printCount(data){
		if(data.count){
			$('.wordnoti_area').html("총 <b>"+ data.count +"</b>건이 검색되었습니다.");
			$('.count').html("총 " + data.count + "개 파일");
		}else{
			$('.wordnoti_area').html("총 <b>0</b>건이 검색되었습니다.");
		}
	}
	
	function getFileBoardAtt(){
		var result = '<colgroup>'
			+	'<col width="3%" />'
			+	'<col width="3%" />'
			+	'<col width="10%"/>'
			+	'<col width="10%" />'
			+	'<col width="5%" />'
			+	'<col width="10%" />'
			+	'<col width="8%" />'
			+	'</colgroup>'
			+	'<tr>'
			+		'<th><input type="checkbox" name="checker"/></th>'
			+		'<th>순번</th>'
			+		'<th>파일명</th>'
			+		'<th>팀</th>'
			+		'<th>직원</th>'
			+		'<th>업로드날짜</th>'
			+		'<th>다운로드이력</th>'
			+	'</tr>';
			
		return result;
	}
	
	// 비동기 파일 게시판 출력
	function printFileBoard(data){
		$('#file_tbl_container').css("display", "block");
		$('#pagination').html("");
		
		$('#btn_left_area').css("display", "block");
 		$('.file_tbl').html("");
		$('.async').css('display', 'inline-block');
 		
		// 비동기 파일 게시물 속성 가져오기
		board_html = getFileBoardAtt();
		
		// 게시물이 없을 경우..
		if(data.getFileList.length == 0){
			board_html += '<tr>'
				+	'<td colspan="7">---- 검색 내역이 없습니다. ----</td>'
				+	'</tr>';
		}
		
		var cnt = 0; // 왼쪽 테이블 row 카운트
		var num = data.totalRecordCount + data.recordCountPerPage - data.currentPageNo * data.recordCountPerPage;	// 순번 처리
		var temp_cnt = 0;	// 오른쪽 테이블 row 카운트
		
		for(var i=0; i<data.getFileList.length; i++){
			if(i < 10){
				board_html +=
						+ '<tr>'
						+		'<td>'
						+    		'<input name="checkField" type="checkbox" />'
						+	    	'<input name="checkId" type="hidden" value="' + data.getFileList[i].atchFileId + '"/>'		// 파일 아이디
						+		    '<input name="file_team_idx" type="hidden" value="' + data.getFileList[i].team_idx + '"/>'	// 파일 팀 인덱스
						+		    '<input name="file_emp_idx" type="hidden" value="' + data.getFileList[i].emp_idx + '"/>'	// 파일 직원 인덱스 
						+		    '<input name="file_team_name" type="hidden" value="' + data.getFileList[i].team_name + '"/>'	// 파일 팀 이름 
						+		    '<input name="file_orignlFileNm" type="hidden" value="' + data.getFileList[i].orignlFileNm + '"/>'	// 파일 오리지널 이름
						+		'</td>'
						+		'<td>' + (num - i) + '</td>'	// 순번
						+		'<td>' + data.getFileList[i].orignlFileNm + '</td>'	// 파일 오리지널 이름
						+		'<td>' + data.getFileList[i].team_name + '</td>'	// 파일 팀이름
						+		'<td>' + data.getFileList[i].emp_name + '</td>'		// 파일 직원 이름
						+		'<td>' + data.getFileList[i].reg_date.substring(0, 10) + '</td>'	// 파일 등록일
						+		'<td><a onclick=" log_look(\''+data.getFileList[i].atchFileId+'\'); ">[보기]</a></td>'
						+	'</tr>';
				cnt++;
			}
		}
		
		// 비동기 파일 게시물 출력
		$('#file_tbl_col_1').append(board_html);
		
		// 비동기 파일 게시물 속성 가져오기
		board_html = getFileBoardAtt();
		
		// 검색 내역이 없을때..
		if(data.getFileList.length == 0){
			board_html += '<tr>'
				+	'<td colspan="7">---- 검색 내역이 없습니다. ----</td>'
				+	'</tr>';
		}
		
		num = num - cnt;
		
		for(var i=cnt; i<data.getFileList.length; i++){
			board_html +=
				+ '<tr>'
				+		'<td>'
				+    		'<input name="checkField" type="checkbox" />'
				+	    	'<input name="checkId" type="hidden" value="' + data.getFileList[i].atchFileId + '"/>'
				+		    '<input name="file_team_idx" type="hidden" value="' + data.getFileList[i].team_idx + '"/>'
				+		    '<input name="file_emp_idx" type="hidden" value="' + data.getFileList[i].emp_idx + '"/>'
				+		    '<input name="file_team_name" type="hidden" value="' + data.getFileList[i].team_name + '"/>'
				+		    '<input name="file_orignlFileNm" type="hidden" value="' + data.getFileList[i].orignlFileNm + '"/>'				
				+		'</td>'
				+		'<td>' + (num - temp_cnt) + '</td>'
				+		'<td>' + data.getFileList[i].orignlFileNm + '</td>'
				+		'<td>' + data.getFileList[i].team_name + '</td>'
				+		'<td>' + data.getFileList[i].emp_name + '</td>'
				+		'<td>' + data.getFileList[i].reg_date.substring(0, 10) + '</td>'
				+		'<td><a onclick=" log_look(\''+data.getFileList[i].atchFileId+'\'); ">[보기]</a></td>'
				+	'</tr>';
				
				temp_cnt++;
		}
		
		// 비동기 파일 게시물 출력
		$('#file_tbl_col_2').append(board_html);
		
		// 비동기 파일 게시물 row 수 출력
		printCount(data);
/* -------------------------------------- 비동기 게시물 페이징 처리(20180605) ------------------------------------------------*/
				
		if(data.lastIndex > 10){
			Math.floor(data.currentPageNo / 10) == 0 ? 
					$('#pagination').append("<a onclick='javascript:linkPage(" + 1 + ")';>[처음]</a>" 
						+ "<a onclick='javascript:linkPage(" + 1 + ")'>[이전]</a>")
					: $('#pagination').append("<a onclick='javascript:linkPage(" + data.firIndex + ")';>[처음]</a>" 
						+ "<a onclick='javascript:linkPage(" + ((Math.floor(data.currentPageNo / 10) - 1) * 10 + 1) + ")'>[이전]</a>");
					
		}
		
		for(var i=data.startPage; i<=data.endPage; i++){
			if(data.currentPageNo == i){
				$('#pagination').append(i);
			};
			
			if(data.currentPageNo != i){
				$('#pagination').append("<a onclick='javascript:linkPage(" + i + ")';>" + i + "</a>");
			};
		}
		if(data.lastIndex > 10){
			Math.floor(data.currentPageNo / 10) == Math.floor(data.lastIndex / 10) ? 
					$('#pagination').append("<a onclick='javascript:linkPage(" + data.lastIndex + ")'>[다음]</a>" + "<a onclick='javascript:linkPage(" + data.lastIndex + ")';>[마지막]</a>")
			: $('#pagination').append("<a onclick='javascript:linkPage(" + ((Math.floor(data.currentPageNo / 10) + 1) * 10 + 1) + ")'>[다음]</a>" + "<a onclick='javascript:linkPage(" + data.lastIndex + ")';>[마지막]</a>");
			
		}
		
		curr_page = data.currentPageNo;
	}
	
	function linkPage(page){
		switch(curr_choice_type){
		case "pro" :
			var map = {
				pageIndex : page,
				team_idx : curr_choice_team, 
				emp_idx : curr_choice_emp, 
				project_code : curr_choice_pro,
				category_code : '0',
				years_code : '0',
				folder_1_code : '0',
				folder_2_code : '0'
			};
			
			getBoardList(map);
			
			break;
			
		case "cate":
			var map = {
				pageIndex : page,
				team_idx : curr_choice_team, 
				emp_idx : curr_choice_emp, 
				project_code : curr_choice_pro, 
				category_code : curr_choice_cate,
				years_code : '0',
				folder_1_code : '0',
				folder_2_code : '0'
			};
			
			getBoardList(map);
			break;
			
		case "years":
			var map = {
				pageIndex : page,
				team_idx : curr_choice_team, 
				emp_idx : curr_choice_emp, 
				project_code : curr_choice_pro, 
				category_code : curr_choice_cate,
				years_code : curr_choice_years,
				folder_1_code : '0',
				folder_2_code : '0'
			};
			
			getBoardList(map);
			
			break;
			
		case "folder_1":
			var map = {
				pageIndex : page,
				team_idx : curr_choice_team, 
				emp_idx : curr_choice_emp, 
				project_code : curr_choice_pro, 
				category_code : curr_choice_cate,
				years_code : curr_choice_years,
				folder_1_code : curr_choice_folder_1,
				folder_2_code : '0'
			};
			
			getBoardList(map);
			
			break;
			
		case "folder_2":
			var map = {
				pageIndex : page,
				team_idx : curr_choice_team, 
				emp_idx : curr_choice_emp, 
				project_code : curr_choice_pro, 
				category_code : curr_choice_cate,
				years_code : curr_choice_years,
				folder_1_code : curr_choice_folder_1,
				folder_2_code : curr_choice_folder_2
			};
			
			getBoardList(map);
			
			break; 
		}
	}
	
	function getBoardList(map){
		 $.ajax({
		 	url:'/crm/kms/asyncList.do',
	        type:'post',
	        dataType: 'json',
	        data: map,
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	printFileBoard(data);
	        }
		 });
	}
	
/* ----------------------// 비동기 게시물 페이징 종료 ----------------------------------------------------------- */
	
	
	var checkedIds = '';
	var count = 0;
	function download(){
		var idxArr = checkedIds.split(",");
		
		if(count < idxArr.length){
			location.href = "/crm/kms/downloadFile.do?atchFileId=" + idxArr[count++] + "&fileSn=";
			setTimeout(function(){
				download();
				}, 1000);
		}else{
			count = 0;
			checkedIds = '';
		}
	}
	
	function downloadFile() {
		var checkField = document.form.checkField;
	    var fileDirIdx = document.form.checkId;
	    var fileTeamIdx = document.form.file_team_idx;
	    var fileEmpIdx = document.form.file_emp_idx; 
	    var fileTeamName = document.form.file_team_name;
	    var fileName = document.form.file_orignlFileNm;
	    
	    checkedIds = "";
	    var checkedCount = 0;
	    	    	    
	    if(checkField) {
	    	if(checkField.length > 1) {
	            for(var i=0; i < checkField.length; i++) {
	            	if(checkField[i].checked){
           				checkedIds += ((checkedCount==0? "" : ",") + fileDirIdx[i].value);
	                    checkedCount++;	                   	
	            	};	// if
	            };	// for
	           
	        } else {
	            if(checkField.checked) {
	                checkedIds = fileDirIdx.value;
	            };	// if
	        };	// else
	    }
	    
	 	if(checkedIds.length > 0) {	    		
	 		download(checkedIds);
	 		insertDownloadLog(checkedIds);
    	};	// if
	}
	
	function insertDownloadLog(checkedIds){
		$.ajax({
		 	url:'/crm/kms/downloadFileLog.do',
	        type:'post',
	        dataType: 'json',
	        data: {checkedIdForFileId : checkedIds},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	
	        }
		 });
	}
	
	function deleteFile(type){
		var checkField = document.form.checkField;
		
	    var fileDirIdx = document.form.checkId;
	    var fileTeamIdx = document.form.file_team_idx;
	    var fileEmpIdx = document.form.file_emp_idx; 
	    var fileTeamName = document.form.file_team_name;
	    var fileName = document.form.file_orignlFileNm;
	   	
	    var notDeleteCount = 0;
	    
	    var checkedIds = "";
	    var checkedCount = 0;
	    
	    if(type=="sync"){
	    	// 동기화 삭제 권한을 위한 변수
		    getPositionIdx = "${getUserInfo.position}";	// 직책 인덱스
			getUserId = "${getUserInfo.emplyrId}";	// session_아이디
			getTeamIdx = "${getUserInfo.team_idx}";	// 팀 인덱스
	    }
	    	    
	    if(checkField) {
	    	if(checkField.length > 1) {
	            for(var i=0; i < checkField.length; i++) {
	            	if(checkField[i].checked){
	            		if(getTeamIdx == fileTeamIdx[i].value) {
		            		// 235 == 팀장
		            		if(getUserId == fileEmpIdx[i].value || getPositionIdx == '235' || fileEmpIdx[i].value == '공용폴더'){
		            			checkedIds += ((checkedCount==0? "" : ",") + fileDirIdx[i].value);
			                    checkedCount++;
		            		}else{
		            			notDeleteCount++;
		            		};	// if~else
	            		}else{
	            			notDeleteCount++;
	            		}; // if~else
	            	};	// if
	            };	// for
	        } else {
	            if(checkField.checked) {
	                checkedIds = fileDirIdx.value;
	            };	// if
	        };	// else
	    }
		
	    if(notDeleteCount){
	    	alert('삭제 권한이 없는 파일 수 : ' + notDeleteCount);
	    	notDeleteCount = 0;
	    }
		
	    if(type == "sync"){
		    if(checkedIds.length > 0) {
		    	if(confirm("<spring:message code="common.delete.msg" />")){
		    	    document.form.checkedIdForFileId.value = checkedIds;
		    	    document.form.action = "<c:url value='/crm/kms/deleteFile.do'/>";
		    		document.form.submit();
		    	};
		    };
	    }else if(type == "async"){
			
	    	if(curr_choice_pro == ''){
				curr_choice_pro = '0';
			}
			if(curr_choice_cate == ''){
				curr_choice_cate = '0';
			}
			if(curr_choice_years == ''){
				curr_choice_years = '0';
			}
			if(curr_choice_folder_1 == ''){
				curr_choice_folder_1 = '0';
			}
			if(curr_choice_folder_2 == ''){
				curr_choice_folder_2 = '0';
			}
			
	    	if(checkedIds.length > 0) {
		    	if(confirm("<spring:message code="common.delete.msg" />")){
		    	    $.ajax({
		    	        url:'/crm/kms/deleteFileAsync.do',
		    	        type:'post',
		    	        dataType: 'json',
		    	        data:{checkedIdForFileId : checkedIds, 
			    	        team_idx : curr_choice_team, 
				        	emp_idx : curr_choice_emp, 
				        	project_code : curr_choice_pro, 
				        	category_code : curr_choice_cate,
				        	years_code : curr_choice_years,
				        	folder_1_code : curr_choice_folder_1,
				        	folder_2_code : curr_choice_folder_2,
				        	pageIndex : curr_page
				        	},
		    	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		    	        error : function(){
		    				alert('삭제 실패.. 잘못 된 접근입니다.');
		    	        },
		    	        success:function(data){
		    	        	printFileBoard(data);
		    	        }	// success
		    	    });	// ajax	
	    	 	};	// if
	    	};	// if
		};	// else if
	
	}
	
	/* --------------------------------------- 상단 메뉴 처리 -----------------------------------------*/
	// (20180528 김윤용 메모 - 시간이 주어진다면 refectoring..)
	// 1. 차후 메소드 추출을 통해 공통 로직을 들어 낼 필요가 있음.
	// 2. 아래 변수를 배열 또는 map 구현/사용을 통해 개선 필요.
	
	function choice_team(obj, team_idx, team_name){
	    $.ajax({
	        url:'/crm/kms/getEmpByTeam.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : team_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	curr_choice_team = team_idx;
	        	curr_choice_type = 'team';
	        	
	        	$('.sync').css('display', 'none');
	        	
	        	$('#emp_ul').css("display", "block").html("");
				$('#pro_ul').css("display", "none");
				$('#cate_ul').css("display", "none");
				$('#years_ul').css("display", "none");
				$('#folder_1_ul').css("display", "none");
				$('#folder_2_ul').css("display", "none");
				
				$('.team_span').html(team_name);
				$('.emp_span').html("");
				$('.pro_span').html("");
				$('.cate_span').html("");
				$('.years_span').html("");
				$('.folder_1_span').html("");
				$('.folder_2_span').html("");
				
				curr_choice_emp = '';
				curr_choice_pro = '';
				curr_choice_cate = '';
				curr_choice_years = '';
				curr_choice_folder_1 = '';
				curr_choice_folder_2 = '';
				
				$('.wordnoti_area').html("총 <b>0</b>건이 검색되었습니다.");
				$('.count').html("총  0개 파일");
				$('#file_tbl_container').css("display", "none");
				$('#btn_left_area').css("display", "none");
					
				// 비동기 삭제 권한을 위한 변수
				getPositionIdx = data.getUserInfo.position;
				getUserId = data.getUserInfo.emplyrId;
				getTeamIdx = data.getUserInfo.team_idx;
								
				/* -----------------------selected----------------------------------------*/
				$(".team_selected").removeClass('team_selected');
				$(".emp_selected").removeClass('emp_selected');
				$(".pro_selected").removeClass('pro_selected');
				$(".cate_selected").removeClass('cate_selected');				
				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('team_selected');
				/*------------------------------------------------------------------------*/
				
				$('#file_tbl_col_1').html("");
				
				for(var i=0; i<data.getEmpList.length; i++){         
	             $("#emp_ul").append(
	                   '<li><button onclick="choice_emp(this, '+ "'" + data.getEmpList[i].emp_idx +"'," + "'" + data.getEmpList[i].emp_name + "'" + ');">'+data.getEmpList[i].emp_name+'</button></li>'
	              );   // append
				}	// for
	       } // success
	   });	// ajax
	}; // function
	
	function choice_emp(obj, emp_idx, emp_name){
		
	    $.ajax({
	        url:'/crm/kms/getPro.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, emp_idx : emp_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
				curr_choice_type = 'emp';
				curr_choice_emp = emp_idx;
				
				$('.emp_span').html(" > " + emp_name);
				$('.pro_span').html("");
				$('.cate_span').html("");
				$('.years_span').html("");
				$('.folder_1_span').html("");
				$('.folder_2_span').html("");
				
				$('#pro_ul').css("display", "block").html("");
	        	$('#cate_ul').css("display", "none");
				$('#years_ul').css("display", "none");
				$('#folder_1_ul').css("display", "none");
				$('#folder_2_ul').css("display", "none");
				
				curr_choice_pro = '';
				curr_choice_cate = '';
				curr_choice_years = '';
				curr_choice_folder_1 = '';
				curr_choice_folder_2 = '';
				
				$('.wordnoti_area').html("총 <b>0</b>건이 검색되었습니다.");
				$('.count').html("총  0개 파일");
				$('#file_tbl_container').css("display", "none");
				$('#btn_left_area').css("display", "none");
				
				/* -----------------------selected(20180528)------------------------------*/
				$(".emp_selected").removeClass('emp_selected');
				$(".pro_selected").removeClass('pro_selected');
				$(".cate_selected").removeClass('cate_selected');				
				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('emp_selected');
				/* ----------------------------------------------------------------------*/
				
				$('#file_tbl_col_1').html("");
				
				
				if(data.getProList.length != 0){
					for(var i=0; i<data.getProList.length; i++){ 
						$("#pro_ul").append(
						      '<li><button onclick="choice_pro(this, '+"'" + data.getProList[i].project_code +"'," + "'" + data.getProList[i].project_name + "'" + ');">'+data.getProList[i].project_name+'</button></li>'
						);   // append
					}	// for
				}else{
					// alert('선택한 직원의 프로젝트가 존재하지 않습니다.');
				}	
	       } // success
	   });	// ajax
	}; // function
	
	function choice_pro(obj, pro_idx, pro_name){
		$.ajax({
	        url:'/crm/kms/getCate.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, 
	        	emp_idx : curr_choice_emp, 
	        	project_code: pro_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	curr_choice_type = 'pro';
	        	curr_choice_pro = pro_idx;
	        	
				$('#cate_ul').css("display", "block").html("");
				
	        	$('#years_ul').css("display", "none");
				$('#folder_1_ul').css("display", "none");
				$('#folder_2_ul').css("display", "none");
				
				$('.pro_span').html(" > " + pro_name);
				$('.cate_span').html("");
				$('.years_span').html("");
				$('.folder_1_span').html("");
				$('.folder_2_span').html("");
				
				curr_choice_cate = '';
				curr_choice_years = '';
				curr_choice_folder_1 = '';
				curr_choice_folder_2 = '';
						
				$(".pro_selected").removeClass('pro_selected');
				$(".cate_selected").removeClass('cate_selected');				
				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('pro_selected');	        	
	        	
				if(data.getCateList.length != 0){
					for(var i=0; i<data.getCateList.length; i++){         
			        	$("#cate_ul").append(
			                   '<li><button onclick="choice_cate(this, '+"'" + data.getCateList[i].category_code +"'," + "'" + data.getCateList[i].category_name + "'" + ');">'+data.getCateList[i].category_name+'</button></li>'
			        	);   // append
					}	// for
				}else{
					// alert('선택한  프로젝트의 카테고리가 존재하지 않습니다.');
				}
				printFileBoard(data);
	    
	       } // success
	   });	// ajax
	}; // function
	
	
	
	function choice_cate(obj, cate_idx, cate_name){
		$.ajax({
	        url:'/crm/kms/getYears.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, 
	        	emp_idx : curr_choice_emp, 
	        	project_code : curr_choice_pro, 
	        	category_code : cate_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
				curr_choice_cate = cate_idx;
				curr_choice_type = 'cate';
				
				$('#years_ul').css("display", "block").html("");
				
				$('#folder_1_ul').css("display", "none");
				$('#folder_2_ul').css("display", "none");
				
				$('.cate_span').html(" > " + cate_name);
				
				$('.years_span').html("");
				$('.folder_1_span').html("");
				$('.folder_2_span').html("");
				
				curr_choice_years = '';
				curr_choice_folder_1 = '';
				curr_choice_folder_2 = '';
	        	
				$(".cate_selected").removeClass('cate_selected');				
				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('cate_selected');
	        	
				

				if(data.getYearsList.length != 0){					
					
					for(var i=0; i<data.getYearsList.length; i++){         
		             $("#years_ul").append(
		                   '<li><button onclick="choice_years(this, '+"'" + data.getYearsList[i].years_code +"'," + "'" + data.getYearsList[i].years_name + "'" + ');">'+data.getYearsList[i].years_name+'</button></li>' 
		             );   // append
					}	// for
				}else{
					// alert('선택한  프로젝트의 카테고리가 존재하지 않습니다.');
				}			
				printFileBoard(data);
	       } // success
	   });	// ajax
	}; // function
	
	function choice_years(obj, years_idx, years_name){
		$.ajax({
	        url:'/crm/kms/getFolder1.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, 
	        	emp_idx : curr_choice_emp, 
	        	project_code : curr_choice_pro, 
	        	category_code : curr_choice_cate, 
	        	years_code : years_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	curr_choice_years = years_idx;
	        	curr_choice_type = 'years';
	        	
				$('#folder_1_ul').css("display", "block").html("");
				$('#folder_2_ul').css("display", "none");
				
				$('.years_span').html(" > " + years_name);
				$('.folder_1_span').html("");
				$('.folder_2_span').html("");
				
				curr_choice_folder_1 = '';
	        	curr_choice_folder_2 = '';		

				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('years_selected');
				
				
				
	        	if(data.getFolder_1List.length != 0){
		        	for(var i=0; i<data.getFolder_1List.length; i++){         
		             $("#folder_1_ul").append(
		                   '<li><button onclick="choice_folder_1(this, '+"'" + data.getFolder_1List[i].folder_1_code +"'," + "'" + data.getFolder_1List[i].folder_1_name + "'" + ');">'+data.getFolder_1List[i].folder_1_name+'</button></li>'
		             );    // append
					}	// for
				}else{
					// alert('폴더가 존재하지 않습니다.');
				}				
	        	printFileBoard(data);
	       } // success
	   });	// ajax
	}; // function
	
	function choice_folder_1(obj, folder_1_idx, folder_1_name){
		$.ajax({
	        url:'/crm/kms/getFolder2.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, 
	        	emp_idx : curr_choice_emp, 
	        	project_code : curr_choice_pro,
	        	category_code : curr_choice_cate,
	        	years_code : curr_choice_years,
	        	folder_1_code : folder_1_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	curr_choice_type = 'folder_1';
				curr_choice_folder_1 = folder_1_idx;
	        	
	        	$('#folder_2_ul').css("display", "block").html("");
	        	
				$('.folder_1_span').html(" > " + folder_1_name);
				$('.folder_2_span').html("");
	        	
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				curr_choice_folder_2 = '';
				
				$(obj).addClass('folder_1_selected');
				
	        	if(data.getFolder_2List.length != 0){
		        	
	        		for(var i=0; i<data.getFolder_2List.length; i++){ 
						$("#folder_2_ul").append(
		                   '<li><button onclick="choice_folder_2(this, '+"'" + data.getFolder_2List[i].folder_2_code +"'," + "'" + data.getFolder_2List[i].folder_2_name + "'" + ');">'+data.getFolder_2List[i].folder_2_name+'</button></li>'
		              	);   // append
					}	// for
				}else{
					//alert('폴더가 존재하지 않습니다.');
				}
	     		
	        	printFileBoard(data);
	       } // success
	   });	// ajax
	}; // function
	
	function choice_folder_2(obj, folder_2_idx, folder_2_name){
		$.ajax({
	        url:'/crm/kms/getFolderLast.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, 
	        	emp_idx : curr_choice_emp, 
	        	project_code : curr_choice_pro, 
	        	category_code : curr_choice_cate,
	        	years_code : curr_choice_years,
	        	folder_1_code : curr_choice_folder_1,
	        	folder_2_code : folder_2_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){	     		
	        	curr_choice_folder_2 = folder_2_idx;
	        	
	        	curr_choice_type = 'folder_2';
	        	
	        	$('.folder_2_span').html(" > " + folder_2_name);
	        	
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('folder_2_selected');
				
	        	printFileBoard(data);
	       } // success
	   });	// ajax
	}; // function
	
	
	
	
	function log_look( atchFileId ){	  
		BPOPUP =  $('#bpopup').bPopup({
            modalClose : true
        });
	    
	    $('#Log_tbl').css("display", "block").html("");
    	$("#Log_tbl").append(
    			'<colgroup>'+
					'<col width= "200px" />'+
					'<col width= "250px" />'+
					'</colgroup>'+
					'<tr>'+
					'<th>다운로드 id</th>'+
					'<th>다운로드 date</th>'+
					'</tr>');
	    
	    
	    
	    $.ajax({
	        url:'/crm/kms/getLog.do',
	        type:'post',
	        dataType: 'json',
	        data:{'atchFileId' : atchFileId},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
	        	
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	
				   if(data.getLogList.length > 0 ){
	            		 for(var i=0; i<data.getLogList.length; i++){
	            				 $("#Log_tbl").append( 
	            						 '<tr><td>'+ data.getLogList[i].download_id +'</td><td>'+  data.getLogList[i].download_date.substring(0, 16) +'</td></tr>'
	            				  );	// append
	            	 	 }
                   }	
	       } // success
	   });	// ajax
	} // function
	
	function win_close(){
		$('#bpopup').bPopup().close();
	}
	/* ----------------------------- // 상단 메뉴 종료 ---------------------------------------*/
	
	var topSearchFlag = 0;
	$("#close_btn").click(function(){
		if(topSearchFlag == 0){
			$("#close_btn").html("open");
			$("#close_btn").css("background", "blue");
			$("#top_search").css("display", "none");
			topSearchFlag = 1;
		}else{
			$("#close_btn").html("close");
			$("#close_btn").css("background", "red");
			$("#top_search").css("display", "block");
			topSearchFlag = 0;
		}
	});
</script>