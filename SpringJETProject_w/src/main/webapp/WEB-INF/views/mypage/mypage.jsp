<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET-my page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

<script type="text/javascript">
	function my_upgrade(){
		
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					refreshUpgrade();
				}
					
			};
			xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("");
			
			
		}		
	//등업확인
	function upgradeView(){
		
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.upgradeChk == true){
					var upgrade = document.getElementById("upgrade");
					upgrade.setAttribute("type","button");
					upgrade.setAttribute("class","btn btn-secondary btn-sm" );
					upgrade.setAttribute("value","대기중입니다.")
					upgrade.setAttribute("disabled","");
				}else{
					var upgrade = document.getElementById("upgrade");
					upgrade.setAttribute("type","button");
					upgrade.setAttribute("onclick","my_upgrade()");
					upgrade.setAttribute("value","등업신청");
					

				}

			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/upgrade_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("");
	}		
		
	function refreshUpgrade(){
		upgradeView();
	}
	
</script>
</head>
<body onload="upgradeView();" style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
		
<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>나의 정보 </h2></div>
		
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
		
        </div>	
<%--사이드바 끝 --%>
	
		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px;background-color:#fff;margin-top:0px;">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">회원정보</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
					
				</div>
			</div>
			<div class="col-3"></div>
		</div>

        <div class="container" style="margin:65px 0 600px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col" style="border:1px solid #D5D5D5;margin-right:12px;width:300px;background-color:#fff;"> 
							<div class="row">
								<div class="col" style="margin:15px 0 0 15px">
									<div class="row">
										<div class="col">
											<h4>JET 프로필</h4>	
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin-left:15px;">
											
											<c:choose>
												<c:when test="${!empty result.imageVoList  }">
													<img style="width: 100px;height: 100px;border-radius: 50px;" src="${result.imageVoList[0].jet_member_image_link }" alt="image">	
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/image/profile_basic.PNG" alt="profile">	
												</c:otherwise>
											</c:choose>
											
										</div>
									</div>
									<div class="row mt-2"> 
										<div class="col" style="margin-left:15px">
											닉네임 : ${result.memberVo.jet_member_nick }
										</div>
									</div>								
								</div>
								<div class="col">
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											등급 : ${result.memberVo.jet_member_grade }	
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											이름 : ${result.memberVo.jet_member_name }
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											성별 : ${result.memberVo.jet_member_sex }
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											<a style="color:black;text-decoration:none;" href="${pageContext.request.contextPath}/mypage/write_mypage.do">내가 작성한 글 (${writeCT })</a>
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											<a style="color:black;text-decoration:none;" href="${pageContext.request.contextPath}/mypage/wrote_reple_mypage.do">내가 작성한 댓글 (${repleCT })</a>
										</div>
									</div>	
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											<c:choose>
												<c:when test="${writeCT >= 5 && repleCT >=15 }">
														<div onclick="upgradeView();">
															<input id="upgrade" onclick="my_upgrade()">
														</div>
													
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-secondary btn-sm" disabled>등업신청</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>																	
								</div>
							</div>
							

						</div>
						<div class="col" style="border:1px solid #D5D5D5;margin-left:12px;width:300px;background-color:#fff;"> 
							<div class="row">
								<div class="col" style="margin:15px 0 0 15px">
									<h4>연락처</h4>
								</div>
							</div>
							<div class="row">
								<div class="col" style="margin-left:15px;margin-top:5px;font-size:14px;">
									<div class="row">
										<div class="col-3">
											이메일
										</div>
										<div class="col-9">
											${result.memberVo.jet_member_id }
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col" style="margin-left:15px;margin-top:5px;font-size:14px;">
									<div class="row">
										<div class="col-3">
											KAKAO ID
										</div>
										<div class="col-9">
											${result.memberVo.jet_member_kakao }
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col" style="margin-left:15px;margin-top:5px;font-size:14px;">
									<div class="row">
										<div class="col-3">
											연락처
										</div>
										<div class="col-9">
											${result.memberVo.jet_member_phone }
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
        

        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>