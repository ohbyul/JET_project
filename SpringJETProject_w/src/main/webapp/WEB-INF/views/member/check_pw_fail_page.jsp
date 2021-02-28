<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET check password fail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

	<jsp:include page="../commons/top_blank.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-8">
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row text-center mt-5">
					<div class="col"><h3>비밀번호를 확인해주세요.</h3></div>
				</div>
				<div class="row text-center mt-5">
					<div class="col g-gird gap-2 text-center">
						<a class="btn btn-success" href="${pageContext.request.contextPath }/member/check_pw_page.do">뒤로 가기</a>
					</div>
				</div>
				<div class="row mt-2"></div>
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