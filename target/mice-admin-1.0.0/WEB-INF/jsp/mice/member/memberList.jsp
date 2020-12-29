<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>

<script type="text/javaScript" language="javascript" defer="defer">

function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm("<spring:message code="common.delete.msg" />")){
        	document.listForm.checkedIdForDel.value=checkedIds;
        	<c:choose>
    		<c:when test="${param.action eq 'adminRegist'}">
    		document.listForm.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>?action=adminRegist";
    		</c:when>
    		<c:when test="${param.action eq 'entRegist'}">
    		document.listForm.action = "<c:url value='/uss/umt/EgovEntrprsMberDelete.do'/>?action=entRegist";
    		</c:when>
    		<c:when test="${param.action eq 'nomalRegist'}">
    		document.listForm.action = "<c:url value='/uss/umt/EgovMberDelete.do'/>?action=entRegist";
    		</c:when>
    	</c:choose>
            
            document.listForm.submit();
        }
    }
}
function fnSelectUser(id) {
    document.listForm.selectedId.value = id;
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];
    }
   	document.listForm.selectedId.value = userId;
   	<c:choose>
   	<c:when test="${param.action eq 'adminRegist'}">
    document.listForm.action = "<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>";
    document.listForm.submit();
    </c:when>
    <c:when test="${param.action eq 'entRegist'}">
    document.listForm.action = "<c:url value='/uss/umt/EgovEntrprsMberSelectUpdtView.do'/>";
    document.listForm.submit();
    </c:when>    
    <c:when test="${param.action eq 'nomalRegist'}">
    document.listForm.action = "<c:url value='/uss/umt/EgovMberSelectUpdtView.do'/>";
    document.listForm.submit();
    </c:when>    
    </c:choose>
}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/uss/umt/EgovUserInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    //document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do?action=${param.action}'/>";
   document.listForm.action = document.listForm.page_url.value+"?action=${param.action}";
   document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	<c:choose>
		<c:when test="${param.action eq 'adminRegist'}">
			document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do?action=adminRegist'/>";
		</c:when>
		<c:when test="${param.action eq 'entRegist'}">
			document.listForm.action = "<c:url value='/uss/umt/EgovEntrprsMberManage.do?action=entRegist'/>";
		</c:when>
		<c:when test="${param.action eq 'nomalRegist'}">
			document.listForm.action = "<c:url value='/uss/umt/EgovMberManage.do?action=nomalRegist'/>";
		</c:when>
	</c:choose>
    document.listForm.submit();
}
function fnViewCheck(){
    if(insert_msg.style.visibility == 'hidden'){
    	insert_msg.style.visibility = 'visible';
    }else{
    	insert_msg.style.visibility = 'hidden';
    }
}

function press() {

    if (event.keyCode==13) {
    	fnSearch();
    }
}

$(document).ready(function(){
	$('input[name=checker]').change(function(){
		var checked = $('input[name=checker]').is(':checked');
		$('input[name=checkField]').each(function(){
			this.checked = checked;
		});
	});
});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">

	<h3>계정관리 <span>></span>  <c:choose> <c:when test="${param.action eq 'entRegist'}">협력사 등록</c:when><c:when test="${param.action eq 'nomalRegist'}">회원등록</c:when><c:otherwise>직원등록</c:otherwise></c:choose></h3>
	<section class="sect_nonetit">
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form:form name="listForm" action="${pageContext.request.contextPath}/uss/umt/EgovUserManage.do" method="post">
		<input name="selectedId" type="hidden" />
        <input name="checkedIdForDel" type="hidden" />
        <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
		<input name="page_url" type="hidden" value="${requestScope['javax.servlet.forward.request_uri']}" />
		
		<div class="brd_p">

			<div class="search_sort_type">
			<dl>
                <dt><select class="brdSelect2" name="searchCondition" id="searchCondition" title="검색조건선택2">
                    <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >아이디</option>
                    <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >성명</option>
                </select></dt>
                <dd><input class="brdSelect3" name="searchKeyword" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" title="검색단어입력" onkeypress="press();" /></dd>
				</dl>
			</div>




				<div class="search_btn_type3">
				<a class="btn2 clrGrad_Wgray" onclick="javascript:fnSearch();">조회</a>
				<!-- <a class="btn2 clrGrad_Wgray nyroModal" href="/uss/umt/EgovUserInsertView.do">등록</a> -->
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
				<a class="btn2 clrGrad_Wgray" href="/member/userRegist.do?action=${param.action}">등록</a>
				</sec:authorize>
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN">
					<a class="btn2 clrGrad_Wgray" onclick="javascript:fnDeleteUser();">삭제</a>
				</sec:authorize>
				</div>						
		</div>		
		<!-- 웹, 패드에서 보이는 리스트 -->
		<table class="adm_tbl2 mobile_none" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="5%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col />
				<col width="18%"/>
				<col width="18%"/>
				<!-- <col width="10%"/> -->
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
			    	<th scope="col"><input type="checkbox" name="checker"/></th>
			    	<th scope="col">아이디</th>
			    	<th scope="col">
			    		<c:choose>
			    			<c:when test="${param.action eq 'adminRegist' }">
			    				직원명
			    			</c:when>
			    			<c:when test="${param.action eq 'entRegist' }">
			    				기업명
			    			</c:when>
			    			<c:when test="${param.action eq 'nomalRegist' }">
			    				회원명
			    			</c:when>
			    		</c:choose>
					</th>
			    	<th scope="col">이메일</th>
			    	<th scope="col">전화번호</th>
			    	<th scope="col">등록일</th>
			    	<!-- <th scope="col">가입상태</th> -->
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
			    	<td><c:out value="${fn:trim(fn:substring(result.uniqId,16,20))}"/></td>
                    <td>
                        <input name="checkField" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
                        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
                    </td>
                    <td style="cursor:pointer;cursor:hand" >
						<span class="link"><a href="<c:choose>
							<c:when test="${param.action eq 'adminRegist'}">/uss/umt/EgovUserSelectUpdtView.do?action=adminRegist&selectedId=${result.uniqId}&pageIndex=${userSearchVO.pageIndex}"><c:out value="${result.userId}"/></c:when>
							<c:when test="${param.action eq 'entRegist'}">/uss/umt/EgovEntrprsMberSelectUpdtView.do?action=entRegist&selectedId=${result.uniqId}&pageIndex=${userSearchVO.pageIndex}"><c:out value="${result.userId}"/></c:when>
							<c:when test="${param.action eq 'nomalRegist'}">/uss/umt/EgovMberSelectUpdtView.do?action=nomalRegist&selectedId=${result.uniqId}&pageIndex=${userSearchVO.pageIndex}"><c:out value="${result.userId}"/></c:when>
						</c:choose>
						</a></span>
                    </td>
			    	<td>
			    		<c:choose>
			    			<c:when test="${param.action eq 'adminRegist' }">
			    				<c:out value="${d:decrypt(result.userNm)}"/>
			    			</c:when>
			    			<c:when test="${param.action eq 'entRegist' }">
			    				<c:out value="${d:decrypt(result.cmpnyNm)}"/>
			    			</c:when>
			    			<c:when test="${param.action eq 'nomalRegist' }">
			    				<c:out value="${d:decrypt(result.userNm)}"/>
			    			</c:when>
			    		</c:choose>
			    	</td>
			    	<td><c:out value="${result.emailAdres}"/></td>
			    	<td><c:out value="${result.areaNo}"/>)<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/></td>
			    	<td><c:out value="${result.sbscrbDe}"/></td>
                    <%-- <td>
                        <c:forEach var="emplyrSttusCode_result" items="${emplyrSttusCode_result}" varStatus="status">
                            <c:if test="${result.sttus == emplyrSttusCode_result.code}"><c:out value="${emplyrSttusCode_result.codeNm}"/></c:if>
                        </c:forEach>
                    </td> --%>
			    
			  </tr>
			 </c:forEach>
			 </tbody>
			
			 <!--tfoot>
			  <tr class="">
			   <td colspan=6 align="center"></td>
			  </tr>
			 </tfoot -->
			</table>

		<!-- //웹, 패드에서 보이는 리스트 -->



<!-- 모바일에서만 보이는 리스트 -->

<p class="all-select-mobile"><input type="checkbox" name="checker"/> 전체선택</p>


			<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="mobile_list">


						<dl>
							<dt>선택</dt>
							<dd><input name="checkField" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
                        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/></dd>
						</dl>

<!-- 						<dl>
							<dt>번호</dt>
							<dd><c:out value="${fn:trim(fn:substring(result.uniqId,16,20))}"/></dd>
						</dl> -->
	
						<dl>
							<dt>아이디</dt>
							<dd><span class="link"><a href="<c:choose>
							<c:when test="${param.action eq 'adminRegist'}">/uss/umt/EgovUserSelectUpdtView.do?action=adminRegist&selectedId=${result.uniqId}"><c:out value="${result.userId}"/></c:when>
							<c:when test="${param.action eq 'entRegist'}">/uss/umt/EgovEntrprsMberSelectUpdtView.do?action=entRegist&selectedId=${result.uniqId}"><c:out value="${result.userId}"/></c:when>
							<c:when test="${param.action eq 'nomalRegist'}">/uss/umt/EgovMberSelectUpdtView.do?action=nomalRegist&selectedId=${result.uniqId}"><c:out value="${result.userId}"/></c:when>
						</c:choose>
						</a></span></dd>
						</dl>


						<dl>
							<dt><c:choose>
			    			<c:when test="${param.action eq 'adminRegist' }">
			    				직원명
			    			</c:when>
			    			<c:when test="${param.action eq 'entRegist' }">
			    				기업명
			    			</c:when>
			    			<c:when test="${param.action eq 'nomalRegist' }">
			    				회원명
			    			</c:when>
			    		</c:choose></dt>
							<dd>						<c:choose>
			    			<c:when test="${param.action eq 'adminRegist' }">
			    				<c:out value="${d:decrypt(result.userNm)}"/>
			    			</c:when>
			    			<c:when test="${param.action eq 'entRegist' }">
			    				<c:out value="${d:decrypt(result.cmpnyNm)}"/>
			    			</c:when>
			    			<c:when test="${param.action eq 'nomalRegist' }">
			    				<c:out value="${d:decrypt(result.userNm)}"/>
			    			</c:when>
			    		</c:choose>
</dd>
						</dl>



						<dl>
							<dt>이메일</dt>
							<dd><c:out value="${result.emailAdres}"/></dd>
						</dl>
						<dl>
							<dt>전화번호</dt>
							<dd><c:out value="${result.areaNo}"/>)<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/></dd>
						</dl>
						<dl>
							<dt>등록일</dt>
							<dd><c:out value="${result.sbscrbDe}"/></dd>
						</dl>

					</div>
			 </c:forEach>
<!-- //모바일에서만 보이는 리스트 -->





			
			<div align="center">
			    <div class="pt20">
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="text"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			    <%-- <div align="right">
			        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
			    </div> --%>
			</div>
			</form:form>
			</td>
			</tr>
			</table>
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>