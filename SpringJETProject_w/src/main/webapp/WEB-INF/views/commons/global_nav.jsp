<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
   
   <%--아이콘 --%>
	<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
	<header id="section_nav" class="fixed-top">
	<div class="row"style="height:6rem;background: #ffffff;">
		<div class="col text-center">
			<a href="${pageContext.request.contextPath }/content/main_page.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/nav_logo.png" style="height: 6.5rem;"></a>
		</div>
		<div class="col-5"></div>
		<div class="col-2 text-end p-0">
			<div class="row mt-2"></div>
			<div class="row">
				<div class="col text-end pt-4">
					<div class="weather">
						<div class="CurrIcon"></div>
						<div class="CurrTemp"></div>
						<div class="City"></div>
					</div>
					<script type="text/javascript">
					/*-----------------------------------날씨--------------------------------------------*/
									
					$(document).ready(function() {
						let weatherIcon = {
							'01' : 'fas fa-sun',
							'02' : 'fas fa-cloud-sun',
							'03' : 'fas fa-cloud',
							'04' : 'fas fa-cloud-meatball',
							'09' : 'fas fa-cloud-sun-rain',
							'10' : 'fas fa-cloud-showers-heavy',
							'11' : 'fas fa-poo-storm',
							'13' : 'far fa-snowflake',
							'50' : 'fas fa-smog'
						};
						
						$.ajax({
						url:'http://api.openweathermap.org/data/2.5/weather?q=jeju&APPID=880bae4c8998021e65ec8f985ffe76f6&units=metric',
						
						dataType:'json',
						type:'GET',
						success:function(data){
							var $Icon = (data.weather[0].icon).substr(0,2);
							var $Temp = Math.floor(data.main.temp) + 'º';
							var $city = data.name;
							
							$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
							$('.CurrTemp').prepend($Temp);
							$('.City').append($city);
						}
					})
					});
			</script>
				</div>
			</div>
		</div>
		<div class="col-2 text-end ps-0"style="padding-right: 2rem;margin-right: 3rem;">
			<div class="row mt-5"></div>
			<div class="row text-end">
				<div id="nav_nav" class="col">
					<ul id="global_nav_ul" class="m-0">
						<c:choose>
							<c:when test="${!empty sessionUser }">
								<li><a href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a></li>
								<li><a href="#">${sessionUser.jet_member_nick }</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/mypage.do">마이페이지</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/member/join_member_page.do">회원가입</a></li>
								<li><a href="${pageContext.request.contextPath }/member/login_page.do">로그인</a></li>
								<li><a href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">공지사항</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				
			</div>
		</div>
		<%--------------------------------------------- 햄버거 및 사이드바 ----------------------------------------------%>
		<div class="overlay"></div>
		<input type = "checkbox" id = "menuicon">
	      <label for="menuicon" style="margin-right: 1rem;margin-top: 2rem;">
	          <span></span>
	          <span></span>
	          <span></span>
	      </label>
	      <div class = "sidebar">
		       <div id="sidebar_Top">    
	                <c:choose>
	                	<c:when test="${!empty sessionUser }">
	                		<div style="margin-top: 30px; height: 80px; color: #000; letter-spacing: 5px; font-weight: bold">
			                    <h4>JET</h4>
			                </div>
			                <div style="height: 110px;" id="profileBox">
			                </div>
	                	</c:when>
	                	<c:otherwise>
		                	<div style="margin-top: 30px; height: 80%; color: #000; letter-spacing: 5px; font-weight: bold">
			                    <h4>JET</h4>
			                </div>
	                	</c:otherwise>
	                </c:choose>
	
	              
	                <div>
	                	<c:choose>
	                		<c:when test="${!empty sessionUser }">
			                    <ul class="side_login" style="margin:left:50px">
			                        <li>
			                            <a style="padding-left: 0;" href="${pageContext.request.contextPath }/mypage/mypage.do">${sessionUser.jet_member_nick }</a>
			                            <a href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>
			                        </li>
			                    </ul>
			                </c:when>
			                <c:otherwise>
			                  	<ul class="side_login">
			                        <li>
			                            <a href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
			                        </li>
			                        <li>
			                            <a href="${pageContext.request.contextPath }/member/join_member_page.do">회원가입</a>
			                        </li>
			                   	</ul>
			                </c:otherwise>    
	                    </c:choose>
	                </div>
	            </div>
	         	<div id="sidebar_Mid">
	             <ul class="sidebar_Mid_Menu">
					
					<c:choose>
				
						<c:when test="${sessionUser.jet_member_grade == 9 }">
							<li style="padding-left: 0.8rem;">
							 <i class="fas fa-user-tie"></i><a style="padding-left: 1.9rem;" href="${pageContext.request.contextPath }/admin/admin_main_page.do">관리자 페이지</a> 
							</li>
						</c:when>
						
						<c:when test="${empty sessionUser }">
							<li>
							 
							</li>
						</c:when>
						
						<c:otherwise>
			                 <li>
			                     <img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/myrevise.PNG">
			                     <a href="${pageContext.request.contextPath }/member/update_member_info_page.do">정보 수정</a>
			                 </li>
			                 <li>
			                 	<img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/plan.PNG">
			                     <a href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">나의 여행 계획</a>
			                 </li>
			                 <li>
			                 	<img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/like.png">
			                     <a href="${pageContext.request.contextPath }/mypage/pick_mypage.do">즐겨찾기 목록</a>
			                 </li>
			                 <li>
			                 	<img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/mywrite.PNG">
			                     <a href="${pageContext.request.contextPath}/mypage/write_mypage.do">내가 쓴 글</a>
			                 </li>
			                 <li>
			                 	<img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/mywrite.PNG">
			                     <a href="${pageContext.request.contextPath}/mypage/wrote_reple_mypage.do">내가 쓴 댓글</a>
			                 </li>
			                 <li>
			                 	<img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/message.PNG">
			                     <a href="${pageContext.request.contextPath }/message/message_page.do">쪽지함</a>
			                 </li>
			                 <li>
			                 	<img alt="myrevise" src="${pageContext.request.contextPath }/resources/image/friend.PNG">
			                     <a href="${pageContext.request.contextPath }/member/my_friendList_page.do">나의 친구</a>
			                 </li>
			                 
			                 
			                 </c:otherwise>
					</c:choose>
	             </ul>
	         </div>
	      </div>
	</div>
	<%----------------------------------------------------------네비바 ---------------------------------------------------------%>
	<div class="row">
		<nav class="navbar navbar-light" style="background-color: #ff9436;height: 4rem;">
		  
		  <div id="nav_main" class="container-fluid text-center">
		  	<div class="col-3"></div>
		  	<div class="col">
		  		<ul>
		  			<li id="nav_main_li">
		  				<a class="navbar-top" href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">나의 여행 계획</a>
		  			</li>
		  		</ul>
		  	</div>
		  	<div class="col">
		  		<ul>
		  			<li id="nav_main_li">
		  				<a class="navbar-top" href="${pageContext.request.contextPath }/party_board/party_board_page.do">여행 친구 찾기</a>
		  			</li>
		  		</ul>
		  	</div>
		  	<div class="col">
		  		<ul>
		  			<li id="nav_main_li">
		  				<a class="navbar-top" href="${pageContext.request.contextPath }/shareplan_board/shareplan_board_page.do">추천 루트</a>
		  				
		  			</li>
		  		</ul>
		  	</div>
		  	<div class="col">
		  		<ul>
		  			<li id="nav_main_li">
		  				<a class="navbar-top" href="${pageContext.request.contextPath }/classboard/main_classboard_page.do">원데이 클래스</a>
		  			<li>
		  		</ul>
		  	</div>
		  	<div class="col">
		  		<ul>
		  			<li id="nav_main_li">
		  				<a class="navbar-top" href="${pageContext.request.contextPath }/board_Review/board_Review.do">게시판</a>
		  			</li>
		  		</ul>
		  	</div>
		  	<div class="col">
		  		<ul>
		  			<li id="nav_main_li">
		  				<a class="navbar-top" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">고객센터</a>
		  			</li>
		  		</ul>
		  	</div>
		  	<div class="col-3"></div>
		  </div>
		</nav>
	</div>
	<nav>
	<div id="detail_menu" class="row" style="height: 10rem;background-color: #ff9436;">
		
		<div class="row m-0 p-0">
			<div class="col-3"></div>
			<div class="col"></div>
			<div class="col ps-1">
				<ul>
					<li><a href="${pageContext.request.contextPath }/party_board/party_board_page.do">파티 찾기</a></li>
				</ul>
			</div>
			<div class="col ps-1">
				<ul>
					<li><a href="${pageContext.request.contextPath }/shareplan_board/shareplan_board_page.do">공유 게시판</a></li>
					<li><a href="${pageContext.request.contextPath }/popular_board/popular_board_page.do">인기 여행지</a></li>
				</ul>
			</div>
			<div class="col ps-2 pe-0">
				<ul style="padding-left: 1rem; margin-left: 0.725rem; padding-right: 0;">
					<li><a href="${pageContext.request.contextPath }/classboard/main_classboard_page.do">클래스 게시판</a></li>
				</ul>
			</div>
			<div class="col ps-1 pe-1" style="margin-left: 1.5rem;padding-left: 1rem;">
				<ul>
					<li><a href="${pageContext.request.contextPath }/freeboard/main_free_board.do">자유게시판</a></li>
					<li><a href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do">팁과 노하우</a></li>
					<li><a href="${pageContext.request.contextPath }/board_Review/board_Review.do">리뷰 게시판</a></li>
				</ul>
			</div>
			<div class="col"style="margin-right: 1.5rem;">
				<ul>
					<li><a href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath }/faboard/faboard_page.do">FAQ</a></li>
					<li><a href="${pageContext.request.contextPath }/csboard/csboard_page.do">Q&A</a></li>
				</ul>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
	</nav>
</header>