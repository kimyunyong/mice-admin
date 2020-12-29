<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').attr('action', '/crm/customer/list.do');
			$('form').attr('method', 'get');
			$('form').submit();
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
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>컨벤션CRM관리 <span>></span> 명함관리</h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="form" action="/crm/customer/list.do" method="get" enctype="multipart/form-data">
		<input name="excel" type="file" style="width:0px" accept=".xls"/>
		<input name="pageIndex" type="hidden" value="<c:out value='${vo.pageIndex}'/>"/>
				<div class="brd_p">
				<select name="searchCnd">
					<option value="0" <c:if test="${vo.searchCnd == '0'}">selected</c:if>>구분</option>
					<option value="1" <c:if test="${vo.searchCnd == '1'}">selected</c:if>>성명</option>
					<option value="2" <c:if test="${vo.searchCnd == '2'}">selected</c:if>>소속</option>
				</select>
                <input class="brdSelect1" name="searchWrd" type="text" size="35" value='<c:out value="${d:decrypt(vo.searchWrd)}"/>' maxlength="35"  title="검색어 입력">
				<div class="btn_areaR">
				<a class="btn2 clrGrad_Wgray" id="btnExcelDownload">엑셀다운로드</a>
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
					<a class="btn2 clrGrad_Wgray" id="btnExcelUpload">엑셀업로드</a>
					<a href="/excel_template/customers_sample_template.xls" class="btn2 clrGrad_Wgray" id="btnExcelUpload">엑셀양식 다운받기</a>
					<a class="btn2 clrGrad_Wgray" id="btnRegist">등록</a>
				</sec:authorize>
				<a class="btn2 clrGrad_Wgray" id="btnSearch">검색</a>
				</div>						
		</div>		
		</form>
		
		<table width="100%" cellpadding="8" class="adm_tbl2" summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="10%"/>
				<col width="5%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">성명</th>
					<th scope="col">소속</th>
			    	<th scope="col">연락처</th>
			    	<th scope="col">E-mail</th>
			    	<th scope="col">작성자</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td>${result.idx}</td>
						<td><a href="/crm/customer/info.do?idx=${result.idx}">${d:decrypt(result.name_ko) }</a></td>
						<td>
							<c:import url="/crm/customer/organizer_mini_list.do" charEncoding="utf-8">
								<c:param name="idx" value="${result.idx }" />
							</c:import>
						</td>
						<td>${d:decrypt(result.tel_no) }</td>
				   		<td>${d:decrypt(result.email) }</td>
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
			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="image"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>
			
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>