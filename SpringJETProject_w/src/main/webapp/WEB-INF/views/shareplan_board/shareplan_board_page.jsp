<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<title>공유 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../shareplan_board/style/shareplan_board_page_style.jsp"/>
<jsp:include page="../shareplan_board/script/shareplan_board_page_script.jsp"/>
</head>


<body >
<jsp:include page="../commons/top_image.jsp"/>
	<main>
		<div class="container">
			<div class="row mt-2">
				<div class="col-5"></div>
				<div class="col-5"></div>
				<div class="col-2 text-muted" style="text-align: right;">board
					> JET</div>
			</div>

			<div class="row mt-2">
				<div class="col-4">
					<!-- 검색... -->
					<form action="${pageContext.request.contextPath }/shareplan_board/shareplan_board_page.do" method="get">
						<div class="row">
							<div class="col-3">
								<select name="search_type" class="form-select">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select>
							</div>
							<div class="col-7" style="margin-left: -15px;">
								<input name="search_word" type="text" class="form-control"
									placeholder="검색어를 입력해주세요">
							</div>
							<div class="col-1" style="margin-left: -15px;">
								<input type="image" src="${pageContext.request.contextPath }/resources/image/search.PNG" alt="search" style="border: 1px solid #D5d5d5; border-radius: 5px;">
							</div>
						</div>
					</form>
				</div>
				<div class="col">
					<c:choose>
						<c:when test="${!empty sessionUser }">
							<div class="row">
								<div class="col-10"></div>
								<div class="col-1" style="margin-left: 25px;">
									<button type="button" class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/shareplan_board/write_shareplan_board_page.do'">
										<img src="${pageContext.request.contextPath}/resources/image/writeBtn.PNG" alt="wirteButton">
									</button>
								</div>

							</div>
						</c:when>
						<c:otherwise>
							<div class="row-2"></div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="row mt-2">
				<div class="col">

						<hr>
						<div class="row">
							<div class="col">
								
								<div style="margin:5px;">
									<h4><span class="badge rounded-pill bg-danger">인기게시물</span></h4>
								</div>
							</div>
						</div>

						<div class="row " style="margin-left: 38px;">
							<c:forEach items="${resultList }" var="data">
							<c:forEach items="${hot }" var="hot">
							<c:choose>
								<c:when test="${data.sharePlanBoardVo.jet_board_shareplan_no == hot.jet_board_shareplan_no }">
							<%--이게 한개임--%>
							
							<div class="col-4 mt-4">
							
								<div class="sa sa-up"style="text-align: center; box-shadow: 2px 2px 5px 0px #BDBDBD; width: 350px;border-radius:5px">
								<div class="row">
										<div class="col">
											
											<div style="float:right; margin:5px;">
												<h4><span class="badge rounded-pill bg-danger">HOT</span></h4>
											</div>
										</div>
									</div>	
									<c:choose>
										<c:when test="${!empty data.thumbnail }">
											<div><a href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none; color:#000;"><img style="width:250px; height:250px;text-align:center;" src="${data.thumbnail[0].jet_board_shareplan_image_link }" alt="image"></a></div>
										</c:when>
										<c:otherwise>
											<div ><a href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none; color:#000;"><img class="img-fluid" style="width:250px; height:250px;text-align:center;"src="${pageContext.request.contextPath }/resources/image/logo.png" alt="image"></a></div>
										</c:otherwise>
									</c:choose>
									
									<ul style="margin-left: -30px;">
										<li class="text-truncate" style="list-style-type: none;max-width: 330px;">${data.sharePlanBoardVo.jet_board_shareplan_title }</li>
										
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
							<div class="row mt-4">
								<div class="col">
									<div style="margin:5px;">
										<h4><span class="badge rounded-pill bg-warning">전체게시물</span></h4>
									</div>	
								</div>
							</div>
							
							
							<div class="row " style="margin-left: 38px;">
							<c:forEach items="${resultList }" var="data">
							
							<%--이게 한개임--%>
							<div class="col-4 mt-4">
								<div class="sa sa-up"style="text-align: center; box-shadow: 2px 2px 5px 0px #BDBDBD; width: 350px;border-radius:5px">
									<div class="row">
										<div class="col">
											
											<%--<div style="float:right; margin:5px;" id="btnPick" onclick="pickView(this , ${data.sharePlanBoardVo.jet_board_shareplan_no})">
												<input id="btnPick" onclick="mineBoard(${data.sharePlanBoardVo.jet_board_shareplan_no})">
												 <img src="${pageContext.request.contextPath }/resources/image/star.png" alt="image"  onclick="mineBoard(${data.sharePlanBoardVo.jet_board_shareplan_no})">
											</div>
											<div div style="float:right; margin:5px;" id="btnPick">
												<img src="${pageContext.request.contextPath }/resources/image/pick.PNG" alt="image" >
											</div>--%>
										</div>
									</div>
									<c:choose>
										<c:when test="${!empty data.thumbnail }">
											<div><a onclick="qwe(this)" href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}"><img style=" width:250px; height:250px;text-align:center;" src="${data.thumbnail[0].jet_board_shareplan_image_link }" alt="image"></a></div>
										</c:when>
										<c:otherwise>
											<div ><a href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}"><img class="img-fluid" style="width:250px; height:250px;text-align:center;" src="${pageContext.request.contextPath }/resources/image/logo.png" alt="image"></a></div>
										</c:otherwise>
									</c:choose>
									
									<ul style="margin-left: -30px;">
										<li class="text-truncate" style="list-style-type: none;max-width: 330px;"><a href="${pageContext.request.contextPath }/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no=${data.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none; color:#000;">${data.sharePlanBoardVo.jet_board_shareplan_title }</a></li>
										
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


							</c:forEach>
						</div>
						
						
						
						    <script>
						      // Scroll Animation (sa, 스크롤 애니메이션)
						      const saTriggerMargin = 300;
						      const saElementList = document.querySelectorAll('.sa');
						
						      const saFunc = function() {
						        for (const element of saElementList) {
						          if (!element.classList.contains('show')) {
						            if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
						              element.classList.add('show');
						            }
						          }
						        }
						      }
						
						      window.addEventListener('load', saFunc);
						      window.addEventListener('scroll', saFunc);
						    </script>
                            	
                            

						<div class="row mt-4">
							<hr>
						</div>

						
					</div>
				</div>
			</div>

	

		<%-- </div>--%>

	</main>
	<div style="position:fixed; bottom:30px; right:30px;display:none;" id="go-top" >
		<img src="${pageContext.request.contextPath}/resources/image/topButton.png" alt="top" onclick="topBtn()" >			
	</div>
	<%--탑버튼 --%>
	<script>
		function upArea(){
		    scrollBy(0,scrollY/-15); 
		}
		 
		function topBtn(){
			topArea = setInterval("if(scrollY>15){upArea();}else{clearInterval(topArea);}",10);
		}
		
		
		window.addEventListener('scroll', () => {
		   if (document.querySelector('html').scrollTop > 200) {
		     document.getElementById('go-top').style.display = "block";
		     
		   } else {
		     document.getElementById('go-top').style.display = "none";
		   }
		 });
	
		
		
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>