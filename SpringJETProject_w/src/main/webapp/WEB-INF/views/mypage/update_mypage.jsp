<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET - everything 4 jeju travel - my page</title>
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
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
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
				if(nick == ''){
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
					alertBox.innerText = "사용 불가능한 닉네임 입니다.";
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
	
	function formSubmit(){
		if(isConfirmNick == true){
			console.log("[test console nick]");
			alert("닉네임을 확인해주세요.");
			return;
		}
		//submit
		var frmUpdateNick = document.getElementById("frm_update_nick");
		
		frmUpdateNick.submit();
	}

</script>
</head>

<body>
<jsp:include page="../commons/top_image.jsp"/>

<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>정보 수정</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>

		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">회원정보</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/security_mypage.do" style="text-decoration:none;color:#000;font-size:15px;">보안설정</a>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		

        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
                    <div class="row">
                    	<div class="col">
                    		<div><h5>프로필 수정</h5></div>
                    		<div style="font-size:14px">JET 대표 프로필과 별명을 수정 하실 수 있습니다.</div>
                    	</div>
                    </div>
                    <div class="row mt-3">
                    	<div class="col" style="border-top:1px solid #D5D5D5; border-bottom:1px solid #D5D5D5">
                    		
                    	<form id="frm_update_nick" action="${pageContext.request.contextPath }/mypage/update_member_nick_process.do" method="post" enctype="multipart/form-data">
                    		
                    		<div class="row">
                    			<div class="col-2" style="background-color:#F6F6F6;border-right:1px solid #D5D5D5;">
                    				<div style="text-align:center; margin-top:20px;font-size:14px;font-weight: bold;">
                    					프로필사진
                    				</div>	
                    			</div>
                    			<div class="col">
                    				<div class="row">
                    					<div class="col" style="margin-top:10px;margin-left:10px">
                    						<c:choose>
												<c:when test="${!empty resultImage.imageVoList  }">
													<img style="width: 100px;height: 100px;border-radius: 50px;" src="${resultImage.imageVoList[0].jet_member_image_link }" alt="image">	
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/image/profile_basic.PNG" alt="profile">	
												</c:otherwise>
											</c:choose>
                    					</div>
                    				</div>
                    				<div class="row" style="margin:10px">
                    					<div class="col">
                    						<input type="file" name="files" id="formFileMultiple" accept="image/*" class="form-control" id="formFileMultiple" value="파일 업로드" multiple>
                    					</div>
                    				</div>
                    				<div class="row" style="margin:10px">
                    					<div class="col">
                    						<div class="filebox">
											   
											 </div>
                    					</div>
                    				</div>
                    			</div>
                    		</div>
                    
                    		<div class="row" style="border-top:1px solid #D5D5D5;">
                    			<div class="col-2" style="background-color:#F6F6F6;border-right:1px solid #D5D5D5;">
                    				<div style="text-align:center; margin-top:25px;font-size:14px;font-weight: bold;">
                    					NICK
                    				</div>	
                    			</div>
                    			<div class="col">
                    				<div class="row" style="margin:20px 0 20px 10px;" >
                    					<div class="col">
                    						<div>
											    <input onblur="confirmNick()" name="jet_member_nick" id="input_nick"  class="form-control form-control-sm" type="text" value="${result.memberVo.jet_member_nick }" aria-label=".form-control-sm example">
										    	
										    </div>
                    					</div>
                    				</div>
                    				<div class="row mt-1">
										<div id="confirmNick_alert_box" class="col"></div>
									</div>
                    			</div>
                    		</div>
                    	</div>
                    </div>
                   	 <div class="row mt-3">
                    	<div class="col ">
                    		<div style="text-align:center">
                    			<input onclick="formSubmit()" id="member_update" type="button" value="변경">
                    		</div>
                    	</div>
                    </div>
   
                   	</form>
   
                </div>
            </div>
        </div>



<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>