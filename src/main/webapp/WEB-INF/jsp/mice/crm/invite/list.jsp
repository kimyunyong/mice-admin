<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.submit();
	}
	
	$(document).ready(function(){
		$("#btnInsert").click(function(){
			location.href = '/crm/invite/insertForm.do';
		});
		
		$("#btnSearch").click(function(){
		    document.form.submit();
		});
		
	});
</script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	#pagination_info{margin-top: 20px;}
	.right_space{display: inline-block; width: 150px; line-height: 20px;}
</style>

<section id="contentArea">
	<h3>고객DB관리 <span>></span> 뷰로유치관리</h3><!-- 180104 -->
	<section class="sect_nonetit">
		<form name="form" action="/crm/invite/list.do" method="post" enctype="multipart/form-data">
			<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>			
			<div class="wordnoti_area">총 <b>${paginationInfo.totalRecordCount }</b>건이 검색되었습니다.</div>



<!-- 180130 -->
			<table  class="adm_tbl2 " summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
				<caption>게시판 목록</caption>
				<colgroup>
					<col width="27%"/>
					<col/>
				</colgroup>
				<tbody>
				<tr>
					<th scope="row">추진현황</th>
					<td class="left">					
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="implementation_status_search_List" />
							<c:param name="type" value="유치행사추진현황" />
							<c:param name="li" value="N" />
							<c:param name="result" value="${vo.implementation_status_search_List }"/>
						</c:import>
					</td>
									</tr>
				
				
				<tr>
					<th scope="row">국내외 구분</th>
					<td class="left" >					
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="invite_character_search_List" />
							<c:param name="type" value="유치행사성격" />
							<c:param name="li" value="N" />
							<c:param name="result" value="${vo.invite_character_search_List }"/>
						</c:import>
					</td>				
				</tr>
				
								</tr>
				
				
				<tr>
				<tr>
					<th scope="row">분류</th>
					<td class="left">
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="invite_category_search_List" />
							<c:param name="type" value="유치행사분류" />
							<c:param name="li" value="N" />
							<c:param name="result" value="${vo.invite_category_search_List }" />
						</c:import>
					</td>
									</tr>
				
				
				<tr>
					<th scope="row">담당자</th>
					<td class="left" >
						<c:import url="/crm/code/check_box.do" charEncoding="utf-8">
							<c:param name="name" value="relation_name_search_List" />
							<c:param name="type" value="유치행사이름" />
							<c:param name="li" value="N" />
							<c:param name="result" value="${vo.relation_name_search_List }" />
						</c:import>
					</td>
				</tr>
				
				<tr>
					<th scope="row">연도</th>
					<td class="left">
						<select name="event_term_search" style="width: 119px;">
							<option value="">==선택하세요==</option>
							<c:forEach var="i" begin="2015" end="2030">
								<option value="${i }" <c:if test="${vo.event_term_search eq i}">selected="selected"</c:if>>${i }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				
				<tr>
					<th scope="row">참가 규모</th>
					<td class="left" >


<ul class="sort_list">
	<li><input type="radio" name="join_total_cnt_search" value="0" <c:if test="${vo.join_total_cnt_search eq '0'}">checked="checked"</c:if>  />없음</li>
	<li><input type="radio" name="join_total_cnt_search" value="1" <c:if test="${vo.join_total_cnt_search eq '1'}" >checked="checked"</c:if> />500명 미만</li>
	<li><input type="radio" name="join_total_cnt_search" value="2" <c:if test="${vo.join_total_cnt_search eq '2'}" >checked="checked"</c:if>  />500명 ~999명</li>

	<li><input type="radio" name="join_total_cnt_search" value="3" <c:if test="${vo.join_total_cnt_search eq '3'}" >checked="checked"</c:if> />1000명 ~1999명 </li>
	<li><input type="radio" name="join_total_cnt_search" value="4" <c:if test="${vo.join_total_cnt_search eq '4'}" >checked="checked"</c:if> />2000명 ~2999명 </li>
	<li><input type="radio" name="join_total_cnt_search" value="5" <c:if test="${vo.join_total_cnt_search eq '5'}" >checked="checked"</c:if> />3000명 이상</li>

</ul>



						
						

					</td>
				</tr>
				
			</tbody>
			</table>
<!-- //180130 -->







			<div class="search_new_btn">
				<a id="btnSearch" role="button" class="btn1 clr_Wgray">검색</a>
				<a id="btnInsert" role="button" class="btn1 clr_Wgray">등록</a>
			</div>
			
		<!-- 180130 -->
			<!-- 웹,패드에서만보임 -->
			<table class="adm_tbl2  mobile_none">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/>
					<col width="5%"/>
					<col width="20%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="15%"/>
					<col width="5%"/>
					<col width="5%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">추진현황</th>
						<th scope="col">구분</th>
						<th scope="col">행사명(국문)</th>
				    	<th scope="col">행사명(영문)</th>
				    	<th scope="col">행사명(영문약칭)</th>
						<th scope="col">행사기간</th>
						<th scope="col">참가규모</th>
						<th scope="col">담당자</th>
				  	</tr>
				</thead>
				
				<tbody>
					<c:forEach var="invite" items="${getList}" varStatus="status">
						<tr>
							<td>${invite.idx}</td>
							<td>${invite.implementation_status_str}</td>
							<td>${invite.invite_character_val}</td>
							<td><a href="/crm/invite/info.do?idx=${invite.idx}">${invite.name_ko}</a></td>
							<td>${invite.name_en}</td>
							<td>${invite.name_etc}</td>							
							<td>${invite.event_term}</td>
							<td><c:out value="${invite.join_total_cnt}" /> 명</td>
							<td>${invite.relation_name_str}</td>
						</tr>
					 </c:forEach>
				 </tbody>
			</table>
		

<!-- //웹,패드에서만보임 -->



		<!-- 180130 -->
			<!-- 모바일에서만보임 -->
			<table class="adm_tbl2 mobile_show ">
				<colgroup>
					<col width="10%"/>
					<col width="20%"/>
					<col />
					<col width="20%"/>
					<col width="20%"/>
					<col/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">추진현황</th>
						<th scope="col">구분</th>
						<th scope="col">행사명</th>
						<th scope="col">행사기간</th>
						<th scope="col">담당자</th>
				  	</tr>
				</thead>
				
				<tbody>
					<c:forEach var="invite" items="${getList}" varStatus="status">
						<tr>
							<td>${invite.implementation_status_str}</td>
							<td>${invite.invite_character_val}</td>
							<td class="hand left" onclick="location.href='/crm/invite/info.do?idx=${invite.idx}';">
								<p class="name_list">국문 : ${invite.name_ko }</p>
								<p class="name_list">영문 : ${invite.name_en }</p>
								<p class="name_list">영문약칭 :${invite.name_etc }</p>
							</td>
							<td>${invite.event_term}</td>
							<td>${invite.relation_name_str}</td>
						</tr>
					 </c:forEach>
				 </tbody>
			</table>
		

<!-- //모바일에서만보임 -->


		<!-- //180130 -->


			<div id="pagination_info" align="center">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>
		</form>
	</section>
</section>
</body>
</html>