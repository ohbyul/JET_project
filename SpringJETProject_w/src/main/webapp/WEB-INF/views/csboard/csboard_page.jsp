<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<jsp:include page="../csboard/style/csboard_page_style.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
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
			            <div class="col text-center display-5 font-monospace">Q & A</div>
			
			        </div>
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > csboard</div>
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
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/faboard/faboard_page.do">F A Q</a>
								</div>
							</div>
							<div class="row" style="height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;background-color: orange;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/csboard/csboard_page.do">Q & A</a>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 사이드 -->
				<div class="col" style="margin-bottom: 100px;">	<!-- 메인 -->
					
					<div class="row mt-2">
	
					<div class="col-7"></div>
					
					<div class="col">
						<form action="${pageContext.request.contextPath }/csboard/csboard_page.do" method="get">
							<div class="row">
								<div class="col-3">
									<select  name="search_type" class="form-select">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">작성자</option>
										<option>=======</option>
									</select>	
								</div>
								<div class="col">
									<input name="search_word" type="text" class="form-control" placeholder="검색어를 입력해주세요">
								</div>
								<div class="col-2">
									<input type="submit" value="검색" class="btn btn-dark">
								</div>
							</div>
						</form>
			        </div>
		        </div>
		        
		        <div class="row mt-4 me-1 ms-1">
		            <table class="table table-hover table-responsive ">
		                <thead>
		                  <tr>
		                    <th scope="col" class="col-1">No</th>
		                    <th scope="col" class="col-1">카테고리</td>
		                    <th scope="col" class="col">제목</td>
		                    <th scope="col" class="col-2">글쓴이</td>
		                    <th scope="col" class="col-1 text-center">조회</td>
		                    <th scope="col" class="col-2 text-center">등록일</td>
		                   </tr>
		                </thead>
		                
		                <tbody>
							
							<c:forEach items="${resultList }" var="data">
								<c:choose>
									<c:when test="${!empty data.csBoardAnswerVo}">
										<tr>
											<th>${data.csBoardVo.jet_board_m_cs_no }</th>
											<c:choose>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==1}"><td>[가입]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==2}"><td>[여행친구]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==3}"><td>[회원등급]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==4}"><td>[포인트]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==5}"><td>[기타]</td></c:when>
											</c:choose>
											<td><a href="${pageContext.request.contextPath }/csboard/read_csboard_page.do?jet_board_m_cs_no=${data.csBoardVo.jet_board_m_cs_no }" style="text-decoration: none;color: black;">
											${data.csBoardVo.jet_board_m_cs_title }</a></td>
											<td>${data.memberVo.jet_member_nick }</td>
											<td class="col-1 text-center">${data.csBoardVo.jet_board_m_cs_readcount }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.csBoardVo.jet_board_m_cs_writedate }"/></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td><a href="${pageContext.request.contextPath }/csboard/answer_read_csboard_page.do?jet_board_a_cs_no=${data.csBoardAnswerVo.jet_board_a_cs_no }" style="text-decoration: none;color: black;">
											${data.csBoardAnswerVo.jet_board_a_cs_title }</a></td>										
											<td><span class="badge bg-danger">관리자</span>${data.memberAdminVo.jet_member_nick }</td>
											<td class="col-1 text-center">${data.csBoardAnswerVo.jet_board_a_readcount }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.csBoardAnswerVo.jet_board_a_cs_writedate }"/></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>${data.csBoardVo.jet_board_m_cs_no }</th>
											<c:choose>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==1}"><td>[가입]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==2}"><td>[여행친구]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==3}"><td>[회원등급]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==4}"><td>[포인트]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==5}"><td>[기타]</td></c:when>
											</c:choose>
											<td><a href="${pageContext.request.contextPath }/csboard/read_csboard_page.do?jet_board_m_cs_no=${data.csBoardVo.jet_board_m_cs_no }" style="text-decoration: none;color: black;">
											${data.csBoardVo.jet_board_m_cs_title }</a></td>
											<td>${data.memberVo.jet_member_nick }</td>
											<td class="col-1 text-center">${data.csBoardVo.jet_board_m_cs_readcount }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.csBoardVo.jet_board_m_cs_writedate }"/></td>
										</tr>
									</c:otherwise>
								</c:choose>
								
								
							</c:forEach>
							
		                </tbody>
		              </table>
		        </div>
		        
		        <div class="row">
		        	<div class="col-10"></div>
		        	<div class="col d-grid gap-2 d">
				        <c:if test="${!empty sessionUser }">
							<a class="btn" id="orange_btn" style="font-family: monospace;" href="${pageContext.request.contextPath }/csboard/write_csboard_page.do">Write CS</a>
						</c:if>	        		
		        	</div>
		        </div>
	
				
				<div class="col mt-2">	 	
					<!-- <nav aria-label="Page navigation"> -->
					  <ul class="pagination justify-content-center">
					    
					    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=1">&lt;&lt</a></li>
						<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${beginPage-1}">&lt;</a></li>
						
							<c:forEach begin="${beginPage }" end="${endPage }" var="index">
							
								<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${index }">${index}</a></li>
							
							</c:forEach>				      
						
						<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${endPage+1 }">&gt;</a></li>
						<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${pageCount}">&gt;&gt</a></li>
					  
					  </ul>
					<!--  </nav> -->
				</div>
					
				</div>
			</div>
	
			

	  
	    	</div>
	    	<div class="col"  style="background-color:#f6f6f6";></div>
	    </div>
	    
	   

	</div>
	<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>