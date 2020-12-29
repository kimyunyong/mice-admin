<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function popInsertOrg(){
		window.name = "parentForm";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    openWin = window.open("/crm/invite/insertOrganizerForm.do",
	            "childForm", "width=1024px, height=900px, resizable = no, scrollbars = no"); 
	}
	
	function setName(name_ko){
		alert(name_ko);
		$('#search_organizer_name').val(name_ko);
		$('#btnSearch').trigger('click');
	}	
</script>
<div id="search_layer" style="display:none;background-color:white; width: 600px;">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1">
        <caption>기관단체 조회</caption>
        <colgroup>
            <col width="30%">
            <col width="70%">
        </colgroup>
        <tbody>
            <tr>
                <th colspan="2" style="text-align:center">기관단체 조회</th>
            </tr>
            <tr>
                <td>기관단체 명</td>
                <td>
                   	<input type="text" name="search_organizer_name" id="search_organizer_name"  onkeydown="javascript:if(event.keyCode == 13){$('#btnSearch').click();}"/>
                    <a href="javascript:;" onclick="javascript:search_organizer(this);" role="button" class="btn1 clr_Wgray" id="btnSearch">조회</a>
                    <a href="javascript:;" onclick="javascript:popInsertOrg();" role="button" class="btn1 clr_Wgray">기관 추가</a>
                </td>
            </tr>
        </tbody>
    </table>
    <table width="100%" id="search_result" border="0" cellpadding="0" cellspacing="0" class="adm_tbl1" style="display:none">
        <caption>기관단체 조회 결과</caption>
        <colgroup>
            <col width="80%">
            <col width="20%">
        </colgroup>
        <tbody>
            <tr>
                <th colspan="2" style="text-align:center">조회결과</th>
            </tr>
        </tbody>
    </table>
</div>