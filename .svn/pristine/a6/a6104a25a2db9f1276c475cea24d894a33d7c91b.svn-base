<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javaScript" language="javascript">

//웹 	화면
$(document).ready(function(){
	
	$('#btnEventManagerSave').on('click',function(){
		if($('#eventManagerForm input[name=cate_name]').val() == "" ){
			alert('분류명을 입력하세요.');
			$('#eventManagerForm input[name=cate_name]').focus();
			return false;
		}
		
	    var params = $("#eventManagerForm").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
	    $.ajax({
	        url: '/crm/manager_event/edit_action.do',
	        type: 'POST',
	        data:params,
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
	        dataType: 'json',
	        success: function (result) {
	            if (result.result){

	            	var crm_idx = $('#eventManagerForm input[name=crm_event_idx]').val();
	            	var cate_code = $('#eventManagerForm input[name=cate_code]').val();
					chkManagerEventList(crm_idx, cate_code);
	            	
	            	$.nmTop().close();
	            	alert('수정되었습니다.');
	            }else{
	            	alert('오류가 발생했습니다. 관리자에게 문의하세요.');
	            }
	        }
	    });		
				
		
		
	});
});


</script>


		<form name="eventManagerForm" id="eventManagerForm" method="post" action="/crm/manager_event/edit_action.do" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${vo.idx}" />
		<input type="hidden" name="crm_event_idx" value="${vo.crm_event_idx}" />
		<input type="hidden" name="cate_code" value="${vo.cate_code}" />
		<input type="hidden" name="depth" value="${vo.depth}" />
		<input type="hidden" name="parent" value="${vo.parent}" />
		
		
		<h5 class="s_tit">카테고리 수정</h5>
		
		<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col width="18%">
				<col width="70%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">${vo.depth}차 카테고리 분류명</th>
					<td class="left">
					
					<input name="cate_name" id="cate_name" type="text" size="100" value="${result.cate_name}" style="ime-mode:active" maxlength="50"/>
					
					</td>
				</tr>
			</tbody>
		</table>


		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<a id="btnEventManagerSave" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="javascript:$.nmTop().close();" role="button" class="btn1 clr_Wgray">취소</a>
			</div>
		</div>
		<!--// 버튼 위치(e) -->


		</form>
	




<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>