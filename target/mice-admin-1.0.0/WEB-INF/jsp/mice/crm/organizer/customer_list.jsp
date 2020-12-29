<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<table class="adm_tbl2 border_top_none">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
				<c:if test="${fn:length(customerList) > 0 }">
				<c:forEach var="result" items="${customerList}" varStatus="status">
					<c:set var="nextVal" value="${relationList[status.index]}"/>
					<tr>
						<th scope="col">이름</th>
						<td><a href="/crm/customer/info.do?idx=${result.idx }" style="font-weight:bold">${d:decrypt(result.name_ko) }</a></td>
					</tr>
					<tr>
						<th scope="col">부서</th>
						<td>${nextVal.unit }</td>
					</tr>
					<tr>
						<th scope="col">직함</th>		
      					<td>${nextVal.staff }</td>
					</tr>
					<tr>
						<th scope="col">전화번호
						</th>
						<td>${d:decrypt(result.tel_no) }</td>
						
						</tr>
											<tr>
						<th scope="col">휴대전화
						</th>
						<td>${d:decrypt(result.phone_no) }</td>
						</tr>
											<tr>

						<th scope="col">E-mail
						</th>	
						<td>${d:decrypt(result.email) }</td>				
						</tr>
											<tr>

						<th scope="col">비고
						</th>
						<td>${result.etc }</td>
						</tr>
					</tr>
		  			<tr>
		  				<td style="background:#bbb;" colspan="2"></td>
		  			</tr>					
	      	    </c:forEach>
	      	    </c:if>

	      	    <c:if test="${fn:length(customerList) == 0 }">
	      	    	<tr>
	      	    		<td colspan="2" class="center"><p class="center">등록된 인력이 없습니다.</p></td>
	      	    	</tr>
	      	    </c:if>
	      	    </tbody>
    </table>