<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<h4>회원 등록</h4>
			<form:form commandName="mberManageVO" action="/member/nomalRegistAction.do?action=nomalRegist" name="mberManageVO" method="post" >
				<table class="adm_tbl2">
					<caption>게시판 글쓰기 및 파일첨부</caption>
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
										<input type="text" name="mberId" id="id" size="15" value="" minlength="2" required>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">성명</th>
								<td class="left">
									<div class="inputBox_S">
										<label for="mberNm" class="hide">성명</label>
										<input type="text" name="mberNm" id="mberNm" size="15" value="" minlength="2" required>
									</div>
								</td>
							</tr>				
							<tr>
								<th scope="row">비밀번호</th>
								<td class="left">
									<div class="inputBox_S">
										<label for="password" class="hide">비밀번호</label>
										<input type="password" name="password" id="password" size="16" value="" minlength="8" maxlength="16" required>
									</div>
								</td>
							</tr>					
							<tr>
								<th scope="row">비밀번호<br class="mobile_show">확인</th>
								<td class="left">
									<div class="inputBox_S">
										<label for="password2" class="hide">비밀번호확인</label>
										<input type="password" name="password2" id="password2" size="15" value=""  minlength="8" maxlength="16" required>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td class="left">
									<div class="inputBox_S">
										<input type="text" size="3" class="wd27per" name="areaNo" id="areaNo"  value=""  minlength="2" maxlength="3" required>-
										<input type="text" size="4" class="wd27per" name="middleTelno" id="middleTelno"  value=""  minlength="3" maxlength="4" required>-
										<label for="endTelno" class="hide">전화번호</label>
										<input type="text" size="4" class="wd27per" name="endTelno" id="endTelno"  value=""  minlength="4" maxlength="4" required>
									</div>
								</td>
							</tr>	
							<tr>
								<th scope="row">이메일</th>
								<td class="left">
									<div class="inputBox_S">
										<input type="text" name="mberEmailAdres" id="mberEmailAdres" size="20" value="" required>
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
							<a href="<c:url value='/uss/umt/EgovMberManage.do?action=nomalRegist'/>" role="button" class="btn1 clr_Wgray">목록</a>
						</div>
					</div>
					<!--// 버튼 위치(e) -->
				</form:form>