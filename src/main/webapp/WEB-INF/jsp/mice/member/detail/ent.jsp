<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<form:form commandName="entrprsManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberSelectUpdt.do?action=entRegist" name="entrprsManageVO" method="post" >
<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
	<input name="checkedIdForDel" type="hidden" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
<input type="hidden" name="userTyForPassword" value="<c:out value='${entrprsManageVO.userTy}'/>" />
<input type="hidden" name="uniqId" value="${entrprsManageVO.uniqId }"/>
<input type="hidden" name="entrprsMberSttus" value="${entrprsManageVO.entrprsMberSttus}"/>

<script type="text/javascript">
	function action_password_change(){
		$('form').attr('action','/uss/umt/EgovEntrprsPasswordUpdtView.do?action=entRegist');
		$('form').submit();
	}
	

</script>
<!-- for validation -->
   			
<table class="adm_tbl2">
	<caption>사용자 정보 상세</caption>
		<colgroup>
			<col width="24%">
			<col >
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="entrprsmberId" class="hide">아이디</label>
						<input class="readonly" type="text" name="entrprsmberId" id="entrprsmberId" value="${entrprsManageVO.entrprsmberId}" minlength="2" required readonly>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">협력사명</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="cmpnyNm" class="hide">성명</label>
						<input type="text" name="cmpnyNm" id="cmpnyNm" value="${d:decrypt(entrprsManageVO.cmpnyNm)}" minlength="2" required>
					</div>
				</td>
			</tr>
			<!-- <tr>
				<th scope="row">비밀번호</th>
				<td>
					<div class="inputBox_S">
						<label for="password" class="hide">비밀번호</label>
						<input type="password" name="password" id="password" size="16" value="" minlength="8" maxlength="16" required>
					</div>
				</td>
			</tr>	
			<tr>
				<th scope="row">비밀번호확인</th>
				<td>
					<div class="inputBox_S">
						<label for="password2" class="hide">비밀번호확인</label>
						<input type="password" name="password2" id="password2" size="16" value=""  minlength="8" maxlength="16" required>
					</div>
				</td>
			</tr> -->
			<tr>
				<th scope="row">전화번호</th>
				<td class="left">
					<div class="inputBox_S">
						<input type="text" class="wd27per" size="3" name="areaNo" id="areaNo"  value="${entrprsManageVO.areaNo}"  minlength="2" maxlength="3" required>-
						<input type="text" class="wd27per"  size="4" name="entrprsMiddleTelno" id="entrprsMiddleTelno"  value="${entrprsManageVO.entrprsMiddleTelno}"  minlength="3" maxlength="4" required>-
						<label for="homeendTelno" class="hide">전화번호</label>
						<input type="text"  class="wd27per" size="4" name="entrprsEndTelno" id="entrprsEndTelno"  value="${entrprsManageVO.entrprsEndTelno}"  minlength="4" maxlength="4" required>
					</div>
				</td>
			</tr>	
			<tr>
			<th scope="row">이메일</th>
			<td class="left">
				<div class="inputBox_S">
					<input type="text" name="applcntEmailAdres" id="applcntEmailAdres" value="${entrprsManageVO.applcntEmailAdres}" required>
				</div>
			</td>
		</tr>			
	</tbody>
</table>
	<!-- 버튼 위치(s) -->
	<div class="btn_area">
		<div class="center">
			<a href="#" id="btnSave" role="button" class="btn1 clr_Dgray">저장</a>
			<a onclick="javascript:location.reload();" role="button" class="btn1 clr_Wgray">취소</a>
			<a onclick="javascript:action_password_change();" class="btn1 clr_Wgray">비밀번호 변경</a>
			<a href="<c:url value='/uss/umt/EgovEntrprsMberManage.do?action=entRegist&pageIndex=${userSearchVO.pageIndex}'/>" role="button" class="btn1 clr_Wgray">목록</a>
		</div>
	</div>
	<!--// 버튼 위치(e) -->
</form:form>