<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<style>
	#mainbox{
		border: 1px solid rgba(0,0,0,.125);
   		border-radius: .25rem;
	}
</style>
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">Message for ADMIN</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-2 text-muted" style="text-align: right;">
					home > message for admin
				</div>
			</div>	
						
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
		
			<div class="row">	<%--탭 페이지  --%>
				<div class="col">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="#">
					    	보낸 쪽지
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_csboard_before_page.do">
					    	
					    </a>
					  </li>
					</ul>
				</div>
			</div> 	<%--탭 페이지  --%>
			<div class="row mt-2"> <%--문의글 테이블 --%>
				<div class="col">	
					<div class="row">	 <%--검색 row--%>
						<div class="col-6"></div>
						<div class="col">
						<form action="${pageContext.request.contextPath }/admin/admin_csboard_page.do" method="get">
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
					</div><%--검색 row  끝--%>
					<%--본문 내용 --%>
					<div class="row">
						<div class="col">
								<div class="row justify-content-center"style="height:250px;">
									<div class="col-11">	        
								        <div class="row mt-4">
								            <table class="table table-hover table-responsive ">
								                <thead>
								                  <tr>
								                    <th scope="col" class="col-1 text-center">번호</th>
								                    <th scope="col" class="col text-center">제목</th>
								                    <th scope="col" class="col-3 text-center">받는 사람</th>
								                    <th scope="col" class="col-2 text-center">보낸 시간</th>
								                   </tr>
								                </thead>
								                <tbody>
													<c:forEach items="${messageList }" var="data">
														<tr>
															<td class="col text-center">${data.messageVo.jet_message_no }</td>
															<td class="col text-center">		
																<a style="text-align: center" href="${pageContext.request.contextPath }/admin/admin_message_read_page.do?jet_message_no=${data.messageVo.jet_message_no}">${data.messageVo.jet_message_title}</a>
															</td>
															<td class="col text-center">${data.memberReceiverNick.jet_member_nick}</td>
															<td class="col text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${data.messageVo.jet_message_senddate }"/></td>
														</tr>
													</c:forEach>
													<c:if test="${empty sessionUser}">
														<tr>
															<td class="col"></td>
															<td class="col text-end pe-4">받은 쪽지가 없습니다.</td>
															<td class="col"></td>
															<td class="col"></td>
														</tr>
													</c:if>
												</tbody>
								            </table>
								        </div>
								        <div class="row mt-1">
											<div class="col text-end">
												<a href="${pageContext.request.contextPath }/admin/admin_message_write_page.do"><button class="btn btn-dark" type="button">쪽지 작성</button></a>
											</div>
										</div>
									</div>	
			                </div>
			            </div>	
						</div>
						<div class="col"></div>
					</div>
					<%--본문 내용 끝--%>
					
					
					
<%-- 					<div class="row"> 페이징 처리 --%>
<!-- 						<div class="col"> -->
<!-- 							<nav aria-label="Page navigation"> -->
<!-- 							  <ul class="pagination justify-content-center"> -->
							    
<%-- 							    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=1">&lt;&lt</a></li> --%>
<%-- 								<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${beginPage-1}">&lt;</a></li> --%>
								
<%-- 									<c:forEach begin="${beginPage }" end="${endPage }" var="index"> --%>
									
<%-- 										<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${index }">${index}</a></li> --%>
									
<%-- 									</c:forEach>				       --%>
								
<%-- 								<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${endPage+1 }">&gt;</a></li> --%>
<%-- 								<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${pageCount}">&gt;&gt</a></li> --%>
							  
<!-- 							  </ul> -->
<!-- 							 </nav> -->
<!-- 						</div> -->
<%-- 					</div>페이징 처리 row끝 --%>
					
					
				</div> <%--문의글 테이블 col 끝--%>
			</div> <%--문의글 테이블 row 끝--%>
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%>
	<%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>

