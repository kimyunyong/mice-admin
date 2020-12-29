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
	<h3>경주사진아카이브관리 <span>></span> 다운로드내역</h3>
	<section class="sect_nonetit">
		<h4>아카이브 리스트</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/cvb/archive/log_list.do" method="post">
			<input type="hidden" name="idx" value="<c:out value='${vo.idx}'/>" />
			<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
			<div class="brd_p">
				<div class="search_sort_type">

					<dl>
						<dt><select name="searchCnd" class="brdSelect1" title="언어선택">
											   <option value="0">전체</option>
										</select></dt>
						<dd><input class="brdSelect2" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35"  title="검색어 입력"></dd>
					</dl>


				</div>
				<div class="search_btn_type">
					<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>  
				</div>	
			</div>						
		</form>


		<!-- 웹,패드에서만 보임 -->
		<table class="adm_tbl2 mobile_none" summary="경주사진아카이브에 관한 테이블입니다. 분류, 이미지, 제목, 등록일, 등록일자등의 정보를 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="7%"/>
				<col width="7%"/>
				<col "/>
				<col width="10%"/>
				<col width="14%"/>
				<col width="14%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">사진번호</th>
					<th scope="col">제목</th>
			    	<th scope="col">용도</th>
			    	<th scope="col">날짜</th>
			    	<th scope="col">IP</th>
			  	</tr>
			</thead>

			<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td>${result.idx}</td>
							<td>${result.archive_idx }</a></td>
							<td><a href="/cvb/archive/info_info.do?idx=${result.archive_idx}">${result.title_ko }</a></td>
					   		<td>${result.purpose_text}</td>
					   		<td>${result.reg_date}</td>
					   		<td>${result.ip}</td>
					 	</tr>
					 </c:forEach>
			 </tbody>
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>
		<!-- //웹,패드에서만 보임 -->





		<!-- 모바일에서만 보임 -->

<!-- mobile_list -->
	<c:forEach var="result" items="${resultList}" varStatus="status">
<div class="mobile_list">
<!-- 	<dl>
		<dt>번호</dt>
		<dd>${result.idx}</dd>
	</dl> -->
	<dl>
		<dt>사진번호</dt>
		<dd>${result.archive_idx }</dd>
	</dl>

	<dl>
		<dt>제목</dt>
		<dd><a href="/cvb/archive/info_info.do?idx=${result.archive_idx}">${result.title_ko }</a></dd>
	</dl>

	<dl>
		<dt>용도</dt>
		<dd>${result.purpose_text}</dd>
	</dl>

	<dl>
		<dt>날짜</dt>
		<dd>${result.reg_date}</dd>
	</dl>

	<dl>
		<dt>IP</dt>
		<dd>${result.ip}</dd>
	</dl>


</div>
 </c:forEach>
<!-- //mobile_list -->

		<!-- //모바일에서만 보임 -->

			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="image"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>

	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>