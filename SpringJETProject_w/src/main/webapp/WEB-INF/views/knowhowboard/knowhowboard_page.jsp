<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>팁과 노하우 게시판</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<!--Bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">	

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

<style>	

	@font-face{
	 font-family:'Daum';
	 font-style:normal;
	 font-weight:400;
	 src:url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff2') format('woff2'),
	     url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff') format('woff');
	}
	
	.title {
		font-family: daum;
	}

</style>





</head>
<body>

	<jsp:include page="../commons/top_image.jsp" />

	<div class="container">

		<main>
			<div class="row mt-2">
				<div class="col-5"></div>
				<div class="col-5"></div>
				<div class="col-2 text-muted" style="text-align: right;">home
					> knowhow board</div>
			</div>
			<div class="title row mt-4">
				<div class="col text-center display-5">팁과 노하우 게시판</div>

			</div>
			<div class="row mt-4">
				<hr>
				<!-- 선 -->
			</div>

			<%-- 
				<form
					action="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do"
					method="get">
					<div class="row mt-3">
						<!-- 카테고리로 검색 -->
						<div class="col-2">
							<select class="form-select" name="category_no">
								<option selected disabled>말머리</option>
								<option value="1">잡담</option>
								<option value="2">노하우</option>
								<option value="3">꿀팁</option>
							</select>
						</div>
						<!-- search_type 으로 검색 -->
						<div class="col-2">
							<select class="form-select" name="search_type">
								<option selected disabled>검색</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<!-- 검색어 입력 칸 -->
						<div class="col">
							<input class="form-control" type="text" name="search_word">
						</div>
						<!-- 검색 버튼 -->
						<div class="col-2 d-grid gap-2">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</div>
				</form>
				--%>

			<!-- 카테고리별로 정렬 -->
			<div class="row mt-3 justify-content-end">
				<div class="col-2">
					<select class="form-select" name="category_no"
						onchange="if(this.value) location.href=(this.value);">
						<option selected disabled>전체 보기</option>
						<option
							value="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do?category_no=1">꿀팁</option>
						<option
							value="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do?category_no=2">노하우</option>
						<option
							value="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do?category_no=3">기타</option>
					</select>
				</div>
			</div>

			<div class="row mt-4">



				<div class="col">
					<table class="table table-hover table-responsive ">
						<thead class="text-center">
							<tr>
								<th scope="col" class="col-1">번호</th>
								<th scope="col">제목</th>
								<th scope="col" class="col-2">글쓴이</th>
								<th scope="col" class="col-1">등록일</th>
								<th scope="col" class="col-1">조회수</th>
								<th scope="col" class="col-1">추천</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${resultList}" var="data">
								<tr>
									<td class="text-center">${data.knowhowBoardVo.jet_board_knowhow_no}</td>
									<td><p style="display: inline;">[${data.categoryVo.jet_board_knowhow_category_nam}]</p> <a style="text-decoration: none; color: #000000;"
										href="${pageContext.request.contextPath}/knowhowboard/read_knowhowboard_page.do?jet_board_knowhow_no=${data.knowhowBoardVo.jet_board_knowhow_no}">${data.knowhowBoardVo.jet_board_knowhow_title}</a>
										<span class="text-danger"> <c:if
												test="${data.countReple != 0 }">
												<a style="font-size: 14px; color: red;">[${data.countReple}]</a>
											</c:if>


									</span></td>
									<td class="text-center">${data.memberVo.jet_member_nick}</td>
									<td class="text-center"><fmt:formatDate
											value="${data.knowhowBoardVo.jet_board_knowhow_writedate}"
											pattern="MM-dd" /></td>
									<td class="text-center">${data.knowhowBoardVo.jet_board_knowhow_readcount}</td>
									<td class="text-center">${data.countLike}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>




			</div>

			<!-- 글쓰기 버튼 -->
			<c:choose>
				<c:when test="${!empty sessionUser}">
					<div class="row mt-1 justify-content-end">
						<div class="col-1">
							<a
								href="${pageContext.request.contextPath}/knowhowboard/write_knowhowboard_page.do"
								type="button" class="btn btn-success">글쓰기</a>
								
						</div>
					</div>
				</c:when>
			</c:choose>
			
			
			 <div class="row mt-4">
	            <hr>	<!-- 선 -->
	        </div>
	        
	        

			<!-- search_type 으로 검색 -->
			<form id="form-box"
				action="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do"
				method="get">
				<div class="row mt-3">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col">
				<div class="row">
					<div class="col-3">
						<select class="form-select" name="search_type" id="search-type">
							
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select>
					</div>
					<!-- 검색어 입력 칸 -->
					<div class="col" style="margin-left: -15px;">
						<input class="form-control" type="text" name="search_word" placeholder="검색어를 입력해주세요" id="search-word">
					</div>
					<!-- 검색 버튼 -->
					<div class="col-3" style="margin-left: -15px;">
						<%-- <button type="submit" class="btn btn-outline-success"><i class="bi bi-search"></i> 검색</button>--%>
						<button type="button" class="btn btn-outline-success" onclick="searchButton()"><i class="bi bi-search"></i> 검색</button>
					</div>
					</div>
				</div>
				</div>
			</form>
						

			<!-- 페이지 -->
			<div class="row mt-5">
				<div class="col">

					<ul class="pagination justify-content-center">

						<li
							class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a
							class="page-link"
							href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=1">&lt;&lt</a></li>
						<li
							class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a
							class="page-link"
							href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${beginPage-1}">&lt;</a></li>

						<c:forEach begin="${beginPage }" end="${endPage }" var="index">
							<li
								class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a
								class="page-link"
								href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${index }">${index}</a></li>
						</c:forEach>

						<li
							class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a
							class="page-link"
							href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${endPage+1 }">&gt;</a></li>
						<li
							class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a
							class="page-link"
							href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${pageCount}">&gt;&gt</a></li>

					</ul>

				</div>
			</div>
	</div>
	<div class="col-1"></div>
	
	
	
	 
	</main>
	
	
	
	<script type="text/javascript">
	
	function searchButton() {
		
		// var searchType = document.getElementById("search-type");
		// var searchTypeIndex = document.getElementById("search-type").options.selectedIndex;
		var searchWord = document.getElementById("search-word");
		var formBox = document.getElementById("form-box");
		
		if (searchWord.value == "" || searchWord.value.trim() == "") {
			return;
		} 
			formBox.submit();
		
	}
	</script>
<jsp:include page="../party_board/popup_chat.jsp"/>
	<jsp:include page="../commons/global_nav.jsp" />
	<jsp:include page="../commons/global_footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>