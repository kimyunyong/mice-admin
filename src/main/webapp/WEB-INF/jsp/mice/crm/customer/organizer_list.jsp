<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%
 /**
  * @Class Name : EgovImgFileList.jsp
  * @Description : 이미지 파일 조회화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.31  이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.31
  *  @version 1.0
  *  @see
  *
  */
%>
	<script type="text/javascript">
	$(document).ready(function(){
		$("a[name=hi]").on('click',function(event){
			var tag = tagFunc();
			var target = $(this).attr('value'); //event.target.attributes[2].nodeValue;
			$.ajax({
			    type: "POST",
			    url: "/crm/customer/organizer_info.do",
			    data: {
			        'organizer_idx' : target
			    },
			    success: function (response) {
			    	if(!tag.children[0] || tag.innerHTML==""){
			    		tag.innerHTML= "<td id="+target+" colspan=2>"+response+"</td>";
			    	}else {
			    		if(tag.children[0].id == target) {
			    			tag.innerHTML = "";
			    		}else if(tag.children[0].id != target){
				    		tag.innerHTML= "<td id="+target+" colspan=2>"+response+"</td>";
			    		}
			    	}
			    }
			});
			
		});
	});
	
	</script>
	<table class="adm_tbl2 detail_table_inner">
	<caption>상세</caption>
		<colgroup>
			<col width="27%">
			<col>
		</colgroup>
		<tbody>
		<c:if test="${fn:length(organizerList) > 0 }">
		<c:forEach var="result" items="${organizerList}" varStatus="status">

			<tr>
				<th scope="row">소속</th>
				<td class="left"><a href="/crm/organizer/info.do?idx=${result.organizer_idx}" target="_blank">${result.name_ko}</a></td>
 			</tr>
			<tr>
				<th scope="row">부서</th>
				<td class="left">${result.unit }</td>
			</tr>
			<tr>
				<th scope="row">직함</th>
				<td class="left">${result.staff }</td>
			</tr>
			<tr>
				<th scope="row">추가연락처</th>
				<td class="left">${result.add_tel_no }</td>
			</tr>
 			<!-- 
			<tr>
				<th scope="row">주소(국문)</th>
				<td class="left">${result.address_ko}</td>
			</tr>
			<tr>
				<th scope="row">주소(영문)</th>
				<td class="left">${result.address_en}</td>
			</tr> 
			 -->
					   				
  			<tr class="last">
  				<th scope="row">담당업무</th>
  				<td class="left">
  						<div style="padding-bottom:5px">${result.operation }</div>
  						<form method="post" action="/crm/customer/organizer_delete.do">
   						<input name="organizer_idx" type="hidden" value="${result.organizer_idx }"/>
   						<input name="customer_idx" type="hidden" value="${result.customer_idx }" />
   						<a id="relation" name="hi" value="${result.organizer_idx }" class="btn2 clrGrad_Wgray" >연관</a>
   						<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
    						<a href="/crm/customer/organizer_edit.do?customer_idx=${result.customer_idx }&organizer_idx=${result.organizer_idx}" class="nyroModal btn2 clrGrad_Wgray">수정</a>
    						<a class="nyroModal btn2 clrGrad_Wgray" onclick="if(!confirm('삭제하시겠습니까?')){ return false;};$(this).parent().submit();">삭제</a>
   						</sec:authorize>
  						</form>
  				</td>
  			</tr>

     	    </c:forEach>
     	    </c:if>
     	    <c:if test="${fn:length(organizerList) == 0 }">
     	    	<tr>
     	    		<td colspan="2" >등록된 소속이 없습니다.</td>
     	    	</tr>
     	    </c:if>
	</tbody>
    </table>
