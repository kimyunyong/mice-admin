<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').submit();
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>경주사진아카이브관리 <span>></span> 아카이브관리</h3>
	<section class="sect_nonetit">
		<h4>아카이브 리스트</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/cvb/archive/info_list.do" method="post">
			<input type="hidden" name="idx" value="<c:out value='${vo.idx}'/>" />
			<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
			<div class="brd_p">
			<div class="search_sort_type">


					<dl class="nst02">
						<dt><select name="search" class="brdSelect1" title="언어선택">
										   <option value="">전체</option>
										   <c:forEach var="result" items="${resultCodeList}" varStatus="status">
												<option value="${result.idx}">${result.code_name}</option>
										   </c:forEach>
									</select></dt>
						<dd>				
									<select name="searchCnd" class="brdSelect1" title="언어선택">
										   <option value="0" <c:if test="${vo.searchCnd == '1' }">selected</c:if>>제목</option>
										   <option value="1"<c:if test="${vo.searchCnd == '1' }">selected</c:if>>등록자</option>
									</select></dd>
					</dl>




					<dl class="nst01">
						<dt class="display_none"></dt>
						<dd><input class="brdSelect2" name="searchWrd" type="text"  value='<c:out value="${vo.searchWrd}"/>' maxlength="35"  title="검색어 입력">
</dd>
					</dl>




			</div>
			<div class="search_btn_type">
				<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
                <a class="btn2 clrGrad_Wgray" href="/cvb/archive/info_insert.do?mode=insert" id="btnRegist" align="right">등록</a>
                </sec:authorize>		
			</div>

				
				
				</div>						
		</form>

		<table class="adm_tbl2 mobile_none" summary="경주사진아카이브에 관한 테이블입니다. 분류, 이미지, 제목, 등록일, 등록일자등의 정보를 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col />
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">분류</th>
					<th scope="col">이미지</th>
			    	<th scope="col">제목</th>
			    	<th scope="col">등록일</th>
			    	<th scope="col">등록자</th>
			  	</tr>
			</thead>

			<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td>${result.idx}</td>
							<td>${result.code_names }</a></td>
							<td><a href="/cvb/archive/info_info.do?idx=${result.idx}"><img src="<c:url value='/com/image/image_info.do'/>?name=${result.thumb_min_file_path}&ext=${result.file_ext}" class="wd100per"/></a></td>
					   		<td><a href="/cvb/archive/info_info.do?idx=${result.idx}">${result.title_ko }</a></td>
					   		<td>${result.reg_date}</td>
					   		<td>${result.writer_id}</td>
					 	</tr>
					 </c:forEach>
			 </tbody>
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>

			
<c:forEach var="result" items="${resultList}" varStatus="status">
					
<!--모바일에서만 보임 -->
<div class="mobile_list">
<!-- 	<dl>
		<dt>번호</dt>
		<dd>${result.idx}</dd>
	</dl> -->

	<dl>
		<dt>분류</dt>
		<dd>${result.code_names }</dd>
	</dl>
	<dl>
		<dt>이미지</dt>
		<dd><a href="/cvb/archive/info_info.do?idx=${result.idx}"><img src="<c:url value='/com/image/image_info.do'/>?name=${result.thumb_min_file_path}&ext=${result.file_ext}" class="wd100per"/></a></dd>
	</dl>
	<dl>
		<dt>제목</dt>
		<dd><a href="/cvb/archive/info_info.do?idx=${result.idx}">${result.title_ko }</a></dd>
	</dl>
	<dl>
		<dt>등록일</dt>
		<dd>${result.reg_date}</dd>
	</dl>
	<dl>
		<dt>등록자</dt>
		<dd>${result.writer_id}</dd>
	</dl>
</div>
<!--//모바일에서만 보임 -->
</c:forEach>






			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="image"
			            jsFunction="fnLinkPage"
			            />
			    </div>

			</div>
			
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>