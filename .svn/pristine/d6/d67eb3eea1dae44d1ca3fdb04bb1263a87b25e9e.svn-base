<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mice/admin.css?ver=20160212'/>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/mice/reset.css?ver=20160212">
<link rel="stylesheet" type="text/css" href="/css/mice/admin.css?ver=20160212">
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="/css/mice/desktop.css" rel="stylesheet" type="text/css"   media="screen and (min-width:1024px)">
<link href="/css/mice/pad.css" rel="stylesheet" type="text/css" media="screen and (min-width:641px) and (max-width:1023px)">
<link href="/css/mice/mobile.css" rel="stylesheet" type="text/css" media="screen and (max-width:640px)">
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<title>주요인사검색</title>
<style>
	table.adm_tbl1 tbody th{
		font-weight: bold;
		text-align: center;
		background-color: #fafafa;
		border-left: 1px solid #dedede;
	}
	
	table.adm_tbl1 tbody th,table.adm_tbl1 tbody td{
		padding: 10px 6px;
	}	
	
	table.adm_tbl1 {border-top: 2px solid #b7b7b7 !important;}
	
	table.adm_tbl1 th {
	    background: #fbfbfb;
	    font-weight: bold;
	    color: #666666;
	    text-align: center;
	    padding: 6px 0px 6px 10px;
	    border-bottom: 1px solid #e0e0e0;}
	
	table.adm_tbl1 td{
	    padding: 6px 0px 6px 10px;
	    border-bottom: 1px solid #e0e0e0;
	    color: #999;
	    text-align: center;
	}
</style>

<script>
	var result = '';
	
	function send(index){		
		var name_ko = '';
		var staff = '';
		var sosoc_excel = '';
        var organizer_name = '';
        var unit = '';
        var tel_no = '';
        var phone_no = '';
        var email = '';
        var address = '';
        
		for(var i=0; i<result.length; i++){
	        name_ko = result[index].name_ko;
	        staff = result[index].staff;
	        sosoc_excel = result[index].sosoc_excel;
	        organizer_name = result[index].organizer_name;
	        unit = result[index].unit;
	        tel_no = result[index].tel_no;
	        phone_no = result[index].phone_no;
	        email = result[index].email;
	        address = result[index].address;
	        
	        if(name_ko == null) name_ko = "";
	        if(staff == null) staff = "";
	        if(sosoc_excel == null) sosoc_excel = "";
	        if(organizer_name == null) organizer_name = "";
	        if(unit == null) unit = "";
	        if(tel_no == null) tel_no = "";
	        if(phone_no == null) phone_no = "";
	        if(email == null) email = "";
	        if(address == null) address = "";
		}
		
		// 우선 급하게 작업하느라 우선 리펙토링 하지 못 한점 양해 부탁드립니다 ^^; 아래 두 파일의 함수를 수정한 후 사용을 부탁드립니다.
		// sosoc_excel - This function remove parameter
		// called - jsp\invite\insert.jsp and jsp\invite\modify.jsp - function setChildVailue(idx, name_ko, staff ...) 
		// **please declare parameters
		opener.setChildValue(result[index].idx, name_ko, staff, organizer_name, unit, tel_no, phone_no, address, email);
		window.close();
	}
	
	function setName(name_ko){
		$('#searchName').val(name_ko);
		$('#btnSearch').trigger('click');
	}
	
	function popDept(idx){
		window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("/crm/invite/insertDeptForm.do?idx="+ idx,
	            "childForm", "width=1000px, height=900px, resizable = no, scrollbars = no"); 
	}
	
	function popInsertCustomer(){
		window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("/crm/invite/insertCustomerForm.do",
	            "childForm", "width=1000px, height=900px, resizable = no, scrollbars = no");
	}
	
	$(document).ready(function(){		
		$("#btnSearch").on('click', function(){
     		$('.info').remove();
			var searchName = $("#searchName").val();
			
			$.ajax({
	            type : "post",
	            data:{'searchName' : searchName},
	            url : "/crm/invite/customerSearch.do",
	            dataType : "json",
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            error : function(){
	                alert('전송 실패.. 다른 값을 입력해주세요.');
	            },
	            success : function(data){
	                if(data.length > 0){
	                	result = data;
	                	
	                	for(var i=0; i<data.length; i++){
	                		 var idx = data[i].idx;
                        	 var name_ko = data[i].name_ko;
	                         var staff = data[i].staff;
	                         var sosoc_excel = data[i].sosoc_excel;
//	                         var organizer_name = {d:decrypt(data[i].organizer_name) };
	                         var organizer_name = data[i].organizer_name;
	                         var unit = data[i].unit;
	                         var phone_no = data[i].phone_no;
	                         	                         
		                     if(name_ko == null) name_ko = "";
		                     if(staff == null) staff = "";
		                     if(sosoc_excel == null) sosoc_excel = "";
		                     if(organizer_name == null) organizer_name = '<a href="javascript:;" onclick="popDept(' + idx + ')" class="btn2 clrGrad_Wgray">근무처 추가</a>';
		                     if(unit == null) unit = "";
		                     if(phone_no == null) phone_no = "";
		                
	                		$("#result").append(
'	                			<tr class="info"> ' +
'	                				<td class="left">'+ name_ko +'</td> ' +
'	                				<td class="left">'+ staff +'</td> ' +
'	                				<td class="left">'+ sosoc_excel +'</td> ' +
'	                				<td class="left">'+ organizer_name +'</td> ' +
'	                				<td class="left">'+ unit +'</td> ' +
'	                				<td class="left">'+ phone_no +'</td> ' +
'	                				<td class="left"><a href="javascript:;" onclick="send('+ i +');" class="btn2 clrGrad_Wgray">선택</a></td> ' +
'	                			</tr> '
			                );	// append
		         		}	// for
					}else{
						 $("#result").append('<tr class="info"><td colspan="6"> --- 검색 결과가 없습니다. --- </td></tr>');						
					}	// if
				} // success
	        });	// $ajax
		}) //function
	});	// document.ready

</script>
</head>
<body>
		<!-- 상담내역 -->
	<!-- adm_tbl2 -->
<!-- 	<table class="adm_tbl1 wd100per">
		<caption>주요인사검색</caption>
			<colgroup>
				<col width="">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">성명 입력</th>
					<td><input type="text" name="searchName" id="searchName"></td>
					<td><a id="btnSearch" role="button" class="btn1 clr_Wgray">검색</a></td>
					<td><a href="javascript:;" onclick="popInsertCustomer();" class="btn2 clrGrad_Wgray">인사 추가</a></td>
				</tr>
			</tbody>
	</table>
	 -->


<!-- 180104 -->

<div class="brd_p">

			<div class="search_sort_type">
					<dl>
						<dt>성명 입력</dt>
						<dd><input type="text" name="searchName" id="searchName"></dd>
					</dl>
				</div>
			<div class="search_btn_type3">
				<a id="btnSearch" role="button" class="btn1 clr_Wgray">검색</a>
				<a href="javascript:;" onclick="popInsertCustomer();" class="btn2 clrGrad_Wgray">인사 추가</a>
				</div>						
		</div>		
<!-- //180104 -->





		
	<table class="adm_tbl2">
		<caption>상세</caption>
		<colgroup>
 				<col width="10%">  
  				<col width="10%">  
  				<col width="10%">  
  				<col width="20%">  
  				<col width="10%">  
  				<col width="20%">  
  				<col width="10%">  
  			</colgroup>  
  			<thead>
	  			<tr>  
	  				<th>성명</th>  
	  				<th>직위</th>  
	  				<th>소속_엑셀</th>  
	  				<th>근무처</th>  
	  				<th>부서/학과</th>  
	  				<th>휴대전화</th>  
	  				<th>선택</th>  
	 			</tr>  
  			</thead>  
	
		<tbody id="result">
	    	
		</tbody>
		
	</table>
</body>
</html>