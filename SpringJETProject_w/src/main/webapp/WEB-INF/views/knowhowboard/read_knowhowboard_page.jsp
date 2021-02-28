<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	
<title>knowhowboard_page</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<jsp:include page="../font/NanumGothicCoding.jsp"/>
	<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<style>
textarea {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	border: solid 1px #5cb85c;
	border-radius: 5px;
	resize: none !important;
}

.heart {
	width: 58px;
	height: 60px;
}

.info-line {
	display: flex;
	align-items: center;
}

.link {
	text-decoration: none;
}


</style>

</head>


<body onload="refreshReple(); refreshSingo(); ">
	<%--바디가 로드되는 시점에refreshSingo(); --%>


	


<jsp:include page="../commons/top_blank.jsp"/>
	<div class="container">
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-10">
				<!-- 중앙 -->
				<div class="row mt-3">


					<div class="col text-success">
						<a
							href="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do"
							class="link text-success">board > knowhow</a>
					</div>


				</div>
				<div class="row mt-3">
					<div class="col">
						<h2>${result.knowhowBoardVo.jet_board_knowhow_title}</h2>
					</div>
				</div>

				<div class="row mt-3">
					<div class="col">
						<span class="badge rounded-pill bg-success">작성자</span>
						${result.memberVo.jet_member_nick}
					</div>
				</div>

				<div class="info-line row mt-2">
					<div class="col-2 text-muted">
						<fmt:formatDate
							value="${result.knowhowBoardVo.jet_board_knowhow_writedate}"
							pattern="yyyy-MM-dd HH:ss" />
					</div>
					<div class="col-8 text-muted">조회
						${result.knowhowBoardVo.jet_board_knowhow_readcount}</div>
					<div class="col-1">추천 ${countLike}</div>




					<c:if test="${!empty sessionUser}">

						<div id="singoBox" class="col-1">

							<%--
							
								<!-- 모달 그림 -->
								<img alt="report"
									src="${pageContext.request.contextPath}/resources/image/report.jpg">
							
							</div>
							<div class="col-1">
							 --%>
							<!-- 모달 버튼. Button trigger modal -->
							<!-- Button trigger modal 모달 버튼 222-->
							<button type="button" class="badge bg-danger"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								style="float: right;">글 신고</button>
						</div>
					</c:if>





					<div class="row">

						<%--
						모달창 시작
						<div class="modal fade" id="singoModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form>
											<div class="mb-3">
												<label for="sessionUser-name" class="col-form-label">신고자</label>
												<div class="form-control" id="sessionUser-name">${SessionMemberVo.jet_member_nick}</div>
											</div>
											<div class="mb-3">
												<label for="jet_board_notice_singo_reason"
													class="col-form-label">신고 사유</label>
												<textarea class="form-control"
													id="jet_board_knowhow_singo_reason"></textarea>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button onclick="singoSubmitBtn();" type="button"
											class="btn btn-danger" data-bs-dismiss="modal">Send
											Declaration</button>
									</div>
								</div>
							</div>
						</div>
						모달 창 끝
						 --%>

						<%--모달 창 시작 222 --%>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<label for="sessionUser-name" class="col-form-label">신고자</label>
											<div class="form-control" id="sessionUser-name">${sessionUser.jet_member_nick}</div>
										</div>
										<div class="mb-3">
											<label for="jet_board_notice_singo_reason"
												class="col-form-label">신고 사유</label>
											<textarea class="form-control"
												id="jet_board_knowhow_singo_reason"></textarea>

											<div class="row mt-1">
												<div id="confirm-singo-alert-box" class="col"></div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary"
											onclick="singoSubmitBtn()">완료</button>
									</div>
								</div>
							</div>
						</div>
						<%-- 모달 창 끝 222--%>
					</div>
					<%--신고 row끝 --%>
				</div>

				<hr style="background-color: #8C8C8C;">

				<div class="row mt-5">
					<div class="col">
						${result.knowhowBoardVo.jet_board_knowhow_content}</div>
				</div>

				


				<!-- 이미지 출력. 이미지는 ArrayList기 때문에 출력을 위해 반복문 사용 -->
				<c:forEach items="${result.imageVoList}" var="imageVo">
					<div class="row">
						<div class="col">
							<img class="img-fluid"
								src="${imageVo.jet_board_knowhow_image_link}">
						</div>
					</div>
				</c:forEach>
				<div class="row mt-5">
					<div class="col">

						<c:choose>

							<c:when test="${!empty sessionUser && isLiked == 0}">
								<!-- 로그인을 하고 좋아요를 안 누른 경우 -->
								<form
									action="${pageContext.request.contextPath}/knowhowboard/insert_like_knowhowboard_process.do">
									<input class="heart mx-auto d-block" type="image"
										src="${pageContext.request.contextPath}/resources/image/heart_blank.png"
										alt="heart_blank"> <input type="hidden"
										name="jet_board_knowhow_no"
										value="${result.knowhowBoardVo.jet_board_knowhow_no}">
								</form>
							</c:when>

							<c:when test="${!empty sessionUser && isLiked != 0}">
								<!-- 로그인을 하고 좋아요를 누른 경우 -->
								<form
									action="${pageContext.request.contextPath}/knowhowboard/delete_like_knowhowboard_process.do">
									<input class="heart mx-auto d-block" type="image"
										src="${pageContext.request.contextPath}/resources/image/heart_full.png"
										alt="heart_full"> <input type="hidden"
										name="jet_board_knowhow_no"
										value="${result.knowhowBoardVo.jet_board_knowhow_no}">
								</form>
							</c:when>

							<c:otherwise>
								<!-- 로그인 안 한 경우: 로그인이 필요하다 -->
							</c:otherwise>

						</c:choose>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p class="text-center">추천 (${countLike})</p>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-1 text-center">
						<a
							href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do"
							class="link">목록</a>
					</div>

					<div class="col-9">
						댓글
						<c:if test="${repleCount != 0}">
							${repleCount}
						</c:if>

					</div>

					<c:if
						test="${!empty sessionUser && sessionUser.jet_member_no == result.knowhowBoardVo.jet_member_no}">
						<div class="col-1 text-center">
							<a
								href="${pageContext.request.contextPath}/knowhowboard/delete_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}"
								class="link">삭제</a>
						</div>
						<div class="col-1 text-center">
							<a
								href="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_page.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}"
								class="link">수정</a>
						</div>

						<%--

						<div class="col-1" style="margin-left: 3%; display: block;">

							<button type="button" class="btn btn-outline-danger"
								onclick="location.href='${pageContext.request.contextPath}/knowhowboard/delete_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}'">삭제</button>



						</div>

						<div class="col-1" style="margin-left: auto; display: block;">
							<button type="button" class="btn btn-outline-success"
								onclick="location.href='${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_page.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}'">수정</button>
						</div>
						 --%>

					</c:if>
				</div>

				<hr style="background-color: #8C8C8C;">


				<%--
				<!-- 댓글 보기 -->
				<!-- 댓글 개수 출력 -->
				<div class="row mt-3">
					<div class="col">댓글 ${repleCount}</div>
					<!-- AJAX 처리가 아니므로 새로고침해야 바뀜 -->
				</div>


	
				<!-- 댓글은 ArrayList. 출력을 위해 반복문 사용 -->
				<c:forEach items="${reple}" var="reple">
				
					<div class="row mt-3">
						<div class="col-1">사진</div>
						<div class="col">
							<div class="row">
								<div class="col">${reple.memberVo.jet_member_nick}</div>
							</div>
							<div class="row mt-1">
								<div class="col">${reple.repleVo.jet_board_knowhow_reple_cont}</div>
							</div>
							<div class="row mt-1">
								<div class="col-3">
									<fmt:formatDate
										value="${result.knowhowBoardVo.jet_board_knowhow_writedate}"
										pattern="yyyy-MM-dd HH:ss" />
								</div>
								<div class="col">답글쓰기</div>
								
								<c:if test="${!empty sessionUser && sessionUser.jet_member_no == reple.memberVo.jet_member_no}">
									<div class="col-2">
										수정
									</div>
									<div class="col-2">
									<%--
										<form action="${pageContext.request.contextPath}/knowhowboard/delete_reple_knowhowboard_process.do" method="post">
											<input type="submit" class="btn btn-outline-warning" value="삭제">
											<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
											<input type="hidden" name="jet_board_knowhow_reple_no" value="${reple.repleVo.jet_board_knowhow_reple_no}">
										</form>
									
										
										<a href="${pageContext.request.contextPath}/knowhowboard/delete_reple_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}&jet_board_knowhow_reple_no=${reple.repleVo.jet_board_knowhow_reple_no}"  class="btn btn-outline-warning">삭제</a>
									</div>
								</c:if>
								
							</div>
						</div>
						<div class="col-1">
							<div class="row"></div>
							<div class="row"></div>
							<div class="row">
								<div class="col">신고</div>
							</div>
						</div>
					</div>
				

				</c:forEach>
				
		 	
				
				<!-- 에이작스로 -->
				<div class="row mt-4">
					<div class="col-1">
						<div>
							<p id="comment">댓글</p>
						</div>
					</div>
				</div>
				<hr style="background-color:#8C8C8C;">
				--%>
				<div class="container">
					<div class="row mt-4">
						<div class="col">
							<h5>댓글</h5>
						</div>
					</div>
				</div>

				<hr style="background-color: #8C8C8C;">

				<!--  댓글 불러오기 -->
				<div class="container" id="reple_list_box"></div>



				<!-- 댓글 쓰기 -->
				<!-- <form
					action="${pageContext.request.contextPath}/knowhowboard/write_reple_knowhowboard_process.do"
					method="get"> 
					 -->
				<c:if test="${!empty sessionUser}">

					<div class="container">
						<div class="row">
							<div class="col">

								<!-- 닉네임 -->
								<div class="row">
									<div class="col">
										<strong>${sessionUser.jet_member_nick}</strong>
									</div>
								</div>

								<!-- 댓글 작성 칸 -->
								<div class="row mt-2">
									<!-- 내용 칸 -->
									<div class="col">
										<textarea name="jet_board_knowhow_reple_cont" rows="3"
											cols="100" placeholder=" 댓글을 남겨보세요" id="input-reple">
									</textarea>
									</div>
									<!-- 댓글 작성 버튼 -->
									<div class="col-1">
										<input type="hidden" name="jet_board_knowhow_no"
											value="${result.knowhowBoardVo.jet_board_knowhow_no}"
											id="knowhowboard-no"> <input
											class="btn btn-success form-control" type="button" value="등록"
											onclick="writeReple()" style="height: 100%;">
									</div>
								</div>

							</div>


						</div>
					</div>

				</c:if>
				<!--  
				</form>
				-->
			</div>
			<div class="col"></div>
		</div>
	</div>
	<jsp:include page="../party_board/popup_chat.jsp"/>
	<jsp:include page="../commons/global_nav.jsp"/>
	<jsp:include page="../commons/global_footer.jsp"/>
	<script type="text/javascript">

// 로그인?? 사용자 상태????????
// RESTfulMemberController
//@RequestMapping("getSessionNo.do")
		
	var jet_member_no = null;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);
			
			// 로그인한 경우 ??
			if (obj.result == "success") {
				jet_member_no = obj.sessionNo;
			} else {
				console.log(obj.reason);
			}
		}
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath}/member/getSessionNo.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();


// 댓글 쓰기
function writeReple() {
	
	var board_no = document.getElementById("knowhowboard-no").value;
	var reple_content = document.getElementById("input-reple").value;
	
	
	if(reple_content == "" || reple_content.trim() == "") {
		alert("댓글을 입력해 주세요.");
		inputReple.focus();
		return;
  	}
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			refreshReple();
		}		
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/knowhowboard/write_reple_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_knowhow_no=" + board_no + "&jet_board_knowhow_reple_cont=" + reple_content);
	
	// 비우기
	document.getElementById("input-reple").value = "";
}

//댓글 새로고침
function refreshReple() {
	
	// 로그인 안 하면 댓글 안 나오던 이유: input-reple이 없어서 에러가 났음. -> 예외처리함 
	if(document.getElementById("input-reple") != null)
		document.getElementById("input-reple").value = "";
	
	
	var board_no = ${result.knowhowBoardVo.jet_board_knowhow_no};
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			
			var obj = JSON.parse(xmlhttp.responseText);   // obj는 리스트다. 에이작스는 여기까지 
			
			// 이후 JS로 태그 생성 및 꾸미기
			
			var repleListBox = document.getElementById("reple_list_box");
			
			var childCount = repleListBox.childNodes.length;
				for (var i = 0; i < childCount; i++) {
					repleListBox.childNodes[0].remove();    // 중간중간. 특정노드를 리무브할 수 있는... 그럼 그 엘리먼트만 삭제됨
				}
		
			for (repleData of obj) {
				
				var rowBox = document.createElement("div");
				
				// 닉네임
				var nickBox = document.createElement("div");    // 동적으로 div박스 생성 
				nickBox.setAttribute("style", "font-weight: bolder;");
				nickBox.innerText = repleData.memberVo.jet_member_nick;
				
				
				// 댓글 내용
				var contentBox = document.createElement("div");
				contentBox.setAttribute("class", "col mt-2");
				contentBox.innerText = repleData.repleVo.jet_board_knowhow_reple_cont;
				
				// 날짜
				var dateBox = document.createElement("div");
				dateBox.setAttribute("class", "col mt-2 text-muted");
				//dateBox.innerText = repleData.repleVo.jet_board_knowhow_reple_date;    // documemnt에 박스 총 5개 만듦. 임시적으로 이제 조립해야 함
				var d = new Date(repleData.repleVo.jet_board_knowhow_reple_date);
 				var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
 					
 				dateBox.innerText = strDate;
 				
 				// 삭제 버튼
 				if (jet_member_no == repleData.repleVo.jet_member_no) {
 					var deleteBox = document.createElement("button");
 					deleteBox.setAttribute("class", "col mt-1 text-muted");
 					deleteBox.setAttribute("onclick", "deleteReple("+ repleData.repleVo.jet_board_knowhow_reple_no +")");
 	 				deleteBox.setAttribute("style","outline:0; border:0; padding: 0; background-color:#fff;");
 	 				deleteBox.innerText = "삭제";
 				} else {
 					var deleteBox = document.createElement("div");
 					deleteBox.innerText = "";
 				}
 				
 				// 수평선
 				var hr = document.createElement("hr");
				hr.setAttribute("style","background-color:#8C8C8C;");
				
				// 박스 조립
				rowBox.append(nickBox);
				rowBox.append(contentBox);
				rowBox.append(dateBox);
				rowBox.append(deleteBox);
				rowBox.append(hr);
				
				// 한바퀴 돌때마다 rowBox가 reple_list_box에.... 챡챡챡 붙게
				repleListBox.append(rowBox);
			}
		}
	};
	
	// 셀렉트니까 get 방식
	xmlhttp.open("get","${pageContext.request.contextPath}/knowhowboard/get_reple_list.do?jet_board_knowhow_no=" + board_no);
	xmlhttp.send();
}


// 댓글 삭제
function deleteReple(reple_no) {
	
	// ?????? 이거 안 해줘도 되나?? 366줄 때문에???
	//var reple_no = repleData.repleVo.jet_board_knowhow_reple_no;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			refreshReple();
		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/knowhowboard/delete_reple_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_knowhow_reple_no=" + reple_no);
}





// 신고 인서트
function singoSubmitBtn() {
	
	var knowhowNo = ${result.knowhowBoardVo.jet_board_knowhow_no };
	var singoReason = document.getElementById("jet_board_knowhow_singo_reason").value;

//		if(${SessionMemberVo==""}==false){
//			alert("로그인 후 이용 가능합니다.");
//			return;
//		}


	
	if(singoReason == "" || singoReason.trim() == ""){
		//alert("신고사유를 입력해주세요.");
		//return;
			
		var confirmAlertBox = document.getElementById("confirm-singo-alert-box");
		var alertBox = document.createElement("div");
		alertBox.setAttribute("class","text-end");
 		alertBox.setAttribute("style","color : red;");
 		alertBox.innerText = "신고사유를 입력해주세요!";
 		confirmAlertBox.append(alertBox);
 		
 		jet_board_knowhow_singo_reason.focus();
 		
 		setTimeout(function(){
 			confirmAlertBox.innerHTML = "";
 		},1500);
 		return;
	}
	
	var xmlhttp = new XMLHttpRequest();
	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//refresh();
				
				
				
				
				$(".modal").modal('hide');
				
				//$('#exampleModal').modal('hide');
				
				
				
				
				refreshSingo();
					
			}	
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/knowhowboard/singo_knowhow_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_knowhow_no=" + knowhowNo + "&jet_board_knowhow_singo_reason=" + singoReason);
		
		//document.getElementById("jet_board_knowhow_singo_reason").value = "";
	
}


// 신고 예외....
function refreshSingo() {
	
	var board_no = ${result.knowhowBoardVo.jet_board_knowhow_no};
	
		
	var xmlhttp = new XMLHttpRequest();
	
		xmlhttp.onreadystatechange = function() {
			
		
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				var obj = JSON.parse(xmlhttp.responseText);
				//responseText 못 받고 있음...
				if (obj.countSingo > 0) {
					//바로 클릭한 직후...obj가 0이다.
					
					var singoBox = document.getElementById("singoBox");
					singoBox.innerHTML = "";
					
											
					// 글씨
					var reportState = document.createElement("div");
					reportState.setAttribute("style", "color : red");
					reportState.innerText = "신고 완료";
					
					singoBox.append(reportState);
					
				}			
			}
		}

		// 셀렉트니까 get 방식
		xmlhttp.open("get","${pageContext.request.contextPath}/knowhowboard/check_singo_process.do?jet_board_knowhow_no=" + board_no);
		xmlhttp.send();
			
}


/*
//신고 예외처리  ?????????
function singoStateBtn() {
	var jet_board_knowhow_no =${result.knowhowBoardVo.jet_board_knowhow_no };
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var obj = JSON.parse(xmlhttp.responseText);
			
			if(obj.existSingoVo == false ){
				var singoButton = document.getElementById("singoButton");
				singoButton.setAttribute("style","text-decoration: none; font-size:12px;color: red;");
				singoButton.setAttribute("data-bs-toggle","modal");
				singoButton.setAttribute("data-bs-target","#singoModal");
				singoButton.setAttribute("onclick","singoBtn()");
				singoButton.innerText= "[신고하기]";
			}else{
				var singoButton = document.getElementById("singoButton");
				singoButton.setAttribute("style","text-decoration: none; font-size:12px;");
				singoButton.innerText= "[신고완료]";
			}
		}
	};
	xmlhttp.open("post","${pageContext.request.contextPath }/knowhowboard/check_singo_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_knowhow_no=" + jet_board_knowhow_no);
}

/*
//예외처리 미로그인 시 로그인 페이지로 여기서 오류는 취소를 누를시 신고 모달창이 뜸
function singoBtn() {

	if(jet_member_no == null){
		var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
		if(confirmResult == true){
			location.href= "${pageContext.request.contextPath }/member/login_page.do";	
		}
		return;
	}
}	
*/

</script>



	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>


</body>
</html>