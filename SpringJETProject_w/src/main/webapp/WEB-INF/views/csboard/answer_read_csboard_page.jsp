<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 답변</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../csboard/style/answer_read_csboard_page_style.jsp"/>
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
						<h1>문의글 답변 읽기</h1>
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
						${result.csBoardAnswerVo.jet_board_a_cs_title }
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
						${result.csBoardAnswerVo.jet_board_a_readcount }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						작성일
					</div>
					<div class="col">
						${result.csBoardAnswerVo.jet_board_a_cs_writedate }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						내용
					</div>
					<div class="col border border-1 overflow-auto" style="height: 200px;">
						${result.csBoardAnswerVo.jet_board_a_cs_content }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
				<div class="row mt-3 mb-3">
					
					<div class="col"></div>
					
					<div class="col-1">
						<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.csBoardAnswerVo.jet_member_no  }">
							<a class="btn btn-outline-danger" href="${pageContext.request.contextPath }/csboard/answer_csboard_delete_process.do?jet_board_a_cs_no=${result.csBoardAnswerVo.jet_board_a_cs_no}">삭제</a>
						</c:if>
					</div>
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
<h1>문의글에 대한 답변</h1>

제목 : ${result.csBoardAnswerVo.jet_board_a_cs_title } <br>
작성자 :  ${result.memberVo.jet_member_nick} <br>
조회수 : ${result.csBoardAnswerVo.jet_board_a_readcount }<br>
작성일 : ${result.csBoardAnswerVo.jet_board_a_cs_writedate }<br>
내용 : ${result.csBoardAnswerVo.jet_board_a_cs_content }<br>

<a href="${pageContext.request.contextPath }/csboard/csboard_page.do">목록으로</a>	


<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.csBoardAnswerVo.jet_member_no  }">
	<a href="${pageContext.request.contextPath }/csboard/answer_csboard_delete_process.do?jet_board_a_cs_no=${result.csBoardAnswerVo.jet_board_a_cs_no}">삭제</a>
</c:if>
 --%>	
	<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>