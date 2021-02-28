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
					<h1 class="text-center">NOTICE for ADMIN</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-2 text-muted" style="text-align: right;">
					home > notice
				</div>
			</div>			
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>

			<div class="row mt-2">
	            <table class="table table-hover table-responsive ">
	                <thead>
	                  <tr>
	                    <th scope="col" class="col-1 text-center">번호</th>
	                    <th scope="col" class="col-1 text-center"></th>
	                    <th scope="col" class="col">제목</td>
	                    <th scope="col" class="col-2 text-center">글쓴이</td>
	                    <th scope="col" class="col-1 text-center">조회</td>
	                    <th scope="col" class="col-1 text-center">등록일</td>
	                   </tr>
	                </thead>
	                
	                <tbody>
						<c:forEach items="${resultList }" var="data">
						<tr>
							<th class="text-center">${data.noticeBoardVo.jet_board_notice_no} </th>
							<th></th>
							<td><a href="${pageContext.request.contextPath }/admin/admin_notice_board_read_page.do?jet_board_notice_no=${data.noticeBoardVo.jet_board_notice_no}">
								${data.noticeBoardVo.jet_board_notice_title}</a></td> <%-- 글 제목 클릭시 페이지 이동 고정된 페이지 값..--%>
							<td class="text-center"><span class="badge bg-danger">관리자</span>${data.memberVo.jet_member_nick}</td>
							<td class="text-center">${data.noticeBoardVo.jet_board_notice_readcount}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.noticeBoardVo.jet_board_notice_writedate}"/></td>
						</tr>
					</c:forEach>
	                </tbody>
	              </table>
	        </div>
	        
	        <%--글쓰기 버튼  --%>
	        <div class="row mt-2">
	        	<div class="col"></div>
	        	<div class="col"></div>
				<div class="col-2">
					<c:if test="${sessionUser.jet_member_grade ==9}">
						<a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/admin_notice_board_write_page.do">공지사항 쓰기</a>
					</c:if>
				</div>
			</div>
			 
			
			<%--페이징 --%>
			<div class="col">	 	
				<!-- <nav aria-label="Page navigation"> -->
				  <ul class="pagination justify-content-center">
				    
				    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_notice_board_page.do?page_num=1">&lt;&lt</a></li>
					<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_notice_board_page.do?page_num=${beginPage-1}">&lt;</a></li>
					
						<c:forEach begin="${beginPage }" end="${endPage }" var="index">
						
							<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_notice_board_page.do?page_num=${index }">${index}</a></li>
						
						</c:forEach>				      
					
					<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_notice_board_page.do?page_num=${endPage+1 }">&gt;</a></li>
					<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_notice_board_page.do?page_num=${pageCount}">&gt;&gt</a></li>
				  
				  </ul>
				<!--  </nav> -->
			</div>
			
			
	        <div class="row mt-2">
	            <hr>	<!-- 선 -->
	        </div>			
			
				

		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>