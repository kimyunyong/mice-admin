<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Javascript Call -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<script type="text/javascript" src="<c:url value="/js/mice/jquery-1.11.2.min.js"/>"></script>
<!-- IE 하위버전 HTML5 / css3 js 태그 / 하위 브라우저 반응형 js태그 -->
<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->
<!--[if IE 6]>
  <script type="text/javascript" src="/plugin/nyroModal/js/jquery.nyroModal-ie6.min.js"></script>
<![endif]-->
<script type="text/javascript" src="<c:url value="/js/mice/jquery.placeholder.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/mice/jquery.bpopup.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/mice/jquery-ui.min.js"/>"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="/plugin/nyroModal/js/jquery.nyroModal.custom.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/mice/jquery.mCustomScrollbar.concat.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/plugin/nyroModal/css/nyroModal.css"/>">
<c:if test="${!empty resultMsg}"><script type="text/javascript">alert("<spring:message code='${resultMsg}'/>");</script></c:if>
<c:if test="${!empty param.resultMsg}"><script type="text/javascript">alert("<spring:message code='${param.resultMsg}'/>");</script></c:if>
<script type="text/javascript">
    $(document).ready(function(){
        $('.datepicker').each(function () {
            $(this).datepicker({
              //showOn: "button",
              //buttonImage: "images/btn_cal.png",
              buttonImageOnly: true,
              //buttonText: "날짜 선택",
              buttonClass: "find_date",
              dateFormat: "yy-mm-dd",
              dayNames: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
              dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
              dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
              monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
              monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
              prevText: "이전달",
              nextText: "다음달",
              showOtherMonths: true,
              showMonthAfterYear: true,
		      changeMonth : true,
		      changeYear : true,
              beforeShowDay: function (day, year) {
                var result;
                switch (day.getDay()) {
                  case 0: // 일요일?
                    result = [true, "ui-date-sunday"];
                    break;
                  case 6: // 토요일?
                    result = [true, "ui-date-saturday"];
                    break;
                  default:
                    result = [true, ""];
                    break;
                }
                return result;
              }
            });
            $('.ui-datepicker-calendar > thead td.ui-datepicker-week-end:last-child a').addClass('ui-date-saturday');
          });    	
    });

    $(document).ready(function(){
    	$('.nyroModal').nyroModal();
    });

    function search_organizer_select_element(obj, targetobj){
    	$('a[data-id=' + targetobj + ']').parent().find('select').val($(obj).parent().parent().find('td[data-name=name_ko]').attr('data-val'));
    	$('#search_result').find('tbody').empty();
    	$('#search_result').hide();
    	$('#search_layer').bPopup().close();
    	$('a[data-id=' + targetobj + ']').parent().find('select').change();
    }
    
    function search_organizer(obj){
		var res = $('#search_result').find('tbody');
		var d = new Date();
		var hhmmss = d.getHours() + d.getMinutes() + d.getSeconds();
		$.ajax({
	        type: "POST",
	        url: "/crm/event/search_organizer.do",
	        data: {
	        	name : $(obj).parent().find('input[name=search_organizer_name]').val(),
	        	hhmmss : hhmmss
	        },
	        success: function (response) {
				$(res).children().empty();
				$('#search_result').show();
				$(res).append('<tr><th colspan="2" style="text-align:center">조회결과</th></tr>');
				if(response.resultList.length > 0){
					
					for(var i=0;i<response.resultList.length;i++)
						$(res).append('<tr><td data-name="name_ko" data-val="' + response.resultList[i].idx + '">' + response.resultList[i].name_ko + '</td><td><button onclick="search_organizer_select_element(this, $(\'#search_layer\').attr(\'data-id\'));return false;">선택</button></td></tr>');
					$('.nyroModal').nyroModal();
				}else{
					$(res).append('<tr><td colspan="2"> - 조회된 기관단체가 없습니다. - </td></tr>');
					$('.nyroModal').nyroModal();
				}
				
	        },
	        error : function (a,b,c){
	        	//alert(c);
	        	alert('기관단체 조회창을 호출할 수 없습니다. 관리자에게 문의하세요.');
	        }
	    });
    }
</script>