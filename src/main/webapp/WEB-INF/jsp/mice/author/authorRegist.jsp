<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">
$(document).ready(function(){

 $('form').validate({
	 lang: 'ko',
	 rules : {
		 emailAdres : { required: true, email: true},
 		 password2 : { equalTo : 'input[name=password]'}
	 }
 });
 $('#btnSave').on('click', function(){
	 $('form').submit();
 });
 
 <c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}'/>");</c:if>
});


</script>
<section id="contentArea">
	<h3>시스템관리 <span>></span> 권한관리 <span>></span> 등록</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
			<form:form commandName="authorManage" action="/sec/ram/EgovAuthorInsert.do" method="post" >
				<table class="adm_tbl2 bp_st01">
					<caption>게시판 글쓰기 및 파일첨부</caption>
						<colgroup>
							<col width="24%">
							<col >
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">권한 코드<span style="color:red"> *</span></th>
								<td>
									<div class="inputBox_S">
										<label for="authorCode" class="hide">권한코드</label>
										<input type="text" name="authorCode" id="authorCode"  value="<c:out value='${authorManage.authorCode}'/>" >
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">권한 명<span style="color:red"> *</span></th>
								<td>
									<div class="inputBox_S">
										<label for="authorNm" class="hide">권한 명</label>
										<input type="text" name="authorNm" id="emplyrNm" value="<c:out value='${authorManage.authorNm}'/>"   required>
									</div>
								</td>
							</tr>				
							<tr>
								<th scope="row">설명</th>
								<td>
									<div class="inputBox_S">
										<label for="authorDc" class="hide">설명</label>
										<input type="text" name="authorDc" id="authorDc"  value="<c:out value='${authorManage.authorDc}'/>">
									</div>
								</td>
							</tr>					
							<%-- <tr>
								<th scope="row">등록일자</th>
								<td>
									<div class="inputBox_S">
										<label for="authorCreatDe" class="hide">등록일자</label>
										<input type="text" name="authorCreatDe" id="authorCreatDe" size="15" value="<c:out value='${authorManage.authorCreatDe}'/>" readonly  required>
									</div>
								</td>
							</tr> --%>
						</tbody>
					</table>
					<!-- 버튼 위치(s) -->
					<div class="btn_area">
							<a href="#" id="btnSave" role="button" class="btn1 clr_Dgray">저장</a>
							<a onclick="javascript:location.reload();" role="button" class="btn1 clr_Wgray">취소</a>
							<a href="<c:url value='/sec/ram/EgovAuthorList.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
					</div>
					<!--// 버튼 위치(e) -->
				</form:form>		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>