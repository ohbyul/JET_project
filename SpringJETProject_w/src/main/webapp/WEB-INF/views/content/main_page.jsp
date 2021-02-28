<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<%--카드 호버 --%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../commons/style/global_footer_style.jsp"/>
<jsp:include page="../content/style/main_page_style.jsp"/>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<style type="text/css">
	#section_1{
		background-color: #f2f2f2;
	}
	#colcolor_1{
		background-color: #ffffff;
		margin: 2%;
	}
	#section1-1{
		border: 1px;
		border-color: #f2f2f2;
	}
	#section_3{
		background-color: #262626;
		padding-bottom: 4rem;
		
	}
	
/*--------------------------------------------------*/
	.card {
		border-radius: 20px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		position: relative;
	}
	
	.card:hover{
		box-shadow: 0 0 5px 0 rgb(10, 10, 10);
	}

	.card-title{
		font-size: 20px;
		font-weight: bolder ;
	}
	#reg_count{
		float: right;
		background-color: #EF5A31 ;
	    color: #FFF ;
	    font-weight: bold ;
	    text-align: center ;
	    margin: 0 0 0 0;
	    padding: 5px 5px;
	    line-height: 20px;
	    font-size: 15px;
	    border-radius: 20%;
	}

	.card-footer {
	  	margin-top: 5px;
	    bottom: 0; 
	    font-size: 14px;
	    color: #9FA5A8;
	    background-color: #ffff;
	}
	
	.icon {
	    display: inline-block;
	    vertical-align: middle;
	    margin-right: 2px;
	}
	
	.checked {
	color: orange;
	}
	
	#icon_eye{
		width: 25px;
		height: 20px	
	}
	#icon_comment{
		width: 25px;
		height: 25px
		
	}
	.reg_date {
		float: right;
	}	
	#viewBtn{
		out-line:none;
		width:180px;
		border:1px solid #009300; 
		border-radius:15px;
		padding:5px;
		color:#009300;
		font-weight:bold;
	}
	
	#viewBtn:hover{
		color:#fff;
		background-color:#009300;
	}
</style>
</head>
<body style="overflow-x:hidden; overflow-y:auto;">
	<jsp:include page="../commons/global_nav.jsp"/>
	<jsp:include page="../commons/carousel_top.jsp"/>
	
	<section id="section_1" style="height:500px;"><!-- section 2 -->
		<div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-10">
					<div class="row" style="height:100px;"></div>
					<div class="row justify-content-center text-center">
						<div class="col"><h6 style="color:#009300; font-weight:bold;">여행을 공유하고 친구를 찾아보세요~!</h6></div>
					</div>
					<div class="row justify-content-center text-center">
						<div class="col" style="color:#009300;font-weight:600;font-size:60px">JET Brand Story</div>
					</div>
					<div class="row mt-4 justify-content-center text-center">
						<div class="col"><h4 style="color:#009300;font-weight:600;">- Since 2021 -</h4></div>
					</div>
					<div class="row mt-4 justify-content-center text-center">
						<div class="col"><h6>JET은 나만의 여행 계획을 만들어보고 나의 여행 계획을 다른 사람들에게 공유하거나 나의 여행 계획으로 새로운 사람들과 여행을 떠날 수 있는 여행계획 공유 플랫폼 입니다. 나의 여행계획을 작성하기 전에 많은 사람들이 공유한 다양한 팁과 노하우를 확인해보세요!</h6></div>
					</div>
					<div class="row justify-content-center text-center" style="margin-top:50px;">
						<a href="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do"><button id="viewBtn" style="" >View</button></a>
					</div>
					<div class="row" style="height:100px;"></div>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>
	<div class="row">
		<div class="col">
			<img style="width:100%;height:600px;" alt="asd" src="${pageContext.request.contextPath}/resources/image/myoung.png">
		</div>
	</div>
	<section id="section_2">
		<div class="container"><!-- section 2 -->
			<div class="row">
				<div class="col"></div>
				<div id="colcolor_2" class="col-10">
					<div class="row mt-5">
						<div class="col"><h3>여행 친구를 찾고 있어요!</h3></div>
						<div class="col-1">
							<a href="${pageContext.request.contextPath}/party_board/party_board_page.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plus_btn.PNG" style="height: 2rem"></a>
						</div>
					</div>
					<hr style="color: #ff751a; height: 0.25%">
					
					<div class="row mt-3"><!-- 여행 친구 찾기 게시판 사진들 1 -->
						
						
						<div class="card-group">
						  <c:forEach items="${resultListParty }" var="data">
							<c:forEach items="${newPartyBoard }" var="newPartyBoard">
								<c:choose>
									<c:when test="${data.partyBoardVo.jet_board_party_no ==newPartyBoard.jet_board_party_no }">
										<div class="col-4">
											<div class="card mx-2 my-2">
											
												<div class="card-head-img">
													<a href="${pageContext.request.contextPath }/party_board/read_party_board_page.do?jet_board_party_no=${data.partyBoardVo.jet_board_party_no}">
														<c:choose>
															<c:when test="${!empty data.thumbnail }">
																<div style="text-align:center;"><img style="height: 250px;overflow: hidden;border-top-left-radius: 20px;border-top-right-radius: 20px;" class="card-img-top" src="${data.thumbnail[0].jet_board_party_image_link }" alt="image"></div>
															</c:when>
															<c:otherwise>
																<div><img style="overflow: hidden;height: 250px;border-top-left-radius: 20px;border-top-right-radius: 20px;" src="${pageContext.request.contextPath }/resources/image/rock.jpg" class="card-img-top"></div>
															</c:otherwise>
														</c:choose>
													</a>	
												</div>
												
												<div class="card-body">
													<div class="card-title">
														
														<div class="row">
															<div class="col-10 card-title text-truncate">	
																<span class="badge rounded-pill bg-danger" style="font-size: 11px;">new</span> ${data.partyBoardVo.jet_board_party_title } 
															</div>
															<div class="col-2">	<%--노 마감 --%>
																<p id="reg_count" class="font-monospace"> [${data.partyBoardVo.jet_board_party_fixcount }/${data.partyBoardVo.jet_board_party_headcount }]</p>	
															</div>
														</div>
													
													</div>
													 
													<div class="row">
														<div class="col-4"><p class="card-text">[모집]</p></div>
														<div class="col font-monospace">
															<i class="far fa-calendar-alt"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_startgather }"/> ~ <br><fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_endgather }"/>
														</div>
													</div>
													<div class="row">
														<div class="col-4"><p class="card-text">[여행 출발]</p></div>
														<div class="col font-monospace">
															<i class="fas fa-plane-departure"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_tsday }"/>
														</div>
													</div>
													<div class="row">
														<div class="col-4"><p class="card-text">[작성자]</p></div>
														<div class="col"><i class="fas fa-user-edit"></i> ${data.memberVo.jet_member_nick }</div>
													</div>
												</div>
												
												<div class="card-footer font-monospace" style="border-bottom-left-radius: 20px;border-bottom-right-radius: 20px;"> <!--  카드 바디 푸터 -->
													<i class="far fa-grin-alt"></i>조회 ${data.partyBoardVo.jet_board_party_readcount }회
													<i class="far fa-hand-paper"></i>참여신청 ${data.attendCount }개
													<i class="reg_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_writedate }"/></i>
												</div>
											</div>
											</div>
									</c:when>
								</c:choose>
							</c:forEach>
							</c:forEach>
						</div>
				        <%--카드 끝 --%>
						
						
					</div>

				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>
	
		<section id="section_2_2">
		<div class="container"><!-- section 2_2-->
			<div class="row">
				<div class="col"></div>
				<div id="colcolor_2_2" class="col-10">
					<div class="row mt-5">
						<div class="col"><h3>추천 원데이 클래스</h3></div>
						<div class="col-1">
							<a href="${pageContext.request.contextPath}/classboard/main_classboard_page.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plus_btn.PNG" style="height: 2rem"></a>
						</div>
					</div>
					<hr style="color: #ff751a; height: 0.25%">
					<div class="row mt-3"><!-- 원데이클래스 게시판 사진들 1 -->
						<c:forEach items="${ClassList }" var="data">
		                <c:forEach items="${threeClasses }" var="threeClasses">
		                	<c:choose>
								<c:when test="${data.classDetailVo.jet_class_detail_no == threeClasses.jet_class_detail_no }">
									<div class="col-4">
										<div class="card mx-2 my-2">
										
											<div class="card-head-img">
												<c:choose>
													<c:when test="${!empty data.imageVoList }">
														<div><a href="${pageContext.request.contextPath }/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}"><img class="img-fluid" style=" width:325px; height:250px;text-align:center;" src="${data.imageVoList[0].jet_class_image_link }" alt="image"></a></div>
													</c:when>
													<c:otherwise>
														<div class="text-center" ><a href="${pageContext.request.contextPath }/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}"><img class="img-fluid text-center" style=" width:250px; height:250px;text-align:center;" src="${pageContext.request.contextPath }/resources/image/logo.png" alt="image"></a></div>
													</c:otherwise>
												</c:choose>			
											</div>
											
											<div class="card-body">
												<div class="row">
													<div class="col-9 card-title text-truncate">	
														${data.classboardVo.jet_class_name }
													</div>
													<div class="col-3">	
														<p id="reg_count" class="font-monospace"> ${data.countReserve} / ${data.classboardVo.jet_class_max_headcount}</p>	
													</div>
												</div>
											
												<div class="row">
													<div class="col-4"><p class="card-text">[수강일]</p></div>
													<div class="col font-monospace">
														<i class="far fa-calendar-alt"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${data.classDetailVo.jet_class_detail_date }"/>
													</div>
												</div>
												<div class="row">
													<div class="col-4"><p class="card-text">[작성자]</p></div>
													<div class="col"><i class="fas fa-user-edit"></i> ${data.memberVo.jet_member_nick }</div>
												</div>
												<div class="row">
													<div class="col-4"><p class="card-text">[평점]</p></div>
													<div class="col font-monospace">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
														  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
														</svg>		
														${data.starRating }
													</div>
												</div>
											</div>
											
											<div class="card-footer font-monospace"> <!--  카드 바디 푸터 -->
												<i class="reg_date">개설일<fmt:formatDate pattern="yyyy-MM-dd" value="${data.classboardVo.jet_class_writedate }"/></i>
											</div>
										</div>
									</div>
							
								</c:when>
							</c:choose>
						</c:forEach>						
				    </c:forEach>    
				        
					</div>

				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>
	
	<section id="section_3">
			<div class="row mt-5">
				<div class="col"></div>
				<div class="col-8">
					<div class="row mt-4">
						<div class="col text-center">
							<h2 style="font-family:'NotoSansKR';font-weight:500; color: #ffffff;">제주도를 여행한 사람들이 공유한 다양한 사진들이 있습니다!</h2>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col text-center">
							<h5 style="font-family:'NotoSansKR';font-weight:400;color: #bfbfbf;">여행 공유 게시판은 여러분들과 함께 만들어가는 제주 여행 공유 플랫폼입니다.</h5>
						</div>
					</div>
					<div class="row mt-1">
						<div class="col p-0">
							<div class="row">
								<div class="col pe-0">
									<a href="${pageContext.request.contextPath}/board_Review/board_Review.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-road_1.jpg">
									</a>
								</div>
								<div class="col ps-0">
									<a href="${pageContext.request.contextPath}/board_Review/board_Review.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-noodie_1.jpg">
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col pe-0">
									<a href="${pageContext.request.contextPath}/board_Review/board_Review.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-pic_1.jpg">
									</a>
								</div>
								<div class="col ps-0">
									<a href="${pageContext.request.contextPath}/board_Review/board_Review.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-bomnal_1.jpg">
									</a>
								</div>
							</div>
						</div>
						<div class="col-6 p-0">
							<div class="row">
								<div class="col pe-0">
									<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/shared_pic2..gif">
									</a>
								</div>
								<div class="col ps-0">
									<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-pic_2.png"">
									</a>
								</div>
							</div>
						</div>
						<div class="col p-0">
							<div class="row">
								<div class="col pe-0">
									<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-bread_1.jfif">
									</a>
								</div>
								<div class="col ps-0">
									<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-people_1.jpg">
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col pe-0">
									<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-sea_1.jpg">
									</a>
								</div>
								<div class="col ps-0">
									<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/jeju-seafood_1.jpg">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
	</section>
	<section id="section_4">
		<div class="container">
			<div class="row mt-3">
				<div class="col"></div>
				<div class="col-10">
					<hr style="color: #ff751a; height: 0.25%">
					<div class="row mt-3">
						<div class="col"><h5 style="font-weight: 400;font-family: 'NotoSansKR';font-size: 1.5rem;">공유된 계획들</h5></div>
						<div class="col-1 text-center">
							<a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plus_btn.PNG" style="height: 1.5rem"></a>
						</div>
						<div class="col-2"><h5 style="font-weight: 400;font-family: 'NotoSansKR';font-size: 1.5rem;">공지사항</h5></div>
						<div class="col-1 text-center">
							<a href="${pageContext.request.contextPath}/notice_board/notice_board_page.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plus_btn.PNG" style="height: 1.5rem"></a>
						</div>
					</div>
					
					<div class="row mt-3"><!-- 공유된 게시판 부분 -->
						<div class="col-9">
						<div class="row">
							<c:forEach items="${resultList }" var="data">
								<c:forEach items="${newSharePlan }" var="newSharePlan">
								<c:choose>
									<c:when test="${data.sharePlanBoardVo.jet_board_shareplan_no == newSharePlan.jet_board_shareplan_no }">
								<%--이게 한개임--%>
								<div class="col-4 mt-2">
									<div class="sa sa-up"style="text-align: center; box-shadow: 2px 2px 5px 0px #BDBDBD; width: 230px;border-radius:5px">
										<div class="row">
											<div class="col">
												
												<div style="float:right; margin:5px;">
													<h4><span class="badge rounded-pill bg-danger">NEW</span></h4>
												</div>
											</div>
										</div>
										<c:choose>
											<c:when test="${!empty data.thumbnail }">
												<div><a href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none; color:#000;"><img class="img-fluid" style="width:130; height:150px;text-align:center;" src="${data.thumbnail[0].jet_board_shareplan_image_link }" alt="image"></a></div>
											</c:when>
											<c:otherwise>
												<div ><a href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none; color:#000;"><img class="iomg-fluid" style="width:130; height:150px;text-align:center;" src="${pageContext.request.contextPath }/resources/image/logo.png" alt="image"></a></div>
											</c:otherwise>
										</c:choose>
										
										<ul style="margin-left: -30px;">
											<li class="text-truncate" style="list-style-type: none;max-width: 210px;">${data.sharePlanBoardVo.jet_board_shareplan_title }</li>
											
											<li style="list-style-type: none; margin-top: 10px;">작성자 : ${data.memberVo.jet_member_nick }</li>
										</ul>
										<div class="row" style="background-color:#FFFBEE; width:100%; margin-left:0px;border-top:1px solid #FFE08C">
											<div class="col"><img src="${pageContext.request.contextPath }/resources/image/readCt.PNG" alt="read"></div>
											<div class="col"><img src="${pageContext.request.contextPath }/resources/image/likeImg.PNG" alt="like"></div>
											<div class="col"><img src="${pageContext.request.contextPath }/resources/image/repleCt.PNG" alt="reple"></div>
										</div>
										<div class="row" style="background-color:#FFFBEE; width:100%; margin-left:0px">
											<div class="col" style="font-size:12px">조회수</div>
											<div class="col" style="font-size:12px">좋아요</div>
											<div class="col" style="font-size:12px">리뷰</div>
										</div>
										<div class="row" style="background-color:#FFFBEE; width:100%; margin-left:0px">
											<div class="col" style="font-size:12px">${data.sharePlanBoardVo.jet_board_shareplan_readcount }</div>
											<div class="col" style="font-size:12px">${data.likeCount }</div>
											<div class="col" style="font-size:12px">${data.repleCount }</div>
										</div>
									</div>
								</div>
	
								</c:when>
	
								</c:choose>
								</c:forEach>
								</c:forEach>
								</div>
						</div>
								
				        <div class="col-3"style="box-shadow: 2px 2px 5px 0px #BDBDBD; width: 230px;border-radius:5px;background-color: #ff9933; margin-left: 1rem;">
					          <div class="row">
					          	<%--<div style="width: 230px;height: 1.5rem; ;border-radius:5px; margin-left: 0.7rem;"></div> --%>
					            <div class="col" style="height:21.8em;">
					            	<div class="row" style="margin-top: 1rem;">
					            		<div class="col"">
					            			<div class="row">
					            				<div class="col" style="background-color: #ffffff;border-radius:5px; padding-bottom: 0.75rem;padding-top: 1.75rem;">
									            	<c:forEach items="${noticeList }" var="data">
									            		<c:forEach items="${newNotice }" var="newNotice">
									            			<c:if test="${data.noticeBoardVo.jet_board_notice_no == newNotice.jet_board_notice_no }">
									            				
											              		<div>
												              		<a style="font-weight: 500;font-family: 'NotoSansKR';font-size: 0.9rem;text-decoration: none; color: #333333;" href="${pageContext.request.contextPath }/notice_board/read_notice_board_page.do?jet_board_notice_no=${data.noticeBoardVo.jet_board_notice_no}">${data.noticeBoardVo.jet_board_notice_title}</a><br>
												              		<p style="font-weight: 400;font-family: 'NotoSansKR';font-size: 0.9rem;text-decoration: none; color: #666666; text-align: right; margin-top: 0.5rem;">${data.memberVo.jet_member_nick} | <fmt:formatDate pattern="yyyy-MM-dd" value="${data.noticeBoardVo.jet_board_notice_writedate}"/></p>
										              			</div>
										              			<hr style="margin-top: 0.25rem; margin-bottom: 0.25rem;">
									              			</c:if>
									              		</c:forEach>
									              	</c:forEach>
							              		</div>
							              	</div>
					              		</div>
					              	</div>
					            </div>
					          </div>
				        </div>
					</div>
				</div>
				<div class="col"></div>
			</div>
		</div>	
	</section>
	
	<jsp:include page="../content/ad_main_page.jsp"/>
	<jsp:include page="../party_board/popup_chat.jsp"/>
	<%-- <jsp:include page="../commons/global_nav.jsp"/>--%>
	<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>