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
	<h3>지원관리 <span>></span> RFP 관리</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>

		<form name="form" action="/cvb/form/rfp_list.do" method="post">
		<input type="hidden" name="idx" value="<c:out value='${vo.idx}'/>" />
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
				<div class="brd_p">
		<div class="search_sort_type">

<!-- 171222 -->

<dl>
	<dt>행사명,담당자명</dt>
	<dd><input class="brdSelect1" name="searchWrd" type="text" size="35" value='<c:out value="${vo.searchWrd}"/>' maxlength="35"  title="검색어 입력"></dd>
</dl>
                
<!-- //171222 -->


			</div>
				<div class="search_btn_type">
				<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</div>						
		</div>		
		</form>
		<!-- 웹,패드에서만 보임 -->
		<table class="adm_tbl2 mobile_none" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col />
				<col width="10%"/>
				<col width="16%"/>
				<col width="10%"/>
				<col width="7%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">행사명</th>
					<th scope="col">연락처</th>
			    	<th scope="col">E-mail</th>
			    	<th scope="col">담당자명</th>
			    	<th scope="col">처리</th>
			    	<th scope="col">등록일</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>${result.idx}</td>
					<td><a href="/cvb/form/rfp_info.do?idx=${result.idx}">${result.event_name}</a></td>
					<td>${d:decrypt(result.manager_tel_no)}</td>
			   		<td>${d:decrypt(result.manager_email) }</td>
			   		<td>${d:decrypt(result.manager_name)}</td>
			   		<td>${d:decrypt(result.confirm_status)}</td>	    
			   		<td>${d:decrypt(result.reg_date)}</td>
			 	</tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>



		<!-- 모바일에서만 보임 -->
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="mobile_list">
					<dl>
						<dt>번호</dt>
						<dd>${result.idx}</dd>
					</dl>

					<dl>
						<dt>행사명</dt>
						<dd><a href="/cvb/form/rfp_info.do?idx=${result.idx}">${result.event_name}</a></dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>${d:decrypt(result.manager_tel_no)}</dd>
					</dl>
					<dl>
						<dt>E-mail</dt>
						<dd>${d:decrypt(result.manager_email) }</dd>
					</dl>
					<dl>
						<dt>담당자명</dt>
						<dd>${d:decrypt(result.manager_name)}</dd>
					</dl>
					<dl>
						<dt>처리</dt>
						<dd>${d:decrypt(result.confirm_status)}</dd>
					</dl>
					<dl>
						<dt>등록일</dt>
						<dd>${d:decrypt(result.reg_date)}</dd>
					</dl>
			</div>
			</c:forEach>
		<!-- //모바일에서만 보임 -->

			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="image"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			    <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
			    </div>
			</div>
			
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>