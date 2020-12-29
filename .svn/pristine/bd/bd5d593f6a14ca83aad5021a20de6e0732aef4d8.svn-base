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
			location.href='/cvb/brochure/insert.do';
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>자료관리 <span>></span> 홍보물관리</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/cvb/brochure/list.do" method="post">
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
				<div class="brd_p">
				<div class="search_sort_type">
				
                
				
				
				<dl>
					<dt><select name="searchCnd">
					<option value="0" <c:if test="${vo.searchCnd == '0' }">selected</c:if>>구분</option>
					<option value="1" <c:if test="${vo.searchCnd == '1' }">selected</c:if>>제목</option>
					<option value="2" <c:if test="${vo.searchCnd == '2' }">selected</c:if>>등록자(ID)</option>
				</select></dt>
					<dd><input class="brdSelect1" name="searchWrd" type="text" value='<c:out value="${vo.searchWrd}"/>' maxlength="35"  title="검색어 입력"></dd>
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
		<table  class="adm_tbl2 mobile_none" summary="홍보물관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col width="20%"/>
				<col width="40%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
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
					<td><img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id }" style="width:100px;height:100px"/></td>
					<td><a href="/cvb/brochure/info.do?idx=${result.idx}">${result.title_ko }</a></td>
					<td>${result.reg_date}</td>
			   		<td>${d:decrypt(result.user_nm) }(${result.reg_id })</td>
			 	</tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>

<!-- 		//웹,패드에서 보이는 리스트 -->

<!-- 모바일에서만 보이는 리스트 -->
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="mobile_list">

						<dl>
							<dt>이미지</dt>
							<dd><img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id }" class="wd100per"/></dd>
						</dl>
						<dl>
							<dt>제목</dt>
							<dd><a href="/cvb/brochure/info.do?idx=${result.idx}">${result.title_ko }</a></dd>
						</dl>
						<dl>
							<dt>등록일</dt>
							<dd>${result.reg_date}</dd>
						</dl>
						<dl>
							<dt>등록자</dt>
							<dd>${d:decrypt(result.user_nm) }(${result.reg_id })</dd>
						</dl>
					</div>
			 </c:forEach>
<!-- //모바일에서만 보이는 리스트 -->

			
			
			<div align="center" class="pt20">
			    <div>
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