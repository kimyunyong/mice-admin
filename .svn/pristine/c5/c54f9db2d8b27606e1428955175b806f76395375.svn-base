<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>
<script type="text/javascript">
_editor_area = "nttCn";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">
window.onload = function(){
	HTMLArea.init(); 
	HTMLArea.onload = initEditor; 
	document.board.nttSj.focus(); 
	makeFileAttachment();
};

function makeFileAttachment(){
	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		 var maxFileNum = 10;//document.board.posblAtchFileNumber.value;
	     /* if(maxFileNum==null || maxFileNum==""){
	    	 maxFileNum = 3;
	     } */
		 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
		 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	</c:if>
	}
	
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
	<h3>${bdMstr.bbsNm } <span>></span> 등록</h3>
	<section class="sect_nonetit">
		<h4>게시글 등록</h4>
		<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" action="/cop/bbs/insertBoardArticle.do">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
		<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
		<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
		<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
		<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
		<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
		<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
		
		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />
		<input type="hidden" name="bbsId" value="${param.bbsId}"/>
		<c:if test="${anonymous != 'true'}">
		<input type="hidden" name="ntcrNm" value="dummy">	<!-- validator 처리를 위해 지정 -->
		<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
		</c:if>

		<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
		   <input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
		   <input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
		</c:if>		
		   			
		<table class="adm_tbl2">
			<caption>게시글 등록</caption>
				<colgroup>
					<col width="24%">
					<col>
				</colgroup>
				<tbody>
				<c:choose>
				<c:when test="${param.bbsId eq 'BBSMSTR_000000000001'}">
					<tr>
						<th scope="row">구분</th>
						<td class="left">
							<select name="siteTp">
								<option value="0">공통</option>
								<option value="1" <c:if test="${param.siteTp == 1}">selected</c:if>>HICO</option>
								<option value="2" <c:if test="${param.siteTp == 2}">selected</c:if>>CVB</option>
							</select> 
						</td>
					</tr>
				</c:when>
				<c:otherwise>
				<input type="hidden" name="siteTp" value="0"/>
				</c:otherwise>
				</c:choose>
					<tr>
						<th scope="row">언어</th>
						<td class="left">
							<select name="bbsLang">
								<option value="ko">국문</option>
								<option value="en">영문</option>
							</select> 
						</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td class="left">
							${d:decrypt(loginVO.name)}(${loginVO.id})
						</td>
					</tr>
					<c:if test="${param.bbsId == 'BBSMSTR_000000000021' }">
					<tr>
						<th scope="row">분과</th>
						<td class="left">
							<div class="inputBox_S">
								<label for="category" class="hide">제목</label>
								<select name="category" id="category">
									<option>MICE 정책지원 분과</option>
									<option>MICE 유치-시설 분과</option>
									<option>MICE 유치-운영 분과</option>
									<option>유니크베뉴 분과</option>
									<option>MICE 서비스 분과</option>
								</select>
							</div>
						</td>
					</tr>
					</c:if>
					<tr>
						<th scope="row">제목</th>
						<td class="left">
							<div class="inputBox_S">
								<label for="nttSj" class="hide">제목</label>
								<input  type="text" name="nttSj" id="nttSj" " value="" minlength="2">
							</div>
						</td>
					</tr>
					<tr>
						<th height="23" class="emphasisRight" ><spring:message code="cop.nttCn" />
					    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
					    <td >


						    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="noStyle">
							    <tr>
							    	<td class="left">
							      		<textarea id="nttCn" name="nttCn" class="textarea"  title="내용입력"></textarea>
							      		<form:errors path="nttCn" />
							    	</td>
							    </tr>
							</table>


						</td>
					</tr>
					
				  <c:if test="${param.bbsId eq 'BBSMSTR_000000000042'}">
				  <tr>
						<th scope="row">Youtube Link</th>
						<td class="left">
							<div class="inputBox_S">
								<label for="youtube_link" class="hide">제목</label>
								<input  type="text" name="youtube_link" id="youtube_link" value="">
							</div>
						</td>
					</tr>
				  </c:if>
				  <c:if test="${bdMstr.fileAtchPosblAt == 'Y' && param.bbsId != 'BBSMSTR_000000000042'}">
				  <tr>
				    <th><spring:message code="cop.atchFile" /></th>
				    <td>

					<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력"/>
			           
						        	<div id="egovComFileList"></div>
	
				    </td>
				  </tr>
			
				  </c:if>								
			</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
					<a href="#" id="btnSave" role="button" class="btn1 clr_Dgray">저장</a>
					<a onclick="javascript:location.reload();" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_000000000001'/>" role="button" class="btn1 clr_Wgray">목록</a>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		</form:form>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>