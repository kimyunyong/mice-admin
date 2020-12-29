<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>


		<h4>직원등록</h4>
			<form:form commandName="userManageVO" action="/member/userRegistAction.do" name="userManageVO" method="post" >
				<table  class="adm_tbl2">
					<caption>게시판 글쓰기 및 파일첨부</caption>
						<colgroup>
							<col width="24%">
							<col >
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">구분</th>
								<td class="left">
									<div class="inputBox_S">
										<label for="permission" class="hide">구분</label>
										<select name="permission">
											<option value="ROLE_SUPERADMIN">Superadmin</option>
											<option value="ROLE_ADMIN">Admin</option>
											<option value="ROLE_MANAGER">Manager</option>
											<option value="ROLE_STAFF">Staff</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">팀</th>
								<td class="left">
									<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
										<c:param name="name" value="team_idx" />
										<c:param name="type" value="팀" />
										<c:param name="result" value="1" />
									</c:import>
								</td>
							</tr>
							<tr>
								<th scope="row">직책</th>
								<td class="left">
									<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
										<c:param name="name" value="position" />
										<c:param name="type" value="직책" />
										<c:param name="result" value="1" />
									</c:import>
								</td>
							</tr>
							<tr>
								<th scope="row">아이디</th>
								<td class="left">
									<div class="inputBox_S">
										<label for="emplyrId" class="hide">아이디</label>
										<input type="text" name="emplyrId" id="id" size="15" value="" minlength="2" required>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">성명</th>
								<td class="left">
									<div class="inputBox_S">
										<label for="emplyrNm" class="hide">성명</label>
										<input type="text" name="emplyrNm" id="emplyrNm" size="15" value="" minlength="2" required>
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
										<input type="text" size="4" class="wd27per" name="homemiddleTelno" id="homemiddleTelno"  value=""  minlength="3" maxlength="4" required>-
										<label for="homeendTelno" class="hide">전화번호</label>
										<input type="text" size="4" class="wd27per" name="homeendTelno" id="homeendTelno"  value=""  minlength="4" maxlength="4" required>
									</div>
								</td>
							</tr>	
							<tr>
								<th scope="row">이메일</th>
								<td class="left">
									<div class="inputBox_S">
										<input type="text" name="emailAdres" id="emailAdres" size="20" value="" required>
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
							<a href="<c:url value='/uss/umt/EgovUserManage.do?action=adminRegist'/>" role="button" class="btn1 clr_Wgray">목록</a>
						</div>
					</div>
					<!--// 버튼 위치(e) -->
				</form:form>