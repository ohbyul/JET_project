<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

<script type="text/javascript">
/*
var jet_member_no = null;

var xmlhttp = new XMLHttpRequest();

xmlhttp.onreadystatechange = function(){
	if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
		var obj = JSON.parse(xmlhttp.responseText);
		
		if(obj.result == "success"){
			jet_member_no = obj.sessionNo;
		}else{
			console.log(obj.reason);
		}
		
	}
};

xmlhttp.open("get","${pageContext.request.contextPath }/member/getSessionNo.do");
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send();

*/
//모달창에 참여자들 출력 
function getAttendList(jet_board_party_no) {
	
	var AttendListBox = document.getElementById("AttendListBox");
	
	var childCount = AttendListBox.childNodes.length ;
	for(var i =0 ; i < childCount ; i++){
		AttendListBox.childNodes[0].remove();
	}
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var obj = JSON.parse(xmlhttp.responseText);
			
			for(Data of obj){
				
				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row");
				
				var nickBox = document.createElement("div");
				nickBox.setAttribute("class","col");
				var nick = document.createElement("p");
				nick.setAttribute("class","form-control");
				nick.innerText = Data.memberVo.jet_member_nick;
				
				var ratingBox = document.createElement("div"); 
				ratingBox.setAttribute("class","col");
				var selectBox = document.createElement("select"); 
				selectBox.setAttribute("class","form-select");
				selectBox.setAttribute("name","jet_party_rating_value");
				selectBox.setAttribute("id","rating_value_box");
				
				var rating5 = document.createElement("option"); 
				rating5.setAttribute("value","5");
				rating5.innerText = "★★★★★" ;
				var rating4 = document.createElement("option"); 
				rating4.setAttribute("value","4");
				rating4.innerText = "★★★★" ;
				var rating3 = document.createElement("option"); 
				rating3.setAttribute("value","3");
				rating3.innerText = "★★★" ;
				var rating2 = document.createElement("option"); 
				rating2.setAttribute("value","2");
				rating2.innerText = "★★" ;
				var rating1 = document.createElement("option"); 
				rating1.setAttribute("value","1");
				rating1.innerText = "★" ;
				
				var sendBox = document.createElement("div"); 
				sendBox.setAttribute("class","col-3");
				//sendBox.setAttribute("id","ratingBtnBox");
				var sendBtn = document.createElement("input"); 
				sendBtn.setAttribute("type","button");
				sendBtn.setAttribute("class","btn btn-success form-control");
				sendBtn.setAttribute("value","평가");
				sendBtn.setAttribute("onclick","insertRating(this,"+jet_board_party_no+","+Data.memberVo.jet_member_no+")");

				
				rowBox.append(nickBox);
				nickBox.append(nick);
				
				rowBox.append(ratingBox);
				ratingBox.append(selectBox);
				selectBox.append(rating5);
				selectBox.append(rating4);
				selectBox.append(rating3);
				selectBox.append(rating2);
				selectBox.append(rating1);
				
				
				rowBox.append(sendBox);
				sendBox.append(sendBtn);
								
				AttendListBox.append(rowBox);
		
			}
		}	
	};
	xmlhttp.open("post","${pageContext.request.contextPath}/mypage/get_approve_membervo_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_party_no="+jet_board_party_no);

}
	//평가 인서트 
	function insertRating(target,jet_board_party_no,jet_member_no) {
		
		var selectBox = target.closest(".row").querySelector(".form-select");
		var jet_party_rating_value = selectBox.selectedOptions[0].value;
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/insert_rating_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_party_no="+jet_board_party_no+"&jet_party_rating_value="+jet_party_rating_value);
	
	}

	//평가 유무 체크
/*	function checkRating() {

	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);
			for(i=0 ; i<obj.length;i++){
				
				
				if(obj.existRatingVo == true){
					var sendBtn = document.createElement("input"); 
					sendBtn.setAttribute("type","button");
					sendBtn.setAttribute("class","btn btn-secondary btn-lg disabled");
					sendBtn.setAttribute("value","평가완료");
					
				} else{
					var sendBtn = document.createElement("input"); 
					sendBtn.setAttribute("type","button");
					sendBtn.setAttribute("class","btn btn-success form-control");
					sendBtn.setAttribute("value","평가");
					sendBtn.setAttribute("onclick","insertRating(this,"+jet_board_party_no+","+Data.memberVo.jet_member_no+")");

				}
			}//포문			

		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath }/notice_board/check_rating_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_party_no=" + jet_board_party_no+"&jet_member_no="+jet_member_no);
		
	}
*/	

</script>
</head>
<body <%--onload="checkRating()" --%>>
<jsp:include page="../commons/top_image.jsp"/>
<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>참가중인 파티</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>

	<%--탭 메뉴 --%>
		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/recruitment_mypage.do" style="text-decoration:none;color:#000;font-size:15px;">개설한 파티 </a>
						
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/attend_mypage.do" style="text-decoration:none;color:#000;font-size:15px;">참가중 파티</a>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/after_rating_page.do" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">친구 평가</a>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	<%--탭메뉴 끝 --%>

        <div class="container" style="margin:115px 0 700px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					
					<div class="row" style="border: 3px solid rgba(0,0,0,.125);">
						<div class="col mx-2 my-2">
							
							<div class="row">
								<div class="col font-monospace" style="font-size: 20px;">I opened</div>
							</div>
							
							<c:forEach items="${result }" var="data">
								
								<div class="row mt-2" style="border: 1px solid rgba(0,0,0,.125);background-color: #f6f6f6;border-radius: 10px;">
									<div class="col-4" style="margin: 20px;padding: 0;">
										<c:choose>
											<c:when test="${!empty data.thumbnail }">
												<div><img style="width: 300px;height: 150px;" class="card-img-top" src="${data.thumbnail[0].jet_board_party_image_link }" alt="image"></div>
											</c:when>
											<c:otherwise>
												<div><img style="width: 300px;height: 150px;" src="${pageContext.request.contextPath }/resources/image/rock.jpg" class="card-img-top"></div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col" style="margin: 20px;">
										<div class="row">
											
											<div class="col"><h3>${data.partyBoardVo.jet_board_party_title }</h3></div>
											<div class="col-3" style="text-align: right;"><span style="background-color: orange;color: white;padding: 5px;border-radius: 10px;font-weight: bold;"> [ ${data.partyBoardVo.jet_board_party_fixcount } /  ${data.partyBoardVo.jet_board_party_headcount } ] </span></div>
										</div>
										
										<div class="row mt-2">
											<div class="col text-muted"><i class="fas fa-plane-departure"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_tsday }"/></div>
										</div>
										
										<div class="row mt-2">
											<div class="col"><i class="fas fa-user-edit"></i> ${data.memberVo.jet_member_nick }<%--세션..${sessionUser.jet_member_nick } --%></div>
										</div>
										
										<div class="row mt-2">
											<div class="col"><input type="button" value="친구평가"  onclick="getAttendList(${data.partyBoardVo.jet_board_party_no})" data-bs-toggle="modal" data-bs-target="#AttendListModal"></div>
										</div>
										
									</div>	<%--사진옆 col끝 --%>
								</div>
							</c:forEach>
						</div> 
					</div>		<%--내가 개설한 row끝 --%>		
						
					

					
					<div class="row mt-4" style="border: 3px solid rgba(0,0,0,.125);">	<%--내가 참여한 --%>
						<div class="col mx-2 my-2">
							
							<div class="row">
								<div class="col font-monospace" style="font-size: 20px;">I attended</div>
							</div>
							
							<c:forEach items="${attendResult }" var="resultData">
								
								<div class="row mt-2" style="border: 1px solid rgba(0,0,0,.125);background-color: #f6f6f6;border-radius: 10px;">
									<div class="col-4" style="margin: 20px;padding: 0;">
										<c:choose>
											<c:when test="${!empty resultData.thumbnail }">
												<div><img style="width: 300px;height: 150px;" class="card-img-top" src="${resultData.thumbnail[0].jet_board_party_image_link }" alt="image"></div>
											</c:when>
											<c:otherwise>
												<div><img style="width: 300px;height: 150px;" src="${pageContext.request.contextPath }/resources/image/rock.jpg" class="card-img-top"></div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col" style="margin: 20px;">
										<div class="row">
											
											<div class="col"><h3>${resultData.partyBoardVo.jet_board_party_title }</h3></div>
											<div class="col-3" style="text-align: right;"><span style="background-color: orange;color: white;padding: 5px;border-radius: 10px;font-weight: bold;"> [ ${resultData.partyBoardVo.jet_board_party_fixcount } /  ${resultData.partyBoardVo.jet_board_party_headcount } ] </span></div>
										</div>
										
										<div class="row mt-2">
											<div class="col text-muted"><i class="fas fa-plane-departure"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${resultData.partyBoardVo.jet_board_party_tsday }"/></div>
										</div>
										
										<div class="row mt-2">
											<div class="col"><i class="fas fa-user-edit"></i> ${resultData.writerMemberVo }</div>
										</div>
										
										<div class="row mt-2">
											<div class="col"><input type="button" value="친구평가" onclick="getAttendList(${resultData.partyBoardVo.jet_board_party_no})"  data-bs-toggle="modal" data-bs-target="#AttendListModal"></div>
										</div>
										
									</div>	<%--사진옆 col끝 --%>
								</div>
							</c:forEach>
						</div> 
					</div>		<%--내가참여한 row끝 --%>			
					
					<%--모달창 --%>
					<div class="modal fade" id="AttendListModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					     
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">친구 별점주기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					     
					      <div class="modal-body">
					      		<div id="AttendListBox"></div>		<%--에이작스 출력 박스 --%>
					      	</div>
					      
					      <div class="modal-footer">
					      	<div class="row">
					      		<div class="col d-grid gap-2">
					      			<input type="button" class="btn btn-danger font-monospace" data-bs-dismiss="modal" value="FINISHED">
					      		</div>  
					      </div>
					    </div>
					    
					  </div>
					 </div>
					</div>
					<%--모달창 끝 --%>

					
					
					
				</div>
            </div>
        </div>
        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        	
</body>
</html>