<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">

	
$(document).ready(function(){
	$('#btnSave').on('click',function(){
		if($('input[name=image_file_id]').val() == ''){
			alert('이미지를 선택해주세요.');
			$('input[name=image_file_id]').focus();
			return false;
		}
		if($('input[name=attach_file_id]').val() == ''){
			alert('첨부파일을 선택해주세요.');
			$('input[name=attach_file_id]').focus();
			return false;
		}
		$('form').submit();
	});
	
	$('form').validate({
		 lang: 'ko',
		 rules : {
			 title_ko : { required: true, minlength:2},
	 		 title_en : { required: true, minlength:2},
	 		 comment_ko : { required: true, minlength:2},
	 		 comment_en :  { required: true, minlength:2}
		 }
	 });
	 
});

function deleteNsetInputFileTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '"  />');
}

function deleteNsetInputImageTag(obj, name, inputfilename){
	$(obj).parent().empty();
	$('#' + name).append('<input type="file" name="' + inputfilename + '"  accept=".gif, .jpg, .bmp, .png"/>');
}
</script>
<section id="contentArea">
	<h3>자료관리 <span>></span> 홍보물관리 <span>></span> 수정</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		<form name="form" method="post" action="/cvb/brochure/edit_action.do?org_tp=${param.org_tp }" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${result.idx }"/>
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목(국문)</th>
						<td class="left">
							<input name="title_ko" type="text" value="${result.title_ko }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">제목(영문)</th>
						<td class="left">
							<input name="title_en" type="text" value="${result.title_en }"/>
						</td>
					</tr>
					<tr>
						<th scope="row">내용(국문)</th>
						<td class="left">
							<textarea name="comment_ko" cols="100" rows="6">${result.comment_ko }</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">내용(영문)</th>
						<td class="left">
							<textarea name="comment_en" cols="100" rows="6">${result.comment_en }</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">이미지</th>
						<td id="image_file_id" class="left">
							<c:if test="${result.image_file_id != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_id}" />
							</c:import>
							<input type="hidden" name="image_file_id" value="${result.image_file_id}"/>
							<button onclick="deleteNsetInputImageTag(this, 'image_file_id', 'image_file_id');return false;" class="small_btn">삭제</button>
							</c:if> 
							<c:if test="${result.image_file_id == ''}">
							<input name="image_file_id" type="file" size="100" accept=".gif, .jpg, .bmp, .png"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td id="attach_file_id" class="left">
							<c:if test="${result.attach_file_id != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.attach_file_id}" />
							</c:import>
							<input type="hidden" name="attach_file_id" value="${result.attach_file_id}"/>
							<button onclick="deleteNsetInputFileTag(this, 'attach_file_id', 'attach_file_id');return false;" class="small_btn">삭제</button>
							</c:if> 
							<c:if test="${result.attach_file_id == ''}">
							<input name="attach_file_id" type="file" size="100"/>
							</c:if>
							
						</td>
					</tr>									
				</tbody>
		</table>
		</form>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="/cvb/brochure/info.do?idx=${param.idx}&org_tp=${param.org_tp }" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/cvb/brochure/list.do?org_tp=${param.org_tp }'/>" role="button" class="btn1 clr_Wgray">목록</a>
					
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>