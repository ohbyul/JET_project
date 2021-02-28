<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>JET Join Member Page</title>
<!-- jquery용 스크립트 src -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<script type="text/javascript">
	function updateInfo(){
		var inputPw = document.getElementById("input_pw");
		var pw = inputPw.value;
		var inputNick = document.getElementById("input_nick");
		var nick = inputNick.value;
		var inputPhone = document.getElementById("input_phone");
		var phone = inputPhone.value;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
			}
		}
		xmlhttp.open("post","${pageContext.request.contextPath}/member/update_member_info_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("pw="+pw+"&nick="+nick+"&phone="+phone);
		
		var update = document.getElementById("frm_update");
		update.submit();
	}
</script>
</head>
<body>

	<jsp:include page="../commons/top_blank.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-5">
				<div class="row border">
					<div class="col">
						<form id="frm_update" action="${pageContext.request.contextPath }/member/update_member_info_process.do" method="post">
							<div class="row pt-4">
								<div class="col"><h1>회원 정보수정</h1></div>
							</div>
							<div class="row mt-5">
								<div class="col-3">아이디</div>
								<div class="col">
									<input type="text" class="form-control" placeholder="${result.memberVo.jet_member_id }" disabled>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-3">비밀번호</div>
								<div class="col"><!-- 비밀번호-->
									<input id="input_pw" name="jet_member_pw" type="password" class="form-control" value="${result.memberVo.jet_member_pw }">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-3">이름</div>
								<div class="col"><!-- 이름 -->
									<input type="text" class="form-control" placeholder="${result.memberVo.jet_member_name }" disabled>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col-3">닉네임</div>
								<div class="col"><!-- 닉네임 -->
									<input id="input_nick" name="jet_member_nick" type="text" class="form-control" value="${result.memberVo.jet_member_nick }">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-3">성별</div>
								<div class="col"><!-- 성별-->
									<input type="text" class="form-control" value="${result.memberVo.jet_member_sex }" disabled>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-3">전화번호</div>
								<div class="col"><!-- 전화번호 -->
									<input id="input_phone" name="jet_member_phone" type="text" class="form-control" value="${result.memberVo.jet_member_phone }">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col-3">카카오 아이디</div>
								<div class="col"><!-- 카카오 아이디 -->
									<input type="text" class="form-control" placeholder="${result.memberVo.jet_member_kakao }" disabled>
								</div>
							</div>
							<div class="row mt-3 text-center pt-2 pb-2 ms-1 me-1">
								<div class="col">
									<div class="row ms-1 me-1 border pt-1 pb-1 form-control"><div class="col text-start">여행 관심사</div></div>
									<div class="row mt-3">
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												관광지
												<input type="checkbox" name="jet_interest_name" value="attraction" class="form-check-input">
											</label>
										</div>
									
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												쇼핑
												<input type="checkbox" name="jet_interest_name" value="shopping"  class="form-check-input">
											</label>
										</div>
									
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												액티비티
												<input type="checkbox" name="jet_interest_name" value="activity"  class="form-check-input">
											</label>
										</div>
									
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												힐링
												<input type="checkbox" name="jet_interest_name" value="healing"  class="form-check-input">
											</label>	
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-2">
							</div>
							<div class="row mt-4 pb-4">
								<div class="col d-grid gap-2">
									<input onclick="updateInfo()" type="button" class="btn btn-success" value="정보수정"> <!-- style="background-color: darkorange;" -->
								</div>
								<div class="col d-grid gap-2">
									<a class="btn" href="${pageContext.request.contextPath }/content/main_page.do" style="background-color: orange; color: #ffffff">취소</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row mt-5"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
</body>
</html>