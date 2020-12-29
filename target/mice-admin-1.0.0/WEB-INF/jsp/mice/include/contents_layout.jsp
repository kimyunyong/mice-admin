<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"	   uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="d" 	uri="/WEB-INF/tlds/custom.tld" %>
<c:set var="sPath" value="${pageContext.request.requestURI}" /> 			
<style>
	input.readonly { background-color:#bdc8c9}
</style>
<script type="text/javascript">
// mCustomScrollbar
(function($){
	$(window).load(function(){
		$(".sidebar_navi").mCustomScrollbar();
	});
})(jQuery);

// accodion Menu
$(function(){	
	
	var po = '${sessionScope.position}';
	
	$(".gnb_sidebar li > a").click(function(index){
		
		var idx = $(".gnb_sidebar li > a").index(this);
		
			
		$(".gnb_sidebar > li").removeClass();
		
		if( $(this).parent().parent().find("ul").length > 0){
			$(this).parent().parent().find("ul").slideUp();	
		}else{
			$(".gnb_sidebar ul").slideUp();
		}
		
		$(this).parent().addClass("open");
		
		if(po == ''){
			$('.kms').removeClass("open");
		}
		
				
		if(!$(this).next().is(":visible")){
			if(idx != 8 || po != ''){ 
				$(this).next().slideDown();
			}
			
			/*if( idx == "1"){
				$(".gnb_sidebar li > a").eq(8).parent().addClass("open");
				//if(!$(".gnb_sidebar li > a").eq(8).next().is(":visible")){
					$(".gnb_sidebar li > a").eq(8).next().slideDown();
				//}			
			}*/					
		}
		

		
	});
	
	
 	$('.kms').on('click',function(){
 		
 		if(po == null || po == ''){
 			alert('권한이 없습니다.');
 		}	
 	});	

	
/*
	$(".gnb_sidebar > li > ul > li > a").click(function(){
		
		alert("111");
		$(".gnb_sidebar > li > ul > li").removeClass();
		$(".gnb_sidebar > li > ul > li").slideUp();
		
		//$(this).parent().addClass("open");
		//if(!$(this).next().is(":visible")){
		//	$(this).next().slideDown();
		//}
	});
*/

});

$(document).ready(function(){
	$('.gnb_sidebar > li > a').each(function(){
		if($(this).parent().hasClass('open'))
			$(this).next().slideDown();
	})
	
	$('#goto_main').on('click',function(){
		location.href='/Main.do';
	});
	
 	
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/mice/include/zipcode.jsp" %>


<div id="wrap">
	<div id="container">
		<!-- 상단 Header(s) -->
		<header id="header">
		<sec:authentication var="user" property="principal" />
			<h1 id="goto_main">
				<img src="/images/mice/new/logo.png" alt="">
			</h1>


			<dl>
				<dt>사용자메뉴</dt>
				<dd class="desktop_show"><strong>${d:decrypt(loginVO.name)} 님</strong> 환영합니다.</dd> 
				<%-- <dd>
					<a href="<c:url value='/account/accountUpdateForm.do'/>">계정관리</a>
				</dd> --%>
				<dd class="desktop_show logout_btn">
					<a href="<c:url value='/j_spring_security_logout'/>"  role="button">로그아웃</a>
				</dd>
				
				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
				<dd class="tsearch_btn_area">
					<script>
						function chkSearchTop(){
							var frm = document.frm_search;
							if(frm.search_wrd.value == ""){
								alert("검색어를 입력하세요");
								frm.search_wrd.focus();
								return;
							}
							var wrd = frm.search_wrd.value;
							frm.searchUserName.value = wrd;
							frm.searchUserPosition.value = wrd;
							frm.searchUserAddr.value = wrd;
							frm.searchUserEtc.value = wrd;
							frm.searchSosoc.value = wrd;
							frm.searchSosoc_excel.value = wrd;
							frm.searchEmail.value = wrd;
							frm.searchEvtName.value = wrd;
							frm.searchArea.value = wrd;
							frm.searchRegName.value = wrd;
							frm.submit();
						}
						$(document).ready(function(){
							
							$("input[name=search_wrd]").keydown(function (key) {
								if(key.keyCode == 13){
									chkSearchTop();
								}
							});							
						});
					</script>
					<form name="frm_search" method="get" action = "/crm/search/list.do" onSubmit="return false;">
						<input type="hidden" name="flag" value="0" />
						<input type="hidden" name="searchUserName" value="" />
						<input type="hidden" name="searchUserPosition" value="" />
						<input type="hidden" name="searchUserAddr" value="" />
						<input type="hidden" name="searchUserEtc" value="" />
						<input type="hidden" name="searchSosoc" value="" />
						<input type="hidden" name="searchSosoc_excel" value="" />
						<input type="hidden" name="searchEmail" value="" />
						<input type="hidden" name="searchEvtName" value="" />
						<input type="hidden" name="searchArea" value="" />
						<input type="hidden" name="searchRegName" value="" />

						<input type="text" name="search_wrd" value="" />
						<a href="javascript:chkSearchTop();"  role="button"><i class="fa fa-search" aria-hidden="true"></i></a>
					</form>					
					
				</dd>
				</sec:authorize>

			</dl>


			<p class="logout_btn">

				<a href="<c:url value='/j_spring_security_logout'/>" class="logout" role="button"><img src="/images/mice/new/logout.png" alt=""></a>




			     <!-- 180119-->
				<!-- <a href="/crm/search/list.do?flag=0" class="logout" role="button"><img src="/images/mice/new/search.png" alt=""></a> -->
			     <!-- //180119-->
			</p>
		</header>
		
		<!--// 상단 Header(e) -->
		<!-- 메뉴 및 콘텐츠 영역(s) -->
		<div class="page-wrapper">
		<!-- 관리자페이지 사이드 메뉴(s) -->
			<nav id="leftGnb">
			<h3 class="nonetit">관리자페이지 메뉴</h3>
			<div class="side_area">

			<p class="total_menu3"><a href="javascript:;" ><img src="/images/mice/new/close.png" alt="전체메뉴보기"></a></p><!-- 171228 -->
			
			<div class="side_GNB">
				<div id="gnb">
					<ul class="gnb_sidebar">

                   <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
        			<li class="<c:if test='${fn:contains(sPath,"/crm/search/")}'>open</c:if>">
                    	<a href= "/crm/search/list.do?flag=1">
                        	 통합검색
                            <span class= "arrow"></span >
                      	</a>
        			</li>
        			</sec:authorize>


					
                    <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_COWORK, ROLE_MANAGER">
        			<li class="<c:if test='${!fn:contains(sPath, "/crm/kms") && fn:contains(sPath,"/mice/crm/") && !fn:contains(sPath,"/crm/active/") && !fn:contains(sPath,"/crm/organizer/") && !fn:contains(sPath,"/crm/customer/") && !fn:contains(sPath,"/crm/code/")  && !fn:contains(sPath,"/crm/event/calender")  && !fn:contains(sPath,"/crm/search") && !fn:contains(sPath,"/crm/invite") || fn:contains(sPath,"/crm/event/calender")  }'>open</c:if>">
                    	<a href= "javascript:void(0);">
                        	 대관관리
                            <span class= "arrow"></span >
                      	</a>
                      	<ul class= "sub-menu">
							<%--<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_COWORK, ROLE_MANAGER"> --%>
                            <%--<li <c:if test='${fn:contains(sPath,"/crm/stastics/")}'>class="active"</c:if>><a href ="<c:url value='/crm/stastics/info.do' />"> 통계</a ></li> --%>
							<%--</sec:authorize> --%>
                            
                            <li <c:if test='${fn:contains(sPath,"/crm/event/calendar")}'>class="active"</c:if>><a href ="<c:url value='/crm/event/calendar.do' />"> 월별현황 </a></li>                            
                            <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
                            <li <c:if test='${fn:contains(sPath,"/crm/event/") && fn:contains(sPath,"/crm/event/calendar") == false && fn:contains(sPath,"/crm/event/calender") == false}'>class="active"</c:if>><a href ="<c:url value='/crm/event/list.do' />"> 대관신청관리</a ></li>
                            <li <c:if test='${fn:contains(sPath,"/crm/promotion/")}'>class="active"</c:if>><a href ="<c:url value='/crm/promotion/list.do' />"> 대관/유치활동관리</a ></li>
                           </sec:authorize>
                            <li <c:if test='${fn:contains(sPath,"/crm/order/")}'>class="active"</c:if>><a href ="<c:url value='/crm/order/list.do' />"> 이벤트오더</a ></li>

                            <sec:authorize ifAnyGranted="ROLE_SUPERADMIN">
                            <li <c:if test='${fn:contains(sPath,"/crm/event/calender")}'>class="active"</c:if>><a href ="<c:url value='/sym/cal/EgovRestdeList.do' />"> 공휴일관리 </a></li>
                            <li <c:if test='${fn:contains(sPath,"/crm/fac/")}'>class="active"</c:if>><a href ="<c:url value='/crm/fac/listFacility.do' />"> 시설관리</a ></li>                           
                            </sec:authorize>
                      	</ul>
        			</li>
        			</sec:authorize>
        			
        			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_COWORK, ROLE_MANAGER">
        			<li class="<c:if test='${fn:contains(sPath, "/crm/kms/") && !fn:contains(sPath, "/crm/event/")}'>open</c:if>">
                    	
                    	<a href= "javascript:void(0);"  class="kms">
                        	 KMS
                            <span class= "arrow"></span >
                      	</a>
                      	<ul class= "sub-menu">
                      		
	                      		<li <c:if test='${fn:contains(sPath,"/crm/kms/list")}'>class="active"</c:if>><a href ="<c:url value='/crm/kms/list.do' />"> 파일 현황 </a></li>                            
	                            
	                            <li <c:if test='${fn:contains(sPath,"/crm/kms/folder")}'>class="active"</c:if>><a href ="<c:url value='/crm/kms/folder.do' />"> 폴더 설정</a ></li>
	                            <li <c:if test='${fn:contains(sPath,"/crm/kms/upload")}'>class="active"</c:if>><a href ="<c:url value='/crm/kms/upload.do' />"> 파일 업로드</a ></li>
	                            <c:if test = '${sessionScope.position == "235"}' >
	                            	<li <c:if test='${fn:contains(sPath,"/crm/kms/evaluate")}'>class="active"</c:if>><a href ="<c:url value='/crm/kms/evaluate.do' />">평가</a ></li>
	                      		</c:if>
                      		
                      	</ul>
        			</li>
        			</sec:authorize>

                   <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
        			<li class="<c:if test='!${ fn:contains(sPath,"/mice/crm/") && !fn:contains(sPath,"/crm/active/") && !fn:contains(sPath,"/crm/organizer/") && !fn:contains(sPath,"/crm/customer/") && !fn:contains(sPath,"/crm/code/")  && !fn:contains(sPath,"/crm/event/calender")  && !fn:contains(sPath,"/crm/search") && !fn:contains(sPath,"/crm/invite") || fn:contains(sPath,"/crm/event/calender") }'>open</c:if>">
                    	<a href= "javascript:void(0);">
                        	 고객DB관리
                            <span class= "arrow"></span >
                      	</a>
                      	<ul class= "sub-menu">
                            <sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
                            <li <c:if test='${fn:contains(sPath,"/crm/organizer/") && param.search_manager_event ne "M"}'>class="active"</c:if>><a href ="<c:url value='/crm/organizer/list.do' />"> 기관단체관리</a ></li>
                            <li <c:if test='${fn:contains(sPath,"/crm/customer/")}'>class="active"</c:if>><a href ="<c:url value='/crm/customer/list.do' />"> 고객명함관리</a ></li>
                            <li <c:if test='${fn:contains(sPath,"/crm/invite/")}'>class="active"</c:if>><a href ="<c:url value='/crm/invite/list.do' />"> 뷰로유치관리</a ></li>
                            <li <c:if test='${fn:contains(sPath,"/crm/organizer/") && param.search_manager_event eq "M"}'>class="active"</c:if>><a href ="<c:url value='/crm/organizer/list.do?search_manager_event=M' />"> 주관전시관리</a ></li>
							<!--li <c:if test='${fn:contains(sPath,"/crm/invite/")}'>class="active"</c:if>><a href ="<c:url value='/crm/invite/list.do' />"> 유치관리활동</a ></li!-->
                            </sec:authorize>
                      	</ul>
        			</li>
        			</sec:authorize>
					

					<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER">
					<li>
                    	<a href= "javascript:void(0);">
                            	설정
                            <span class= "arrow"></span >
                      	</a>
						<ul class= "sub-menu">
							<!-- //180108 -->
		        			<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN, ROLE_MANAGER, ROLE_STAFF"> 
								<sec:authorize ifAnyGranted="ROLE_SUPERADMIN">
									<li class="<c:if test='${fn:contains(sPath,"author") || fn:contains(sPath,"log") || fn:contains(sPath,"role")  || fn:contains(sPath,"/crm/code/")  }'>open</c:if>">
											<a href="javascript:void(0);">
												시스템관리
												<span class="arrow"></span>
											</a>
											<ul class="sub-menu">
												<li <c:if test='${fn:contains(sPath,"author")}'>class="active"</c:if>><a href="<c:url value='/sec/ram/EgovAuthorList.do'/>">권한메뉴얼</a></li>
												<li <c:if test='${fn:contains(sPath,"role")}'>class="active"</c:if>><a href="<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>">권한관리</a></li>
												<li <c:if test='${fn:contains(sPath,"log/log")}'>class="active"</c:if>><a href="<c:url value='/sym/log/lgm/SelectSysLogList.do'/>">로그관리</a></li>
												<li <c:if test='${fn:contains(sPath,"log/webLog")}'>class="active"</c:if>><a href="<c:url value='/log/info.do'/>">PV/UV정보</a></li>
				
												<li <c:if test='${fn:contains(sPath,"/crm/code/")}'>class="active"</c:if>><a href ="<c:url value='/crm/code/info.do' />">코드관리</a ></li>
											</ul>
									</li>
								</sec:authorize>
								<sec:authorize ifAnyGranted="ROLE_SUPERADMIN">
				 					<li class="<c:if test='${fn:contains(sPath,"/mice/member/")}'>open</c:if>">
				                    	<a href= "javascript:void(0);">
				                        	 계정관리
				                            <span class= "arrow"></span>
				                      	</a>
				                      	<ul class= "sub-menu">
				                        	<li <c:if test="${param.action eq 'adminRegist'}">class="active"</c:if>><a href ="<c:url value='/uss/umt/EgovUserManage.do?action=adminRegist' />"> 직원등록</a ></li>
				                            <li <c:if test="${param.action eq 'entRegist'}">class="active"</c:if>><a href ="<c:url value='/uss/umt/EgovEntrprsMberManage.do?action=entRegist' />"> 협력사등록</a ></li>
				                            <li <c:if test="${param.action eq 'nomalRegist'}">class="active"</c:if>><a href ="<c:url value='/uss/umt/EgovMberManage.do?action=nomalRegist' />"> 회원등록</a ></li>                                                                  
				                      	</ul>
				        			</li>
			        			</sec:authorize>
							</sec:authorize>
						
						</ul>
					</li>

					</sec:authorize>
					</ul>
				</div>

				<sec:authorize ifAnyGranted="ROLE_SYSTEM, ROLE_SUPERADMIN, ROLE_ADMIN">
				<a href="/images/mice/new/manual.pdf" target="_blank" class="btn_manual">CRM 가이드 보기</a>
				</sec:authorize>

			</div>
			</div>
			</nav>

			<p class="total_menu"><a href="javascript:;" ><img src="/images/mice/new/menu.png" alt="전체메뉴보기"></a></p>





		</div>
		<!--// 관리자페이지 사이드 메뉴(e) -->

		<div class="contentBG"></div>


<!--171228수정 -->

<script>
$(function(){
	$totlaMenu_bol = false;
	$(window).resize(function(){
		var stageW = $(this).width();
		var stageH = $(this).height();
		var maxW = 1200;
		var menuR = stageW > maxW ? (stageW-maxW)/2 : 0
		if($totlaMenu_bol){
			//$('.total_menu').animate({'left':'180px'});
		}else{
			//$('.total_menu').css({'left':menuR});
			$('.total_menu').css({'left':'20px'});
		}




	}).resize();
	$('.contentBG').css({'opacity':0.5});
	
	$('.total_menu').click(function(){	
		if($totlaMenu_bol){
			//$(this).find('img').attr('src','/images/mice/new/menu.png');
			$('.side_area').animate({'left':'-240px'});
			$('.contentBG').fadeOut();
			//$('.side_GNB #gnb > li').find('.sub_menu').slideUp();
			$('body').css({'overflow-y':'auto'});
			//$('.total_menu3').animate({'left':'0px'});
			//$('.total_menu3').css({'display':'none'});


			//$totlaMenu_bol = false;
		}else{			
			//$(this).find('img').attr('src','/images/mice/new/close.png');
			$('.side_area').animate({'left':'0'});
			$('.contentBG').fadeIn();
			//$('body').css({'overflow-y':'hidden'});180108
			//$('.total_menu3').animate({'left':'200px'});
			contentBG_resize();
			$//totlaMenu_bol = true;	

		}



		$(window).resize();
		return false;
	});


	$(document).ready(function(){
			//$('.total_menu').css({'left':'180px'});
	});



});


$(document).ready(function(){
    $(".total_menu3").click(function(){
		$('.side_area').animate({'left':'-240px'});
    });

});


function menuOpen(){
	
		if($totlaMenu_bol){
			$(this).find('img').attr('src','/images/mice/new/menu.png');
			$('.side_area').animate({'left':'-240px'});
			$('.contentBG').fadeOut();
			//$('.side_GNB #gnb > li').find('.sub_menu').slideUp();
			$('body').css({'overflow-y':'auto'});
			//$totlaMenu_bol = false;
		}else{			
			$(this).find('img').attr('src','/images/mice/new/close.png');
			$('.side_area').animate({'left':'0'});
			$('.contentBG').fadeIn();
			$('body').css({'overflow-y':'hidden'});
			contentBG_resize();
			//$totlaMenu_bol = true;					
		}

		$(window).resize();
		return false;
	
}


function contentBG_resize(){
	var cBG = $('#wrap').height();//171222
	if(cBG < $(window).height()){
		$('.contentBG').css({'height':$(window).height()});
	}else{
		$('.contentBG').css({'height':cBG});
	}
}

</script>