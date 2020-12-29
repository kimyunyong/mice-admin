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
			location.href='/${site}/banner/${type}/banner_insert.do';
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>메인관리 <span>></span> <c:choose><c:when test="${site == 'cvb' && type == '1' }">CVB 메인비주얼관리</c:when>
	<c:when test="${site == 'cvb' && type == '4' }">CVB 팝업관리</c:when>
	<c:when test="${site == 'cvb' && type == '5' }">CVB 행사배너 1 관리</c:when>
	<c:when test="${site == 'cvb' && type == '6' }">CVB 행사배너 2 관리</c:when>
	<c:when test="${type == '3' }">공통배너관리</c:when><c:when test="${site == 'hico' && type == '1' }">HICO 메인비주얼관리</c:when>
	<c:when test="${site == 'hico' && type == '2' }">HICO 배너관리</c:when>
	<c:when test="${site == 'hico' && type == '4' }">HICO 팝업관리</c:when>
	</c:choose></h3>
	<section class="sect_nonetit">
		<h4>리스트</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/${site}/banner/${type}/list.do" method="post">
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
				

			<div class="brd_p">
				<div class="search_btn_type float_r">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
						<a class="btn2 clrGrad_Wgray" id="btnRegist">등록</a>
					</sec:authorize>	
				</div>		
				</div>		










		</form>

		<!-- 웹, 패드에서만 보임 -->
		<table  class="adm_tbl2 mobile_none" summary="배너에  관한 테이블입니다.순서, 제목, 작성일일 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="10%"/>
				<col width="60%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">순서</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
			    	<th scope="col">파일</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>${result.sort_no}</td>
					<td><a href="/${site}/banner/${type}/banner_info.do?idx=${result.idx}">${result.title_ko }</a></td>
			   		<td>
			   			<fmt:parseDate  value="${result.reg_date}" var="dateFmt" pattern="yyyy-MM-dd"/>
			   			<fmt:formatDate value="${dateFmt }" pattern="yyyy-MM-dd"/>
			   			
			   		</td>
			   		<td><c:if test="${result.image_file_id != ''}"><img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id }" style="width:80px;height:80px"/></c:if></td>
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
<!-- 모바일에서만보임 -->
	<div class="mobile_list">
				<dl>
			    	<dt>순서</dt>
					<dd>${result.sort_no}</dd>
			  	</dl>
				<dl>
			    	<dt>제목</dt>
					<dd><a href="/${site}/banner/${type}/banner_info.do?idx=${result.idx}">${result.title_ko }</a></dd>
			  	</dl>
				<dl>
			    	<dt>작성일</dt>
					<dd><fmt:parseDate  value="${result.reg_date}" var="dateFmt" pattern="yyyy-MM-dd"/>
			   			<fmt:formatDate value="${dateFmt }" pattern="yyyy-MM-dd"/>
			   			</dd>
			  	</dl>
				<dl>
			    	<dt>파일</dt>
					<dd><c:if test="${result.image_file_id != ''}"><img src="/cmm/fms/getImage.do?atchFileId=${result.image_file_id }" class="wd100per" /></c:if></dd>
			  	</dl>
</div>
			 </c:forEach>


<!-- 모바일에서만보임 -->






			
			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="image"
			            jsFunction="fnLinkPage"
			            />
			    </div>
<!-- 			    <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
			    </div> -->
			</div>
			
			</td>
			</tr>
			</table>
		<!-- //웹, 패드에서만 보임 -->

	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>