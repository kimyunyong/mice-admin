<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').submit();
		});
		$('#btnRegist').on('click',function(){
			location.href='/cvb/organizer/insert.do?org_tp=${param.org_tp }';
		});
	});
	
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.action = '/cvb/organizer/list.do?org_tp=${param.org_tp }';
	    document.form.submit();
	}
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3><c:choose><c:when test="${param.org_tp == '0' }">콘텐츠관리 <span>></span> 컨벤션서비스업체관리</c:when><c:when test="${param.org_tp == '1' }">콘텐츠관리 <span>></span> 유관기관관리</c:when><c:when test="${param.org_tp == '4' }">얼라이언스관리 <span>></span> 얼라이언스관리</c:when></c:choose></h3>
	<section class="sect_nonetit">
		<h4>정보</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/cvb/organizer/list.do?org_tp=${param.org_tp }" method="get">
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		<input name="org_tp" type="hidden" value="${param.org_tp }" />
		<div class="brd_p">
		
			<div class="search_sort_type">
			<dl class="n_st_sort">
			<dt>
				<c:if test="${param.org_tp == '0' }">
					<select name="type">
						<option value="">전체</option>
						<option value="PEO">PEO</option>
						<option value="PCO">PCO</option>
						<option value="이벤트사">이벤트사</option>
						<option value="여행사">여행사</option>
						<option value="수송업체">수송업체</option>
					</select>
				</c:if>
				<select name="searchCnd">
					<option value="0">구분</option>
					<option value="1" <c:if test="${vo.searchCnd == '1' }">selected</c:if>>기관명</option>
					<option value="2" <c:if test="${vo.searchCnd == '2' }">selected</c:if>>연락처</option>
					<option value="3" <c:if test="${vo.searchCnd == '3' }">selected</c:if>>이메일</option>
				</select>
				</dt>
				<dd><input class="brdSelect1" name="searchWrd" type="text" size="35" value='<c:out value="${vo.searchWrd}"/>' maxlength="35"  title="검색어 입력"></dd>
			</dl>
			</div>
				
			<div class="search_btn_type">
			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
				<a class="btn2 clrGrad_Wgray" id="btnRegist">등록</a>				
				<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
               </sec:authorize>
			</div>	
								
		</div>		
		</form>
		
		
		<!-- 		웹,패드에서 보이는 리스트 -->
		<table class="adm_tbl2 mobile_none" summary="홍보물관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="5%"/>
			<c:if test="${param.org_tp == '4' }">
			<col width="15%"/>
			</c:if>
			<c:if test="${param.org_tp == '0' }">
			<col width="5%"/>
			<col width="20%"/>
			</c:if>
			<c:if test="${param.org_tp == '1' }">
			<col />
			</c:if>
			<col width="15%"/>
			<col width="20%"/>
			<col width="15%"/>
			<col width="8%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<c:if test="${param.org_tp == '4' }">
				<th scope="col">분과</th>
				</c:if>
				<c:if test="${param.org_tp == '0' }">
				<th scope="col">구분</th>
				</c:if>
				<th scope="col">기관명</th>
				<th scope="col">연락처</th>
		    	<th scope="col">이메일</th>
		    	<th scope="col">등록일</th>
		    	<th scope="col">등록자</th>
		  	</tr>
		</thead>

		<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>${result.rowNum}</td>
				<c:if test="${param.org_tp == '4' }">
				<td>${result.sub_type }</td>
				</c:if>
				<c:if test="${param.org_tp == '0' }">
				<td>${result.type }</td>
				</c:if>
				<td><a style="font-weight:bold" href="/cvb/organizer/info.do?idx=${result.idx}&org_tp=${param.org_tp }">${result.organizer_name_ko }</a></td>
				<td>${d:decrypt(result.tel_no) }</td>
				<td>${d:decrypt(result.email)}</td>
		   		<td>${result.reg_date}</td>
		   		<td>${d:decrypt(result.user_nm) }(${result.reg_id})</td>
		 	</tr>
		 </c:forEach>
		 </tbody>
		</table>

		<!-- 		//웹,패드에서 보이는 리스트 -->





<!-- 모바일에서만 보이는 리스트 -->
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="mobile_list">



						<c:if test="${param.org_tp == '4' }">
						<dl>
							<dt>분과</dt>
							<dd>${result.sub_type }</dd>
						</dl>
						</c:if>

					<c:if test="${param.org_tp == '0' }">
						<dl>
							<dt>구분</dt>
							<dd>${result.type }</dd>
						</dl>
					</c:if>


						<dl>
							<dt>기관명</dt>
							<dd><a style="font-weight:bold" href="/cvb/organizer/info.do?idx=${result.idx}&org_tp=${param.org_tp }">${result.organizer_name_ko }</a></dd>
						</dl>
						<dl>
							<dt>연락처</dt>
							<dd>${d:decrypt(result.tel_no) }</dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd>${d:decrypt(result.email)}</dd>
						</dl>

						<dl>
							<dt>등록일</dt>
							<dd>${result.reg_date}</dd>
						</dl>

						<dl>
							<dt>등록자</dt>
							<dd>${d:decrypt(result.user_nm) }(${result.reg_id})</dd>
						</dl>


					</div>
			 </c:forEach>
<!-- //모바일에서만 보이는 리스트 -->




			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>
			
			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>