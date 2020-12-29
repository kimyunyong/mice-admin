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
		$('#btnSearch').on('click',function(){
			$("form input[name=pageIndex]").val(1);
			$('form').attr('action','/crm/order/list.do');
			$('form').submit();
		});
	});
	
	$(document).ready(function(){

		//작성현황 - 확정 클릭시 검색
		$("input[name=write_condition_tf]").each(function(idx){
			$(this).click(function(){
				if( $(this).val() == "2" ){
					$('form').submit();
				}
			});
		});
		
	});	
</script>



<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>대관관리 <span>></span> 이벤트오더</h3>
	<section class="sect_nonetit">
	
	
		<form name="form" action="/crm/order/list.do" method="post" enctype="multipart/form-data">
	
			<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
			<h5 class="s_tit">행사정보</h5>
			
            <table width="100%" class="adm_tbl2 table_left" >
				<colgroup>
					<col width="27%"/>
					<col/>
				</colgroup>
				<tr>
					<th><label>행사명</label></th>
					<td><input type="text" name="searchEventName" value="${vo.searchEventName }"/></td>
				</tr>
				<tr>
					<th><label>행사기간</label></th>
					<td>
						<input type="text" name="searchEventStartDate" class="datepicker wd40per" value="${vo.searchEventStartDate }" /> - 
						<input type="text" name="searchEventEndDate" class="datepicker wd40per" value="${vo.searchEventEndDate }" />
					</td>
				</tr>
				<tr>
					<th><label>HICO 담당자</label></th>
					<td>
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="searchRegId" />
							<c:param name="result" value="${vo.searchRegId }"/>
						</c:import>
					</td>
				</tr>
				<tr>
					<th><label>작성현황</label></th>
					<td>
						<input type="radio" name="write_condition_tf" value="0" <c:if test='${vo.write_condition_tf.equals("0")}'>checked="checked"</c:if> />작성전
						<input type="radio" name="write_condition_tf" value="1" <c:if test='${vo.write_condition_tf.equals("1")}'>checked="checked"</c:if> /> 작성중
						<input type="radio" name="write_condition_tf" value="2" <c:if test='${vo.write_condition_tf.equals("2")}'>checked="checked"</c:if> /> 확정
						<input type="radio" name="write_condition_tf" value="3" <c:if test='${vo.write_condition_tf.equals("3")}'>checked="checked"</c:if> /> 취소
					</td>
				</tr>
			</table>

			<div class="search_new_btn"> 
				<a class="n_btn02" id="btnSearch">검색</a>
			</div>

			<!-- 		이벤트 오더 관리 리스트 -->
			<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건</div>
		
			<!-- 웹,패드만 보이는 리스트 -->
			<div class="mobile_none">

					<table width="100%" cellpadding="8" class="adm_tbl2">
						<colgroup>
							<col width="7%"/>
							<col>
							<col width="25%"/>
							<col width="20%"/>
							<col width="7%"/>
							<col width="7%"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">순번</th>
								<th scope="col">행사명</th>
								<th scope="col">주최기관</th>
						    	<th scope="col">행사기간</th>
						    	<th scope="col">참석인원</th>
						    	<th scope="col">작성현황</th>
						  	</tr>
						</thead>
						
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>
									<td>${result.idx }</td>
									<td><a href="/crm/order/info.do?crm_event_idx=${result.idx}&write_condition_tf=${result.write_condition_tf}">${result.name_ko }</a></td>
									<td>${result.organizers_1_name}</td>
									<td>${result.event_st_date }~${result.event_ed_date }</td>
									<td>${result.join_personal_cnt }</td>
										<c:if test='${result.write_condition_tf == null}'>
										<td class="write_status0">작성전</c:if>
										<c:if test='${result.write_condition_tf.equals("1")}'>
										<td class="write_status1">작성중</c:if>
										<c:if test='${result.write_condition_tf.equals("2")}'>
										<td class="write_status2">확정</c:if>
										<c:if test='${result.write_condition_tf.equals("3")}'>
										<td class="write_status3">취소</c:if>					
									</td>
								</tr>
							 </c:forEach>
						 </tbody>
					</table>


			</div>
			<!-- 웹,패드만 보이는 리스트 -->



			
			<!-- 모바일 보이는 리스트 -->
			<div class="mobile_show">

					<c:forEach var="result" items="${resultList}" varStatus="status">
						<div class="mobile_list">
							<dl>
								<dt>순번</dt>
								<dd>${result.idx }</dd>
							</dl>
							<dl>
								<dt>행사명</dt>
								<dd><a href="/crm/order/info.do?crm_event_idx=${result.idx}&write_condition_tf=${result.write_condition_tf}">${result.name_ko }</a></dd>
							</dl>

							<dl>
								<dt>주최기관</dt>
								<dd>${result.organizers_1_name}</dd>
							</dl>

							<dl>
								<dt>행사기간</dt>
								<dd>${result.event_st_date }~${result.event_ed_date }</dd>
							</dl>

							<dl>
								<dt>참석인원</dt>
								<dd>${result.join_personal_cnt }</dd>
							</dl>
							<a href="/crm/order/info.do?crm_event_idx=${result.idx}&write_condition_tf=${result.write_condition_tf}">
								<c:if test='${result.write_condition_tf == null}'>
								<p class="write_status0">작성전</c:if>
								<c:if test='${result.write_condition_tf.equals("1")}'>
								<p class="write_status1">작성중</c:if>
								<c:if test='${result.write_condition_tf.equals("2")}'>
								<p class="write_status2">확정</c:if>
								<c:if test='${result.write_condition_tf.equals("3")}'>
								<p class="write_status3">취소</c:if>	
								</p>	
							</a>					
						</div>
					 </c:forEach>

			</div>
			<!-- 모바일만 보이는 리스트 -->

		</form>
		
		<div id="pagination_info" align="center">
		    <div>
		        <ui:pagination paginationInfo = "${paginationInfo}"
		            type="text"
		            jsFunction="fnLinkPage"
		            />
		    </div>
		</div>
			
	</section>
</section>


<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>