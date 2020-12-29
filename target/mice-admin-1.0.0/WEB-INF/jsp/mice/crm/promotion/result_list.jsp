<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>


		
<script>
function win_open(url){
	window.open(url, "", "width=1200px, height=800px, resizable=yes, scrollbars=yes");
}
</script>

<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:if test="${fn:length(resultList) > 0 }">
		<table width="100%"class="adm_tbl2 mobile_none" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="55%"/>
				<!--<col width="15%"/>!-->
				<col width="5%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">종류</th>
					<th scope="col">날짜</th>
					<th scope="col">담당자</th>
			    	<th scope="col">내용</th>
			    	<!-- <th scope="col">행사명</th> -->
			    	<th scope="col">첨부</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td>${result.idx}</td>
						<td>${result.promotion_type_name}</td>
						<td>${result.input_date}</td>
						<td>${d:decrypt(result.user_nm)}</td>
						<td><a href="javascript:win_open('/crm/event/promotion_info.do?idx=${result.idx}&today=${today}&promotion_type=${result.promotion_type}&redirect_url2=${requestScope['javax.servlet.forward.request_uri']}?idx=${result.parent_idx}&redirect_url=/crm/event/promotion_end.do');" class="nyroModal__"  style="word-break: break-all;text-align:left;float:left"><pre style="line-height:1.3em"><c:out value="${result.comment}" /></a></td>
				   		<!-- 
				   		<td>
				   			<c:out value="${result.event_name }" />
				   		</td>
				   		 -->
				   		<td>
				   			<c:if test="${result.file_cnt > 0 }">
				   			<a href="/crm/promotion/attach_file_list.do?promotion_idx=${result.idx}" class="nyroModal">@</a>
				   			</c:if>
				   		</td>
				 	</tr>
			 </c:forEach>
			 </tbody>
		</table>


<!-- 180122 -->
<table width="100%" class="adm_tbl2 mobile_show" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="20%"/>
				<col width="20%"/>
				<col />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">날짜</th>
					<th scope="col">담당자</th>
			    	<th scope="col">내용</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td>${result.input_date}</td>
						<td>${d:decrypt(result.user_nm)}</td>
						<td><a href="javascript:win_open('/crm/event/promotion_info.do?idx=${result.idx}&today=${today}&promotion_type=${result.promotion_type}&redirect_url2=${requestScope['javax.servlet.forward.request_uri']}?idx=${result.parent_idx}&redirect_url=/crm/event/promotion_end.do');" class="nyroModal__"  style="word-break: break-all;text-align:left;float:left"><pre style="line-height:1.3em"><c:out value="${result.comment}" /></a></td>

				 	</tr>
			 </c:forEach>
			 </tbody>
		</table>

<!-- //180122 -->

</c:if>
<c:if test="${fn:length(resultList) == 0 }">
<div align="center">등록된 유치활동이 없습니다.</div>
</c:if>