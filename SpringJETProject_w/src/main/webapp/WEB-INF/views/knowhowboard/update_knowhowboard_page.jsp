<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<jsp:include page="../font/NanumGothicCoding.jsp"/>
	<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<title>knowhowboard_page</title>
<style type="text/css">
	#title_knowhow{
		font-family: 'NotoSansKR';
		font-weight: 500;
		font-size: 2.5rem;
	}
</style>
</head>
<body>

<jsp:include page="../commons/top_image.jsp"/>
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-1"></div>
			<div class="col">
			<p id="title_knowhow">노하우 수정</p>
			<hr>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-2">
			<div class="col-1"></div>
			<!-- 여백 -->
			<div class="col">
				<!-- 중앙 -->

				<!-- 글 수정 폼 -->
				<form id="posting-form"
					action="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_process.do"
					method="post">
					<div class="row mt-3">
						<div class="col-2">
							<select class="form-select" name="jet_board_knowhow_category_no">
								<option value="1" <c:if test="${result.categoryVo.jet_board_knowhow_category_no == 1}">selected</c:if>>꿀팁</option>
								<option value="2" <c:if test="${result.categoryVo.jet_board_knowhow_category_no == 2}">selected</c:if>>노하우</option>
								<option value="3" <c:if test="${result.categoryVo.jet_board_knowhow_category_no == 3}">selected</c:if>>기타</option>
							</select>
						</div>
						<div class="col">
							<input type="text" name="jet_board_knowhow_title"
								value="${result.knowhowBoardVo.jet_board_knowhow_title}"
								class="form-control" placeholder="제목" id="title">
						</div>
						<%--
						<div class="col-2">${sessionUser.jet_member_nick}</div>
						<div class="col-2">작성일</div>
						 --%>
					</div>
					<div class="row mt-3">
						<!-- 이미지 -->
						<div class="col">
							<input class="form-control" type="file" id="formFile">
						</div>
					</div>
					<div class="row mt-3">
						<!-- 내용 -->
						<div class="col">
							<textarea name="jet_board_knowhow_content" rows="10" cols="500"
								class="form-control" placeholder="내용" id="content">${result.knowhowBoardVo.jet_board_knowhow_content}</textarea>
						</div>
					</div>

					<div class="row mt-3">
						<!-- 버튼 -->
						<div class="col">
						<!-- 
							<input type="hidden" name="jet_board_knowhow_no"
								value="${result.knowhowBoardVo.jet_board_knowhow_no}"> <input
								class="btn btn-success" type="submit" value="수정하기">
								 -->
								 <input class="btn btn-success" type="button" value="작성하기" onclick="postingSubmit()">
								
								
						</div>
					</div>
					<input type="hidden" name="jet_board_knowhow_no"
								value="${result.knowhowBoardVo.jet_board_knowhow_no}">
				</form>

			</div>

			<div class="col-1"></div>
			<!-- 여백 -->
		</div>
	</div>
	

<script>
function postingSubmit() {
	
	var title = document.getElementById("title");
	var content = document.getElementById("content");
	
	if (title.value == "" || title.value.trim() == "") {
		alert("제목을 작성해 주세요.");
		title.focus();
		return;
	}
	if (content.value == "" || content.value.trim() == "") {
		alert("내용을 작성해 주세요.");
		content.focus();
		return;
	}
	
	var postingForm = document.getElementById("posting-form");
	postingForm.submit();
	
}
</script>

<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>