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
			location.href='/cvb/lodgment/insert.do';
		});
	});
	
	function fnLinkPage(i){
		$('input[name=pageIndex]').val(i);
		$('form[name=form]').submit();
	}	
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">


<!-- 171222 -->

	<h3>콘텐츠관리 <span>></span> 숙박/관광지/프로그램 관리</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/cvb/lodgment/list.do" method="post">
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
				<div class="brd_p">
				<div class="search_sort_type">
				<dl>
				<dt>
				<select name="searchCnd">
					<option value="0" <c:if test="${vo.searchCnd == '0' }">selected</c:if>>구분</option>
					<option value="1" <c:if test="${vo.searchCnd == '1' }">selected</c:if>>등급</option>
					<option value="2" <c:if test="${vo.searchCnd == '2' }">selected</c:if>>시설명</option>
				</select>
				</dt>
				<dd>
                <input class="brdSelect1" name="searchWrd" type="text" size="35" value='<c:out value="${vo.searchWrd}"/>' maxlength="35"  title="검색어 입력">
</dd>

</dl>
				</div>
				<div class="search_btn_type">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
					<a class="btn2 clrGrad_Wgray" id="btnRegist">등록</a>
				</sec:authorize>
				<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</div>						
		</div>		
		</form>


		<!-- 웹, 패드에서 보이는 리스트 -->
		<table class="adm_tbl2 mobile_none" summary="숙박관리에  관한 테이블입니다.구분, 등급, 시설명, 등록자, 등록일 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="15%"/>
				<col width="10%"/>
				<col/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">구분</th>
					<th scope="col">등급</th>
			    	<th scope="col">시설명</th>
			    	<th scope="col">등록자</th>
			    	<th scope="col">등록일</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>${result.idx}</td>
					<td><a href="/cvb/lodgment/info.do?idx=${result.idx}">${result.type }</a></td>
					<td><a href="/cvb/lodgment/info.do?idx=${result.idx}">${result.class_info }</a></td>
					<td><a href="/cvb/lodgment/info.do?idx=${result.idx}">${result.name_ko}</a></td>
			   		<td>${result.reg_id }</td>
			   		<td>${result.reg_date}</td>
			 	</tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>
		<!-- //웹, 패드에서 보이는 리스트 -->


<!-- 모바일에서만 보이는 리스트 -->
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="mobile_list">


						<dl>
							<dt>구분</dt>
							<dd><a href="/cvb/lodgment/info.do?idx=${result.idx}">${result.type }</a></dd>
						</dl>
						<dl>
							<dt>등급</dt>
							<dd><a href="/cvb/lodgment/info.do?idx=${result.idx}">${result.class_info }</a></dd>
						</dl>
						<dl>
							<dt>시설명</dt>
							<dd><a href="/cvb/lodgment/info.do?idx=${result.idx}">${result.name_ko}</a></dd>
						</dl>
						<dl>
							<dt>등록자</dt>
							<dd>${result.reg_id }</dd>
						</dl>
						<dl>
							<dt>등록일</dt>
							<dd>${result.reg_date}</dd>
						</dl>

					</div>
			 </c:forEach>
<!-- //모바일에서만 보이는 리스트 -->



			
			<div id="pagination_info" align="center">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>

<!-- //171222 -->

			    <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
			    </div>
			</div>
			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>