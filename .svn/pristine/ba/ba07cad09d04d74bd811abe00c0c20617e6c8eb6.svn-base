<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/jsp/mice/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/mice/include/scripts.jsp" %>


<script src="/plugin/validate/jquery.validate.js"></script>
<script type="text/javascript" src="/plugin/validate/localization/messages_ko.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="zipcode_layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('zipcode_layer');

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            if (document.getElementById('zip_postcode') != null) 
            	document.getElementById('zip_postcode').value = data.zonecode; //5자리 새우편번호 사용
            
            if (document.getElementById('zip_address_ko') != null)
            	document.getElementById('zip_address_ko').value = fullAddr;
            
            if (document.getElementById('zip_address_en') != null)
            	document.getElementById('zip_address_en').value = data.addressEnglish;

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%'
    }).embed(element_layer);

    // iframe을 넣은 element를 보이게 한다.
    element_layer.style.display = 'block';

    // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
    var width = 300; //우편번호서비스가 들어갈 element의 width
    var height = 460; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

$(document).ready(function(){
	$('#btnSave').on('click',function(){		
		var name_ko = $("input[name=name_ko]").val();
		var name_en = $("input[name=name_en]").val();
		var name_etc = $("input[name=name_etc]").val();
		var type_idx = $("select[name=type_idx]").val();
	
		var national = $("input[name=national]").val();
		var city = $("input[name=city]").val();
		var zip_code = $("input[name=zip_code]").val();
		var address_ko = $("input[name=address_ko]").val();
		var address_en = $("input[name=address_en]").val();
		var tel_no = $("input[name=tel_no]").val();
		var fax = $("input[name=fax]").val();
		var email = $("input[name=email]").val();
		var homepage = $("input[name=homepage]").val();		
		var manager_id = $("select[name=manager_id]").val();
		
		if(name_ko == ""){alert("기관 단체명을 넣어주세요."); $("input[name=name_ko]").focus(); return;}
		if(type_idx == ""){alert("구분을 선택하세요."); $("select[name=type_idx]").focus(); return;}
		
		$.ajax({
	           type : "post",
	           data:{'name_ko' : name_ko,
	        	'name_en' : name_en , 
	           	'name_etc' : name_etc , 
	           	'type_idx' : type_idx , 
	           	'national' : national ,
	           	'city' : city,
	           	'zip_code' : zip_code,
	           	'address_ko' : address_ko,
	           	'address_en' : address_en,
	           	'tel_no' : tel_no,
	           	'fax' : fax,
	           	'email' : email,
	           	'homepage' : homepage,
	           	'manager_id' : manager_id
	           },
	           url : "/crm/invite/insertOrganizer.do",
	           dataType : "json",
	           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	           error : function(){
	               alert('등록 실패..');
	           },
	           success : function(data){
				if(data.msg == "success"){
					alert('등록 완료');
					opener.parent.location.reload();
					
					opener.setName(data.name_ko);
					window.close();
				}else{
					alert('이미 기관을 등록하였습니다.');
				}
				
				location.reload();
			} // success
		});	// $ajax
	});
});
</script>

<style>
	.error{color:red}
	label{padding-left:5px}
	.esicon{color:red;}
</style>

<section class="sect_nonetit">
	<h4>상세보기</h4>
	<form name="form" method="post" action="/crm/organizer/" enctype="multipart/form-data">
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1">
		<caption>상세</caption>
			<colgroup>
				<col width="15%">
				<col width="85%">
			</colgroup>
			<tbody>
				<tr><th colspan="2" style="text-align:left">기관단체명</th></tr>
				<tr>
					<th scope="row"><span class="esicon">*</span>국문</th>
					<td>
						<input name="name_ko" type="text" size="100"  style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">영문</th>
					<td>
						<input name="name_en" type="text" size="100"  style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">기타</th>
					<td>
						<input name="name_etc" type="text" size="100"/>
					</td>
				</tr>
				<tr><th colspan="2" style="text-align:left">기본정보</th></tr>
				<tr>
					<th scope="row"><span class="esicon">*</span>구분</th>
					<td>
						<c:import url="/crm/code/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="type_idx" />
							<c:param name="type" value="주최자구분" />
						</c:import>
					</td>
				</tr>
				<tr>
					<th scope="row">국가</th>
					<td>
						<input name="national" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">도시</th>
					<td>
						<input name="city" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">우편번호</th>
					<td>
						<input id="zip_postcode" name="zip_code" type="text" size="100"/>
						<a role="button" class="btn1 clr_Wgray" onclick="execDaumPostcode()">주소검색</a>
					</td>
				</tr>
				<tr>
					<th scope="row">주소(국문)</th>
					<td>
						<input id="zip_address_ko" name="address_ko" type="text" size="100" style="ime-mode:active"/>
					</td>
				</tr>
				<tr>
					<th scope="row">주소(영문)</th>
					<td>
						<input id="zip_address_en" name="address_en" type="text" size="100" style="ime-mode:inactive"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대표전화</th>
					<td>
						<input name="tel_no" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">FAX</th>
					<td>
						<input name="fax" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">대표 E-mail</th>
					<td>
						<input name="email" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">홈페이지</th>
					<td>
						<input name="homepage" type="text" size="100"/>
					</td>
				</tr>
				<tr>
					<th scope="row">담당자</th>
					<td>
						<c:import url="/crm/manager/select_box.do" charEncoding="utf-8">
							<c:param name="name" value="manager_id" />
							<c:param name="result" value="myid" />
						</c:import>
					</td>
				</tr>
				<tr><th colspan="2" style="text-align:left">추가정보</th></tr>
				<tr>
					<th scope="row"></th>
					<td>
						<textarea name="comment" rows="4" cols="80"></textarea>
					</td>
				</tr>
			</tbody>
	</table>
	</form>
		<!-- 버튼 위치(s) -->
		<div class="btn_area">
			<div class="center">
				<a id="btnSave" role="button" class="btn1 clr_Wgray">저장</a>
				<a href="javascript:;" onclick="window.close();" role="button" class="btn1 clr_Wgray">닫기</a>
			</div>
		</div>
		<!--// 버튼 위치(e) -->
	
</section>
