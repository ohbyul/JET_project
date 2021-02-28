<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<style>


	.icon_fa{
		width: 35px;
		height: 35px;
		
	}
	.heading{
		height:65px;
		border-style: dashed;
		border-color: black;
		border-radius: 20px;
		border-width: 1px; 
		border-color: #A4A4A4; 
	}
	.content_body{
		background-color:#F2F2F2; 
		padding: 20px;
		border-radius: 30px;
	}
	#sidebar{
		border-right: 1px solid rgba(0,0,0,.125);
	}
	#title{
		border-left: 1px solid rgba(0,0,0,.125);
		border-right: 1px solid rgba(0,0,0,.125);
	}


</style>
<script>
	
$(document).ready(function() {
	jQuery(".content").hide();
	//content 클래스를 가진 div를 표시/숨김(토글)
	$(".heading").click(function()
	{
	$(".content").not($(this).next(".content").slideToggle(500)).slideUp();
	});
	});

</script>
</head>
<body>

<jsp:include page="../commons/top_image.jsp"/>
<jsp:include page="../commons/orange_btn.jsp"/>

	<div class="container-fluid">
	    <div class="row">
	    	<div class="col" style="background-color:#f6f6f6";></div>

	    	<div class="col-9">
	    	
	    	<div class="row" id="title">
		    	<div class="col">	
			        <div class="row mt-4">
			            <div class="col text-center display-5 font-monospace">F A Q</div>
			
			        </div>
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > F&A</div>
			        </div>
				</div>
			</div>
			
			<div class="row"  style="border: 1px solid rgba(0,0,0,.125);">
				<div class="col-2" id="sidebar">
					<div class="row" style="margin-top: 10px;">
						<h2><i class="fas fa-info-circle" style="color: orange;"></i> 고객센터</h2>
					</div>
					<div class="row" style="margin-top: 60px;margin-left: 5px;margin-right: 5px;">
						<div class="col" style="border: 1px solid rgba(0,0,0,.125);border-radius: 10px;">
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">NOTICE</a>
								</div>
							</div>
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;background-color: orange;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/faboard/faboard_page.do">F A Q</a>
								</div>
							</div>
							<div class="row" style="height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/csboard/csboard_page.do">Q & A</a>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 사이드 -->
				
				<div class="col">	<!-- 메인 -->
					
					<div class="row mt-2">	<%--아코디언 박스 --%>
						
					<div class="col py-5">
						
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>회원승급을 올리고싶어요</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										회원 가입시 자동 grade 1입니다.<br>
										게시글 작성 3개 + 댓글 작성 5개 이상시 grade2로 승급되며,<br>
										게시글과 댓글 의 갯수로 자동 승급됩니다.<br>
										높은 grade를 갖게되면 여행친구찾기나 원데이클래스를 열수 있습니다<br>
										사이트의 활발한 활동으로 승급 가능하십니다.
										
									</div>
								</div>
							</div>
						</div>		<%--한줄의 아코디안 끝 --%>
	
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>아이디 변경은 어떻게 하나요?</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										아이디를 변경 은 불가합니다
										아이디 변경을 원하시면 탈퇴후
										새로운 아이디로 가입 가능 하십니다.
									</div>
								</div>
							</div>
						</div>		<%--한줄의 아코디안 끝 --%>
						
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>친구 추가를 하고싶어요</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										마이페이지 -> 나의 친구 페이지에 들어가면 친구 추가 가능합니다.
									</div>
								</div>
							</div>
						</div>		<%--한줄의 아코디안 끝 --%>
						
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>원데이 클래스 환불 가능한가요?</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										5일전 취소시, 100% <br>
										3일전 취소시, 70% <br>
										1일전 취소시, 50% <br>
										당일 취소는 불가입니다.
										 카드의 경우 보통, 카드사마다 환급기간은 약간의 차이가 있으며  카드취소가 된 날로부터 영업일 기준 3-5일정도 뒤 카드사에 문의하시면 확인이 가능합니다. 
									</div>
								</div>
							</div>
						</div>		<%--한줄의 아코디안 끝 --%>
						
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>회원탈퇴후 재가입 가능한가요?</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										탈퇴후 같은 아이디로 재가입 불가합니다.<br>
										다른 아이디 사용시 가능합니다.
									</div>
								</div>
							</div>
						</div>		<%--한줄의 아코디안 끝 --%>
						
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>게시판 글쓰기가 안되요</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										자유게시판 글쓰기는 가입->로그인 후 모두가 사용 가능합니다.
										노하우 게시판 /원데이클래스 /공유게시판 /여행친구찾기 게시판은 <br>
										승급이 올라가면 글쓰기가 사용 가능합니다.<br>
										
									</div>
								</div>
							</div>
						</div>		<%--한줄의 아코디안 끝 --%>
						
						<div class="heading mt-1">		    <!-- 제목으로 보일부분 -->
							<div class="row mt-3">
								<div class="col-2"style="padding-left: 50px;">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA1.jpg">
								</div>
								<div class="col">
									<h4>제가 즐겨 찾기한 목록은 어딧나요?</h4>
								</div>
							</div>
						</div>
						<div class="content pt-2">    <!-- 클릭시 보여질 부분 -->
							<div class="row">
								<div class="col-1"></div>
								<div class="col-1">
									<img class="icon_fa" src="${pageContext.request.contextPath }/resources/image/FandA2.jpg">
								</div>
								<div class="col">
									<div class="content_body">
										오른쪽 상단 버튼 클릭시, 즐겨찾기한 목록 페이지가 나옵니다.
										
									</div>
								</div>
							</div>
						</div><%--한줄의 아코디안 끝 --%>
					</div><%--아코디언 박스 col --%>
					</div>
				</div>	<%--메인 col --%>
			</div>
			
		</div>
		<div class="col"  style="background-color:#f6f6f6";></div>
</div>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>