<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>

<style>
	.layer1 {
	margin: 0;
	padding: 0;
	width: 500px;
	}
	
	.heading {
	margin: 1px;
	color: #fff;
	padding: 3px 10px;
	cursor: pointer;
	position: relative;
	background-color:#c30;
	}
	.content {
	padding: 5px 10px;
	background-color:#fafafa;
	}
	p { padding: 5px 0; }
	
</style>

<script type="text/javascript">

	$(document).ready(function() {
		  jQuery(".content").hide();
		//content 클래스를 가진 div를 표시/숨김(토글)
		  $(".heading").click(function()
		  {
		    $(".content").not($(this).next(".content").slideToggle(500)).slideUp();
		  });
		});


</script>
</head>
<body>

	<jsp:include page="../admin/admin_only_nav.jsp" />

	<div class="container-fluid mt-2">
		<div class="row">
			<jsp:include page="../admin/admin_only_sidebar.jsp"/>
			
			<div class="col me-3 border border-dark"><%--관리자 메인 페이지 --%>

				<div class="row mt-5">
					<div class="col">
						<h1 class="text-center">아코디언</h1>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<hr>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="layer1">
							<p class="heading">제목 1 </p>
							<div class="content">첫 번째 컨텐츠<br>첫 번째 컨텐츠</div>
							<p class="heading">제목 2</p>
							<div class="content">두 번째 컨텐츠<br>두 번째 컨텐츠</div>
							<p class="heading">제목 3</p>
							<div class="content">세 번째 컨텐츠<br>세 번째 컨텐츠</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<details>
							<summary>서머리1</summary>
							<summary>서머리 2</summary>
							<summary>서머리 3</summary>
						</details>
					</div>
				</div>

			
				<div class="row">	<%--아코디언 시작 --%>
					<div class="col">
					 <tbody>
					 <c:forEach items="${resultList }" var="data">
						<div class="accordion" id="accordionExample">
						
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="headingOne">
						      
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						        		               
		                	
		                		<c:if test="${empty data.csBoardAnswerVo }">
		                			<tr>
										<th class="text-center">${data.csBoardVo.jet_board_m_cs_no }</th>
										<c:choose>
											<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==1}"><td>[가입]</td></c:when>
											<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==2}"><td>[여행친구]</td></c:when>
											<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==3}"><td>[회원등급]</td></c:when>
											<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==4}"><td>[포인트]</td></c:when>
											<c:when test="${data.csBoardVo.jet_board_m_cs_category_no ==5}"><td>[기타]</td></c:when>
										</c:choose>
										<td>${data.csBoardVo.jet_board_m_cs_title }</td>
										<td>${data.memberVo.jet_member_nick }</td>
										<td>${data.csBoardVo.jet_board_m_cs_readcount }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${data.csBoardVo.jet_board_m_cs_writedate }"/></td>
									</tr>
		                		</c:if>
						      </button>
						    </h2>
						    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
						        	긁읽기 냉ㅇ..
						      </div>
						    </div>
						    
						  </div>
							</c:forEach>				
						 </tbody>
						</div>
					</div>
				</div>	<%--아코디언 끝 --%>
				



				<div class="row">	 <%--검색 row--%>
					<div class="col-8"></div>
					<div class="col">
					<form action="${pageContext.request.contextPath }/admin/admin_csboard_before_page.do" method="get">
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
		                		<c:if test="${empty data.csBoardAnswerVo }">
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
		                		</c:if>
		                	</c:forEach>
						</tbody>
						
						</table>	
					</div>
				</div><%--글리스트 테이블 row 끝--%>

			</div>
			<%--관리자 메인 페이지 col끝--%>
		</div>
		<%--가장 큰 row박스 끝 --%>
	</div>
	<%--컨테이너 박스 끝 --%>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>

</html>