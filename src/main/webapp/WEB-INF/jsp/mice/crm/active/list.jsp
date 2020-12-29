<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	function fnLinkPage(pageNo){
	    document.form.pageIndex.value = pageNo;
	    document.form.submit();
	}

	$(document).ready(function(){
		$('#btnSearch').on('click',function(){
			$('form').attr('action','/crm/event/list.do');
			$('form').submit();
		});
		$('#btnRegist').on('click',function(){
			location.href='/crm/event/insert.do';
		});
		
		$('#btnExcelDownload').on('click',function(){
			$('form').attr('action','/crm/event/excel_download.do');
			$('form').submit();
		});
		
		$('#btnExcelDownload2').on('click',function(){
			$('form').attr('action','/crm/event/excel_download2.do');
			$('form').submit();
		});
		
		$('#btnExcelUpload').on('click',function(){
			$('input[name=excel]').click();
		});
		
		$('input[name=excel]').change(function(){
			
			if($(this).val() != ''){
				$('form').attr('action','/crm/event/excel_upload.do');
				$('form').submit();
			}
				
		});
	});
</script>
<%@ include file="/WEB-INF/jsp/mice/include/contents_layout.jsp" %>
<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
<section id="contentArea">
	<h3>대관관리 <span>></span> 유치활동관리</h3>
	<section class="sect_nonetit">
		<h4>정보</h4>
		



<!-- 행사정보 -->
		<h5 class="s_tit">행사정보</h5>

		<!-- adm_tbl2 -->
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">추진현황</th>
						<td class="left">
							<select name="" title="추진현황">
						    		<option value="01">유치추진</option>
						    		<option value="02">유치확정</option>
					      	</select>
						</td>
					</tr>
					<tr>
						<th scope="row">유치확정<br class="mobile_show">일자</th>
						<td class="left">
							<input type="text" value=""/>
						</td>
					</tr>
					
					<tr>
						<th scope="row">행사명<br class="mobile_show">(국문)</th>
						<td class="left">
							<input type="text" value=""/>
						</td>
					</tr>
					
					<tr>
						<th scope="row">행사명<br class="mobile_show">(영문)</th>
						<td class="left">
							<input type="text" value=""/>
						</td>
					</tr>
					
					<tr>
						<th scope="row">행사명<br class="mobile_show">(영문약칭)</th>
						<td class="left">
							<input type="text" value=""/>
						</td>
					</tr>
					<tr>
						<th scope="row">행사구분</th>
						<td class="left">
							<select name="" title="행사구분">
						    		<option value="01">정부/지자체</option>
						    		<option value="02">공공기관</option>
						    		<option value="03">학회</option>
						    		<option value="04">협회</option>
						    		<option value="05">기업</option>
						    		<option value="06">학교</option>
						    		<option value="07">비영리단체</option>
						    		<option value="08">기타</option>
					      	</select>
						</td>
					</tr>
					<tr>
						<th scope="row">개최주기</th>
						<td class="left">
							<input type="text" value=""/>
						</td>
					</tr>
					<tr>
						<th scope="row">참가규모</th>
						<td class="left">
							<input type="text" value="" class="wd15per"/>개국 <input type="text" value=""  class="wd15per"/>명 / <br class="mobile_show">해외 <input type="text" value=""  class="wd15per"/>개국 <input type="text" value=""  class="wd15per"/>명
						</td>
					</tr>
					<tr>
						<th scope="row">장소</th>
						<td class="left">
							<select name="" title="행사구분">
								<option value="">==선택하세요==</option>
								<option value="11" >HICO</option>
								<option value="34" >Hyundai Hotel</option>
								<option value="35" >Hilton Gyeongju</option>
								<option value="36" >경주조선온천호텔</option>
								<option value="37" >CONCORDE HOTEL</option>
								<option value="38" >Commodore Hotel Gyeongju</option>
								<option value="39" >KOLON HOTEL</option>
								<option value="40" >The-K GyeongJu Hotel</option>
								<option value="41" >DAEmyung Resort Gyeongju</option>
								<option value="42" >캔신턴리조트 경주보문</option>
								<option value="43" >한화리조트 경주</option>
								<option value="44" >블루원리조트</option>
								<option value="45" >교원드림센터</option>
								<option value="46" >동국대학교 경주캠퍼스</option>
								<option value="47" >기타</option>
								<option value="48" >KT경주수련원</option>
								<option value="134" >COEX</option>
					      	</select>						
						</td>
					</tr>

					<tr>
						<th scope="row">행사기간</th>
						<td class="left">
						    <input type="text" value=""/> ~ <input type="text" value=""/>
						</td>
					</tr>

					<tr>
						<th scope="row">기타사항</th>
						<td class="left">
										<textarea></textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">행사프로그램</th>
						<td class="left">
						    <input type="file" />
						</td>
					</tr>


				</tbody>
		</table>
		<!-- //adm_tbl2 -->

<!-- //행사정보 -->






<!-- 지원내역 -->
		<h5 class="s_tit">지원내역</h5>

		<!-- adm_tbl2 -->
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" rowspan="3">지원내역</th>
						<td class="left">
							유치지원 <input type="text" value="" class="wd12per" />원  <input type="text" value="" class="wd40per max_none"/>
						</td>
					</tr>

					<tr>
						<td class="left">
							홍보지원 <input type="text" class="wd12per" value=""/ >원  <input type="text" value="" class="wd40per max_none"/>
						</td>
					</tr>
					<tr>
						<td class="left">
							개최지원 <input type="text" class="wd12per" value=""/>원  <input type="text"class="wd40per max_none"  value=""/>
						</td>
					</tr>

					<tr>
						<th scope="row">제안서<br class="mobile_show">첨부</th>
						<td class="left">
							<input type="file" value=""/>
						</td>
					</tr>
					
					<tr>
						<th scope="row">유치실패<br class="mobile_show">사유</th>
						<td class="left">
							<input type="text" value=""/>
						</td>
					</tr>
					

				</tbody>
		</table>
		<!-- //adm_tbl2 -->

<!-- //지원내역 -->





<!-- 통계조사 -->
		<h5 class="s_tit">통계조사</h5>

		<!-- adm_tbl2 -->
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" rowspan="3">직접지출</th>
						<td class="left">
							국내인평균 <input type="text" value="" class="wd30per" />원  
						</td>
					</tr>

					<tr>
						<td class="left">
							해외참가자평균<input type="text" class="wd30per" value=""/ >원  
						</td>
					</tr>

					<tr>
						<td class="left">
							<input type="file" value=""/>
						</td>
					</tr>
					

				</tbody>
		</table>
		<!-- //adm_tbl2 -->

<!-- //통계조사 -->


<!-- 주요인사-->
		<h5 class="s_tit">주요인사연결</h5>



<!-- brd_p -->
<div class="brd_p">

	<div class="search_sort_type mobile_l">
		<input type="text">
	</div>
	<div class="search_btn_type mobile_r">
		<a href="#" class="btn2 clrGrad_Wgray">조회</a>
	</div>


</div>
<!-- //brd_p -->




		<!-- adm_tbl2 모바일,탭에서만 보임 -->
		<table class="adm_tbl2 mobile_none">
			<caption>상세</caption>
				<colgroup>
					<col width="13%">
					<col width="12%">
					<col width="13%">
					<col width="13%">
					<col width="17%">
					<col width="17%">
					<col width="17%">
					<col width="17%">
					<col width="20%">
					<col>
				</colgroup>

		<thead>
			<tr>
				<th >성명</th>
				<th>직위</th>
				<th>근무처</th>
				<th>부서/학과</th>
				<th>전화</th>
				<th>휴대전화</th>
				<th>이메일</th>
				<th>주소</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					김경주<br class="pad_show"><a href="javascript:;" onclick="window.open('http://iniini.co.kr/site/kj/desktop3.asp','modal','width=500px; height:500px;');" class="small_btn">내역</a>
				</td>
				<td>
					학회장
				</td>
				<td>
					경주대학교
				</td>
				<td>
					행정부/<br>행정학과
				</td>
				<td>
					054-123-2222
				</td>
				<td>
					010-2232-2334
				</td>
				<td>
					abc@advef.com
				</td>
				<td>
					경상북도 경주시 보문단지로 369
				</td>
				<td>
					비고
				</td>

			</tr>

			

		</tbody>
		</table>
		<!-- //adm_tbl2 -->













			<!-- 모바일에서만 보이는 리스트 -->
			
					<div class="mobile_list">

						<dl>
							<dt>성명</dt>
							<dd>김경주	 <a href="javascript:;" onclick="window.open('http://iniini.co.kr/site/kj/desktop3.asp','modal','width=500px; height:500px;');"  class="small_btn">내역</a></dd>
						</dl>
					
						<dl>
							<dt>직위</dt>
							<dd>학회장</dd>
						</dl>
						<dl>
							<dt>근무처</dt>
							<dd>경주대학교 </dd>
						</dl>
						<dl>
							<dt>부서/학과</dt>
							<dd>행정부/행정학과 </dd>
						</dl>

						<dl>
							<dt>전화</dt>
							<dd>054-123-2222 </dd>
						</dl>

						<dl>
							<dt>휴대전화</dt>
							<dd>010-2232-2334 </dd>
						</dl>
						<dl>
							<dt>이메일</dt>
							<dd>abc@advef.com </dd>
						</dl>
						<dl>
							<dt>주소</dt>
							<dd>경상북도 경주시 보문단지로 369 </dd>
						</dl>
						<dl>
							<dt>비고</dt>
							<dd>비고 </dd>
						</dl>


					</div>
			 





















<!-- //주요인사-->



<!-- 담당자-->
		<h5 class="s_tit">담당자</h5>

		<!-- adm_tbl2 -->
		<table class="adm_tbl2">
			<caption>상세</caption>
				<colgroup>
					<col width="27%">
					<col>
				</colgroup>

				<tbody>

					<tr>
						<th scope="row">유치담당</th>
						<td class="left">
							<input type="text" value=""  />  
						</td>
					</tr>

					<tr>
						<th scope="row">개최지원<br class="mobile_show">담당</th>
						<td class="left">
							<input type="text" value="" />  
						</td>
					</tr>


					<tr>
						<th scope="row">대관담당</th>
						<td class="left">
							<input type="text" value="" />  
						</td>
					</tr>





				</tbody>
		</table>
		<!-- //adm_tbl2 -->

<!-- //담당자->

		<!-- 버튼 위치(s) -->
			<div class="search_new_btn">
					<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
					<a href="#" role="button" class="btn1 clr_Wgray">취소</a>
					<a href="#" role="button" class="btn1 clr_Wgray">목록</a>
			</div>
			<!--// 버튼 위치(e) -->

        
	</section>
	<!-- //sect_nonetit -->

</section>

</sec:authorize>
<%@ include file="/WEB-INF/jsp/mice/include/bottom.jsp" %>
