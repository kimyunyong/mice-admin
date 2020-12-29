<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').submit();
		});
		
		$('button[name=codeRegist]').on('click', function(){
			if($(this).parent().parent().find('input[name=code_name]').val() == ''){
				alert('분류명을 입력해주세요.');
				$(this).parent().parent().find('input[name=code_name]').focus();
				return false;
			}
			$(this).parent().parent().find('form').submit();
		});
		
		$('button[name=codeEdit]').on('click',function(){
			if($(this).parent().parent().find('input[name=code_name]').val() == ''){
				alert('분류명을 입력해주세요.');
				$(this).parent().parent().find('input[name=code_name]').focus();
				return false;
			}
			$(this).parent().parent().find('form').attr('action','/cvb/archive/code_edit.do');
			$(this).parent().parent().find('form').submit();
		})
		
		$('button[name=codeDelete]').on('click',function(){
			if(!confirm('삭제하시겠습니까?'))
				return false;
			$(this).parent().parent().find('form').attr('action','/cvb/archive/code_delete.do');
			$(this).parent().parent().find('form').submit();
		})
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>경주사진아카이브관리 <span>></span> 아카이브관리 <span>></span> 분류코드관리</h3>
	<section class="sect_nonetit">
		<h4>코드리스트</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/cvb/form/promotion_list.do" method="post">
		<input type="hidden" name="idx" value="<c:out value='${vo.idx}'/>" />
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		<!-- <div class="brd_p">
				<div class="btn_areaR">
					<a class="btn2 clrGrad_Wgray" id="btnRegist">등록/수정</a>
				</div>						
		</div>	 -->	
		</form>
		

		<!-- 웹이랑 패드에서만 보임-->
		<table class="adm_tbl2 mobile_none" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="5%"/>
				<col width="28%"/>
				<col width="28%"/>
				<col />
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">코드번호</th>
					<th scope="col">순서</th>
					<th scope="col">분류명(국문)</th>
					<th scope="col">분류명(영문)</th>
			    	<th scope="col">생성일</th>
			    	<th scope="col"></th>
			  	</tr>
			</thead>
			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			
			 	<tr>
			 		
					<td>
						${result.idx}
						<form name="editForm" method="post" action="/cvb/archive/code_edit.do">
							<input name="idx" type="hidden" value="${result.idx}"/>
							<input name="sort_no" type="hidden" value="${result.sort_no }"/>
							<input name="code_name" type="hidden" style="width:100%" value="${result.code_name}"/>
							<input name="code_name_en" type="hidden" style="width:100%" value="${result.code_name_en}"/>
						</form>
					</td>
					<td>
						${result.sort_no }
					</td>
					<td>
						<input type="text" name="cd" style="width:100%" value="${result.code_name}"/>
					</td>
					<td>
						<input type="text" name="cd_en" style="width:100%" value="${result.code_name_en}"/>
					</td>
			   		<td>
			   			${result.reg_date }
			   		</td>
                    <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
			   		<td>
			   			<button class="btn2" name="codeEdit">수정</button>
			   			<button class="btn2" name="codeDelete">삭제</button>
			   		</td>
                    </sec:authorize>
			   		
			 	</tr>
			 </c:forEach>
			  	<tr>
			  		<form name="registForm" type="post" action="/cvb/archive/code_insert.do">
						<td></td>
						<td>
							${sort_no}
							<input name="sort_no" type="hidden" value="${sort_no}"/>
						</td>
						<td colspan="3"><input name="code_name" type="text" style="width:100%" value=""/></td>
                        <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
				   		<td>
				   			<button class="btn22" name="codeRegist" onclick="javascript:return false;">추가</button>
				   		</td>
                        </sec:authorize>
			   		</form>
			 	</tr>
			 
			 </tbody>
			</table>
		
			
			
<%-- 			<div align="center" style="padding-top:5px">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div> --%>
			
			</td>
			</tr>
			</table>

		<!-- //웹이랑 패드에서만 보임-->

			<!-- 모바일에서만 보임 -->

		<c:forEach var="result" items="${resultList}" varStatus="status">
				<!-- mobile_list -->
				<div class="mobile_list">
					<dl>
						<dt>코드번호</dt>
						<dd>${result.idx}
						<form name="editForm" method="post" action="/cvb/archive/code_edit.do">
							<input name="idx" type="hidden" value="${result.idx}"/>
							<input name="sort_no" type="hidden" value="${result.sort_no }"/>
							<input name="code_name" type="hidden" style="width:100%" value="${result.code_name}"/>
							<input name="code_name_en" type="hidden" style="width:100%" value="${result.code_name_en}"/>
						</form></dd>
					</dl>
					<dl>
						<dt>순서</dt>
						<dd>${result.sort_no }</dd>
					</dl>
					<dl>
						<dt>분류명<br>(국문)</dt>
						<dd><input type="text" name="cd" style="width:100%" value="${result.code_name}"/></dd>
					</dl>
					<dl>
						<dt>분류명<br>(영문)</dt>
						<dd><input type="text" name="cd_en" style="width:100%" value="${result.code_name_en}"/></dd>
					</dl>
					<dl>
						<dt>생성일</dt>
						<dd>${result.reg_date }</dd>
					</dl>

					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
					<div class="m_listin_btn">
			   			<button class="btn2" name="codeEdit">수정</button>
			   			<button class="btn2" name="codeDelete">삭제</button>
					</div>
                    </sec:authorize>
								</div>
				<!-- //mobile_list -->
			 </c:forEach>

	




				<div class="mobile_list2">
				<h5>추가하기</h5>
			  		<form name="registForm" type="post" action="/cvb/archive/code_insert.do">
							
							<dl>
								<dt>순서</dt>
								<dd>${sort_no}	<input name="sort_no" type="hidden" value="${sort_no}"/></dd>
							</dl>
							
							<dl>
								<dt>분류명<br>(한글)</dt>
								<dd><input name="code_name" type="text" style="width:100%" value=""/></dd>
							</dl>
                        <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">

						<div class="m_listin_btn">
				   			<button class="btn22" name="codeRegist" onclick="javascript:return false;">추가</button>
						</div>
                        </sec:authorize>
			   		</form>
				</div>













			<!-- //모바일에서만 보임 -->

	</section>
</section>
<script type="text/javascript">
	$('input[name=cd]').keypress(function(){
		$(this).parent().parent().find('input[name=code_name]').val($(this).val());
	});
	$('input[name=cd_en]').keypress(function(){
		$(this).parent().parent().find('input[name=code_name_en]').val($(this).val());
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>