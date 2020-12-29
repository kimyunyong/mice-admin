<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<script type="text/javaScript" language="javascript" defer="defer">

function fnSearch(){
    document.listForm.submit();
}
function fnViewCheck(){
    if(insert_msg.style.visibility == 'hidden'){
    	insert_msg.style.visibility = 'visible';
    }else{
    	insert_msg.style.visibility = 'hidden';
    }
}

function fn_egov_inqire_notice(i, nttId, bbsId) {
	/*  if(bbsId == "") return false; //20150508
	document.subForm.nttId.value = nttId;
	document.subForm.bbsId.value = bbsId;
	document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>"; */
	document.subForm.submit();
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

function fnLinkPage(i){
	$('input[name=pageIndex]').val(i);
	$('form[name=listForm]').submit();
}
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<section id="contentArea">
	<h3>${brdMstrVO.bbsNm }</h3>
	<section class="sect_nonetit">
	
		<h4>직원등록</h4>
		<div class="wordnoti_area">총 <b>${paginationInfo.getTotalRecordCount() }</b>건이 검색되었습니다.</div>
		<form name="listForm" action="/cop/bbs/selectBoardList.do" method="post">
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
		<input type="hidden" name="nttId"  value="0" />
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

		<div class="brd_p">
		<div class="search_sort_type">
				<dl class="n_st_sort">
					<dt>
						<select name="searchLang" class="brdSelect1" title="언어선택">
						   <option value="">전체</option>
						   <option value="ko" <c:if test="${searchVO.searchLang eq 'ko'}">selected="selected"</c:if> >국문</option>
						   <option value="en" <c:if test="${searchVO.searchLang eq 'en'}">selected="selected"</c:if> >영문</option>
						</select>
						<c:choose>
						<c:when test="${param.bbsId eq 'BBSMSTR_000000000001'}">
						<select name="searchTp" class="brdSelect1" title="검색조건선택">
							   <option value="0">공통</option>
							   <option value="1" <c:if test="${searchVO.searchTp == '1'}">selected="selected"</c:if> >HICO</option>
							   <option value="2" <c:if test="${searchVO.searchTp == '2'}">selected="selected"</c:if> >CVB</option>
						</select>
						</c:when>
						<c:otherwise>
						<input type="hidden" name="searchTp" value="0"/>
						</c:otherwise>
						</c:choose>
						<select name="searchCnd" class="brdSelect1" title="검색조건선택">
							   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
							   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
							   <c:if test="${anonymous != 'true'}">
							   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
							   </c:if>
							   <c:if test="${boardVO.bbsId == 'BBSMSTR_000000000021' }">
							   <option value="3" <c:if test="${searchVO.searchCnd == '3'}">selected="selected"</c:if> >분과</option>
							   </c:if>
						</select>
					</dt>
					<dd>
						<input class="brdSelect2" name="searchWrd" type="text"  value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
					</dd>
				</dl>
				
				<div class="search_btn_type">
					<a class="btn2 clrGrad_Wgray" onclick="javascript:fnSearch();">조회</a>
					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
						<a class="btn2 clrGrad_Wgray" href="/cop/bbs/addBoardArticle.do?bbsId=${boardVO.bbsId}">등록</a>
					</sec:authorize>
				</div>	
									
		</div>
		</div>		
		</form>
		
		<!-- 웹, 패드에서 보이는 리스트 -->
		<table class="adm_tbl2 mobile_none" summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
			<caption>게시판 목록</caption>
			<colgroup>
				<col width="5%"/>
				<col width="5%"/>
				<col width="5%"/>
				<c:choose>
				<c:when test="${boardVO.bbsId == 'BBSMSTR_000000000021' }">
				<col width="10%"/>
				<col width="45%"/>
				</c:when>
				<c:otherwise>
				<col width="55%"/>
				</c:otherwise>
				</c:choose>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">언어</th>
					<th scope="col">구분</th>
					<c:if test="${boardVO.bbsId == 'BBSMSTR_000000000021' }">
					<th scope="col">분과</th>
					</c:if>
			    	<th scope="col">제목</th>
			    	<th scope="col">작성일</th>
			    	<th scope="col">조회수</th>
			  	</tr>
			</thead>

			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
					<td><c:choose><c:when test="${result.bbsLang eq 'ko'}">국문</c:when><c:when test="${result.bbsLang eq 'en'}">영문</c:when></c:choose></td>
					<td><c:choose><c:when test="${result.siteTp == 0}">공통</c:when><c:when test="${result.siteTp == 1}">HICO</c:when><c:when test="${result.siteTp == 2}">CVB</c:when></c:choose></td>
					<c:if test="${param.bbsId == 'BBSMSTR_000000000021' }">
					<td>${result.category }</td>
					</c:if>
			   		<td>
			   	   	<c:choose>
			    		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
					    	<c:if test="${result.replyLc!=0}">
			    			<c:forEach begin="0" end="${result.replyLc}" step="1">
		    				&nbsp;
				    		</c:forEach>
				    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
					    	</c:if>
	    					<c:out value="${result.nttSj}" />
	    				</c:when>
	    				<c:otherwise>
				    		<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectBoardArticle.do'/>">
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
								<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
								<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
								<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
								<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						    	<c:if test="${result.replyLc!=0}">
						    		<c:forEach begin="0" end="${result.replyLc}" step="1">
						    			&nbsp;
						    		</c:forEach>
						    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
						    	</c:if>
					    		<span class="link">
					    			<%-- <a href="#"  onclick="fn_egov_inqire_notice(0,<c:choose><c:when test='${result.nttId} not eq empty'>${result.nttId}</c:when><c:otherwise>-1</c:otherwise></c:choose>,'${result.bbsId}');"><c:out value="${result.nttSj}"/></a> --%>
					    			<a onclick="javascript:$(this).parent().parent().submit();"><c:out value="${result.nttSj}"/></a>
					    			
					    			
					    		</span>
					    	</form>
			    		</c:otherwise>
	    			</c:choose>
			   		</td>
			   		<td>${result.frstRegisterPnttm}</td>
			   		<td>${result.inqireCo}</td>	    
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


		<!-- 모바일에서 보이는 리스트 -->
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="mobile_list">
				<!-- 				
				<dl>
					<dt>번호</dt>
					<dd><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></dd>
				</dl> 
				-->

				<dl>
					<dt>언어</dt>
					<dd><c:choose><c:when test="${result.bbsLang eq 'ko'}">국문</c:when><c:when test="${result.bbsLang eq 'en'}">영문</c:when></c:choose></dd>
				</dl>

				<dl>
					<dt>구분</dt>
					<dd><c:choose><c:when test="${result.siteTp == 0}">공통</c:when><c:when test="${result.siteTp == 1}">HICO</c:when><c:when test="${result.siteTp == 2}">CVB</c:when></c:choose></dd>
				</dl>
				<c:if test="${boardVO.bbsId == 'BBSMSTR_000000000021' }">
				<dl>
					<dt>분과</dt>
					<dd>${result.category }</dd>
				</dl>
				</c:if>

				<dl>
					<dt>제목</dt>
					<dd><c:choose>
			    		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
					    	<c:if test="${result.replyLc!=0}">
			    			<c:forEach begin="0" end="${result.replyLc}" step="1">
		    				&nbsp;
				    		</c:forEach>
				    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
					    	</c:if>
	    					<c:out value="${result.nttSj}" />
	    				</c:when>
	    				<c:otherwise>
				    		<form name="subForm" method="post" action="<c:url value='/cop/bbs/selectBoardArticle.do'/>">
								<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
								<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
								<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
								<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
								<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
								<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						    	<c:if test="${result.replyLc!=0}">
						    		<c:forEach begin="0" end="${result.replyLc}" step="1">
						    			&nbsp;
						    		</c:forEach>
						    		<img src="<c:url value='/images/egovframework/com/cmm/icon/reply_arrow.gif'/>" alt="reply arrow">
						    	</c:if>
					    		<span class="link">
					    			<%-- <a href="#"  onclick="fn_egov_inqire_notice(0,<c:choose><c:when test='${result.nttId} not eq empty'>${result.nttId}</c:when><c:otherwise>-1</c:otherwise></c:choose>,'${result.bbsId}');"><c:out value="${result.nttSj}"/></a> --%>
					    			<a onclick="javascript:$(this).parent().parent().submit();"><c:out value="${result.nttSj}"/></a>
					    			
					    			
					    		</span>
					    	</form>
			    		</c:otherwise>
	    			</c:choose></dd>
				</dl>
				<dl>
					<dt>작업일</dt>
					<dd>${result.frstRegisterPnttm}</dd>
				</dl>

				<dl>
					<dt>조회수</dt>
					<dd>${result.inqireCo}</dd>
				</dl>
			</div>
			</c:forEach>
			<!-- //모바일에서 보이는 리스트 -->
			
			<div align="center" class="pt20">
			    <div>
			        <ui:pagination paginationInfo = "${paginationInfo}"
			            type="image"
			            jsFunction="fnLinkPage"
			            />
			    </div>
			</div>

			
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>