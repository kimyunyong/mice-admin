<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">
<!--

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
    var returnValue = "";

    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                	    returnValue = returnValue + ";" + checkField[i].value;
                    checkCount++;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 권한이 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.authorCodes.value = returnValue;

    return returnBoolean;
}

function fncSelectAuthorList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthor(author) {
    document.listForm.authorCode.value = author;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthor.do'/>";
    document.listForm.submit();
}

function fncAddAuthorInsert() {
    location.replace("<c:url value='/sec/ram/EgovAuthorInsertView.do'/>");
}

function fncAuthorDeleteList() {

    if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/sec/ram/EgovAuthorListDelete.do'/>";
            document.listForm.submit();
        }
    }
}

function fncAddAuthorView() {
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorUpdate.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorRole(author) {
    document.listForm.searchKeyword.value = author;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorRoleList.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/ram/EgovAuthorList.do'/>";
    document.listForm.submit();
}


function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorList('1');
    }
}


-->
</script>
<!-- <style> -->
<!--  	.text_left{margin-left: 10px; text-align: left;}  -->
<!-- </style> -->
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>시스템관리 <span>></span> 권한매뉴얼</h3>
	<section class="sect_nonetit">
		<h4>권한 목록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form:form name="listForm" action="${pageContext.request.contextPath}/sec/ram/EgovAuthorList.do" method="post">
		<div class="brd_p">

			<div class="search_sort_type">
					<dl>
						<dt><label class="open" for="brdSelect1">권한명</label></dt>
						<dd><input class="brdSelect1" name="searchKeyword" type="text" value="<c:out value='${authorManageVO.searchKeyword}'/>" title="검색" onkeypress="press();" /></dd>
					</dl>
				</div>
			<div class="search_btn_type">

				<a class="btn2 clrGrad_Wgray" onclick="javascript:fncSelectAuthorList('1')">조회</a>
<!-- 				<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAddAuthorInsert()">등록</a> -->
<!-- 				<a class="btn2 clrGrad_Wgray" onclick="javascript:fncAuthorDeleteList()">삭제</a> -->
				</div>						
		</div>		






			
		<table class="adm_tbl2 mobile_none" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다." class="mobile_none">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="15%"/>
				<col width="15%"/>
				<col width="70%"/>
			</colgroup>
			<thead>
				<tr>
<!-- 					<th scope="col"></th> -->
			    	<th scope="col">권한 ID</th>
			    	<th scope="col">권한 명</th>
			    	<th scope="col">설명</th>
<!-- 			    	<th scope="col">등록일자</th> -->
<!-- 			    	<th scope="col">롤 정보</th> -->
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="author" items="${authorList}" varStatus="status">
				<tr>
<%-- 			    	<td><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${author.authorCode}"/>" /></td> --%>
			    	<%-- <td><a href="#LINK" class="nyroModal" onclick="javascript:fncSelectAuthor('<c:out value="${author.authorCode}"/>')"><b><c:out value="${author.authorCode}"/></b></a></td> --%>
			    	<td><a href="/sec/ram/EgovAuthor.do?authorCode=<c:out value="${author.authorCode}"/>"><b><c:out value="${author.authorCode}"/></b></a></td>
			    	<td><c:out value="${author.authorNm}"/></td>
			    	<td class="text_left"><c:out value="${author.authorDc}"/></td>
<%-- 			    	<td><c:out value="${author.authorCreatDe}"/></td> --%>
<%-- 			    <td><a href="/sec/ram/EgovAuthorRoleList.do?searchKeyword=<c:out value="${author.authorCode}"/>" class="btn2 clrGrad_Wgray">상세보기</a></td> --%>
			    
			  </tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>





<!--모바일에서만 보임-->
	<c:forEach var="author" items="${authorList}" varStatus="status">
		<div class="mobile_list mobile_show">
				<dl>
			    	<dt>권한 ID</dt>
					<dd><a href="/sec/ram/EgovAuthor.do?authorCode=<c:out value="${author.authorCode}"/>"><b><c:out value="${author.authorCode}"/></b></a></dd>
			  	</dl>
				<dl>
			    	<dt>권한 명</dt>
					<dd><c:out value="${author.authorNm}"/></dd>
			  	</dl>
				<dl>
			    	<dt>설명</dt>
					<dd><c:out value="${author.authorDc}"/></dd>
			  	</dl>
			</div>
			 </c:forEach>





			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td height="10"></td>
			  </tr>
			</table>


<!--//모바일에서만 보임-->

























			
			<c:if test="${!empty authorManageVO.pageIndex }">
			<div align="center">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="default"
			            jsFunction="linkPage"
			            />
			    </div>
<!-- 			    <div align="right"> -->
<%-- 			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/> --%>
<!-- 			    </div> -->
			</div>
			</c:if>
			<input type="hidden" name="authorCode"/>
			<input type="hidden" name="authorCodes"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
			<input type="hidden" name="searchCondition"/>
			</form:form>
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>