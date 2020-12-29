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

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<caption>상세</caption>
		<colgroup>
			<col width="100%">
		</colgroup>
		<tbody>
		
		<c:if test="${fn:length(eventList) > 0 }">
		<c:forEach var="result2" items="${eventList}" varStatus="status">
			<tr>
				<td>
					<span id="${result2.idx }${organizers}${status.index}" onclick="javascript:eventCall(this);" name="fadeBtn" style="font-size:large">+</span>
					<span style="font-size:16px;font-weight:bolder">${result2.name_ko } <button onclick="location.href='/crm/event/info.do?idx=${result2.idx}'">상세보기</button></span>
				</td>
    				</tr>
    				<tr id = "${result2.idx }${organizers}${status.index}tbl" style="display:none"><td>
    					<table width="100%" border="0" cellpadding="0" cellspacing="0">
    						<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
						</colgroup>
    						<tbody>
    							<tr>
    								<th>행사장소</th>
    								<td>${result2.place_name }</td>
    								<th>행사기간</th>
    								<td>${result2.event_st_date } ~ ${result2.event_ed_date }</td>
    							</tr>
    							<tr>
    								<th>대관기간</th>
    								<td>${result2.rent_st_date } ~ ${result2.rent_ed_date }</td>
    								<th>행사성격</th>
    								<td>${result2.event_scale_name }</td>
    							</tr>
    							<tr>
    								<th>행사유형</th>
    								<td>${result2.event_type_name }</td>
    								<th>외국인수</th>
    								<td>${result2.join_foreigner_cnt }</td>
    							</tr>
    							<tr>
    								<th>내국인수</th>
    								<td>${result2.join_nationals_cnt }</td>
    								<th>참가국수</th>
    								<td>${result2.participating_states_cnt }</td>
    							</tr>
    							<tr>
    								<th>참가자수</th>
    								<td>${result2.join_personal_cnt }</td>
    								<th>전시면적</th>
    								<td>${result2.exhibition_scale }</td>
    							</tr>
    							<tr>
    								<th>전시부스</th>
    								<td>${result2.booth_cnt }</td>
    								<th>주최</th>
    								<td>${result2.organizers_1_name }</td>
    							</tr>
    							<tr>
    								<th>주관</th>
    								<td>${result2.organizers_2_name }</td>
    								<th></th>
    								<td></td>
    							</tr>
    						</tbody>
    					</table></td>
    				</tr>
     	    </c:forEach>
     	    </c:if>
     	    
     	    <c:if test="${fn:length(eventList) == 0 }">
     	    	<tr>
     	    		<td style="text-align: center">등록된 행사가 없습니다.</td>
     	    	</tr>
     	    </c:if>
     	    
     	    </tbody>
    </table>