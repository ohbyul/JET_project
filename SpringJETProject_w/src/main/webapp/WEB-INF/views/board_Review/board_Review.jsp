<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>리뷰 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>
	
	<div class="container">
                <main>
                    <div class="row mt-2">
                        <div class="col-5"></div>
                        <div class="col-5"></div>
                        <div class="col-2 text-muted" style="text-align: right;">home > travel review</div>
                    </div>
                    <div class="row mt-4">
                        <div class="col text-center display-5">Review Board</div>

                    </div>
                    <div class="row mt-4">
                        <hr>
                    </div>
                    <div class="row mt-2">
                    	<div class="col">
	                    	<form action="${pageContext.request.contextPath }/board_Review/board_Review.do" method="get">
	                    	
	                    	
		                    	<select id="category_hold" onchange="if(this.value) location.href=(this.value);" name="category_no" class="form-select form-select-sm" aria-label=".form-select-sm example" style="float:right;width:100px">
	                                <option value="${pageContext.request.contextPath }/board_Review/board_Review.do?category_no=0" ${category_hold == '0' ? 'selected="selected"' :'' }>전체보기</option>
	                                <option value="${pageContext.request.contextPath }/board_Review/board_Review.do?category_no=1" ${category_hold == '1' ? 'selected="selected"' :'' }>기타</option>
	                                <option value="${pageContext.request.contextPath }/board_Review/board_Review.do?category_no=2" ${category_hold == '2' ? 'selected="selected"' :'' }>숙소</option>
	                                <option value="${pageContext.request.contextPath }/board_Review/board_Review.do?category_no=3" ${category_hold == '3' ? 'selected="selected"' :'' }>카페</option>
	                                <option value="${pageContext.request.contextPath }/board_Review/board_Review.do?category_no=4" ${category_hold == '4' ? 'selected="selected"' :'' }>액티비티</option>
	                                <option value="${pageContext.request.contextPath }/board_Review/board_Review.do?category_no=5" ${category_hold == '5' ? 'selected="selected"' : '' }>식당</option>
                            	</select>
                            	
                            	<%-- 
	                    	
	                    		<input type="button" value="qwe" name="category_ndo">
	                    		<input type="button" value="기타">
	                    		<input type="button" value="숙소">
	                    		<input type="button" value="카페">
	                    		<input type="button" value="액티비티">	
	                    		<input type="button" value="식당">
	                    	--%>
	                    		
	                    	</form>
	                    	
	                    		
                           	
                    	</div>
                    </div>
                    <div class="row mt-2">
                        <table class="table table-hover table-responsive ">
                            <thead>
                              <tr class="text-center">
                                <th scope="col" class="col-1 ">번호</th>
                                <th scope="col" class="col ">제목</th>
                                <th scope="col" class="col-2">글쓴이</th>
                                <th scope="col" class="col-1">등록일</th>
                                <th scope="col" class="col-1">조회</th>
                                <th scope="col" class="col-1">추천</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${resultList }" var="data">
                            	<tr>
                                <th scope="row" class="text-center">${data.boardReviewVo.jet_board_review_no }</th>
                                <td><a href="${pageContext.request.contextPath }/board_Review/board_Review_View.do?board_Review_no=${data.boardReviewVo.jet_board_review_no}" style="text-decoration:none; color:#000;">
                                
                                <c:choose>
                                	<c:when test="${data.boardReviewVo.jet_board_review_category_no == 1}">[기타]</c:when>
                                	<c:when test="${data.boardReviewVo.jet_board_review_category_no == 2}">[숙소]</c:when>
                                	<c:when test="${data.boardReviewVo.jet_board_review_category_no == 3}">[카페]</c:when>
                                	<c:when test="${data.boardReviewVo.jet_board_review_category_no == 4}">[액티비티]</c:when>
                                	
                                	<c:otherwise>
                                		[식당]
                                	</c:otherwise>
                                </c:choose>
                                 &nbsp;
                                ${data.boardReviewVo.jet_board_review_title }</a>
                                	
                               		<c:if test="${data.repleCount != 0 }">
                               			<a style="font-size : 14px; color:red;">[ ${data.repleCount } ]</a>
                             		</c:if>

                                </td>
                                <td class="text-center">${data.memberVo.jet_member_nick }</td>
                                <td class="text-center"><fmt:formatDate pattern="MM-dd" value="${data.boardReviewVo.jet_board_review_writedate }"/></td>
                                <td class="text-center">${data.boardReviewVo.jet_board_review_readcount }</td>
                                <td class="text-center">${data.likeCount }</td>
                              </tr>
                            </c:forEach>


                            </tbody>
                          </table>
                    </div>
                    <c:choose>
                    	<c:when test="${!empty sessionUser }">
		                    <div class="row">
			                    <div class="col-11"></div>
			                    <div class="col-1" style="text-align: right; ">
			                        <button type="button" class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/board_Review/board_Review_Write.do'"><img src="${pageContext.request.contextPath}/resources/image/writeBtn.PNG" alt="wirteButton"></button>
			                    </div>
		                	</div>
	                	</c:when>
	                	<c:otherwise>
	                		<div class="row-2">
	                			
	                		</div>
	                	</c:otherwise>
                	</c:choose>
                	<div class="row mt-2">
                    	<hr>
                	</div>
                    <div class="row mt-3">
                    	<div class="col">
	                        <nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item<c:if test="${currentPage == 1}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/board_Review/board_Review.do?page_num=1" class="page-link text-dark">&lt;&lt;</a></li>
									<li class="page-item<c:if test="${beginPage <= 1}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/board_Review/board_Review.do?page_num=${beginPage-1 }" class="page-link text-dark">&lt;</a></li>
									<c:forEach begin="${beginPage }" end="${endPage }" var="i">
										<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/board_Review/board_Review.do?page_num=${i }" class="page-link text-dark">${i }</a></li>
									</c:forEach>
									<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/board_Review/board_Review.do?page_num=${endPage+1 }" class="page-link text-dark">&gt;</a></li>
									<li class="page-item<c:if test="${currentPage == pageCount}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/board_Review/board_Review.do?page_num=${pageCount }" class="page-link text-dark">&gt;&gt;</a></li>
									
								</ul>
							</nav>
                        </div>
                        
                        <div class="col"></div>
	                    <div class="col"><!-- 검색... -->
		                    <form action="${pageContext.request.contextPath }/board_Review/board_Review.do" method="get">
		                        <div class="row">
		                            <div class="col-3">
		                                <select name="search_type" class="form-select">
		                                    <option value="title">제목</option>
		                                    <option value="content">내용</option>
		                                    <option value="writer">작성자</option>
		                                </select>
		                            </div>
		                            <div class="col-7" style="margin-left: -15px;">
		                                <input name="search_word" type="text" class="form-control" placeholder="검색어를 입력해주세요">
		                            </div>
		                            <div class="col-1" style="margin-left: -15px;">
		                                <input type="image"  src="${pageContext.request.contextPath }/resources/image/search.PNG" alt="search" style="border: 1px solid #D5d5d5; border-radius: 5px;">
		                            </div>
		                        </div>
	                    	</form>
	                    </div>
                    </div>
                    
                </main>
	</div>	
	<jsp:include page="../party_board/popup_chat.jsp"/>
	<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>