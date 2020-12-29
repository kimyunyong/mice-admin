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
	<h3>지원관리 > HICO Contact 관리</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/hico/form/contact_list.do" method="post">
		<input type="hidden" name="idx" value="<c:out value='${vo.idx}'/>" />
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
				<div class="brd_p">
				<label>직원명</label>
                <input class="brdSelect1" name="searchWrd" type="text" size="35" value='<c:out value="${vo.searchWrd}"/>' maxlength="35"  title="검색어 입력">
				<div class="btn_areaR">
				<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</div>						
		</div>		
		</form>
		
		<table width="100%" cellpadding="8" class="adm_tbl2" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col width="30%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">E-mail</th>
					<th scope="col">직원명</th>
			    	<th scope="col">처리</th>
			    	<th scope="col">등록일</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>${result.idx}</td>
					<td><a href="/hico/form/contact_info.do?idx=${result.idx}"><c:out value="${d:decrypt(result.requester_email)}" /></a></td>
					<td><c:out value="${d:decrypt(result.manager_name)}" /></td>
			   		<td><c:out value="${result.confirm_status }" /></td>
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
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="10"></td>
			  </tr>
			</table>
			
			
			<div align="center">
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