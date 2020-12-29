<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			chkForm();
		});
		$('#btnRegist').on('click',function(){
			location.href='/crm/customer/insert.do';
		});
		$('#btnExcelDownload').on('click',function(){
			$('form').attr('action','/crm/customer/excel_download.do');
			$('form').attr('method', 'post');
			$('form').submit();
			$('form').attr('action', '/crm/customer/list.do');
			$('form').attr('method', 'get');
		})
		
		$('#btnExcelUpload').on('click',function(){
			$('input[name=excel]').click();
		});
		
		$('input[name=excel]').change(function(){
			
			if($(this).val() != ''){
				$('form').attr('action','/crm/customer/excel_upload.do');
				$('form').attr('method', 'post');
				$('form').submit();
			}
				
		});
	});
	function fnLinkPage(pageno){
		$('input[name=pageIndex]').val(pageno);
		$('form').submit();
	}
</script>
<script>
$(document).ready(function(){
	$("form input[name=searchWrdName], form input[name=searchWrdSosoc]").keydown(function (key) {
		if(key.keyCode == 13){
			chkForm();
		}
	});	
	$("form select[name=searchMng]").change(function () {
		chkForm();
	});	
	$("form input[name=searchNewsletter]").change(function () {
		chkForm();
	});		
	$("form input[name=searchCountry]").change(function () {
		chkForm();
	});	
	
});

function chkForm(){
	$('form').attr('action', '/crm/customer/list.do');
	$('form').attr('method', 'get');
	$('form').find("input[name=pageIndex]").val(1);
	$('form').submit();
}
</script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>고객DB관리 <span>></span> 고객명함관리</h3>
	<section class="sect_nonetit">
		<h4>고객명함관리</h4>
		
		<form name="form" action="/crm/customer/list.do" method="get" enctype="multipart/form-data">
		
		<input name="excel" type="file" style="width:0px;height:0px;" accept=".xls" />
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
		
		<div class="brd_p mb0">
		
			<div class="search_sort_type">
				<dl>
					<dt>성명</dt>
					<dd><input class="brdSelect1 mobile-input01" name="searchWrdName" type="text"  value='<c:out value="${d:decrypt(vo.searchWrdName)}"/>' maxlength="35"  title="검색어 입력"></dd>
				</dl>
				
				<dl>
					<dt>소속 </dt>
					<dd><input class="brdSelect1 mobile-input01" name="searchWrdSosoc" type="text"  value='<c:out value="${d:decrypt(vo.searchWrdSosoc)}"/>' maxlength="35"  title="검색어 입력"></dd>
				</dl>
				
				<dl>
					<dt>담당자</dt>
					<dd>
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="searchMng" />
							<c:param name="result" value="${vo.searchMng}"/>
						</c:import>
					</dd>
				</dl>
				<dl>
					<dt>뉴스레터<br class="mobile_show">발송대상</dt>
					<dd>				
							<input type="radio" name="searchNewsletter" value="Y" <c:if test="${vo.searchNewsletter == 'Y'}"> checked </c:if> /> Y
							<input type="radio" name="searchNewsletter" value="N" <c:if test="${vo.searchNewsletter == 'N'}"> checked </c:if> /> N
							<input type="radio" name="searchNewsletter" value="null" <c:if test="${vo.searchNewsletter == 'null'}"> checked </c:if> /> 미등록
							<input type="radio" name="searchNewsletter" value="" <c:if test="${vo.searchNewsletter == ''}"> checked </c:if> /> 전체
					</dd>
				</dl>
				<dl>
					<dt>내/외국인</dt>
					<dd>
					
						<input type="radio" name="searchCountry" value="내국인" <c:if test="${vo.searchCountry == '내국인' || vo.searchCountry == ''}"> checked </c:if> /> 내국인
						<input type="radio" name="searchCountry" value="외국인" <c:if test="${vo.searchCountry == '외국인'}"> checked </c:if> /> 외국인
						<input type="radio" name="searchCountry" value="" <c:if test="${vo.searchCountry == ''}"> checked </c:if> /> 전체
						
					</dd>
				</dl>	
			</div>
			
	

		<div class="search_new_btn2 mobile_btn_wd100">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
						<a class="n_btn03" id="btnRegist">등록</a>
					</sec:authorize>
					<a class="n_btn03" id="btnSearch">검색</a>
		</div>
	
	
	
			<div class="btn_right_area pb0" >
				<a class="sbtn01" id="btnExcelDownload">엑셀다운로드</a>
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
						<a class="sbtn01" id="btnExcelUpload">엑셀업로드</a>
						<a href="/excel_template/customers_sample_template.xls" class="sbtn01" id="btnExcelUpload">엑셀양식 다운</a>
					</sec:authorize>
			</div>
		
			<div class="wordnoti_area float_l pt10">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		</div>		
		</form>
		
		
		<!-- 웹,패드에서만 보임 -->
		<table class="adm_tbl2 mobile_none" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col/>
				
				<col width="15%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">성명</th>
					<th scope="col">직책</th>
					<th scope="col">부서</th>
					<th scope="col">소속</th>
					
			    	<th scope="col">연락처</th>
			    	<th scope="col">E-mail</th>
			    	<th scope="col">담당자</th>
			    	<th scope="col">작성자</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td>${result.idx}</td>
						<td><a href="/crm/customer/info.do?idx=${result.idx}&pageIndex=${vo.pageIndex}">${d:decrypt(result.name_ko)}</a>
							<c:if test="${result.remember_created_at != '' && result.remember_created_at ne null }">
								<span style="color:red;">R</span>
							</c:if>		
						</td>
						<td>${result.position}</td>
						<td>${result.department}</td>
						<td>
							<c:import url="/crm/customer/organizer_mini_list.do" charEncoding="utf-8">
								<c:param name="idx" value="${result.idx }" />
							</c:import>
							<c:if test="${result.sosoc_excel != '' && result.sosoc_excel != NULL}">(${result.sosoc_excel})</c:if>
						</td>
						
						<td>${d:decrypt(result.tel_no) }</td>
				   		<td>${d:decrypt(result.email) }</td>
				   		<td>${d:decrypt(result.manager_nm) }</td>
				   		<td>${d:decrypt(result.user_nm)}</td>
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
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<div class="mobile_list">
					<dl>
						<dt>구분</dt>
						<dd>${result.idx}</dd>
					</dl>
					<dl>
						<dt>성명</dt>
						<dd>
						<a href="/crm/customer/info.do?idx=${result.idx}">${d:decrypt(result.name_ko) }</a>
							<c:if test="${result.remember_created_at != '' && result.remember_created_at ne null }">
								<span style="color:red;">R</span>
							</c:if>		
						
						</dd>
					</dl>
					<dl>
						<dt>직책</dt>
						<dd>${result.position}</dd>
					</dl>
					<dl>
						<dt>부서</dt>
						<dd>${result.department}</dd>
					</dl>

					<dl>
						<dt>소속</dt>
						<dd>
							<c:import url="/crm/customer/organizer_mini_list.do" charEncoding="utf-8">
								<c:param name="idx" value="${result.idx }" />
							</c:import>
						</dd>
					</dl>

					<dl>
						<dt>연락처</dt>
						<dd>${d:decrypt(result.tel_no) }</dd>
					</dl>

					<dl>
						<dt>E-mail</dt>
				   		<dd>${d:decrypt(result.email) }</dd>
					</dl>

					<dl>
						<dt>담당자</dt>
				   		<dd>${d:decrypt(result.manager_nm) }</dd>
					</dl>

					<dl>
						<dt>작성자</dt>
				   		<dd>${d:decrypt(result.user_nm)}</dd>
				 	</dl>
				</div>
			 </c:forEach>
		<!-- //모바일에서만 보임 -->

			
			<div id="pagination_info" align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>
			

	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
