<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!-- <title>JET Login Page</title> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<style>
	#login_btn{
 		color: $yellow-300;
  		background-color: $indigo-900;
	}
	.aa{
		margin-bottom: 8px;
		font-family: 'NotoSansKR';
		font-weight: 400;
		margin-left: 1rem;
		color: #666666;
	}
	
</style>
<script type="text/javascript">
	function enterkey(){
		if(window.event.keyCode == 13){
			loginProcess();
		}
	}
	function loginProcess(){
		var inputId = document.getElementById("input_id");
		var inputPw = document.getElementById("input_pw");
		
		var id = inputId.value;
		var pw = inputPw.value;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				if(xmlhttp.responseText == "rejectedUser"){
					Swal.fire({
						  title: "관리자에 의해 정지된 계정입니다.",
						  text: "계정 정지와 관련된 자세한 사항은 adminJET@gmail.com으로 문의해주시기 바랍니다.",
						  icon: "warning",
						  confirmButtonColor: '#198754',
						  confirmButtonText: '확인'
						})
					return;
				}else if(xmlhttp.responseText == "admin"){
					window.location.href = "${pageContext.request.contextPath}/admin/admin_main_page.do"
				}else if(xmlhttp.responseText == "loginFail"){
					Swal.fire({
						  title: "로그인 실패",
						  text: "아이디와 비밀번호를 확인해주세요.",
						  icon: "warning",
						  confirmButtonColor: '#198754',
						  confirmButtonText: '확인'
						})
					return;
				}else{
					window.location.href = "${pageContext.request.contextPath}/content/main_page.do"
				}
			}
		}
		
		xmlhttp.open("post","${pageContext.request.contextPath }/member/login_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_id="+id+"&jet_member_pw="+pw);
	}
</script>

</head>
<body>

	<jsp:include page="../commons/top_blank.jsp"/>
	<jsp:include page="../font/NanumGothicCoding.jsp"/>
	<div class="container mt-4">
		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<div class="row mt-4" style="box-shadow: 1px 1px 2px 3px #BDBDBD">
					<div class="col p-0 text-center">
						<div class="row p-0 m-0">
							<div class="col p-0">
								<img class="img-fluid" style="width: 100%; height: 102%;" src="${pageContext.request.contextPath }/resources/image/login_image_4.jpg">
							</div>
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col border">
								<div class="row mt-5"></div>
								<div class="row mt-1">
									<div class="col d-grid gap-2">
										<p class="ms-2 fs-2">
											<img style="width: 9rem;" alt="..." src="${pageContext.request.contextPath }/resources/image/lettering_logo.png">
										</p>
									</div>
								</div>
								<div class="row mt-4"></div>
								<form id="frm_login_process">
									<div class="row mt-3">
										<div class="col d-grid gap-2">
											<input id="input_id" name="jet_member_id" type="text" placeholder="Email" class="text-muted border-top-0 border-start-0 border-end-0 border-bottom">
										</div>
									</div>
									<div class="row mt-2">
										<div class="col d-grid gap-2" onkeyup="enterkey()">
											<input id="input_pw" name="jet_member_pw" type="password" placeholder="Password" class="text-muted border-top-0 border-start-0 border-end-0 border-bottom">
										</div>
									</div>
									<div class="row mt-5"></div>
									<div class="row mt-4">
										<div class="col d-grid gap-2">
											<input onclick="loginProcess()" id="login_btn" type="button" value="로그인" style="background-color: darkorange;color: #ffffff;font-family: 'NotoSansKR'; font-weight: 600;" class="btn">
										</div>
									</div>
								</form>
								<div class="row mt-5"></div>
								<div class="row mt-5"></div>
								<div class="row mt-5"></div>
								<div class="row mt-5"></div>
								<div class="row mt-2">
									<div class="col">
										<a class="text-muted fw-light" href="${pageContext.request.contextPath }/member/join_member_page.do" style="font-family: 'NotoSansKR'; font-weight: 500;">회원가입</a>
									</div>
									<div class="col-3"></div>
									<div class="col-5">
										<p class="text-end"><a class="text-muted fw-light" href="#" style="font-family: 'NotoSansKR'; font-weight: 500;">ID/PW 찾기</a></p>
									</div>
								</div>
								<div class="row"></div>
							</div>	
						</div>
					</div>
				</div>
				<div class="row mt-4" style="box-shadow: 1px 1px 1px 2px #BDBDBD;">
					<div class="col p-1">
						<p class="aa">테스트 <strong>관리자</strong> 아아디/비밀번호 : admin01@aaa.com / admin01</p>
						<p class="aa">테스트 <strong>사용자</strong> 아이디/비밀번호 : user01@aaa.com / user01</p>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>	
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
	<!-- 부트스트랩 js태그 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>