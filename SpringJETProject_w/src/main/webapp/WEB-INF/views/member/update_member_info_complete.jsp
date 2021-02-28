<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET Join Member Complete</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>
<body>

	<jsp:include page="../commons/top_blank.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-6 text-center">
				<div class="row mt-5"></div>
				<div class="row mt-5">
					<div class="col ps-0"><h3>회원 정보 수정이 완료되었습니다.</h3></div>
				</div>
				<div class="row mt-1">
					<div class="col"></div>
				</div>
				<div class="row mt-5">
					<div class="col g-gird gap-2 me-4">
						<a class="btn btn-success" href="${pageContext.request.contextPath }/content/main_page.do">메인 페이지로</a>
					</div>
				</div>
				<div class="row"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<jsp:include page="../commons/top_blank.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>