<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">

function fncSelectAuthorGroupList(frm, pageNo){
	 //document.listForm.searchCondition.value = "1";
	//var frm = document.listForm;
	 
	frm.pageIndex.value = pageNo;
	frm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do?action=${param.action}'/>";
	frm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorGroupList('1');
    }
}

function fncManageChecked(frm) {
	
	//var frm = document.listForm;

	var resultCheck = false;

    var checkField = frm.delYn;
    var checkId = frm.checkId;
    var selectAuthor = frm.authorManageCombo;
    var booleanRegYn = frm.regYn;
    var listMberTyCode = frm.mberTyCode;

    var returnId = "";
    var returnAuthor = "";
    var returnRegYn = "";
    var returnmberTyCode = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnId == "") {
                        returnId = checkField[i].value;
                        returnAuthor = selectAuthor[i].value;
                        returnRegYn = booleanRegYn[i].value;
                        returnmberTyCode = listMberTyCode[i].value;
                    }
                    else {
                    	returnId = returnId + ";" + checkField[i].value;
                    	returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                    	returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                    	returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;

                    }
                }
            }

            if(checkedCount > 0)
            	resultCheck = true;
            else {
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }

        } else {
        	 if(frm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            }
            else {
                returnId = checkId.value;
                returnAuthor = selectAuthor.value;
                returnRegYn = booleanRegYn.value;
                returnmberTyCode = listMberTyCode.value;

                resultCheck = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    frm.userIds.value = returnId;
    frm.authorCodes.value = returnAuthor;
    frm.regYns.value = returnRegYn;
    frm.mberTyCodes.value = returnmberTyCode;
    return resultCheck;
}

function fncAddAuthorGroupInsert(frm) {

	//var frm = document.listForm;
	if(!fncManageChecked(frm)) return;
    if(confirm("등록하시겠습니까?")) {
   		frm.action = "<c:url value='/sec/rgm/EgovAuthorGroupInsert.do'/>";
    	frm.submit();
    }
}

function fncAuthorGroupDeleteList(frm) {

	//var frm = document.listForm;
	if(!fncManageChecked(frm)) return;
    if(confirm("삭제하시겠습니까?")) {
    	frm.action = "<c:url value='/sec/rgm/EgovAuthorGroupDelete.do'/>";
    	frm.submit();
    }
}

$(document).ready(function(){
	$('input[name=checker]').change(function(){
		var checked = $('input[name=checker]').is(':checked');
		$('input[name=delYn').each(function(){
			this.checked = checked;
		});
	});
})


function fnLinkPage(pageno){
	$('input[name=pageIndex]').val(pageno);
	$('form[name=listForm]').submit();
}

function fnLinkPage_mobile(pageno){
	$('input[name=pageIndex]').val(pageno);
	$('form[name=listForm_mobile]').submit();
}

</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리 <span>></span> 권한관리 </h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>


<!-- 웹,패드에서만 보임 -->
<div class="mobile_none">
<form name="listForm" action="${pageContext.request.contextPath}/sec/rgm/EgovAuthorGroupList.do" method="post">
			
			
	<input name="selectedId" type="hidden" />
    <input name="checkedIdForDel" type="hidden" />
	<input type="hidden" name="userId"/>
	<input type="hidden" name="userIds"/>
	<input type="hidden" name="authorCodes"/>
	<input type="hidden" name="regYns"/>
	<input type="hidden" name="mberTyCodes"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>

	<div class="brd_p">
		<div class="search_sort_type">
			<dl>
				<dt>   <select class="brdSelect2" name="searchCondition" id="searchCondition" title="검색조건선택2">
								<option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected="selected"</c:if> >사용자ID</option>
								<option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected="selected"</c:if> >사용자명</option>
							</select></dt>
				<dd>  <input class="brdSelect3" name="searchKeyword" type="text" value="<c:out value="${authorGroupVO.searchKeyword}"/>" title="검색단어입력" onkeypress="press();" /></dd>
			</dl>
		</div>
			<div class="search_btn_type searchbtn3">
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fncSelectAuthorGroupList(document.listForm,'1')">조회</a>
			<!-- <a class="btn2 clrGrad_Wgray nyroModal" href="/uss/umt/EgovUserInsertView.do">등록</a> -->
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAddAuthorGroupInsert(document.listForm);">등록</a>
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAuthorGroupDeleteList(document.listForm);">삭제</a>
			</div>						
	</div>		
		
		
			
	<table width="100%" class="adm_tbl2" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="5%"/>
			<col width="5%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="25%"/>
			<col width="15%"/>
			<!--<col width="10%"/>
			<col width="10%"/-->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
		    	<th scope="col"><input type="checkbox" name="checker"/></th>
		    	<th scope="col">아이디</th>
		    	<th scope="col">사용자명</th>
		    	<th scope="col">사용자 유형</th>
		    	<th scope="col">권한</th>
			    <!--th scope="col">등록여부</th> 
		    	<th scope="col">가입상태</th --> 
		  	</tr>
		</thead>

		<tbody>
		<c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
			<input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>">
		
			<tr>
		    	<td><c:out value="${status.count}"/></td>
                   <td>
                       <input name="delYn" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
                       <input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/>
                   </td>
                   <td>
					<c:out value="${authorGroup.userId}"/>
                   </td>
		    	<td><c:out value="${d:decrypt(authorGroup.userNm)}"/></td>
		    	<td>
		    		<c:out value="${authorGroup.mberTyNm}"/>
		    		<input type="hidden" name="mberTyCode" value="${authorGroup.mberTyCode}"/>
		    	</td>
		    	<td>
		    		<select name="authorManageCombo" title="권한">
		    			<option value="">선택하세요</option>
				        <c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
				            <option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
				        </c:forEach>
				    </select>
		    	</td>
			    <!--<td><b>${authorGroup.regYn}</b></td>-->
		  </tr>
		 </c:forEach>
		 </tbody>
		</table>

		

			<c:if test="${!empty authorGroupVO.pageIndex }">
			<div id="pagination_info" align="center">
			    <div>
				<ui:pagination paginationInfo = "${paginationInfo}"
		            type="text"
		            jsFunction="fnLinkPage_mobile"
		            />
			    </div>
<!-- 			    <div align="right"> -->
<%-- 			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/> --%>
<!-- 			    </div> -->
			</div>
			</c:if>
			


</form>
</div>
<!-- //웹,패드에서만 보임 -->

		
	
<!-- 모바일에서만 보임 -->
<div class="mobile_show">
<form name="listForm_mobile" action="${pageContext.request.contextPath}/sec/rgm/EgovAuthorGroupList.do" method="post">

			
	<input name="selectedId" type="hidden" />
    <input name="checkedIdForDel" type="hidden" />
	<input type="hidden" name="userId"/>
	<input type="hidden" name="userIds"/>
	<input type="hidden" name="authorCodes"/>
	<input type="hidden" name="regYns"/>
	<input type="hidden" name="mberTyCodes"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>

	<div class="brd_p">
		<div class="search_sort_type">
			<dl>
				<dt>   <select class="brdSelect2" name="searchCondition" id="searchCondition" title="검색조건선택2">
								<option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected="selected"</c:if> >사용자ID</option>
								<option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected="selected"</c:if> >사용자명</option>
							</select></dt>
				<dd>  <input class="brdSelect3" name="searchKeyword" type="text" value="<c:out value="${authorGroupVO.searchKeyword}"/>" title="검색단어입력" onkeypress="press();" /></dd>
			</dl>
		</div>
			<div class="search_btn_type searchbtn3">
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fncSelectAuthorGroupList(document.listForm_mobile,'1')">조회</a>
			<!-- <a class="btn2 clrGrad_Wgray nyroModal" href="/uss/umt/EgovUserInsertView.do">등록</a> -->
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAddAuthorGroupInsert(document.listForm_mobile);">등록</a>
			<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAuthorGroupDeleteList(document.listForm_mobile);">삭제</a>
			</div>						
	</div>	

	<p><input type="checkbox" name="checker"/> 전체선택</p>
	<c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
	<input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>">
	
	<div class="mobile_list">
		<p>  <input name="delYn" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
             <input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/>
		</p>
		<dl>
			<dt>아이디</dt>
			<dd><c:out value="${authorGroup.userId}"/></dd>
		</dl>
		<dl>
			<dt>사용자명</dt>
			<dd><c:out value="${d:decrypt(authorGroup.userNm)}"/></dd>
		</dl>
		<dl>
			<dt>사용자 유형</dt>
			<dd><c:out value="${authorGroup.mberTyNm}"/>
				<input type="hidden" name="mberTyCode" value="${authorGroup.mberTyCode}"/>
			</dd>
		</dl>
		<dl>
			<dt>권한</dt>
			<dd>
				<select name="authorManageCombo" title="권한">
	    			<option value="">선택하세요</option>
			        <c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
			            <option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
			        </c:forEach>
			    </select>
			</dd>
		</dl>
		
	</div>
	</c:forEach>


			<c:if test="${!empty authorGroupVO.pageIndex }">
			<div id="pagination_info" align="center">
			    <div>
				<ui:pagination paginationInfo = "${paginationInfo}"
		            type="text"
		            jsFunction="fnLinkPage_mobile"
		            />
			    </div>
<!-- 			    <div align="right"> -->
<%-- 			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/> --%>
<!-- 			    </div> -->
			</div>
			</c:if>
			
</form>
</div>

			<!-- //모바일에서만 보임 -->


			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>