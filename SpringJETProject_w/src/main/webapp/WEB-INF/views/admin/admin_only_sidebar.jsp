<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<style>
	
	#admin_sidebar{
		background-color : #ffff;
		height: 909px;

	}
	
/*	
	#profile_image{
		width : 55px;
		height : 55px;
	}	
	.menu_icon{
		width : 40px;
		height : 30px;
		padding-right: 10px
	}
*/
	.list-group a{
		font-size: 18px;
		color: black;
	}
</style>


<div id="admin_sidebar" class="col-2"> <%--관리자 사이드바 메뉴 --%>
			
	<div class="row mx-2 mt-5">
		<div class="col-2 ms-3">
<%-- 			<img id="profile_image" src="${pageContext.request.contextPath }/resources/image/admin1.png"> --%>
		</div>
		<div class="col mx-3 text-center">
			<c:choose>
				<c:when test="${!empty sessionUser }">
						<div class="row pt-2 text-center" id="admin_profile">
							<h3 class="fw-bold"><i class="fas fa-user-tie"></i>${sessionUser.jet_member_nick }</h3>
						</div>
						<div class="row mt-4 text-center">
							<a href="${pageContext.request.contextPath }/member/logout_process.do" style="text-decoration:none;font-weight: bold;">LOGOUT</a>
						</div>						
				</c:when>
				<c:otherwise>
						<a href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<hr>
		</div>
	</div>
	
	<div class="list-group"> <%--버튼 활성화시  active --%>
	  
	  <a href="${pageContext.request.contextPath }/admin/admin_notice_board_page.do" class="list-group-item list-group-item-action">
<%-- 	  	<img class="menu_icon" src="${pageContext.request.contextPath }/resources/image/notice2.png"> --%>
	  	<i class="fas fa-bullhorn"></i>
	  	공지사항
	  </a>
	  <a href="${pageContext.request.contextPath }/admin/admin_csboard_page.do" class="list-group-item list-group-item-action">
<%-- 	  	<img class="menu_icon" src="${pageContext.request.contextPath }/resources/image/cs3.jpg"> --%>
	  	<i class="far fa-question-circle"></i>
	  	문의게시판
	  </a>
	  <a href="${pageContext.request.contextPath }/admin/admin_declaration_notice_list_page.do" class="list-group-item list-group-item-action">
<%-- 	 	<img class="menu_icon" src="${pageContext.request.contextPath }/resources/image/singo8093.png"> --%>
	 	 <i class="fas fa-exclamation-triangle"></i>
	 	 신고리스트
	  </a>
	  <a href="${pageContext.request.contextPath }/admin/admin_message_page.do" class="list-group-item list-group-item-action">
<%--   	  	<img class="menu_icon" src="${pageContext.request.contextPath }/resources/image/message_admin.png"style="height: 1.7rem;"> --%>
		<i class="fas fa-envelope"></i>
		관리자 쪽지함	
  	  </a>
  	  <a href="${pageContext.request.contextPath }/admin/admin_member_management_page.do" class="list-group-item list-group-item-action">
<%--   	  	<img class="menu_icon" src="${pageContext.request.contextPath }/resources/image/member0000.png"> --%>
  	  	<i class="fas fa-user-cog"></i>
  	  	회원관리
  	  	</a>
  	  <a href="${pageContext.request.contextPath }/admin/admin_dashboard_page.do" class="list-group-item list-group-item-action">
<%--   		 <img class="menu_icon" src="${pageContext.request.contextPath }/resources/image/dash.jpg">  --%>
  		 <i class="fas fa-chart-pie"></i> 
  		  대시보드(통계)
  	  </a>	
  	 	<hr>
<%--   	  <a href="${pageContext.request.contextPath }/admin/test_tap.do" class="list-group-item list-group-item-action">TEST TAP</a> --%>
<%-- 	  <a href="${pageContext.request.contextPath }/admin/test_read.do" class="list-group-item list-group-item-action">TEST 탭버튼</a> --%>
	  
<%-- 	  <a href="${pageContext.request.contextPath }/admin/test_accodian.do" class="list-group-item list-group-item-action">TEST 아코디언</a>	 --%>
	
	</div>		
	
</div> <%--관리자  사이드 바 메뉴 --%> 