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
		$('form[name=insertForm]').validate({
			 lang: 'ko',
			 rules : {
				 //unit : { required: true, minlength:2, maxlength:20},
				 //staff : { required: true, minlength:2, maxlength:20},
				 //add_tel_no : { required: true, minlength:9, maxlength:20},
				 //operation :  { required: true, minlength:2, maxlength:20}
			 }
		 });
		
		$("#save").on('click',function(){
			if($('select[name=organizer_idx]').val() ==''){
				alert('소속 정보를 선택하세요');
				return false;
			}
			$('form[name=insertForm]').submit();
		});
	});
	</script>
	<form name="insertForm" action="/crm/customer/organizer_insert_action.do" method="post">
	<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">소속</th>
						<td>
							<select name="organizer_idx" style="width:100px">
									<option value=""></option>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									 
									<option value="${result.idx }">${result.name_ko }</option>
								</c:forEach>
							</select>
							<a onclick="on_search_layer(this);" data-id="organizers_1" role="button" class="btn1 clr_Wgray" >조회</a>
						</td>
      				</tr>
      				<tr>
      					<th scope="row">부서</th>
      					<td><input name="unit" type="text"/></td>
      				</tr>
      				<tr>
      					<th scope="row">직함</th>
      					<td><input name="staff" type="text"/></td>
      				</tr>
      				<tr>
      					<th scope="row">추가<br class="mobile_show">연락처</th>
      					<td><input name="add_tel_no" type="text"/></td>
      				</tr>
      				<tr>
      					<th scope="row">담당업무</th>
      					<td><input name="operation" type="text"/>
						<input name="customer_idx" type="hidden" value="${param.idx }"/>
      					</td>
      				</tr>
      				<tr>
      					<th height="30px" colspan="2" align="right" scope="row"><a id="save" class="btn2 clrGrad_Wgray">저장</a></td>
   				  </tr>
	      	    </tbody>
    </table>
	</form>