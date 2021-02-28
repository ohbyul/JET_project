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

<jsp:include page="../commons/top_image_2.jsp"/>


	<div class="container">
		<div class="row mt-5">
			<div class="col-1"></div>
			<div class="col">
			<p id="title_knowhow">노하우 작성</p>
			<hr>
			</div>
			<div class="col-1"></div>
		</div>
		
		<div class="row mt-2">
			<div class="col-1"></div>
			<div class="col">
				<!-- 중앙 -->
				<!-- 입력 폼 -->
				<form id="posting-form"
					action="${pageContext.request.contextPath}/knowhowboard/write_knowhowboard_process.do"
					method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col">
								<span class="badge rounded-pill bg-success">작성자</span>
								${sessionUser.jet_member_nick}
						</div>
					</div>
					<div class="row mt-3">
					
						<div class="col-2">
							<select class="form-select" name="jet_board_knowhow_category_no" id="category">
								<option selected disabled>말머리 선택</option>
								<option value="1">꿀팁</option>
								<option value="2">노하우</option>
								<option value="3">기타</option>
							</select>
						</div>
						
						<div class="col">
							<input type="text" name="jet_board_knowhow_title"
								class="form-control" placeholder="제목" id="title">
						</div>
						
					</div>
					<div class="row mt-3">
						<!-- 이미지 -->
						<div class="col">
							<input type="file" name="files" accept="image/*" multiple
								class="form-control">
						</div>
					</div>

					<div class="row mt-3">
						<div class="col">
							<textarea name="jet_board_knowhow_content" rows="10" cols="5000"
								class="form-control" placeholder="내용" id="content"></textarea>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<input class="btn btn-success" type="button" 
								value="글쓰기" onclick="postingSubmit()">
						</div>
					</div>
				</form>
				<!-- 입력 폼 -->

			</div>
			<div class="col-1"></div>
		</div>
	</div>

<script>
function postingSubmit() {
	
	var category = document.getElementById("category");
	var categoryIndex = document.getElementById("category").options.selectedIndex;
	var title = document.getElementById("title");
	var content = document.getElementById("content");

	if (categoryIndex == "") {
		alert("말머리를 선택해 주세요.");
		category.focus();
		return;
	}
	
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>