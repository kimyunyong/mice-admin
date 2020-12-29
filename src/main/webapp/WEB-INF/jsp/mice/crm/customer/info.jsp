<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp"%>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp"%>
<%
	pageContext.setAttribute("enter", "\n");
%>
<jsp:useBean id="toDay" class="java.util.Date" />
<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript"	src="/plugin/validate/localization/messages_ko.js"></script>
<script type="text/javascript"	src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript"	src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>

<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp"%>
<style>
.error {
	color: red
}

label {
	padding-left: 5px
}
</style>
<script type="text/javaScript" language="javascript">
	$(document).ready(function() {
		$('#btnDelete').on('click',	function() {
			if (!confirm('삭제하시겠습니까?'))
				return false;
			location.replace('/crm/customer/delete_action.do?idx=${param.idx}');
		});

	});
	
	function on_search_layer(obj){
		$('#search_layer').bPopup();
		$('#search_layer').attr('data-id',$(obj).attr('data-id'));
		$('input[name=search_organizer_name]').focus();
		
	}
	function tagFunc(){
		var _td = document.getElementById("relationInfo");
		return _td;
	};
	function eventCall(obj){
		var target = event.target.id;
		var t = target+"tbl";
	    $("#"+t).fadeToggle();
		if(this.innerHTML =="+"){
	    	this.innerHTML = "";
	    	this.innerHTML = "-";
		}else{
	    	this.innerHTML = "";
	    	this.innerHTML = "+";    		
		}
	}
</script>
<section id="contentArea">
	<h3>고객DB관리 <span>></span> 고객명함관리 <span>></span> 상세</h3>
	<section class="sect_nonetit">

		<h5>기본정보</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">이름(국문)</th>
					<td class="left">${d:decrypt(result.name_ko) }</td>
				</tr>
				<tr>
					<th scope="row">이름(영문)</th>
					<td class="left">${d:decrypt(result.name_en) }</td>
				</tr>
				
				<tr>
					<th scope="row">직책</th>
					<td class="left">${result.position}</td>
				</tr>	
							
				<tr>
					<th scope="row">소속_엑셀</th>
					<td class="left">${result.sosoc_excel}</td>
				</tr>	
							
				<tr>
					<th scope="row">부서</th>
					<td class="left">${result.department}</td>
				</tr>	
												
				<tr>
					<th scope="row">전화번호</th>
					<td class="left">${d:decrypt(result.tel_no) }</td>
				</tr>
				<tr>
					<th scope="row">휴대전화</th>
					<td class="left">${d:decrypt(result.phone_no) }</td>
				</tr>
				<tr>
					<th scope="row">E-mail</th>
					<td class="left">${d:decrypt(result.email)}</td>
				</tr>
				<tr>
					<th scope="row">FAX</th>
					<td class="left">${d:decrypt(result.fax_no) }</td>
				</tr>
				
				<tr>
					<th scope="row">우편번호</th>
					<td class="left">${result.zip_code }</td>
				</tr>
				<tr>
					<th scope="row">주소(국문)</th>
					<td class="left">${d:decrypt(result.address_ko) }</td>
				</tr>
				<tr>
					<th scope="row">주소(영문)</th>
					<td class="left">${d:decrypt(result.address_en) }</td>
				</tr> 
				<tr>
					<th scope="row">담당자</th>
					<td class="left">${result.manager_nm }</td>
				</tr>
				<tr>
					<th scope="row">뉴스레터 발송대상</th>
					<td class="left">${result.newsletter}</td>
				</tr>		
				<tr>
					<th scope="row">내/외국인</th>
					<td class="left">
					
						${result.country}
					
					</td>
				</tr>									
				<tr>
					<th scope="row">특기사항</th>
					<td class="left" style="word-break: break-all">${fn:replace(result.etc,enter,'<br/>')}</td>
				</tr>
				
				
				<tr>
					<th scope="row">등록일</th>
					<td class="left">${result.reg_date}</td>
				</tr>	
				<tr>
					<th scope="row">수정일</th>
					<td class="left">${result.modify_date}</td>
				</tr>	
				<tr>
					<th scope="row">리멤버 명함 등록일</th>
					<td class="left">${result.remember_created_at}</td>
				</tr>
				<tr>
					<th scope="row">리멤버 명함 수정일</th>
					<td class="left">${result.modify_date}</td>
				</tr>
				
																						
			</tbody>
		</table>

		<h5>소속정보</h5>
		<table class="adm_tbl2">
			<caption>상세</caption>
			<colgroup>
				<col width="27%">
				<col>
			</colgroup>
			<tbody>
				<tr>
				<td class="padding_none" colspan="2">
						<c:import url="/crm/customer/organizer_list.do"
							charEncoding="utf-8">
							<c:param name="idx" value="${result.idx }" />
						</c:import>
					</td>
				</tr>
				<tr>
				<td class="border-top-none"  colspan="2">
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
						<a href="/crm/customer/organizer_insert.do?idx=${result.idx }&today=${toDay}" class="nyroModal btn2 clrGrad_Wgray">소속등록</a>
					</sec:authorize>
				</td>
			</tr>
			<tr id="relationInfo">
			</tr>
		  </tbody>
		</table>





		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<sec:authorize
					ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
					<a href="/crm/customer/edit.do?idx=${result.idx}" role="button" class="btn1 clr_Wgray">수정</a>
				</sec:authorize>
				<!--c:if test="${loginVO.id == result.reg_id}"-->
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
				</sec:authorize>
				<!--/c:if-->
				
				<a href="<c:url value='/crm/customer/list.do?pageIndex=${vo.pageIndex}'/>" role="button"
					class="btn1 clr_Wgray">목록</a>

			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/mice/crm/event/search_layer.jsp" %>
		<!--// 버튼 위치(e) -->

	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp"%>