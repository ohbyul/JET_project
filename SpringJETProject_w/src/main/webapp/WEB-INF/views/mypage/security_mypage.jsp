<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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

<script type="text/javascript">
	
	
	function shareplan_write(){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refreshSharePlan();
	
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
		
	
	}
	
	function sharePlanWrite(){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var sharePlanBox = document.getElementById("mypage_box");
				
				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row mt-2");
	
				var ulBox = document.createElement("ul");
				
				
				var nickBox = document.createElement("li");
				nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
				nickBox.innerText = "닉네임이다";
				
				
				rowBox.append(ulBox);
	
				ulBox.append(nickBox);
				
				sharePlanBox.append(rowBox);
	
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
	
	function boardTab(evt, tabName) {
	    var i, tabcontent, tablinks; 
	    tabcontent = document.getElementsByClassName("tabcontent");                           
	    for (i = 0; i < tabcontent.length; i++) { 
	            tabcontent[i].style.display = "none";                                   
	        } 
	        tablinks = document.getElementsByClassName("tablinks");                                                   
	        for (i = 0; i < tablinks.length; i++) { 
	            tablinks[i].className = tablinks[i].className.replace(" active", "");                                       
	        }   
	        document.getElementById(tabName).style.display = "block";                                                           
	        evt.currentTarget.className += " active";                                                                             
	}
	
	function refreshSharePlan(){
		sharePlanWrite();
	}

</script>
</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>

<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>보안 설정</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>


		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/update_mypage.do" style="text-decoration:none;color:#000;font-size:15px;font-weight:bold;">회원정보</a>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">보안설정</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		

	<div class="container mt-4">
		<div class="row">
			<div class="col"></div>
			<div class="col-5">
				<div class="row border">
					<div class="col">
						<form action="${pageContext.request.contextPath }/member/update_member_info_process.do" method="post">
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
									<input name="jet_member_pw" type="password" class="form-control" value="${result.memberVo.jet_member_pw }">
									
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
									<input name="jet_member_nick" type="text" class="form-control" value="${result.memberVo.jet_member_nick }">
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
									<input name="jet_member_phone" type="text" class="form-control" value="${result.memberVo.jet_member_phone }">
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
									<input type="submit" class="btn btn-success" value="정보수정"> <!-- style="background-color: darkorange;" -->
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>