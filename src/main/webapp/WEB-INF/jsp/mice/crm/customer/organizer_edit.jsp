<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
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
		$('form[name=editForm]').validate({
			 lang: 'ko',
			 rules : {
				 unit : { required: true, minlength:2},
				 staff : { required: true, minlength:2},
				 //add_tel_no : { required: true, minlength:9},
				 //operation :  { required: true, minlength:2}
			 }
		 });
		
		$("#save").on('click',function(){
			if($('select[name=organizer_idx]').val() ==''){
				alert('소속 정보를 선택하세요');
				return false;
			}
			$('form[name=editForm]').submit();
		});
	});
	</script>
	<form name="editForm" action="/crm/customer/organizer_edit_action.do" method="post">
	<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">소속</th>
						<td class="left">
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<c:if test="${result.idx == res.organizer_idx }">
									${result.name_ko }
								</c:if>
							</c:forEach>
							<input type="hidden" name="organizer_idx" value="${res.organizer_idx }"/>
							
						</td>
      				</tr>
      				<tr>
      					<th scope="row">부서</th>
      					<td><input name="unit" type="text" value="${res.unit }"/></td>
      				</tr>
      				<tr>
      					<th scope="row">직함</th>
      					<td><input name="staff" type="text" value="${res.staff }"/></td>
      				</tr>
      				<tr>
      					<th scope="row">추가연락처</th>
      					<td><input name="add_tel_no" type="text" value="${res.add_tel_no}"/></td>
      				</tr>
      				<tr>
      					<th scope="row">담당업무</th>
      					<td>
							<input name="operation" type="text" value="${res.operation }"/>
							<input name="customer_idx" type="hidden" value="${param.customer_idx }"/>
      					</td>
      				</tr>
      				<tr>
      					<th scope="row" colspan="2"><a id="save" style="width:120px;padding-top:5px" class="btn2 clrGrad_Wgray">저장</a></td>
      				</tr>
	      	    </tbody>
    </table>
	</form>