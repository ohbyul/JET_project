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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
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

</style>
</head>
<body>

<jsp:include page="../commons/top_image.jsp"/>
	<div class="container">
	    <main>
	        <div class="row mt-2">
	            <div class="col-4"></div>
	            <div class="col-4"></div>
	            <div class="col-4 text-end text-muted" style="text-align: right;">home > board > Freeboard</div>
	        </div>
	        <div class="row mt-4">
	            <div class="col text-center display-5" style="font-family: daum">자유 게시판</div>
	        </div>
	        <div class="row mt-4">
	            <hr> <!-- 선 -->
	        </div>
	        <div class="row mt-4">
       			<div class="col">
       				<a href="${pageContext.request.contextPath }/freeboard/main_free_board.do?jet_board_free_category_no=1"><span class="badge rounded-pill bg-secondary" style=" width: 6rem;">일상</span></a> |	
       				<a href="${pageContext.request.contextPath }/freeboard/main_free_board.do?jet_board_free_category_no=2"><span class="badge rounded-pill bg-light text-dark" style="width: 6rem;">잡담</span></a>	|	
       				<a href="${pageContext.request.contextPath }/freeboard/main_free_board.do?jet_board_free_category_no=3"><span class="badge rounded-pill bg-dark" style="width: 6rem;">수다</span></a>
       				
       			</div> 
				<!-- 	 <div class="col-2">
					<select class="form-select" name="jet_board_free_category_no" onchange="if(this.value) location.href=(this.value);">
						<option selected disabled>분류</option>
						<option value="${pageContext.request.contextPath}/freeboard/main_free_board.do?jet_board_free_category_no=1">일상</option>
						<option value="${pageContext.request.contextPath}/freeboard/main_free_board.do?jet_board_free_category_no=2">잡담</option>
						<option value="${pageContext.request.contextPath}/freeboard/main_free_board.do?jet_board_free_category_no=3">수다</option>
					</select>
				</div>	        -->	
	       		
	        	<div class="col">
		     	   <!-- 검색 기능  -->	        
		        	<form class="text-end" action="${pageContext.request.contextPath }/freeboard/main_free_board.do" method="get">
					<select name="search_type">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer_nick">작성자</option>
						<option>=======</option>
					</select>	
					<input name="search_word" type="text">
					<input type="submit" value="검색" >
					</form>  	
				</div>
	        </div>

	       
			<!-- 글 목록 -->
			 <div class="row mt-2">
	            <table class="table table-hover table-responsive ">
	                <thead>
	                  <tr>
	                  	<th scope="col" class="col-1 text-center">분류</th>
	                    <th scope="col" class="col-1 text-center">번호</th>
	                    <th scope="col" class="col">제목</th>
	                    <th scope="col" class="col-2 text-center">글쓴이</th>
	                    <th scope="col" class="col-1 text-center">조회</th>
	                    <th scope="col" class="col-1 text-center">등록일</th>
	                   </tr>
	                </thead>
	                <tbody>    
						<c:forEach items="${resultList }" var="data">
							<tr>
								<c:choose>
									<c:when test="${data.freeboardVo.jet_board_free_category_no == 1}">
										<td class="badge bg-secondary rounded-pill text-wrap text-center" style="width: 6rem;margin-top: 1rem;">${data.freeboardCategoryVo.jet_board_free_category_name }</td>
									</c:when>
									<c:when test="${data.freeboardVo.jet_board_free_category_no == 2}">
										<td class="badge bg-light text-dark rounded-pill text-wrap text-center" style="width: 6rem;margin-top: 1rem;">${data.freeboardCategoryVo.jet_board_free_category_name }</td>
									</c:when>
									<c:when test="${data.freeboardVo.jet_board_free_category_no == 3}">
										<td class="badge bg-dark rounded-pill text-wrap text-center" style="width: 6rem;margin-top: 1rem;">${data.freeboardCategoryVo.jet_board_free_category_name }</td>
									</c:when>
								</c:choose>
								
								<td class="text-center">${data.freeboardVo.jet_board_free_no }</td>
								<td><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/freeboard/read_free_board_page.do?jet_board_free_no=${data.freeboardVo.jet_board_free_no}">
									${data.freeboardVo.jet_board_free_title }</a>
									<c:if test="${data.repleCount > 0 }"><span style="color: red;">[${data.repleCount}]</span></c:if>
								</td>
								<td class="text-center">${data.memberVo.jet_member_nick }</td>
								<td class="text-center">${data.freeboardVo.jet_board_free_readcount }</td>
								<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${data.freeboardVo.jet_board_free_writedate }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<c:if test="${!empty sessionUser }">
					  <a class="btn btn-warning" href="${pageContext.request.contextPath }/freeboard/write_free_board_page.do" role="button">글쓰기</a>
					</c:if>
				</div>		
				
				<div class="col">

				<!-- <nav aria-label="Page navigation"> -->
				  <ul class="pagination justify-content-center">
				    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/freeboard/main_free_board.do?page_num=1" class="page-link">&lt;&lt;</a></li>
					<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/freeboard/main_free_board.do?page_num=${beginPage-1}" class="page-link">&lt;</a></li>
						<c:forEach begin="${beginPage }" end="${endPage }" var="index">
							<li class="page-item <c:if test="${index == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/freeboard/main_free_board.do?page_num=${index }" class="page-link">${index}</a></li>
						</c:forEach>				      
					<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/freeboard/main_free_board.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
					<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/freeboard/main_free_board.do?page_num=${pageCount}" class="page-link">&gt;&gt;</a></li>
				  </ul>
					<!-- </nav> -->
				</div>
			
	     	
	        
	        <div class="row mt-4">
	            <hr>	<!-- 선 -->
	        </div>
	    </main>
	  

	</div>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>