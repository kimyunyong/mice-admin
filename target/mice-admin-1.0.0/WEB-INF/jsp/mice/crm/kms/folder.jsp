<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp"%>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp"%> <!-- get jQuery CDN -->
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
	div#top_search table{
		width:100%;
	}
	
/* 	top_search table 공통 요소 */
	div#top_search table td, div#top_search table th{
		border-bottom: 1px dotted #BAB5B1;
		padding: 0px 5px 0px 5px;
		z-index: 0; 
	}
	
/* 	top_search table 제목	 */
	div#top_search table th{
		text-align: center; 
		color: #1C436C;
		border-right: 1px dotted #BAB5B1;
	}
	
/* 	top_search table 내용영역 */
	div#top_search table td{
		position: relative;
	}
	

/* 	top_search 각각 버튼들의 부모 영역 */
	div#top_search ul li {
		float: left;
		margin: 5px;
	}
	
	
	/* ---- top_search button 정의  ----*/
	/* 	top_search 모든 버튼 */
	.team_selected,.emp_selected{
   		color: #FFFFFF;
 		background: #1C436C;
   }	
	div#top_search ul li button {
		padding : 3px;
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
		width: 265px;
	}
	
	/* 	top_search 직원 버튼 */
	div#top_search ul#emp_ul li button {
		width: 165px;
	}
	

	/*상단 영역 table */
	table#top_tbl{
	width: 100%;
	margin:10px 0px 0px 0px;
	}
	/*프로젝트 insert 버튼*/
	table#top_tbl tr td button#project_insert_btn{
		width: 110px;
		color: #ffffff;
		background: #000000;
		padding: 5px 0px 5px 0px;
		margin: 0px 10px 10px 0px;
		font-size:10px; 
	}
	div#folder_div{
		width: 100%;
	}
	
	/*모든 folder table*/
	table#folder_tbl{
		width: 100%;
		border-top: 3px solid #A8A8A8;
	}
	table#folder_tbl tr{
		width: 100%;
	}
	
	table#folder_tbl tr td{
		text-align: center;
		border-bottom: 1px solid #D8D8D8;
	}
	/*모든 folder 버튼*/
	table#folder_tbl button#folder_btn{
		width: 95px;
		color: #ffffff;
		background: #000000;
		padding: 5px 0px 5px 0px;
		margin: 0px 10px 0px 10px;
		font-size:10px; 
	}
	
	
	table#folder_tbl tr td:nth-child(1){
		width:100px;
	    text-align: center;
	    
	}
	table#folder_tbl tr td:nth-child(2){
		width:100px;
		text-align: center;
		
	}
	table#folder_tbl tr td:nth-child(3){
		width:100px;
		text-align: center;
		
	
	}
	table#folder_tbl tr td:nth-child(4){
		width:100px;
		text-align: center;
		
	
	}
	table#folder_tbl tr td:nth-child(5){
		width:100px;
		text-align: center;
		
	
	}
	table#folder_tbl tr td:nth-child(6){
		width:100px;
		text-align: center;
		
	}
	
	table#folder_tbl tr td:nth-child(7){
	    width:45%;
		text-align: center;
		
	
	}
	table#folder_tbl tr td:nth-child(8){
		width:200px;
		text-align: center;
		
	}
	/*생성, 수정, 삭제 버튼*/
	table#folder_tbl tr td:nth-child(8) button#cud_btn{
		color: #ffffff;
		background: #000000;
		padding: 5px 10px 5px 10px;
		margin: 5px 5px 5px 5px;
		font-size:10px; 
	}
	
</style>

<!-- 180517 -->
<section id="contentArea">

   <h3>KMS<span>></span>폴더 &nbsp;설정</h3><!-- 180104 -->
   <div id="top_search">
		<table>
			<colgroup>
				<col width="5%"/>
				<col />
			</colgroup>
			
			<tr>
				<th>팀</th>
				<td>
					<ul id="team_ul">	
					<c:forEach var="get" items="${getTeamList}" >
							<li><button onclick= "choice_team( this, ${get.team_idx})" >${get.team_name }</button></li>
					</c:forEach>
						<!--
						<li><button onclick="">센터마케팅팀</button></li>
						<li><button onclick="">MICE사업팀</button></li>
						<li><button onclick="">컨벤션유치팀</button></li>
						<li><button onclick="">시설운영팀</button></li>
						<li><button onclick="">총무팀</button></li>
						-->
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
		</table>
	</div>
	
	
	<div id="bpopup1" style="display: none; background-color: white; width: 500px; height: 300px;">
	  	<h5 class="s_tit">이름 입력<h5>
		<table class="adm_tbl2">
					<colgroup>
						<col width="27%"/>
						<col />
					</colgroup>
					<tr>
					<td>
					  이름 
					</td>
					<td>
					 <input type="text" name="name" id="name"/>
					</td>
					</tr>
		</table>
		<div class="search_new_btn" class="pt20">
		    
			<a class="btn1 clr_Wgray" id="btn_save" onclick="">등록</a>
			<a class="btn1 clr_Wgray" onclick="win_close();">닫기</a>
		</div>
	</div>
	<div id="bpopup2" style="display: none; background-color: white; width: 500px; height: 300px;">
	  	<h5 class="s_tit">이름 입력<h5>
		<div class="search_new_btn" class="pt20">
		    
			<a class="btn1 clr_Wgray" id="btn_delete" onclick="">삭제</a>
			<a class="btn1 clr_Wgray" onclick="win_close2();">취소</a>
		</div>
	</div>
	
   
   <table id="top_tbl">
   			<tr>
   				<td align="right">
   				
   					<button id=project_insert_btn>프로젝트등록</button>
   				</td>
   			</tr>
   </table>
   <div id="folder_div">
   <table id="folder_tbl">
  		
   </table>
   </div>
   &nbsp;&nbsp;
</section>

<!-- // 180517 -->
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp"%>


<script type="text/javascript">
    var curr_type = '';
	var curr_choice_team = "${getTeamList.get(0).team_idx}";
	var curr_choice_emp = '';
	var curr_choice_project='';
	var curr_choice_category='';
	var curr_choice_years='';
	var curr_choice_folder_1='';
	var curr_choice_folder_2='';
	var curr_choice_team_button;
	var curr_choice_emp_button;
	
	
	$("#team_ul li button").addClass('team_selected');
	
	var folder_data;
	var BPOPUP='';
			
		(function($) {
		    $(function() {
		          $('#project_insert_btn').bind('click', function(e) {
		              e.preventDefault();
		              BPOPUP =  $('#bpopup1').bPopup({
		                   modalClose : true
		               });
		              
		              document.getElementById("btn_save").onclick = project_insert;
		              
		            }); 
		     });
		    
		})(jQuery);
		
		/*
		$('#btn_save').on('click', function(){
			if($('#name').val() == ''){
				alert('내용을 입력해주세요.');
				return false;
			}
			document.getElementById("team_idx").value = curr_choice_team;
			document.getElementById("emp_name").value = curr_choice_emp;
			document.getElementById("form").action = '/crm/kms/project_insert_action.do';
             
			$('form').submit();
			
			choice_team(curr_choice_team);
			choice_emp(curr_choice_emp);
			//self.close();
		});
		*/
	function win_close(){
		$('#bpopup1').bPopup().close();
	}
	function win_close2(){
			$('#bpopup2').bPopup().close();
	}
	function choice_team( obj, team_idx ){
	    curr_choice_team = team_idx;
	    curr_choice_team_button = obj;
	    
	    
	    $.ajax({
	        url:'/crm/kms/getEmp.do',
	        type:'post',
	        dataType: 'json',
	        data:{team_idx : curr_choice_team},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
	        	
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(data){
				
				 $(".team_selected").removeClass('team_selected');
		         //$(".emp_selected").removeClass('emp_selected');

		         $(obj).addClass('team_selected');

				$('#emp_ul').css("display", "block").html("");
				
				$('#folder_tbl').css("display", "").html("");
				   if(data.getEmpList.length > 0 ){
	            		 for(var i=0; i<data.getEmpList.length; i++){
	            				 var id = data.getEmpList[i].emp_idx;
	            				 
	            				 $("#emp_ul").append(
	            						 '<li><button onclick="choice_emp( this , \''+id+'\' )">'+data.getEmpList[i].emp_name+'</button></li>'
	            				  );	// append
	            	 	 }
                   }	
	       } // success
	   });	// ajax
	} // function
      function choice_emp(obj, id){
    	  curr_choice_emp = id;
    	  curr_choice_emp_button = obj;
   
    	  $.ajax({
  	        url:'/crm/kms/getFolder.do',
  	        type:'post',
  	        dataType: 'json',
  	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp},
  	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
  	        error : function(){
  	        	
  				alert('검색 실패.. 잘못 된 접근 입니다.');
  	        },
  	        success:function(data){
  	        	folder_data = data;
  	        	
		         $(".emp_selected").removeClass('emp_selected');

		         $(obj).addClass('emp_selected');
  	        
  				$('#folder_tbl').css("display", "").html("");
  				   if(data.getFolderList.length > 0 ){
  	            		 for(var i=0; i<data.getFolderList.length; i++){
  	            				 var name = data.getFolderList[i].name;
  	            				
  	            				 var html = '<tr><td>';
  	            				 if(data.getFolderList[i].category_code==0){
  	            				  	html += '<button id=folder_btn onclick="folding_project( '+data.getFolderList[i].project_code+' )">프로젝트</button>';
  	            				 }
  	            				 html += '</td><td>';
  	            				if(data.getFolderList[i].category_code==0){
  	            				  	html += data.getFolderList[i].name;
  	            				 }else if(data.getFolderList[i].category_code!=0 &&data.getFolderList[i].years_code==0){
  	            					html += '<button id=folder_btn onclick="folding_category( '+data.getFolderList[i].project_code+','+data.getFolderList[i].category_code+' )">카테고리</button>';
  	            				 }
  	            				 html +='</td><td>';
  	            				if(data.getFolderList[i].category_code!=0 && data.getFolderList[i].years_code==0){
  	            				  	html += data.getFolderList[i].name;
  	            				 }else if(data.getFolderList[i].category_code!=0 &&
  	            						 data.getFolderList[i].years_code!=0 &&
  	            						 data.getFolderList[i].folder_1_code==0){
  	            					html += '<button id=folder_btn onclick="folding_years( '+data.getFolderList[i].project_code+','+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+' )">년도</button>';
  	            				 }
  	            				 html +='</td><td>';
  	            				if(     data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0&&
  	            						data.getFolderList[i].folder_1_code==0){
  	            				  	html += data.getFolderList[i].name;
  	            				 }else if(data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0 &&
  	            						data.getFolderList[i].folder_1_code!=0 && 
  	            						data.getFolderList[i].folder_2_code==0){
  	            					html += '<button id=folder_btn onclick="folding_folder_1( '+data.getFolderList[i].project_code+','+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+','+data.getFolderList[i].folder_1_code+' )">1차폴더</button>';
  	            				 }
  	            				 html +='</td><td>';
  	            				if(data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0 &&
  	            						data.getFolderList[i].folder_1_code!=0 && 
  	            						data.getFolderList[i].folder_2_code==0){
  	            				  	html += data.getFolderList[i].name;
  	            				 }else if(data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0 &&
  	            						data.getFolderList[i].folder_1_code!=0 && 
  	            						data.getFolderList[i].folder_2_code!=0){
  	            					html += '<button id=folder_btn>2차폴더</button>';
  	            				 }
  	            				 html +='</td><td>';
   	            				if(data.getFolderList[i].category_code!=0 &&
   	            						data.getFolderList[i].years_code!=0 &&
   	            						data.getFolderList[i].folder_1_code!=0 && 
   	            						data.getFolderList[i].folder_2_code!=0){
   	            				  	html += data.getFolderList[i].name;
   	            				}
   	            				html +='</td><td></td><td>';
   	            				
   	            				if(data.getFolderList[i].category_code==0){
   	            					html +=//'<button id=cud_btn onclick="category_create( '+data.getFolderList[i].project_code+' )">폴더생성</button>'
   	            					'<button id=cud_btn onclick="project_edit( '+data.getFolderList[i].project_code+' )">수정</button>'
   	            					+'<button id=cud_btn onclick="project_remove( '+data.getFolderList[i].project_code+' )">삭제</button>';
   	            					    
   	            				}else if(data.getFolderList[i].category_code!=0 &&
   	            						data.getFolderList[i].years_code==0){
   	            					html +='<button id=cud_btn onclick="years_create('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+')">폴더생성</button>';
   	            				         //+'<button id=cud_btn onclick="category_edit('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+')">수정</button>'
   	            					     //+'<button id=cud_btn onclick="category_remove('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+')">삭제</button>';
   	            				}else if(data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0&&
  	            						data.getFolderList[i].folder_1_code==0){
   	            					html +='<button id=cud_btn onclick="folder_1_create('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+')">폴더생성</button>'
   	            					     +'<button id=cud_btn onclick="years_edit('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+')">수정</button>'
   	            					     +'<button id=cud_btn onclick="years_remove('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+')">삭제</button>';
   	            				}else if(data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0 &&
  	            						data.getFolderList[i].folder_1_code!=0 && 
  	            						data.getFolderList[i].folder_2_code==0){
   	            					html +='<button id=cud_btn onclick="folder_2_create('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+','+data.getFolderList[i].folder_1_code+')">폴더생성</button>' 
   	            					     +'<button id=cud_btn onclick="folder_1_edit('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+','+data.getFolderList[i].folder_1_code+')">수정</button>'
   	            					     +'<button id=cud_btn onclick="folder_1_remove('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+','+data.getFolderList[i].folder_1_code+')">삭제</button>';
   	            					     
   	            				}else if(data.getFolderList[i].category_code!=0 &&
  	            						data.getFolderList[i].years_code!=0 &&
  	            						data.getFolderList[i].folder_1_code!=0 && 
  	            						data.getFolderList[i].folder_2_code!=0){
   	            					html +='<button id=cud_btn onclick="folder_2_edit('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+','+data.getFolderList[i].folder_1_code+','+data.getFolderList[i].folder_2_code+')">수정</button>'
   	            					     +'<button id=cud_btn onclick="folder_2_remove('+data.getFolderList[i].project_code+', '+data.getFolderList[i].category_code+','+data.getFolderList[i].years_code+','+data.getFolderList[i].folder_1_code+','+data.getFolderList[i].folder_2_code+')">삭제</button>';
   	            				}
   	            				
   	            				html+='</td></tr>';
   	            				
  	            				$("#folder_tbl").append(
  	            						html
  	            	   		  	);	// append
  	            	   		  	
  	            	 	 }
                     }		
  	       } // success
  	   });	// ajax
  
      }
      
     function folding_project(project_code){
    	 flag = 0;
    	 for(var i=0;i<folder_data.getFolderList.length;i++){
    		 
    		 if(folder_data.getFolderList[i].project_code == project_code && folder_data.getFolderList[i].category_code != 0 ){
    			 j = i+1;
    			 status = $('#folder_tbl tr:nth-child('+j+')').css("display");
    			
    			 if(status == "table-row"){
    				 flag = 1;
    			 }
    			 if(folder_data.getFolderList[i].years_code == 0 && flag == 0){
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "");
    			 }else if(flag==1){
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "none");
    			 }
    			 
    			 
    		 } 		 
    	 }
     }
     function folding_category( project_code, category_code){
    	 flag = 0;
    	 for(var i=0;i<folder_data.getFolderList.length;i++){
    		 if(folder_data.getFolderList[i].project_code == project_code && 
    				 folder_data.getFolderList[i].category_code == category_code &&
    				 folder_data.getFolderList[i].years_code != 0 ){
    			 j = i+1;
    			 status = $('#folder_tbl tr:nth-child('+j+')').css("display");
    			
    			 if(status == "table-row"){
    				 flag = 1;
    			 }
    			 if(folder_data.getFolderList[i].folder_1_code == 0 && flag == 0){
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "");
    			 }else if(flag==1){
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "none");
    			 }
    		 } 		 
    	 }
     }
     function folding_years( project_code, category_code, years_code){
    	 flag = 0;
    	 for(var i=0;i<folder_data.getFolderList.length;i++){
    		 if(folder_data.getFolderList[i].project_code == project_code && 
    				 folder_data.getFolderList[i].category_code == category_code &&
    				 folder_data.getFolderList[i].years_code == years_code &&
    				 folder_data.getFolderList[i].folder_1_code != 0 ){
    			 j = i+1;
    			 status = $('#folder_tbl tr:nth-child('+j+')').css("display");
    			 
    			 if(status == "table-row"){
    				 flag = 1;
    			 }
    			 if(folder_data.getFolderList[i].folder_2_code == 0 && flag == 0){
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "");
    			 }else if(flag==1){
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "none");
    			 }
    		 } 		 
    	 }
     }
     function folding_folder_1(project_code, category_code, years_code, folder_1_code){
    	 
    	 for(var i=0;i<folder_data.getFolderList.length;i++){
    		 if(     folder_data.getFolderList[i].project_code == project_code && 
    				 folder_data.getFolderList[i].category_code == category_code &&
    				 folder_data.getFolderList[i].years_code == years_code &&
    				 folder_data.getFolderList[i].folder_1_code == folder_1_code &&
    				 folder_data.getFolderList[i].folder_2_code != 0 ){
    			 j = i+1;
    			 status = $('#folder_tbl tr:nth-child('+j+')').css("display");
    			 if(status == "none"){
    			 $('#folder_tbl tr:nth-child('+j+')').css("display", "");
    			 }else{
    				 $('#folder_tbl tr:nth-child('+j+')').css("display", "none");
    			 }
    		 } 		 
    	 }
     }
  	
	
	function project_insert(){
	 
		    
		    if($('#name').val() == ''){
				alert('내용을 입력해주세요.');
				return false;
			}
	
		    $.ajax({
		        url:'/crm/kms/project_insert_action.do',
		        type:'post',
		        dataType: 'json',
		        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'name':document.getElementById("name").value },
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        error : function(){
					alert('검색 실패.. 잘못 된 접근 입니다.');
		        },
		        success:function(){
		        	
		        	win_close();
		        	
		       
		        	//choice_team( curr_choice_team_button, curr_choice_team);
		        	choice_emp( curr_choice_emp_button, curr_choice_emp);
		        	

		       } // success
		   });	// ajax			
		//window.open('/crm/kms/popUp.do?team_idx='+curr_choice_team+'&emp_name='+curr_choice_emp+'&redirect_url=/crm/kms/project_insert_action.do', "", "width=600px, height=300px, resizable=no, scrollbars=no");
	}
/*	function category_insert(name){
		 
	   
	   	 
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}
		
	    $.ajax({
	        url:'/crm/kms/category_insert_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	       'name': name },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	//win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	//choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	//window.open('/crm/kms/popUp.do?team_idx='+curr_choice_team+'&emp_name='+curr_choice_emp+'&redirect_url=/crm/kms/project_insert_action.do', "", "width=600px, height=300px, resizable=no, scrollbars=no");
	}*/
	function years_insert(){
	    
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/years_insert_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	       'category_code': curr_choice_category,
	        	       'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	//window.open('/crm/kms/popUp.do?team_idx='+curr_choice_team+'&emp_name='+curr_choice_emp+'&redirect_url=/crm/kms/project_insert_action.do', "", "width=600px, height=300px, resizable=no, scrollbars=no");
	}
	function folder_1_insert(){
	    
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/folder_1_insert_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	       'category_code': curr_choice_category, 'years_code': curr_choice_years,
	        	       'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);

	       } // success
	   });	// ajax			
	//window.open('/crm/kms/popUp.do?team_idx='+curr_choice_team+'&emp_name='+curr_choice_emp+'&redirect_url=/crm/kms/project_insert_action.do', "", "width=600px, height=300px, resizable=no, scrollbars=no");
	}
	function folder_2_insert(){	    
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/folder_2_insert_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	       'category_code': curr_choice_category, 'years_code': curr_choice_years, 'folder_1_code': curr_choice_folder_1,
	        	       'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);

	       } // success
	   });	// ajax			
	//window.open('/crm/kms/popUp.do?team_idx='+curr_choice_team+'&emp_name='+curr_choice_emp+'&redirect_url=/crm/kms/project_insert_action.do', "", "width=600px, height=300px, resizable=no, scrollbars=no");
	}
	function project_update(){	    
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/project_update_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project, 'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);

	       } // success
	   });	// ajax			
	//window.open('/crm/kms/popUp.do?team_idx='+curr_choice_team+'&emp_name='+curr_choice_emp+'&redirect_url=/crm/kms/project_insert_action.do', "", "width=600px, height=300px, resizable=no, scrollbars=no");
	}
	function category_update(){
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/category_update_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category, 'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);

	       } // success
	   });	// ajax			
	}
	function years_update(){
	    
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/years_update_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,'years_code': curr_choice_years, 
	        	  'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	       } // success
	   });	// ajax			
	}
	function folder_1_update(){
		
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/folder_1_update_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,'years_code': curr_choice_years, 'folder_1_code': curr_choice_folder_1,
	        	  'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);

	       } // success
	   });	// ajax			
	}
	function folder_2_update(){
			    
	    if($('#name').val() == ''){
			alert('내용을 입력해주세요.');
			return false;
		}

	    $.ajax({
	        url:'/crm/kms/folder_2_update_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,'years_code': curr_choice_years, 'folder_1_code': curr_choice_folder_1,
	        	  'folder_2_code': curr_choice_folder_2, 'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	}
	function project_delete(){
		
	   
	    $.ajax({
	        url:'/crm/kms/project_delete_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close2();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	}
	function category_delete(){
		
	   
	    $.ajax({
	        url:'/crm/kms/category_delete_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,
	        	  'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close2();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	}
	function years_delete(){
		
	   
	    $.ajax({
	        url:'/crm/kms/years_delete_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,'years_code': curr_choice_years,
	        	  'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close2();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	}
	function folder_1_delete(){
		
	   
	    $.ajax({
	        url:'/crm/kms/folder_1_delete_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,'years_code': curr_choice_years, 'folder_1_code': curr_choice_folder_1,
	        	  'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close2();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);

	       } // success
	   });	// ajax			
	}
	function folder_2_delete(){
		
	    $.ajax({
	        url:'/crm/kms/folder_2_delete_action.do',
	        type:'post',
	        dataType: 'json',
	        data:{'team_idx' : curr_choice_team, 'emp_name': curr_choice_emp, 'project_code': curr_choice_project,
	        	  'category_code': curr_choice_category,'years_code': curr_choice_years, 'folder_1_code': curr_choice_folder_1,
	        	  'folder_2_code': curr_choice_folder_2, 'name':document.getElementById("name").value },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        error : function(){
				alert('검색 실패.. 잘못 된 접근 입니다.');
	        },
	        success:function(){
	        	
	        	win_close2();
	        	//choice_team( curr_choice_team_button, curr_choice_team);
	        	choice_emp( curr_choice_emp_button, curr_choice_emp);
	        	

	       } // success
	   });	// ajax			
	}
	function category_create(project_code){
		curr_choice_project = project_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         });
        document.getElementById("btn_save").onclick = category_insert;
	}
	function years_create(project_code, category_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
            modalClose : true
        });
       document.getElementById("btn_save").onclick = years_insert;		
	}    
	function folder_1_create(project_code, category_code, years_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
            modalClose : true
        });
       document.getElementById("btn_save").onclick = folder_1_insert;
	}
	function folder_2_create(project_code, category_code, years_code, folder_1_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		curr_choice_folder_1 =  folder_1_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
            modalClose : true
        });
       document.getElementById("btn_save").onclick = folder_2_insert;	
	}
	function project_edit(project_code){
		curr_choice_project = project_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         });
        document.getElementById("btn_save").onclick = project_update;
	}
	function category_edit(project_code, category_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         });
        document.getElementById("btn_save").onclick = category_update;
	}
	function years_edit(project_code, category_code,years_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         });
        document.getElementById("btn_save").onclick = years_update;
	}
	function folder_1_edit(project_code, category_code,years_code,folder_1_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		curr_choice_folder_1 =  folder_1_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         });
        document.getElementById("btn_save").onclick = folder_1_update;
	}
	function folder_2_edit(project_code, category_code,years_code,folder_1_code,folder_2_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		curr_choice_folder_1 =  folder_1_code;
		curr_choice_folder_2 =  folder_2_code;
		
		BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         });
        document.getElementById("btn_save").onclick = folder_2_update;
	}
	function project_remove(project_code){
		curr_choice_project = project_code;
		
		BPOPUP =  $('#bpopup2').bPopup({
             modalClose : true
         });
        document.getElementById("btn_delete").onclick = project_delete;
	}
	function category_remove(project_code, category_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		
		
		BPOPUP =  $('#bpopup2').bPopup({
             modalClose : true
         });
        document.getElementById("btn_delete").onclick = category_delete;
	}
	function years_remove(project_code, category_code,years_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		
		BPOPUP =  $('#bpopup2').bPopup({
             modalClose : true
         });
        document.getElementById("btn_delete").onclick = years_delete;
	}
	function folder_1_remove(project_code, category_code,years_code,folder_1_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		curr_choice_folder_1 =  folder_1_code;
		
		BPOPUP =  $('#bpopup2').bPopup({
             modalClose : true
         });
        document.getElementById("btn_delete").onclick = folder_1_delete;
	}
	function folder_2_remove(project_code, category_code,years_code,folder_1_code,folder_2_code){
		curr_choice_project = project_code;
		curr_choice_category = category_code;
		curr_choice_years = years_code;
		curr_choice_folder_1 =  folder_1_code;
		curr_choice_folder_2 =  folder_2_code;
		
		BPOPUP =  $('#bpopup2').bPopup({
             modalClose : true
         });
        document.getElementById("btn_delete").onclick = folder_2_delete;
	}
 </script>