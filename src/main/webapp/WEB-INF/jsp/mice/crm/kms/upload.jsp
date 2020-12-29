<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mice/include/header.jsp"%>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp"%>
<!-- get jQuery CDN -->
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp"%>

<!-- <link href="https://rawgithub.com/hayageek/jquery-upload-file/master/css/uploadfile.css" rel="stylesheet">  -->

<script src="https://rawgithub.com/hayageek/jquery-upload-file/master/js/jquery.uploadfile.min.js"></script>

<style>

.ajax-file-upload-statusbar {
border: 1px solid #0ba1b5;
margin-top: 10px;
margin: 0 auto;
-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
padding: 5px 5px 5px 5px;
box-sizing: border-box;
}

.ajax-file-upload-filename {
width: 300px;
height: auto;
margin: 0 5px 5px 0px;

}

.ajax-file-upload-filesize {
width: 50px;
height: auto;
margin: 0 5px 5px 0px;
display: inline-block;
vertical-align:middle;
}

.ajax-file-upload-progress {
margin: 5px 10px 5px 0px;
position: relative;
width: 800px;
border: 1px solid #ddd;
padding: 1px;
border-radius: 3px;
display: inline-block;
color:#FFFFFF;
}

.ajax-file-upload-bar {
background-color: #0ba1b5;
width: 0;
height: 20px;
border-radius: 3px;
color:#FFFFFF;
}

.ajax-file-upload-percent {
position: absolute;
display: inline-block;
top: 3px;
left: 48%
}

.ajax-file-upload-red {
-moz-box-shadow: inset 0 39px 0 -24px #e67a73;
-webkit-box-shadow: inset 0 39px 0 -24px #e67a73;
box-shadow: inset 0 39px 0 -24px #e67a73;
background-color: #e4685d;
-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
display: inline-block;
color: #fff;
font-family: arial;
font-size: 13px;
font-weight: normal;
padding: 4px 15px;
text-decoration: none;
text-shadow: 0 1px 0 #b23e35;
cursor: pointer;
vertical-align: top;
margin: 5px 10px 5px 0px;
}

.ajax-file-upload-green {
background-color: #77b55a;
-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
margin: 0;
padding: 0;
display: inline-block;
color: #fff;
font-family: arial;
font-size: 13px;
font-weight: normal;
padding: 4px 15px;
text-decoration: none;
cursor: pointer;
text-shadow: 0 1px 0 #5b8a3c;
vertical-align: top;
margin: 5px 10px 5px 0px;
}

.ajax-file-upload {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
   font-weight: bold;
	padding: 15px 20px;
	cursor:pointer;
	line-height:20px;
	height:25px;
	margin:0 10px 10px 0;
  display: inline-block;
  background: #fff;
  border: 1px solid #e8e8e8;
  color: #888;
  text-decoration: none;
  border-radius: 3px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  -moz-box-shadow: 0 2px 0 0 #e8e8e8;
  -webkit-box-shadow: 0 2px 0 0 #e8e8e8;
  box-shadow: 0 2px 0 0 #e8e8e8;
  padding: 6px 10px 4px 10px;
  color: #fff;
  background: #2f8ab9;
  border: none;
  -moz-box-shadow: 0 2px 0 0 #13648d;
  -webkit-box-shadow: 0 2px 0 0 #13648d;
  box-shadow: 0 2px 0 0 #13648d;
  vertical-align: middle;
  }

.ajax-file-upload:hover {
      background: #3396c9;
      -moz-box-shadow: 0 2px 0 0 #15719f;
      -webkit-box-shadow: 0 2px 0 0 #15719f;
      box-shadow: 0 2px 0 0 #15719f;
}

.ajax-upload-dragdrop
{
	border:2px dotted #A5A5C7;
	width:420px;
	color: #DADCE3;
	text-align:left;
	vertical-align:middle;
	padding:10px 10px 0px 10px;
	box-sizing: border-box;
	height: 150px;
}

.state-hover
{
	border:2px solid #A5A5C7;
}
.ajax-file-upload-container
{
	margin:20px 0px 20px 0px;
}


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

#pro_ul,#cate_ul,#years_ul,#folder_1_ul,#folder_2_ul {
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

div#file_tbl_container2 {
	display: none;
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

#fileuploader{
	width: 1000px;
	display: none;
	margin: 0 auto;
	margin-top:50px;
}

.emp_ul{display: block;}

</style>

<!-- 180517 -->
<section id="contentArea">
	<h3>KMS > 업로드</h3>
		
	<!-- 상단 검색 영역 -->
	<b style="color:red;">* 한 파일 당 5 MB 까지 업로드가 가능합니다.</b>
	<div id="top_search">
		<table>
			<colgroup>
				<col width="5%" />
				<col />
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
						<c:forEach var="get" items="${getEmpList}">
							<li><button onclick="choice_emp(this, '${get.emp_idx}', '${get.emp_name }')">${get.emp_name}</button></li>
						</c:forEach>
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
	
	<div id="fileuploader">Upload</div>
     <form action="" class="form">
<!--         <textarea class="form-contol" contenteditable data-emojiable="true" placeholder="Type a message here" -->
<!--          	id="send_to_topic_message" name="send_to_topic_message" background="#000000"> -->
<!--         </textarea> -->
    </form>
</section>
<!-- // 180517 -->
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp"%>

<!-- 파일 업로드 시  전역변수(curr_idx)를 drag&drop lib에 알수 없는 이유로 적용되지 않아 input box 사용 (20180529) -->
<input type="hidden" id="dir_idx" name="dir_idx">

<script>
var curr_choice_team = "${getTeamList.get(0).team_idx}";
var curr_choice_emp = '';
var curr_choice_pro = '';
var curr_choice_years = '';
var curr_choice_cate = '';
var curr_choice_folder_1 = '';
var curr_choice_folder_2 = '';
var board_html = '';
var paging_thiml = '';
var curr_choice_type ='';
//var curr_idx = '';

// 초기 팀 자동 선택.
$("#team_ul li button").addClass('team_selected');

function open_file_upload_form(flag){
	if(flag == true){
		$('#fileuploader').css("display", "block");
	}else{
		$('#fileuploader').css("display", "none");
	}
}



// function choice_team(obj, team_idx, team_name){
//     $.ajax({
//         url:'/crm/kms/getEmp.do',
//         type:'post',
//         dataType: 'json',
//         data:{team_idx : team_idx},
//         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
//         error : function(){
// 			alert('업로드 실패.. 잘못 된 접근 입니다.');
//         },
//         success:function(data){
//         	curr_choice_type = 'team';
//         	curr_choice_team = team_idx;
        	
//         	$('#emp_ul').css("display", "block").html("");
			
// 			$('#pro_ul').css("display", "none");
// 			$('#cate_ul').css("display", "none");
// 			$('#years_ul').css("display", "none");
// 			$('#folder_1_ul').css("display", "none");
// 			$('#folder_2_ul').css("display", "none");
			
// 			$('.team_span').html(team_name);
// 			$('.emp_span').html("");
// 			$('.pro_span').html("");
// 			$('.cate_span').html("");
// 			$('.years_span').html("");
// 			$('.folder_1_span').html("");
// 			$('.folder_2_span').html("");
			
// 			curr_choice_emp = '';
// 			curr_choice_pro = '';
// 			curr_choice_cate = '';
// 			curr_choice_years = '';
// 			curr_choice_folder_1 = '';
// 			curr_choice_folder_2 = '';
			
// 			open_file_upload_form(false);
			
// 			$(".team_selected").removeClass('team_selected');
// 			$(".emp_selected").removeClass('emp_selected');
// 			$(".pro_selected").removeClass('pro_selected');
// 			$(".cate_selected").removeClass('cate_selected');				
// 			$(".years_selected").removeClass('years_selected');
// 			$(".folder_1_selected").removeClass('folder_1_selected');
// 			$(".folder_2_selected").removeClass('folder_2_selected');
			
// 			$(obj).addClass('team_selected');
			
// 			for(var i=0; i<data.getEmpList.length; i++){         
//              $("#emp_ul").append(
//                    '<li><button onclick="choice_emp(this, '+ "'" + data.getEmpList[i].emp_idx +"'," + "'" + data.getEmpList[i].emp_name + "'" + ');">'+data.getEmpList[i].emp_name+'</button></li>'
//               );   // append
// 			}	// for
//        } // success
//    });	// ajax
// }; // function
	
	function choice_emp(obj, emp_idx, emp_name){
	    $.ajax({
	        url:'/crm/kms/getPro.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, emp_idx : emp_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('업로드 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        	curr_choice_type = 'emp';
				curr_choice_emp = emp_idx;
				
	        	$('#pro_ul').css("display", "block").html("");
	        	$('#cate_ul').css("display", "none");
				$('#years_ul').css("display", "none");
				$('#folder_1_ul').css("display", "none");
				$('#folder_2_ul').css("display", "none");
				
				$('.emp_span').html(" > " + emp_name);
				$('.pro_span').html("");
				$('.cate_span').html("");
				$('.years_span').html("");
				$('.folder_1_span').html("");
				$('.folder_2_span').html("");
				
				curr_choice_pro = '';
				curr_choice_cate = '';
				curr_choice_years = '';
				curr_choice_folder_1 = '';
				curr_choice_folder_2 = '';
	        	
				open_file_upload_form(false);
				
				$(".emp_selected").removeClass('emp_selected');
				$(".pro_selected").removeClass('pro_selected');
				$(".cate_selected").removeClass('cate_selected');				
				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('emp_selected');
				
	        	if(data.getProList.length != 0){
	        		for(var i=0; i<data.getProList.length; i++){ 
	        			
						$("#pro_ul").append(
						      '<li><button onclick="choice_pro(this, '+"'" + data.getProList[i].project_code +"'," + "'" + data.getProList[i].project_name + "'," + "'" + data.getProList[i].dir_idx + "'" + ');">'+data.getProList[i].project_name+'</button></li>'
						);   // append
					}	// for
				}else{
					//alert('선택한 직원의 프로젝트가 존재하지 않습니다.');
				};
				
	       } // success
	   });	// ajax
	}; // function
	
	function choice_pro(obj, pro_idx, pro_name, dir_idx){		
				
		$('#dir_idx').val(dir_idx);
		
		$.ajax({
	        url:'/crm/kms/getCate.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team, 
	        	emp_idx : curr_choice_emp, 
	        	project_code: pro_idx},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('업로드 실패.. 잘못 된 접근 입니다.');
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
	        	
				open_file_upload_form(true);
				
				$(".pro_selected").removeClass('pro_selected');
				$(".cate_selected").removeClass('cate_selected');				
				$(".years_selected").removeClass('years_selected');
				$(".folder_1_selected").removeClass('folder_1_selected');
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('pro_selected');
	        	
				if(data.getCateList.length != 0){
					for(var i=0; i<data.getCateList.length; i++){        
			             $("#cate_ul").append(
			                   '<li><button onclick="choice_cate(this, '+"'" + data.getCateList[i].category_code +"'," + "'" + data.getCateList[i].category_name + "'," + "'" + data.getCateList[i].dir_idx + "'" + ');">'+data.getCateList[i].category_name+'</button></li>'
			              );   // append
					}	// for	
				}else{
					//alert('선택한  프로젝트의 카테고리가 존재하지 않습니다.');
				}
	       } // success
	   });	// ajax
	}; // function
	
	function choice_cate(obj, cate_idx, cate_name, dir_idx){
		$('#dir_idx').val(dir_idx);
		
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
				alert('업로드 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
				curr_choice_type = 'cate';
				curr_choice_cate = cate_idx;
								
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
			                   '<li><button onclick="choice_years(this, '+"'" + data.getYearsList[i].years_code +"'," + "'" + data.getYearsList[i].years_name + "'," + "'" + data.getYearsList[i].dir_idx + "'" + ');">'+data.getYearsList[i].years_name+'</button></li>' 
			             );   // append
						}	// for
				}else{
					//alert('선택한  프로젝트의 카테고리가 존재하지 않습니다.');
				}
	       } // success
	   });	// ajax
	}; // function
	
	function choice_years(obj, years_idx, years_name, dir_idx){
		$('#dir_idx').val(dir_idx);
		
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
				alert('업로드 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
	        				
	        	curr_choice_type = 'years';
	        	curr_choice_years = years_idx;
	        	
	        	$('#folder_1_ul').css("display", "block").html("");
				
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
			                   '<li><button onclick="choice_folder_1(this, '+"'" + data.getFolder_1List[i].folder_1_code +"'," + "'" + data.getFolder_1List[i].folder_1_name + "'," + "'" + data.getFolder_1List[i].dir_idx + "'" + ');">'+data.getFolder_1List[i].folder_1_name+'</button></li>'
			             );    // append
					}	// for
				}else{
					// alert('폴더가 존재하지 않습니다.');
				}
	       } // success
	   });	// ajax
	}; // function
	
	function choice_folder_1(obj, folder_1_idx, folder_1_name, dir_idx){
		
		$('#dir_idx').val(dir_idx);
		
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
		                   '<li><button onclick="choice_folder_2(this, '+"'" + data.getFolder_2List[i].folder_2_code +"'," + "'" + data.getFolder_2List[i].folder_2_name + "'," + "'" + data.getFolder_2List[i].dir_idx + "'" + ');">'+data.getFolder_2List[i].folder_2_name+'</button></li>'
		              	);   // append
					}	// for
				}else{
					// alert('폴더가 존재하지 않습니다.');
				}
	        	
	       } // success
	   });	// ajax
	}; // function
	
	function choice_folder_2(obj, folder_2_idx, folder_2_name, dir_idx){		
		$('#dir_idx').val(dir_idx);
		
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
				alert('업로드 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){	     		
	        	curr_choice_type = 'folder_2';
	        	curr_choice_folder_2 = folder_2_idx;
	        	
	        	$('.folder_2_span').html(" > " + folder_2_name);
	        	
				$(".folder_2_selected").removeClass('folder_2_selected');
				
				$(obj).addClass('folder_2_selected');
				
	       } // success
	   });	// ajax
	}; // function
	

		/*$("#fileuploader").uploadFile({
			url:"/crm/kms/uploadFile.do",
			 autoSubmit: false
		});
		
		$("#submit").click(function() {
	        //alert(I want get file name here);
	        extraObj.startUpload();
	        return false;
	    });*/
	    
	(function ($) {
		var extraObj  = $("#fileuploader").uploadFile({
			fileName:"myfile",
			maxFileSize:1024*1024*5,
			autoSubmit:true,
			showPreview:false,
			returnType:"json",
			showCancel: true,
			showAbort: true,
			showDone: true,
			showDelete: false,
			showError: true,
			showStatusAfterSuccess: true,
			showStatusAfterError: true,
			showFileCounter: false,
			fileCounterStyle: "). ",
			showProgress: false,
			nestedForms: false,
			showDownload:false,
			downloadStr:"Download",
			showQueueDiv:false,
			statusBarWidth:1000,
			dragdropWidth:1000,
			url:"/crm/kms/uploadFile.do",
			formData:{},
			dynamicFormData: function () {
	        	return {dir_idx : $('#dir_idx').val()};
	        },
			onSuccess:function(files,data,xhr,pd){
				
			}
	});
        
	}(jQuery));
	
	$(document).ready(function(){
		$('input[name=checker]').change(function(){
			var checked = $('input[name=checker]').is(':checked');
			$('input[name=checkField]').each(function(){
				this.checked = checked;
			});
		});
	});
	
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



