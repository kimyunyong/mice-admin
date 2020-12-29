<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').attr('action', '/crm/promotion/list.do');
			$('input[name=pageIndex]').val(1);
			$('form').submit();
		});

	});
	
	function deleteFile(obj, delete_file_id){
		$.ajax({
		    type: "POST",
		    url: "/crm/promotion/delete_attach_file.do",
		    data: {
		        file_id : delete_file_id
		    },
		    success: function (response) {
		    	$(obj).parent().remove();
		    	location.reload();
		    }
		});
	}
	
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.submit();
	}
</script>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	var str1 = "#form input[name=searchWrd]";
	$(str1).keydown(function (key) {
		if(key.keyCode == 13){
			$('#form').submit();
		}
	});	
	

});
</script>


<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<!-- 180110 --><h3>대관관리 <span>></span> 대관/유치활동관리</h3><!-- //180110 -->
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" id="form" action="/crm/promotion/list.do" method="get">
			<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>

			<div class="brd_p mid_input_area">
		
				<div class="search_sort_type">
					<dl class="mobile_sort_type2">
						<dt>
							<select name="searchCnd">
								<option value="1" <c:if test="${vo.searchCnd == '1' }">selected</c:if>>담당자(성명)</option>
								<option value="0" <c:if test="${vo.searchCnd == '0' }">selected</c:if>>담당자(아이디)</option>
							</select>
						</dt>
						<dd>				
							<input class="brdSelect1" name="searchWrd" type="text" size="35" value='<c:out value="${d:decrypt(vo.searchWrd)}"/>' maxlength="35"  title="검색어 입력">
						</dd>
					</dl>
		
					<dl class="mid_input_area_inner">
						<dt>활동종류</dt>
						<dd><input type="radio" name="searchPromotionType" value="E" <c:if test="${vo.searchPromotionType == 'E' }">checked</c:if>>행사
						<input class="searchEvtName" name="searchEvtName" type="text"  value='<c:out value="${d:decrypt(vo.searchEvtName)}"/>' maxlength="35"  title="행사명 입력"></dd>
						<!-- 180117 -->
						<dd class="desk_pl10"><!-- //180117 --><input type="radio" name="searchPromotionType" value="O" <c:if test="${vo.searchPromotionType == 'O' }">checked</c:if>>기관
						<input class="searchOrgName" name="searchOrgName" type="text"  value='<c:out value="${d:decrypt(vo.searchOrgName)}"/>' maxlength="35"  title="기관명 입력"></dd>
		
					</dl>
					<dl>
						<dt>상담형태</dt>
						<dd>	
						<c:import url="/crm/code/select_box2.do" charEncoding="utf-8">
							<c:param name="name" value="searchPromotionType2" />
							<c:param name="type" value="상담형태" />
							<c:param name="result" value="${vo.searchPromotionType2}"/>
							<c:param name="searchInList" value="E"/>
							<c:param name="searchInList" value="I"/>
						</c:import>               
						</dd>
					</dl>
						
											
					<dl class="mid_input_area_inner2">
						<dt>입력일</dt>
						<dd> <input name="searchStartDate" type="text" class="brdSelect2 datepicker" value="${vo.searchStartDate }" size="10" readonly /> ~
							<input name="searchEndDate" type="text" class="brdSelect2 datepicker" value="${vo.searchEndDate }" size="10" readonly /></dd>
					</dl>
				</div>
						
				<div class="search_btn_type pb30">
					<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</div>
					


			</div>	
		



		</form>
		
		<table width="100%" class="adm_tbl2 mobile_none" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="45%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">종류</th>
					<th scope="col">담당자</th>
					<th scope="col">입력일</th>
			    	<th scope="col">행사(기관)명</th>
			    	<th scope="col">내용</th>
			  	</tr>
			</thead>
			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td>${result.idx}</td>
						<td>
							${result.promotion_type_name}
						</td>
						<td>${d:decrypt(result.user_nm)}<!-- (${result.reg_id }) --></td>
						<td>
							${fn:substring(result.reg_date,0,10) }
						</td>

						<td>
							<strong><a href="${result.link_url}?idx=${result.parent_idx}">${result.event_name }</a></strong>
						</td>

						
				   		<td style="word-break:break-all;text-align:left">
				   			<pre><a href="/crm/event/promotion_info.do?idx=${result.idx}&today=${toDay}&redirect_url=/crm/promotion/list.do" class="nyroModal">${result.comment }</a></pre>
						</td>
				 	</tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>


<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>


		<table width="100%" class="adm_tbl2 mobile_show" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">

			
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="15%"/>
				<col width="15%"/>
				<col  width="10%">
				<col >
			</colgroup>
			<thead>
				<tr>
					<th scope="col">담당자</th>
					<th scope="col">입력일</th>
			    	<th scope="col">행사<br>(기관)명</th>
			    	<th scope="col">내용</th>
			  	</tr>
			</thead>
			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td>${d:decrypt(result.user_nm) }<!-- (${result.reg_id }) --></td>
						<td>
							${fn:substring(result.reg_date,0,10) }<br>
							${result.promotion_type_name}
						</td>
						<td class="cal_inner_022">
							<strong>${result.event_name }</strong>
							<div class="tooltip_wrapper">
									<dl class="tooltip_area">
											<dt>	${result.event_name }</dt>
											<dd><a href="${result.link_url}?idx=${result.parent_idx}">more</a></dd>
										</dl>
										<script>
											$(".cal_inner_022").hover(
												function() {
												   $(this).children('.tooltip_wrapper').show();
												},
												function(){
												   $(this).children('.tooltip_wrapper').hide();
												}
											);
										</script>
							</div>

						</td>



				   		<td style="word-break:break-all;text-align:left">
				   			<pre><a href="/crm/event/promotion_info.do?idx=${result.idx}&today=${toDay}&redirect_url=/crm/promotion/list.do" class="nyroModal">${result.comment }</a></pre>
						</td>
				 	</tr>
			 </c:forEach>
			 </tbody>
			</table>




	<!-- 180110 -->
<!-- 			<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="mobile_list">
			
				<dl>
					<dt>종류</dt>
					<dd>${result.promotion_type_name}</dd>
				</dl>
			
				<dl>
					<dt>담당자</dt>
					<dd>${d:decrypt(result.user_nm) }(${result.reg_id })</dd>
				</dl>
			
				<dl>
					<dt>입력일</dt>
					<dd>${fn:substring(result.reg_date,0,10) }</dd>
				</dl>
			
				<dl>
					<dt>행사<br>(기관)명</dt>
					<dd><a href="${result.link_url}?idx=${result.parent_idx}" style="font-weight: bold;">${result.event_name }</a></dd>
				</dl>
			
			
				<dl>
					<dt>내용</dt>
					<dd><pre><a href="/crm/event/promotion_info.do?idx=${result.idx}&today=${toDay}&redirect_url=/crm/promotion/list.do" class="nyroModal">${result.comment }</a></pre></dd>
				</dl>
			
					</div>
			 </c:forEach>
			
			180220 -->

	<!-- //180111 -->





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
			</div>
			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>