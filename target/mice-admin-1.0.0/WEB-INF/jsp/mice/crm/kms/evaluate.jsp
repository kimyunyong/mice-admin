<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp"%>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp"%> <!-- get jQuery CDN -->
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp"%>
<style>
	div#top_search {
			width: 100%;
	 		border-top: 3px solid #BAB5B1;
	 		border-bottom: 3px solid #BAB5B1;
	/* 		border-top: 3px solid #1F6093; */
	/*  		border-bottom: 3px solid #1F6093; */
			overflow: visible;
	}
	div#top_search table{
			width:50%;
	}
	div#top_search table tr td{
			text-align: center;
			font-size: 0.9em;
			padding: 5px 0px 5px 0px;
	}
	
	div#top_search table tr td button#btnSearch {
	        width: 110px;
			color: #ffffff;
			background: #1A394B;
			padding: 5px 0px 5px 0px;
			margin: 0px 10px 0px 10px;
			font-size:10px; 
			text-align: center;
	}
	table#evaluate_tbl{
		width: 100%;
		text-align: center;
		border-top: 3px solid #BAB5B1;
	 	border-bottom: 3px solid #BAB5B1;
	 	margin: 30px 0px 30px 0px;
	}
	table#evaluate_tbl th{
		text-align: center;
		padding: 5px 0px 5px 0px;
		border-bottom: 1px dotted #BAB5B1;
	}
	table#evaluate_tbl tr td{
		text-align: center;
		padding: 5px 0px 5px 0px;
	}
	.btnEval{
		width: 150px;
		color: #ffffff;
		background: #494949;
		padding: 5px 0px 5px 0px;
		margin: 0px 10px 0px 10px;
		font-size:10px; 
		text-align: center;
	}
	.myProgress {
	  	width: 100%;
	 	background-color: #ddd;
	}
	
	.myBar {
	 	width : 1%;
	 	height: 15px;
	  	background-color: #06286F;
	}
	
</style>

<section id="contentArea">
<h3>KMS<span>></span>평가</h3><!-- 180104 -->
 <div id="top_search">
 <form name="form" action="/crm/kms/evaluate.do" method="post">
 <table>
 	<colgroup>
		<col width="5%"/>
		<col width="22%"/>
		<col width="5%"/>
		<col width="22%"/>
		<col width="5%"/>
		<col width="22%"/>
		<col width="19%"/>
	</colgroup>
 	<tr>
   		<td>년도</td>
   		<td><select name="years">
				<option value="">==선택하세요==</option>
				<c:forEach var="cnt" begin="2018" end="2030">
				<option value="${cnt}" <c:if test="${cnt == vo.years}">selected</c:if>>${cnt}</option>
				</c:forEach>
			</select>
		</td>
   		<td>팀명</td>
   		<td><c:import
                      url="/crm/code/select_box3.do" charEncoding="utf-8">
                     <c:param name="name" value="team_idx" />
                     <c:param name="type" value="팀" />
                     <c:param name="result" value="${vo.team_idx }" />
                  </c:import></td>
   		<td>직원명</td>
   		<td><c:import
                     url="/crm/manager/select_box.do" charEncoding="utf-8">
                     <c:param name="name" value="emp_id" />
                     <c:param name="result" value="${vo.emp_id }" />
            </c:import></td>
   		<td><button id="btnSearch">  검색   </button></td>
 	</tr>
 </table>
 </form>
 </div>
 
<table id="evaluate_tbl">
 	<caption>게시판 목록</caption>
			<colgroup>
				<col width = "7%" />
				<col width = "7%" />
				<col width = "7%"/>
				<col />
				<col width = "13%"/>
				<col width = "15%"/>
				<col width = "15%"/>	
			</colgroup>
			<thead>
				<tr>
					<th scope="col">년도</th>
					<th scope="col">팀명</th>
			    	<th scope="col">직원명</th>
			    	<th scope="col"></th>
			    	<th scope="col">파일 업로드 수</th>
			    	<th scope="col">파일수준종합평가</th>
			    	<th scope="col"></th>
			  	</tr>
			</thead>
			<tbody>
			<c:forEach var="get" items="${getEvaluateList}" >
			<tr>
				<td>${get.years }</td>
				<td>${get.team_name }</td>
				<td>${get.emp_name }</td>
				<td><div class="myProgress">	
  						<div class="myBar"></div>
						<input type="hidden" value="${get.fileCount }" class="bar_value"/>
					</div>
				</td>
				<td>${get.fileCount }</td>
				<td>${get.evaluate }</td>
				<td><button class="btnEval" id="btnReg" onclick = "evaluate_reg( '${get.years }', '${get.emp_id }','${get.evaluate }' )" >등록 및 수정</button></td>
			</tr>
			</c:forEach>		
			</tbody>
	</table>

<div id="bpopup1" style="display: none; background-color: white; width: 500px; height: 300px;">
	  	<form name="form2">
		  	<h5 class="s_tit">평가 입력</h5>
		  	
			<input type="hidden" name="team_idx"  />
			<input type="hidden" name="years"  />
			<input type="hidden" name="emp_id" />
			
			<input type="hidden" name="curr_years"  />
			<input type="hidden" name="curr_emp_id" />
			<input type="hidden" name="curr_point" />
			
			<table class="adm_tbl2">
						<colgroup>
							<col width="27%"/>
							<col />
						</colgroup>
						<tr>
						<td>
						  평가
						</td>
						<td>
						 <input type="text" name="point" id="point"/>
						</td>
						</tr>
			</table>
			
			<div class="search_new_btn" class="pt20">	    
				<a class="btn1 clr_Wgray" id="btn_save" onclick="evaluate_insert()">등록</a>
				<a class="btn1 clr_Wgray" onclick="win_close();">닫기</a>
			</div>
		</form>
		
	</div>
</section>

<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp"%>

<script type="text/javascript">
    var curr_years;
    var curr_emp_id;
    var curr_point;
	var BPOPUP='';
	
     $(document).ready(function(){
	  var elem = document.getElementsByClassName("myProgress");
	  
	 
	  var value = new Array();
	  var percent = new Array();
	  
	  var width = 1;
	  
	  for(var i=0;i<elem.length;i++){
		
	  var elem_2 = elem[i].getElementsByClassName("myBar");
	  var elem_3 = elem[i].getElementsByClassName("bar_value");
		
	  var value = elem_3[0].value;
	  var percent = 100 * value/100;
	  
	  elem_2[0].style.width = percent + '%';      
	  
	  /*
	  var id = setInterval(frame, 10);
	  
	  function frame() {
		    if (width >= percent) {
		      clearInterval(id);
		    } else {
		      width++; 
		      
		    }
	  }
	  */
	 	}
     });
     
     function evaluate_reg(years, emp_id, point ){
    	curr_years = years;
    	curr_emp_id = emp_id;
    	curr_point = point;
 
    	
    	
    	 BPOPUP =  $('#bpopup1').bPopup({
             modalClose : true
         }); 
    	 document.getElementById("btn_save").onclick = evaluate_insert;
     }
     
     function win_close(){
 		$('#bpopup1').bPopup().close();
 	}
    function evaluate_insert(){
    	
    	  if($('#point').val() == ''){
  			alert('내용을 입력해주세요.');
  			return false;
  		}
    	
    	document.form2.team_idx.value = document.form.team_idx.value;
    	document.form2.years.value = document.form.years.value;
    	document.form2.emp_id.value = document.form.emp_id.value;
    	
    	document.form2.curr_years.value = curr_years;
    	document.form2.curr_emp_id.value = curr_emp_id;
    	document.form2.curr_point.value = curr_point;
    	
    	document.form2.action = "/crm/kms/evaluate_insert_action.do";
		document.form2.method = "post";
		document.form2.submit();	
    }    
</script>