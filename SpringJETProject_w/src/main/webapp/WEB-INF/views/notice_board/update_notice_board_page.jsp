<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
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
						<h1>공지사항 수정</h1>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
				<form action="${pageContext.request.contextPath }/notice_board/update_notice_board_process.do" method="post">
				
				<div class="row mt-3">
					<div class="col-2">
						작성자
					</div>
					<div class="col">
						${result.memberVo.jet_member_nick }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						제목
					</div>
					<div class="col">
						<input class="form-control" type="text" name="jet_board_notice_title" value="${result.noticeBoardVo.jet_board_notice_title } ">
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						내용
					</div>
					<div class="col">
						<textarea class="form-control" rows="10" cols="60" name="jet_board_notice_content">${result.noticeBoardVo.jet_board_notice_content }</textarea>
					</div>
				</div>
				
				<input type="hidden" name="jet_board_notice_no" value="${result.noticeBoardVo.jet_board_notice_no }">
				
				<div class="row mt-3">
					<div class="col-10"></div>
					<div class="col d-grid gap-2 d">
						<input class="btn btn-primary" type="submit" value="글  수정">
					</div>
				</div>
				
				</form>
				
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
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>