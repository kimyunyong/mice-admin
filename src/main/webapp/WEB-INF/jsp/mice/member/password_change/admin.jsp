<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form:form commandName="passwordChgVO" action="/uss/umt/EgovUserPasswordUpdt.do?action=adminRegist" name="passwordChgVO" method="post" >
    <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
    <input name="checkedIdForDel" type="hidden" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
    <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
    <!-- 우편번호검색 -->
    <input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
	<table class="adm_tbl2">
		<caption>비밀번호 변경</caption>
		<colgroup>
			<col width="24%">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="emplyrId" class="hide">아이디</label>
						<input class="readonly" name="emplyrId" id="emplyrId" title="사용자아이디" type="text"  value="<c:out value='${userManageVO.emplyrId}'/>"  maxlength="20" readonly/>
	                    <input name="uniqId" id="uniqId" title="uniqId" type="hidden"  value="<c:out value='${userManageVO.uniqId}'/>"/>
	                    <input name="userTy" id="userTy" title="userTy" type="hidden" value="<c:out value='${userManageVO.userTy}'/>"/>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">기존 <br class="mobile_show">비밀번호</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="oldPassword" class="hide">기존 비밀번호</label>
						<input type="password" name="oldPassword" id="oldPassword"  value="" minlength="8" maxlength="16" required>
					</div>
				</td>
			</tr>	
			<tr>
				<th scope="row">비밀번호</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="newPassword" class="hide">비밀번호</label>
						<input type="password" name="newPassword" id="newPassword" value="" minlength="8" maxlength="16" required>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 <br class="mobile_show">확인</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="newPassword2" class="hide">비밀번호</label>
						<input type="password" name="newPassword2" id="newPassword2"  value="" minlength="8" maxlength="16" required>
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
			<a href="<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>?action=adminRegist&selectedId=<c:out value='${userManageVO.uniqId}'/>" role="button" class="btn1 clr_Wgray">뒤로가기</a>
			<a href="<c:url value='/uss/umt/EgovUserManage.do?action=adminRegist'/>" role="button" class="btn1 clr_Wgray">목록</a>
		</div>
	</div>
	<!--// 버튼 위치(e) -->
</form:form>		