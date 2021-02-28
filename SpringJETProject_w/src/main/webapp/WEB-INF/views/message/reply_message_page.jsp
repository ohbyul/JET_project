<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

<script type="text/javascript">

		function formSubmit(){
			
			var titleBox = document.getElementById("titleBox");
			var taBox = document.getElementById("taBox");
			
			if(titleBox.value == "Re: "+"" || titleBox.value.trim() == ""){
		 		var bottomCol = document.getElementById("bottom_col");
		 		var alertBox = document.createElement("div");
		 		alertBox.setAttribute("class","text-center");
		 		alertBox.setAttribute("style","color : red;");
		 		alertBox.innerText = "쪽지 제목을 입력해주세요.";
		 		bottomCol.append(alertBox);
		 		
		 		setTimeout(function(){
		 			bottomCol.innerHTML = "";
		 		},1000);
		 		return;
		 	}
		 	
		 	if(taBox.value == "" || taBox.value.trim() == ""){
		 		var bottomCol = document.getElementById("bottom_col");
		 		var alertBox = document.createElement("div");
		 		alertBox.setAttribute("class","text-center");
		 		alertBox.setAttribute("style","color : red;");
		 		alertBox.innerText = "쪽지 내용을 입력해주세요.";
		 		bottomCol.appendChild(alertBox);
		 		
		 		setTimeout(function(){
		 			bottomCol.innerHTML = "";
		 		},1000);
		 		return;
		 	}
			
			
			var frmReplyMessage = document.getElementById("frm_reply_message");
			frmReplyMessage.submit();
		}
</script>
</head>
<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>받은 쪽지함</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>
        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-10">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col"></div>
						<div class="col-8">
							<div class="row mt-2">
					            <div class="col-4"></div>
					            <div class="col-4"></div>
					            <div class="col text-end" >home > message</div>
					        </div>
					        <div class="row mt-2">
								<div class="col">
									<h4>쪽지 답장</h4>
								</div>
							</div>
					        <div class="row">
					        	<div class="col">
					        		<hr>
					        	</div>
					        </div>
							<form id="frm_reply_message" action="${pageContext.request.contextPath }/message/reply_message_process.do" method="post">
								<div class="row">
									<div class="col-2 d-grid gap-2 input-group-text">작성자</div>
									<div class="col d-grid gap-2 form-control text-center">${sessionUser.jet_member_nick }</div>
								</div>
								<div class="row mt-1"><%--현재는 임시로 받는 사람을 작성하도록 함. insert가 목표 --%>
									<div class="col-2 d-grid gap-2 input-group-text">받는 사람</div> 
									<div class="col d-grid gap-2 form-control">
										<input class="col text-center" type="text" value="${result.memberSenderNick.jet_member_nick }" disabled>
										<input type="hidden" name="jet_member_receiver" value="${result.messageVo.jet_member_sender }">
										<input type="hidden" name="jet_message_no" value="${result.messageVo.jet_message_no }">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-2 d-grid gap-2 input-group-text">제목</div>
									<div class="col d-grid gap-2 form-control">
										<input id="titleBox" name="jet_message_title" type="text" value="Re: ">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid gap-2 text-center input-group-text ps-0 pe-0">내용</div>
								</div>
								<div class="row mt-1">
									<div class="col d-grid gap-2 ps-0 pe-0">
										<textarea id="taBox" name="jet_message_content" rows="10" cols="60" class="form-control ps-0 pe-0" aria-label="내용"></textarea>	
									</div>
								</div>
								<div class="row mt-2">
									<div id="bottom_col" class="col d-grip gap-2"></div>
									<div class="col-6 d-grip gap-2 text-end pe-0">
										<a class="btn btn-outline-success" type="button" href="${pageContext.request.contextPath }/message/message_page.do">목록으로</a>
										<input onclick="formSubmit()" class="btn btn-success" type="button" value="쪽지 보내기">
									</div>
								</div>
							</form>	
						</div>
						<div class="col"></div>
                </div>
                
            </div>
        </div>
     </div>
        
        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>        	
</body>
</html>