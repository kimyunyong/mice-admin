<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<form:form commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovMberSelectUpdt.do?action=nomalRegist" name="mberManageVO" method="post" >
<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
	<input name="checkedIdForDel" type="hidden" />
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
<!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
<input type="hidden" name="userTyForPassword" value="<c:out value='${mberManageVO.userTy}'/>" />
<input type="hidden" name="uniqId" value="${mberManageVO.uniqId }"/>
<input type="hidden" name="emplyrSttusCode" value="${mberManageVO.mberSttus}"/>


<!-- for validation -->
<script type="text/javascript">
	function action_password_change(){
		$('form').attr('action','/uss/umt/EgovMberPasswordUpdtView.do?action=nomalRegist');
		$('form').submit();
	}
	

</script>  			
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
						<label for="mberId" class="hide">아이디</label>
						<input class="readonly" type="text" name="mberId" id="mberId" size="15" value="${mberManageVO.mberId}" minlength="2" required readonly>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">회원명</th>
				<td class="left">
					<div class="inputBox_S">
						<label for="mberNm" class="hide">성명</label>
						<input type="text" name="mberNm" id="mberNm" size="15" value="${mberManageVO.mberNm}" minlength="2" required>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td class="left">
					<div class="inputBox_S">
						<input type="text" size="3" class="wd27per" name="areaNo" id="areaNo"  value="${mberManageVO.areaNo}"  minlength="2" maxlength="3" required>-
						<input type="text" size="4" class="wd27per" name="middleTelno" id="middleTelno"  value="${mberManageVO.middleTelno}"  minlength="3" maxlength="4" required>-
						<label for="homeendTelno" class="wd27per"class="hide">전화번호</label>
						<input type="text" size="4" class="wd27per" name="endTelno" id="endTelno"  value="${mberManageVO.endTelno}"  minlength="4" maxlength="4" required>
					</div>
				</td>
			</tr>	
			<tr>
			<th scope="row">이메일</th>
			<td class="left">
				<div class="inputBox_S">
					<input type="text" name="mberEmailAdres" id="mberEmailAdres" value="${mberManageVO.mberEmailAdres}" required>
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
			<a href="<c:url value='/uss/umt/EgovMberSelectUpdt.do'/>?action=nomalRegist&pageIndex=${userSearchVO.pageIndex}" role="button" class="btn1 clr_Wgray">목록</a>
		</div>
	</div>
	<!--// 버튼 위치(e) -->
</form:form>