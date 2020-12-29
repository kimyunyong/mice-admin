<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<script type="text/javascript" src="/js/egovframework/com/cmm/fms/EgovMultiFile.js"></script>
<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<style>
	.error{color:red}
	label{padding-left:5px}
</style>
<script type="text/javaScript" language="javascript">
$(document).ready(function(){
	$('#btnDelete').on('click',function(){
		if(!confirm('삭제하시겠습니까?'))
			return false;
		
		location.replace('/cvb/lodgment/delete_action.do?idx=${param.idx}');
	});
});
	
</script>
<section id="contentArea">
	<h3>콘텐츠관리 > 숙박/관광지/프로그램 관리 > 상세</h3>
	<section class="sect_nonetit">
		<h4>상세보기</h4>
						<h5>기본정보</h5>

		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="24%">
					<col >
				</colgroup>
				<tbody>

					</tr>
					<tr>
						<th scope="row">호텔명<br class="mobile_show">(국문)</th>
						<td class="left">
							${fn:escapeXml(result.name_ko) }
						</td>
					</tr>
					<tr>
						<th scope="row">호텔명<br class="mobile_show">(영문)</th>
						<td class="left">
							${result.name_en }
						</td>
					</tr>
					<tr>
						<th scope="row">구분</th>
						<td class="left">
							${result.type }
						</td>
					</tr>
					<tr>
						<th scope="row">등급</th>
						<td class="left">
							${result.class_info }
						</td>
					</tr>
					<tr>
						<th scope="row">대표<br class="mobile_show">이미지1</th>
						<td class="left">
							<c:if test="${result.image_file_path1 != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_path1}" />
							</c:import>
							<input type="hidden" name="image_file_path1" value="${result.image_file_path1}"/>
							</c:if> 
							
						</td>
					</tr>
					<tr>
						<th scope="row">대표<br class="mobile_show">이미지2</th>
						<td class="left">
							<c:if test="${result.image_file_path2 != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_path2}" />
							</c:import>
							</c:if> 
						</td>
					</tr>
					<tr>
						<th scope="row">대표<br class="mobile_show">이미지3</th>
						<td class="left">
							<c:if test="${result.image_file_path3 != ''}">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.image_file_path1}" />
							</c:import>
							</c:if> 
						</td>
					</tr>
					<tr>
						<th scope="row">홈페이지</th>
						<td class="left">
							${result.homepage }
						</td>
					</tr>
					<tr>
						<th scope="row">주소<br class="mobile_show">(국문)</th>
						<td class="left">
							${result.address_ko }
						</td>
					</tr>
					<tr>
						<th scope="row">주소<br class="mobile_show">(영문)</th>
						<td class="left">
							${result.address_en}
						</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td class="left">
							${result.tel_no}
						</td>
					<tr>
					</tr>
					<tr>
						<th scope="row">내용<br class="mobile_show">(국문)</th>
						<td class="left">
							${result.comment }
						</td>
					</tr>
					<tr>
						<th scope="row">내용<br class="mobile_show">(영문)</th>
						<td class="left">
							${result.comment_en }
						</td>
					</tr>
					<tr>
						<th scope="row">지도</th>
						<td class="left">
							<iframe src="${result.google_map }"></iframe>
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row" colspan="2">[위치]</th>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">소재지<br class="mobile_show">(국문)</th>
						<td class="left">
							${result.locality_ko }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">소재지<br class="mobile_show">(영문)</th>
						<td class="left">
							${result.locality_en}
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">HICO</th>
						<td class="left">
							${result.hico }M
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">신경주역</th>
						<td class="left">
							${result.new_gyeongju_ktx_station}KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주역</th>
						<td class="left">
							${result.gyeongju_station }KM
						</td>
					</tr>					
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">서경주역</th>
						<td class="left">
							${result.west_gyeongju_station }KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주고속버스터미널</th>
						<td class="left">
							${result.gyeongju_express_bus}KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주시외버스터미널</th>
						<td class="left">
							${result.gyeongju_intercity_bus }KM
						</td>
					</tr>					
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">경주IC</th>
						<td class="left">
							${result.gyeongju_ic }KM
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔' && result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row" colspan="2">[객실]</th>
					</tr>
					<tr <c:if test="${result.type != '호텔' && result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row">총 객실수</th>
						<td class="left">
							${result.total_room_count }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">스위트룸</th>
						<td class="left">
							${result.sweetroom_count }
						</td>
					</tr>						
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">일반룸</th>
						<td class="left">
							${result.nomal_room_count }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">더블룸</th>
						<td class="left">
							${result.double_room_count }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">트윈룸</th>
						<td class="left">
							${result.tween_room_count }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">트리플룸</th>
						<td class="left">
							${result.triple_room_count }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">쿼드러플룸</th>
						<td class="left">
							${fn:escapeXml(result.quadruple_room_count) }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">온돌 룸</th>
						<td class="left">
							${result.ondol_room_count }
						</td>
					</tr>						
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">스위트룸</th>
						<td class="left">
							${result.ondol_room_count }
						</td>
					</tr>						
					<tr <c:if test="${result.type != '호텔' && result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row" colspan="2">[수용규모<br class="mobile_show"> Largest room]</th>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">극장식</th>
						<td class="left">
							${result.theater_capacity }
						</td>
					</tr>										
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">강의식</th>
						<td class="left">
							${result.classroom_capacity }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">연회식</th>
						<td class="left">
							${result.convention_capacity }
						</td>
					</tr>					
					<tr <c:if test="${result.type != '전통고택'}">style="display:none"</c:if>>
						<th scope="row">수용인원</th>
						<td class="left">
							${result.total_room_capacity }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">연회실<br class="mobile_show">(기본)</th>
						<td class="left">
							${result.banquet_basic_count }
						</td>
					</tr>
					<tr <c:if test="${result.type != '호텔'}">style="display:none"</c:if>>
						<th scope="row">연회실<br class="mobile_show">(최대)</th>
						<td class="left">
							${result.banquet_max_count }
						</td>
					</tr>
				</tbody>
		</table>
			<!-- 버튼 위치(s) -->
			<div class="btn_area">
				<div class="center">
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_MANAGER, ROLE_ADMIN">
					<a href="/cvb/lodgment/edit.do?idx=${param.idx}" role="button" class="btn1 clr_Wgray">수정</a>
					<a id="btnDelete" role="button" class="btn1 clr_Wgray">삭제</a>
				
					<a href="<c:url value='/cvb/lodgment/list.do'/>" role="button" class="btn1 clr_Wgray">목록</a>
				</sec:authorize>
				</div>
			</div>
			<!--// 버튼 위치(e) -->
		
	</section>
</section>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>