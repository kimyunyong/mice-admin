<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javaScript" language="javascript" defer="defer">





function chkDel(cate_code, idx, parent){

	if(!confirm("삭제하시겠습니까?")) return false;
	//document.form.idx.value = idx;
	//document.form.parent.value = parent;
	//document.form.action = "/crm/manager_event/delete_action.do";
	//document.form.submit();


	var frm = "eventManagerForm_"+cate_code;
	$("#"+frm+" input[name=idx]").val(idx);
	$("#"+frm+" input[name=parent]").val(parent);
	

	
    var params = $("#"+frm).serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
    $.ajax({
        url: '/crm/manager_event/delete_action.do',
        type: 'POST',
        data:params,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        dataType: 'json',
        success: function (result) {
            if (result.result){
            	alert('삭제되었습니다.');
            	
            	var crm_idx =   $("#"+frm+" input[name=crm_event_idx]").val();
            	var cate_code = $("#"+frm+" input[name=cate_code]").val();
            	
            	
				chkManagerEventList(crm_idx, cate_code);
           	
            	
            }else{
            	alert('오류가 발생했습니다. 관리자에게 문의하세요.');
            }
        }
    });			
	
}	
function chkSortUp(cate_code, idx, depth, sort, searchSort){
	//document.form.idx.value = idx;
	//document.form.depth.value = depth;
	//document.form.sort.value = sort;
	//document.form.action = "/crm/manager_event/sort_up.do";
	//document.form.submit();

	if(!confirm("순서를 변경하시겠습니까?")) return false;
	
	var frm = "eventManagerForm_"+cate_code;
	$("#"+frm+" input[name=idx]").val(idx);
	$("#"+frm+" input[name=depth]").val(depth);
	$("#"+frm+" input[name=sort]").val(sort);
	$("#"+frm+" input[name=searchSort]").val(searchSort);
	
 	
    var params = $("#"+frm).serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
    $.ajax({
        url: '/crm/manager_event/sort_up.do',
        type: 'POST',
        data:params,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        dataType: 'json',
        success: function (result) {
            if (result.result){
            	
            	var crm_idx =   $("#"+frm+" input[name=crm_event_idx]").val();
            	var cate_code = $("#"+frm+" input[name=cate_code]").val();
				chkManagerEventList(crm_idx, cate_code);

            	alert('수정되었습니다.');
            	
            }else{
            	alert('오류가 발생했습니다. 관리자에게 문의하세요.');
            }
        }
    });		
	
}	
		
	
</script>


		
		<form name="eventManagerForm_${vo.cate_code}" id="eventManagerForm_${vo.cate_code}" method="post" action="" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="" />
		<input type="hidden" name="crm_event_idx" value="${vo.crm_event_idx}" />
		<input type="hidden" name="cate_code" value="${vo.cate_code}" />
		<input type="hidden" name="parent" value="0" />
		<input type="hidden" name="depth" value="0" />
		<input type="hidden" name="sort" value="0" />
		<input type="hidden" name="searchSort" value="" />

  		</form>
  
		<table class="adm_tbl2 " summary="명함관리에  관한 테이블입니다.번호, 이미지, 제목, 등록일, 등록자 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col />
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<!-- 
			<thead>
				<tr>
					<th scope="col">분류명</th>
					<th scope="col"></th>
					<th scope="col"></th>
			  	</tr>
			</thead>
			 -->
			
			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td class="left">
				
					<span style="padding-left:${result.depth}0px;"></span>
					<img src="/images/mice/new/cate${result.depth}.gif"/>
					${result.cate_name }
					<span style="color:red;">(${result.cate_no})</span>
					<a class="nyroModal clrGrad_Wgray" href="/crm/manager_event/edit.do?idx=${result.idx}&crm_event_idx=${result.crm_event_idx}&cate_code=${result.cate_code}&depth=${result.depth}">[수정]</a>
					<a href="javascript:chkDel('${result.cate_code}',${result.idx},${result.cate_no});">[삭제]</a>
					

				</td>
				<td>
				
					<c:if test="${result.depth ==1 && result.cate_code =='biz' }">
						<a class="nyroModal clrGrad_Wgray"  href="/crm/manager_event/insert.do?crm_event_idx=${result.crm_event_idx}&cate_code=${result.cate_code}&depth=2&parent=${result.cate_no}"><img src="/images/mice/new/cate_add2.gif" alt="2차 카테고리 등록"/></a>
					</c:if>
					<c:if test="${result.depth ==2 && result.cate_code =='biz' }">
						<a class="nyroModal clrGrad_Wgray"  href="/crm/manager_event/insert.do?crm_event_idx=${result.crm_event_idx}&cate_code=${result.cate_code}&depth=3&parent=${result.cate_no}"><img src="/images/mice/new/cate_add3.gif" alt="3차 카테고리 등록" /></a>
					</c:if>	
					
						
				</td>
				<td>
					<c:if test="${result.sort !=1 }"><a href="javascript:chkSortUp('${result.cate_code}',${result.idx},${result.depth},${result.sort},'up');">▲ 위로</a></c:if>
					<c:if test="${result.sort_cnt !=0 }"><a href="javascript:chkSortUp('${result.cate_code}',${result.idx},${result.depth},${result.sort},'down');">▼ 아래로</a></c:if>
				</td>
			</tr>
			 </c:forEach>
			 </tbody>
			</table>
			
			<a class="nyroModal clrGrad_Wgray"  id="btnCustomerSave" href="/crm/manager_event/insert.do?crm_event_idx=${vo.crm_event_idx}&cate_code=${vo.cate_code}&depth=1&parent=0"><img src="/images/mice/new/cate_add1.gif" alt="1차 카테고리 등록"/></a>


			