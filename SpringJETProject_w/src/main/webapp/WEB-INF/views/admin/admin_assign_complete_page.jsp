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
					<h1 class="text-center">CS for ADMIN</h1>
				</div>
			</div>

			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-2 text-muted" style="text-align: right;">
					home > csBoard > assign_c
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
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do">
					    	ALL CS
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_csboard_before_page.do">
					    	미답변
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_csboard_complete_page.do">
					    	답변 완료
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_assign_before_page.do">
					    	Assign[미답변]
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/admin/admin_assign_complete_page.do">
					    	Assign[답변 완료]
					    </a>
					  </li>
					  
					</ul>
				</div>
			</div> 	<%--탭 페이지  --%>

			
			<div class="row mt-2"> <%--문의글 테이블 --%>
				<div class="col">
					
					<div class="row">	 <%--검색 row--%>
						<div class="col-8"></div>
						<div class="col">
						<form action="${pageContext.request.contextPath }/admin/admin_assign_complete_page.do" method="get">
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
			
					<div class="row mt-2">
						<div class="col">
							<table class="table table-hover table-responsive ">
			                <thead>
			                  <tr>
			                    <th scope="col" class="col-1 text-center">번호</th>
			                    <th scope="col" class="col-1">카테고리</td>
			                    <th scope="col" class="col">제목</td>
			                    <th scope="col" class="col-2">글쓴이</td>
			                    <th scope="col" class="col-1">조회</td>
			                    <th scope="col" class="col-1 text-center">등록일</td>
			                   </tr>
			                </thead>
			                
			                <tbody> 	
			                	<c:forEach items="${resultList }" var="data">
			                		<c:forEach items="${assignList }" var="assign">
			                			<c:if test="${data.csBoardVo.jet_board_m_cs_no == assign.adminAssignVo.jet_board_m_cs_no && !empty data.csBoardAnswerVo}">
			                				<tr>
											<th class="text-center">${data.csBoardVo.jet_board_m_cs_no }</th>
											<c:choose>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==1}"><td>[가입]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==2}"><td>[여행친구]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==3}"><td>[회원등급]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==4}"><td>[포인트]</td></c:when>
												<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==5}"><td>[기타]</td></c:when>
											</c:choose>
											<td><a href="${pageContext.request.contextPath }/admin/admin_csboard_read_page.do?jet_board_m_cs_no=${data.csBoardVo.jet_board_m_cs_no }">
											${data.csBoardVo.jet_board_m_cs_title }</a></td>
											<td>${data.memberVo.jet_member_nick }</td>
											<td>${data.csBoardVo.jet_board_m_cs_readcount }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.csBoardVo.jet_board_m_cs_writedate }"/></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td><a href="${pageContext.request.contextPath }/admin/admin_csboard_answer_read_page.do?jet_board_a_cs_no=${data.csBoardAnswerVo.jet_board_a_cs_no }">
											${data.csBoardAnswerVo.jet_board_a_cs_title }</a></td>										
											<td><span class="badge bg-danger">관리자</span>${data.memberAdminVo.jet_member_nick }</td>
											<td>${data.csBoardAnswerVo.jet_board_a_readcount }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.csBoardAnswerVo.jet_board_a_cs_writedate }"/></td>
										</tr>
			                			</c:if>
			                		</c:forEach>
			                	</c:forEach>
							</tbody>
							
							</table>	
						</div>
					</div><%--글리스트 테이블 row 끝--%>
					
					<div class="row">
						<div class="col">
							<hr>
						</div>
					</div>
					
				
					
				</div> <%--문의글 테이블 col 끝--%>
			</div> <%--문의글 테이블 row 끝--%>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>