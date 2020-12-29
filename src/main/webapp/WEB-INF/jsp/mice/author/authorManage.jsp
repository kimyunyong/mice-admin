<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var checkRegYn = document.listForm.regYn;
    var returnValue = "";
    var returnRegYns = "";
    var checkedCount = 0;
    var returnBoolean = false;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;

	                if(returnValue == "") {
	                    returnValue = checkField[i].value;
	                    returnRegYns = checkRegYn[i].value;
	                }
	                else {
	                    returnValue = returnValue + ";" + checkField[i].value;
	                    returnRegYns = returnRegYns + ";" + checkRegYn[i].value;
	                }
                }
            }

            if(checkedCount > 0)
            	returnBoolean = true;
            else {
                alert("선택된  롤이 없습니다.");
                returnBoolean = false;
            }
        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택된 롤이 없습니다.");
            	returnBoolean = false;
            }
            else {
            	returnValue = checkId.value;
                returnRegYns = checkRegYn.value;

                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.roleCodes.value = returnValue;
    document.listForm.regYns.value = returnRegYns;

    return returnBoolean;

}

function fncAddAuthorRoleInsert() {
	if(fncManageChecked()) {
	    if(confirm("등록하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleInsert.do'/>";
            document.listForm.submit();
	    }
	} else return;
}

</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리<span>></span>권한관리<span>></span>롤정보</h3>
	<section class="sect_nonetit">
		<h4>권한 목록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form:form name="listForm" action="${pageContext.request.contextPath}/sec/ram/EgovAuthorRoleList.do" method="post">
		<div class="brd_p">

			<!-- seach_sort_type -->
			<div class="seach_sort_type">
				<dl>
					<dt><label class="open" for="brdSelect1">권한코드</label></dt>
					<dd><input name="searchKeyword" style="background-color:#bdc8c9" type="text" size="40" value="<c:out value='${authorRoleManageVO.searchKeyword}'/>" title="검색"  onkeypress="press();" readonly="readonly" /></dd>
				</dl>
			</div>
			<!-- //seach_sort_type -->

			<!-- search_btn-type -->
			<div class="search_btn-type">
				<a class="btn2 clrGrad_Wgray" href="/sec/ram/EgovAuthorList.do">조회</a>
				<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAddAuthorRoleInsert();">수정</a>
				<a class="btn2 clrGrad_Wgray" href="/sec/ram/EgovAuthorList.do">목록</a>
			</div>
			<!-- //search_btn-type -->
		</div>		
			


		<!-- 웹,패드에서 보이는 테이블 -->
		<table class="adm_tbl2 mobile_none" summary="권한 롤을 관리하는 테이블입니다.롤 ID,롤 명,롤 타입,롤 Sort,롤 설명,등록일자,등록여부의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="3%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="30%"/>
				<col width="12%"/>
				<col width="5%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택"></th>
			    	<th scope="col">롤 ID</th>
			    	<th scope="col">롤 명</th>
			    	<th scope="col">롤 타입</th>
			    	<th scope="col">롤 Sort</th>
			    	<th scope="col">롤 설명</th>
			    	<th scope="col">등록일자</th>
			    	<th scope="col">등록여부</th>
			  	</tr>
			</thead>

			<tbody>
			<c:if test="${fn:length(authorRoleList) == 0}">
			<tr>
				<td colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
			<c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
				<tr>
			    	<td nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" /></td>
				    <td nowrap="nowrap"><c:out value="${authorRole.roleCode}"/></td>
				    <td nowrap="nowrap"><c:out value="${authorRole.roleNm}"/></td>
				    <td nowrap="nowrap"><c:out value="${authorRole.roleTyp}"/></td>
				    <td nowrap="nowrap"><c:out value="${authorRole.roleSort}"/></td>
				    <td nowrap="nowrap"><c:out value="${authorRole.roleDc}"/></td>
				    <td nowrap="nowrap"><c:out value="${authorRole.creatDt}"/></td>
				    <td nowrap="nowrap">
				        <select name="regYn" title="등록여부">
				            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
				            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
				        </select>
				    </td>
			  </tr>
			 </c:forEach>
			 </tbody>
			</table>
		<!-- //웹,패드에서 보이는 테이블 -->


<p><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택">전체선택</p>

		<!-- 모바일 보이는 테이블 -->
	<c:if test="${fn:length(authorRoleList) == 0}">
			<spring:message code="common.nodata.msg" />
	</c:if>	
	<c:forEach var="authorRole" items="${authorRoleList}" varStatus="status">
<div class="mobile_list">

	<dl>
		<dt>선택</dt>
		<dd><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorRole.roleCode}"/>" /></dd>
	</dl>

	<dl>
		<dt>롤 ID</dt>
		<dd><c:out value="${authorRole.roleCode}"/></dd>
	</dl>

	<dl>
		<dt>롤 명</dt>
		<dd><c:out value="${authorRole.roleNm}"/></dd>
	</dl>

	<dl>
		<dt>롤 타입</dt>
		<dd><c:out value="${authorRole.roleTyp}"/></dd>
	</dl>

	<dl>
		<dt>롤 Sort</dt>
		<dd><c:out value="${authorRole.roleSort}"/></dd>
	</dl>

	<dl>
		<dt>롤 설명</dt>
		<dd><c:out value="${authorRole.roleDc}"/></dd>
	</dl>

	<dl>
		<dt>등록일자</dt>
		<dd><c:out value="${authorRole.creatDt}"/></dd>
	</dl>
	<dl>
		<dt>등록여부</dt>
		<dd><select name="regYn" title="등록여부">
				            <option value="Y" <c:if test="${authorRole.regYn == 'Y'}">selected</c:if> >등록</option>
				            <option value="N" <c:if test="${authorRole.regYn == 'N'}">selected</c:if> >미등록</option>
				        </select></dd>
	</dl>

</div>
			 </c:forEach>

		<!-- //모바일에서 보이는 테이블 -->







			
			<c:if test="${!empty authorRoleManageVO.pageIndex }">
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="default"
			            jsFunction="linkPage"
			            />
			    </div>
			    <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
			    </div>
			</div>
			</c:if>
			<input type="hidden" name="roleCodes"/>
			<input type="hidden" name="regYns"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${authorRoleManageVO.pageIndex}'/>"/>
			<input type="hidden" name="authorCode" value="<c:out value="${authorRoleManageVO.searchKeyword}"/>"/>
			<input type="hidden" name="searchCondition"/>
			</form:form>
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>