<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	function formSubmit(){
		//정규표현식 이메일
		var inputId = document.getElementById("input_id");
		//var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		//if(!regExp.test(inputId.value)/*inputId.value == ""*/){
	//		alert("아이디는 이메일 형식이어야 합니다.");//나중에서 alert말고 부트스트랩으로 더 복잡하게 할 것
	//		inputId.value = "";//정규표현식에 맞지 않으면 썼던게 사라짐
	//		inputId.focus();
	//		return;
	//	}
		//정규표현식 비밀번호
		var inputPw = document.getElementById("input_pw");
	//	var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; // 비번 정규식 = 8 ~ 10자 영문, 숫자 조합
		
	//	if(!regExp.test(inputPw.value)){
	//		alert("비밀번호는 8~10자의 영문, 숫자 조합으로 입력해주세요.");
	//		inputPw.value = "";//정규표현식에 맞지 않으면 썼던게 사라짐
	//		inputPw.focus();
	//		return;
	//	}
		
		//전화번호
		
		var inputPwConfirm = document.getElementById("input_pw_confirm");
		
		if(inputPw.value != inputPwConfirm.value){
			alert("비밀번호를 확인해주세요");
			inputPw.value = "";
			inputPwConfirm.value = "";
			inputPw.focus();
			return;
		}
		
		if(isConfirmId == false){
			console.log("[test console]");
			alert("이메일을 확인해주세요.");
			inputId.value = "";
			inputId.focus();
			return;
		}
		var inputNick = document.getElementById("input_nick");
		if(isConfirmNick == true){
			console.log("[test console nick]");
			alert("닉네임을 확인해주세요.");
			inputNick.value = "";
			inputNick.focus();
			return;
		}
		
		var inputName = document.getElementById("input_name");
		if(inputName.value == "" || inputName.value.trim() == ""){
			var nameAlertBox = document.getElementById("confirmName_alert_box");
			var alertBox = document.createElement("div");
			alertBox.setAttribute("class","text-end");
	 		alertBox.setAttribute("style","color : red;");
	 		alertBox.innerText = "이름을 입력해주세요!";
	 		inputName.value = "";
	 		inputName.focus();
	 		nameAlertBox.append(alertBox);
	 		
	 		setTimeout(function(){
	 			nameAlertBox.innerHTML = "";
	 		},1500);
	 		return;
			
		}		
		var inputPhone = document.getElementById("input_phone");
		var regExp =  /^[0-9]*$/;
		if(inputPhone.value == "" || inputPhone.value.trim() == "" || !regExp.test(inputPhone.value)){
			var phoneAlertBox = document.getElementById("confirmPhone_alert_box");
			var alertBox = document.createElement("div");
			alertBox.setAttribute("class","text-end");
	 		alertBox.setAttribute("style","color : red;");
	 		alertBox.innerText = "전화번호를 입력해주세요!";
	 		inputPhone.value = "";
	 		inputPhone.focus();
	 		phoneAlertBox.append(alertBox);
	 		
	 		setTimeout(function(){
	 			phoneAlertBox.innerHTML = "";
	 		},1500);
	 		return;
			
		}
		
		var inputKakao = document.getElementById("input_kakao");
		
		if(inputKakao.value == "" || inputKakao.value.trim() == ""){
			var kakaoAlertBox = document.getElementById("confirmKakao_alert_box");
			var alertBox = document.createElement("div");
			alertBox.setAttribute("class","text-end");
	 		alertBox.setAttribute("style","color : red;");
	 		alertBox.innerText = "카카오 아이디를 입력해주세요!";
	 		kakaoAlertBox.append(alertBox);
			
	 		setTimeout(function(){
	 			kakaoAlertBox.innerHTML = "";
	 		},1500);
	 		return;
		}
		
		
		//가입 동의 3개 오별
		var checkbox1 = document.getElementById("check_16").checked;
		if(!checkbox1){
            alert('16세 미만은 가입하지 못합니다.');
            return;
        } 
		
		var checkbox2 = document.getElementById("check_service").checked;
		if(!checkbox2){
            alert('이용 약관 미동의시 가입 불가입니다.');
            return;
        } 
		
		var checkbox3 = document.getElementById("check_privacy_policy").checked;
		if(!checkbox3){
            alert('개인정보 처리 방침 미 동의시 가입 불가합니다.');
            return;
        } 
		
		
		//submit
		var frmJoinMember = document.getElementById("frm_join_member");
		
		frmJoinMember.submit();
	}
	
	
	
	//아이디 확인
	var isConfirmId = false;
	
	function confirmId(){
		//바닐라 js
		var inputId = document.getElementById("input_id");
		var inputMailserver = document.getElementById("input_mailserver");
		var inputAt = document.getElementById("input_at");
		var id = inputId.value+inputAt.value+inputMailserver.value;
		var id1 = inputId.value
		var id2 = inputMailserver.value;
		var id3 = inputId.value+inputMailserver.value;
		var xmlhttp = new XMLHttpRequest();
		
		isConfirmId = false;
					
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				if(xmlhttp.responseText == "true"){//아이디 중복 O
					//가입 불가능
					//js로 동적으로 태그를 생성하고 컨트롤, ajax가 들어가면 필연적으로 여기가 들어감
					isConfirmId = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "중복된 이메일 입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirm_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
					
				}else if(id == ""|| id3 == "" || id.trim() == "@" || id1 == "" || id2 == ""){//아이디 중복 X
					//가입 가능
					isConfirmId = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "이메일을 입력해주세요";
					alertBox.style.color = "black";
					
					var positionBox = document.getElementById("confirm_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}else{
					isConfirmId = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 가능한 이메일 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirm_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}
				
			}
		};
	
		xmlhttp.open("post","${pageContext.request.contextPath}/member/exist_id.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("id="+id);
		
	}
	
	var isConfirmNick = false;
	
	function confirmNick(){
		var inputNick = document.getElementById("input_nick");
		var nick = inputNick.value;
		console.log("[test confirmNick]"+nick);
		var regExp = /^[a-zA-Zㄱ-힣0-9]*$/;
		var xmlhttp = new XMLHttpRequest();
		
		isConfirmNick = false;
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				if(!regExp.test(nick)){
					isConfirmNick = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "닉네임은 한글, 영문, 숫자만 입력 가능합니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
					return;
				}
				
				if(nick == ""){
					isConfirmNick = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "닉네임을 입력해주세요";
					alertBox.style.color = "black";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
					
					
				}else if(xmlhttp.responseText == "false" && regExp.test(inputNick.value)){
					isConfirmNick = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 가능한 닉네임 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}else{
					isConfirmNick = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "중복된 닉네임 입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}
			
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/member/exist_member_nick.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_nick="+nick);	
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
						<form id="frm_join_member" action="${pageContext.request.contextPath }/member/join_member_process.do" method="post">
							<div class="row pt-4">
								<div class="col"><h1>회원가입</h1></div>
							</div>
							<div class="row mt-5">
								<div class="input-group">
								  <input onblur="confirmId()"type="text" id="input_id" name="jet_member_id" class="form-control" placeholder="이메일" aria-label="E-Mail">
								  <span class="input-group-text">@</span>
								  <input type="hidden" id="input_at" name="jet_member_id" value="@">
								  <input onblur="confirmId()" id="input_mailserver"  name="jet_member_id" type="text" class="form-control" placeholder="ex) gmail.com" aria-label="ex) gmail.com">
								</div>
							</div>
							<div class="row mt-1">
								<div id="confirm_alert_box" class="col"></div>
							</div>
							<div class="row mt-3">
								<div class="col"><!-- 비밀번호-->
									<input id="input_pw" name="jet_member_pw" type="password" class="form-control" placeholder="비밀번호는 8 ~ 10자 영문, 숫자 조합으로 입력해주세요.">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col"><!-- 비밀번호 확인-->
									<input id="input_pw_confirm" type="password" class="form-control" placeholder="비밀번호 확인">
								</div>
							</div>
							
							<div class="row mt-3">
								<div class="col"><!-- 이름 -->
									<input id="input_name" name="jet_member_name" type="text" class="form-control" placeholder="이름">
								</div>
							</div>
							<div class="row mt-1">
								<div id="confirmName_alert_box" class="col"></div>
							</div>
							<div class="row mt-2">
								<div class="col"><!-- 닉네임 -->
									<input onblur="confirmNick()" id="input_nick" name="jet_member_nick" type="text" class="form-control" placeholder="닉네임">
								</div>
							</div>
							<div class="row mt-1">
								<div id="confirmNick_alert_box" class="col"></div>
							</div>
							<div class="row mt-3 text-center">
								<div class="col"><!-- 성별-->
									<label class="form-check-label" for="flexRadioDefault1">
										남(Male)
									</label>
									<input name="jet_member_sex" value="Male" class="form-check-input" type="radio" id="flexRadioDefault1" checked>
								</div>
								<div class="col">
									<label class="form-check-label" for="flexRadioDefault2">
										여(Female)
									</label>
									<input name="jet_member_sex" value="FeMale" class="form-check-input" type="radio" id="flexRadioDefault2">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col"><!-- 전화번호 -->
									<input id="input_phone" name="jet_member_phone" type="text" class="form-control" placeholder="010xxxxxxxx">
								</div>
							</div>
							<div class="row mt-1">
								<div id="confirmPhone_alert_box" class="col"></div>
							</div>
							<div class="row mt-2">
								<div class="col"><!-- 카카오 아이디 -->
									<input id="input_kakao" name="jet_member_kakao" type="text" class="form-control" placeholder="카카오 ID">
								</div>
							</div>
							<div class="row mt-1">
								<div id="confirmKakao_alert_box" class="col"></div>
							</div>
							<div class="row mt-3 text-center pt-2 pb-2 ms-1 me-1">
								<div class="col"><!-- 관심사 체크박스 --><!-- 여러 개가 선택되면 배열로 날아감 -->
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
							
							<div class="row mt-2"><!-- 16세 -->
								<div class="col">
									<input type="checkbox" id="check_16" class="form-check-input">
									16세 이상 입니다.
								</div>
							</div>
							
							<div class="row mt-2"><!-- 이용 약관 -->
								<div class="col">
									<input type="checkbox" id="check_service" class="form-check-input">
									<a class="link-danger" href="${pageContext.request.contextPath }/content/Terms_of_service.do" target="_blank">이용 약관</a>에 동의합니다.
								</div>
							</div>
							
							<div class="row mt-2"><!-- 개인정보 처리 방침 -->
								<div class="col">
									<input type="checkbox" id="check_privacy_policy" class="form-check-input">
									<a class="link-info" href="${pageContext.request.contextPath }/content/Privacy_Policy.do" target="_blank">개인정보 처리방침 안내</a>에 동의 합니다.
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col">
									<input name="jet_member_grade" type="hidden" value="0">
									<input name="jet_member_credit" type="hidden" value="0">
								</div>
							</div>
							<div class="row mt-4 pb-4">
								<div class="col d-grid gap-2">
									<input onclick="formSubmit()" type="button" class="btn btn-success" value="회원가입"> <!-- style="background-color: darkorange;" -->
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