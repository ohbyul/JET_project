<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 읽기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../csboard/style/read_csboard_page_style.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>

<div class="container-fluid">
	<main>
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				
				<div class="row mt-5">
					<div class="col text-center">
						<h1>문의글 읽기</h1>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						제목
					</div>
					<div class="col">
						${result.csBoardVo.jet_board_m_cs_title }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						카테고리
					</div>
					<div class="col">
						<c:choose>
							<c:when test="${result.csBoardVo.jet_board_m_cs_category_no ==1}"><td>[가입]</td></c:when>
							<c:when test="${result.csBoardVo.jet_board_m_cs_category_no ==2}"><td>[여행친구]</td></c:when>
							<c:when test="${result.csBoardVo.jet_board_m_cs_category_no ==3}"><td>[회원등급]</td></c:when>
							<c:when test="${result.csBoardVo.jet_board_m_cs_category_no ==4}"><td>[포인트]</td></c:when>
							<c:when test="${result.csBoardVo.jet_board_m_cs_category_no ==5}"><td>[기타]</td></c:when>
						</c:choose>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						작성자
					</div>
					<div class="col">
						${result.memberVo.jet_member_nick}
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						조회수
					</div>
					<div class="col">
						${result.csBoardVo.jet_board_m_cs_readcount }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						작성일
					</div>
					<div class="col">
						${result.csBoardVo.jet_board_m_cs_writedate }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						내용
					</div>
					<div class="col border border-1 overflow-auto" style="height: 200px;">
						${result.csBoardVo.jet_board_m_cs_content }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						이메일
					</div>
					<div class="col">
						${result.csBoardVo.jet_board_m_cs_customeremail }
					</div>
				</div>
				
				<div class="row mt-3">	<!-- 이미지박스 -->
					<div class="col-2">
						이미지
					</div>
					<div class="col border border-1" >
						<c:forEach items="${result.imageVoList }" var="imageVo">
							<img id="image_size_auto" src="${imageVo.jet_board_cs_image_link }"><br>
						</c:forEach>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
				<div class="row mt-3 mb-3">
					<!-- 관리자 전용 답글 버튼 -->
					<c:if test="${sessionUser.jet_member_grade ==9 }">
						<div class="col-1 d-grid gap-2 d">
							<form action="${pageContext.request.contextPath }/csboard/answer_write_csboard_page.do" method="post">
								<input class="btn btn-outline-dark" type="submit" value="답글"> 
								<input type="hidden" name="jet_board_m_cs_no" value="${result.csBoardVo.jet_board_m_cs_no }">		
							</form>
						</div>
					</c:if>
					
					<div class="col"></div>
					
					<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.csBoardVo.jet_member_no }">
						<div class="col-1 d-grid gap-2 d">
							<a class="btn btn-outline-danger" href="${pageContext.request.contextPath }/csboard/delete_csboard_process.do?jet_board_m_cs_no=${result.csBoardVo.jet_board_m_cs_no}">
							삭제</a>
						</div>
						<div class="col-1 d-grid gap-2 d">
							<a class="btn btn-outline-success" href="${pageContext.request.contextPath }/csboard/update_csboard_page.do?jet_board_m_cs_no=${result.csBoardVo.jet_board_m_cs_no}">
							수정</a>
						</div>
					</c:if>
					
					<div class="col-1 d-grid gap-2 d">
						<a class="btn btn-primary" href="${pageContext.request.contextPath }/csboard/csboard_page.do">목록</a>
					</div>
				</div>		
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
			</div>
			<div class="col-2"></div>
		</div>
	</main>
</div>


<%--
<h1>read_content_page</h1>

	제목 : ${result.csBoardVo.jet_board_m_cs_title } <br>
	작성자 :  ${result.memberVo.jet_member_nick} <br>
	조회수 : ${result.csBoardVo.jet_board_m_cs_readcount }<br> <!-- 리드카운트 cs빠졌다 ㅜㅜ -->
	작성일 : ${result.csBoardVo.jet_board_m_cs_writedate }<br>
	내용 : ${result.csBoardVo.jet_board_m_cs_content }<br>
	이메일 : ${result.csBoardVo.jet_board_m_cs_customeremail }<br>
	<br>
	
	<div class="row">
	<c:forEach items="${result.imageVoList }" var="imageVo">
		<img id="image_size_auto" src="${imageVo.jet_board_cs_image_link }"><br>
	</c:forEach>
	</div>
	
	<a href="${pageContext.request.contextPath }/csboard/csboard_page.do">목록으로</a>	
	
	<!-- 관리자 전용 답글 버튼 -->
	<c:if test="${sessionUser.jet_member_grade ==9 }">
		
		<form action="${pageContext.request.contextPath }/csboard/answer_write_csboard_page.do" method="post">
			<input type="submit" value="답글"> 
			<input type="hidden" name="jet_board_m_cs_no" value="${result.csBoardVo.jet_board_m_cs_no }">		
		</form>
	
	</c:if>
	
	<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.csBoardVo.jet_member_no }">
		<a href="${pageContext.request.contextPath }/csboard/delete_csboard_process.do?jet_board_m_cs_no=${result.csBoardVo.jet_board_m_cs_no}">
		삭제</a>
		<a href="${pageContext.request.contextPath }/csboard/update_csboard_page.do?jet_board_m_cs_no=${result.csBoardVo.jet_board_m_cs_no}">
		수정</a>
	</c:if>
	<br>
 --%>	
	<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>