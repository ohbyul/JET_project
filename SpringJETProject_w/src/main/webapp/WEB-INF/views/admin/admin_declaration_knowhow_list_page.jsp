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
					<h1 class="text-center">게시물 신고 리스트</h1>
				</div>
			</div>

			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-2 text-muted" style="text-align: right;">
					home > singo
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
					    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/admin/admin_declaration_notice_list_page.do">
					    	Notice
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">
					    	자유게시판
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" href="${pageContext.request.contextPath }/admin/admin_declaration_knowhow_list_page.do">
					    	팁과노하우
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">
					    	리뷰게시판
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">
					    	여행공유게시판
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_declaration_party_list_page.do">
					    	여행친구찾기
					    </a>
					  </li>
					   <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_declaration_class_list_page.do">
					    	원데이클래스
					    </a>
					  </li>
					  
					</ul>
				</div>
			</div> 	<%--탭 페이지  --%>			
			
			<div class="row mt-2"> <%--문의글 테이블 --%>
				<div class="col">
	
					<div class="row mt-2">
						<div class="col">
							<table class="table table-hover table-responsive ">
			                <thead>
			                  <tr>
			                    <th scope="col" class="col-1 text-center">번호</th>
			                    <th scope="col" class="col-4">글제목</td>
			                    <th scope="col" class="col-4">신고 사유</td>
			                    <th scope="col" class="col-1">신고자</td>
			                    <th scope="col" class="col-1 text-center">신고 날짜</td>
			                    <th scope="col" class="col-1 text-center">상태</td>
			                   </tr>
			                </thead>
			                
			                <tbody>
								<c:forEach items="${resultList }" var="data">
									<tr>
										<th class="text-center">${data.knowhowSingoVo.jet_board_knowhow_singo_no }</th>
										<td><a href="${pageContext.request.contextPath }/knowhowboard/read_knowhowboard_page.do?jet_board_knowhow_no=${data.knowhowBoardVo.jet_board_knowhow_no}">
											${data.knowhowBoardVo.jet_board_knowhow_title }
										</a></td>
										<td>${data.knowhowSingoVo.jet_board_knowhow_singo_reason }</td>
										<td>${data.singoMemberVo.jet_member_nick }</td>
										<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.knowhowSingoVo.jet_board_knowhow_singo_date }"/></td>
										<td class="text-center">
											<select>
												<option>전체 공개</option>
												<option>숨김</option>
												<option>삭제</option>
												<option>======</option>
											</select>
										</td>
									</tr>
									
								</c:forEach>
							</tbody>
							</table>	
						</div>
					</div><%--멤버리스트 테이블 row 끝--%>
					
					<div class="row">
						<div class="col">
							<hr>
						</div>
					</div>
<%--페이징 처리 --%><%--					
					<div class="row"> 
						<div class="col">
						
							  <ul class="pagination justify-content-center">
							    
							    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=1">&lt;&lt</a></li>
								<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${beginPage-1}">&lt;</a></li>
								
									<c:forEach begin="${beginPage }" end="${endPage }" var="index">
									
										<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${index }">${index}</a></li>
									
									</c:forEach>				      
								
								<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${endPage+1 }">&gt;</a></li>
								<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${pageCount}">&gt;&gt</a></li>
							  
							  </ul>
						
						</div>
					</div>
 --%>			
 <%--페이징 처리 row끝 --%>		
					
				</div> <%--멤버 리스트 테이블 col 끝--%>
			</div> <%--멤버 리스트 테이블 row 끝--%>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>