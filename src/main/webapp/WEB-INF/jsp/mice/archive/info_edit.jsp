<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">

$(document).ready(function(){
	 $('form').validate({
		 lang: 'ko'
	 });
	 
	$('#btnEdit').on('click',function(){
		if($('input[name=file]').val() == '' && $('input[name=file_path]').val() == undefined){
			alert('첨부파일을 선택해주세요.');
 			return false;
		}
		$('form').attr('action','/cvb/archive/info_edit_action.do');
		$('form').submit();
	});
 
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		$('form').attr('action','/cvb/archive/info_delete_action.do');
 		$('form').submit();
	});
 
 	$('#btnRegist').on('click',function(){
 		if($('input[name=file]').val() == ''){
 			alert('첨부파일을 선택해주세요.');
 			return false;
 		}
 		$('form').attr('action','/cvb/archive/info_insert_action.do');
 		$('form').submit();
 	});
 	
 	$('input[name=checker]').change(function(){
 	 	var res = '';
 		$('input[name=checker]').each(function(i){
 			if($(this).is(':checked') == true)
 				if(res.length > 0)
 					res += "," + $(this).val();
 				else
 					res += $(this).val();
 		});
 		
 		$('input[name=codes]').val(res);
 	});

 	$('#imageDelete').on('click', function(){
 		$('#attachFileTag').empty();
 		$('#attachFileTag').append('<input type="file" name="file" accept=".gif, .jpg, .bmp, .png">');
 	});
});


</script>
<section id="contentArea">
	<h3>경주사진아카이브관리 <span>></span> 아카이브관리 <span>></span> 등록/수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" enctype="multipart/form-data">
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="30%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">분류</th>
						<td class="text-left">
							<input type="checkbox" id="checkAll" <c:if test="${param.mode eq 'insert' || allCheck == true}">checked</c:if> onclick="javascript:$('input[name=checker]').attr('checked', false);$('input[name=codes]').val('');">전체
						<c:forEach var="result" items="${resultCodeList}" varStatus="status">
					   		<input type="checkbox" name="checker" value="${result.idx}" onclick="javascript:$('#checkAll').attr('checked',false);" <c:if test="${result.checked == true}">checked</c:if>>${result.code_name}
					   </c:forEach>
					   
					   <c:if test="${param.mode eq 'edit'}">
					   		<input type="hidden" name="codes" value="<c:forEach var="result" items="${resultRelationList }" varStatus="status">${result.code_idx },</c:forEach>"/>
					   		<input type="hidden" name="idx" value="${result.idx }"/>
					   </c:if>
					   <c:if test="${param.mode eq 'insert' }">
					   		<input type="hidden" name="codes" value="">
					   </c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">제목(국문)</th>
						<td class="text-left">
							<input type="text" name="title_ko" value="${result.title_ko}" required minlength="2" />
						</td>
					</tr>					
					<tr>
						<th scope="row">제목(영문)</th>
						<td class="text-left">
							<input type="text" name="title_en" value="${result.title_en}"  required minlength="2" />
						</td>
					</tr>
					<tr>
						<th scope="row">키워드(국문)</th>
						<td class="text-left">
							<input type="text" name="keyword_ko" value="${result.keyword_ko}"  required minlength="2" />
						</td>
					</tr>
					<tr>
						<th scope="row">키워드(영문)</th>
						<td class="text-left">
							<input type="text" name="keyword_en" value="${result.keyword_en}"  required minlength="2" />
						</td>
					</tr>
					<tr>
						<th scope="row">내용(국문)</th>
						<td class="text-left">
							<textarea name="comment_ko" id="comment_ko" class="textarea"   required minlength="2">${result.comment_ko}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">내용(영문)</th>
						<td class="text-left">
							<textarea name="comment_en" id="comment_en" class="textarea"  required minlength="2">${result.comment_en}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td id="attachFileTag"  class="text-left">
							<c:if test="${param.mode == 'edit' }">
							<input type="hidden" name="file_name" value="${result.file_name}">
							<input type="hidden" name="file_ext" value="${result.file_ext}">
							<input type="hidden" name="thumb_min_file_path" value="${result.thumb_min_file_path}">
							<input type="hidden" name="thumb_max_file_path" value="${result.thumb_max_file_path}">
							<img src="<c:url value='/com/image/image_info.do'/>?name=${result.thumb_min_file_path}&ext=${result.file_ext}"/><br><button id="imageDelete" class="small_btn">삭제</button>
							</c:if>
							<c:if test="${param.mode == 'insert' }">
							<input type="file" name="file" accept=".gif, .jpg, .bmp, .png">
							</c:if>
						</td>
					</tr>															
				</tbody>
			</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
					<c:if test="${param.mode == 'edit' }">
					<a id="btnEdit" role="button" class="btn1 clr_Wgray">저장</a>
					<a role="button" class="btn1 clr_Wgray" onclick="javascript:location.reload();">취소</a>
					</c:if>
					<c:if test="${param.mode == 'insert' }">
					<a id="btnRegist" role="button" class="btn1 clr_Wgray">등록</a>
					</c:if>
					<a href="<c:url value='/cvb/archive/info_list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
			</div>
			<!--// 버튼 위치(e) -->
		</form>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>