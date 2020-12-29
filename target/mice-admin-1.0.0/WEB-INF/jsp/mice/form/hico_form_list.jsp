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
	$('#btnSave').on('click',function(){
		$('form').submit();
	});
	

 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});

function sbmit(obj){
	$(obj).parent().submit();
};

function deleteNsetInputFileTag(obj, name, inputfilename){
	var par = $(obj).parent(); 
	var title = $(par).find('input[name=title]').val();
	var idx = $(par).find('input[name=idx]').val();
	$(obj).parent().empty();
	$(par).append('<input type="hidden" name="title" value="' + title + '" onchange="javascript:titleChange(this);"/><input type="hidden" name="idx" value="' + idx + '"/><input type="file" name="' + inputfilename + '" size="100" onchange="javascript:sbmit(this);" />');
	
}
function titleChange(obj){
	$(obj).parent().parent().find('input[name=title]').val($(obj).val());
}

</script>
<section id="contentArea">
	<h3>자료관리 > HICO 양식관리 > 등록</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
		
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${resultList }"  varStatus="status">
					<tr>
						<th scope="row"><input type="text" name="title_tmp" value="${result.title}" onchange="javascript:titleChange(this);" size="40"/></th>
						<td class="">
							<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
							<form name="form" method="post" action="/hico/form/update.do" enctype="multipart/form-data">
								<input type="hidden" name="idx" value="${result.idx }" />
								<input type="hidden" name="title" value="${result.title}"/>							
								<c:if test="${result.form_file_id != null}">
								<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${result.form_file_id}" />
								</c:import>
								<input type="hidden" name="form_file_id" value="${result.form_file_id}"/>
								<button onclick="deleteNsetInputFileTag(this, 'form_file_id', 'form_file_id');return false;">삭제</button>
								</c:if>
								<c:if test="${result.form_file_id == null}">
								<input type="file" name="form_file_id" size="100"  onchange="javascript:sbmit(this);"/>
								</c:if>
							</form>							
							</sec:authorize>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>