<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>자유게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<script type="text/javascript">

	var jet_member_no = null;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);  //여기가 뭘까.
			
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
	

	//좋아요 버튼 기능.
	function likeButton() {
		
		//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...
		if(jet_member_no == null){
			
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			return;
		}
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
		};	
		
		xmlhttp.open("post","${pageContext.request.contextPath }/freeboard/freeboard_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);
		
	}
	
	function dislikeButton() {
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/freeboard/freeboard_dislike_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");	
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);
	}


	function likeFreeboard(){
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);		
				
				if(obj.likeCheck == true){
					var btnLike = document.getElementById("btnLike");
					   btnLike.setAttribute("type","image");
		               btnLike.setAttribute("src","${pageContext.request.contextPath}/resources/image/heart.png");
		               btnLike.setAttribute("style","outline:none;");
		               btnLike.setAttribute("onclick","dislikeButton()");
					
				}else{
					var btnLike = document.getElementById("btnLike");
					   btnLike.setAttribute("type","image");
		               btnLike.setAttribute("src","${pageContext.request.contextPath}/resources/image/heart_blank.png");
		               btnLike.setAttribute("style","outline:none;");
		               btnLike.setAttribute("onclick","likeButton()");
					
				
				}
				
				var btnLikeCount = document.getElementById("likeCount");
				btnLikeCount.innerText = obj.likeCount;
				
			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/freeboard_like_map.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);
	}
	

	function refreshLike() {
		likeFreeboard();
	}

	//리플 예외처리 + 기본 submit 도 이제 ajax 처리 필요.
	function writeReple() {
		
		var reple_content = document.getElementById("reple_content").value;
		var freeboard_no = ${result.freeboardVo.jet_board_free_no };
		
		if(reple_content ==""){
			alert("댓글을 입력해 주세요.");
			inputReple.focus();
			return;
	  	}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/write_free_board_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");//post방식 헤더 세팅
		xmlhttp.send("jet_board_free_no="+freeboard_no + "&jet_board_free_reple_content="+reple_content);
		
		//초기화
		document.getElementById("reple_content").value = "";
	}
	
	function refreshReple() {
		
		var freeboard_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				
				var repleListBox = document.getElementById("reple_list_box");
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0; i < childCount; i++){	
					repleListBox.childNodes[0].remove();
				}
				
				for(reple of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class", "row p-4");			
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class", "col-1")
					nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					nickBox.innerText = reple.memberVo.jet_member_nick;
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class", "col")
					contentBox.innerText = reple.freeboardRepleVo.jet_board_free_reple_content;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col-3 pe-0 text-muted");
					dateBox.setAttribute("style","text-align: end; font-size: 12px;");
					var d = new Date(reple.freeboardRepleVo.jet_board_free_reple_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					dateBox.innerText = strDate;


					//댓글 삭제
					if(jet_member_no == reple.freeboardRepleVo.jet_member_no){
						
						var deleteBox = document.createElement("button");
						deleteBox.setAttribute("onclick","deleteReple("+reple.freeboardRepleVo.jet_board_free_reple_no+")");
						deleteBox.setAttribute("style","text-align:end; outline:0; border:0;background-color:#fff;font-size:12px;");
						deleteBox.innerText = "삭제";	
						
					}else if(jet_member_no != reple.freeboardRepleVo.jet_member_no){
							var deleteBox = document.createElement("div");
							deleteBox.innerText = "";	
					}

					var hr = document.createElement("hr");
					hr.setAttribute("style","background-color:#8C8C8C;");
					

					rowBox.append(nickBox);
					rowBox.append(contentBox);
					rowBox.append(dateBox);
					rowBox.append(deleteBox);
					rowBox.append(hr);
					
					repleListBox.append(rowBox);
					
				}
				
			}
				
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/freeboard/get_free_board_reple_list.do?jet_board_free_no="+freeboard_no);
		xmlhttp.send();
		
	}
	
	function deleteReple(jet_board_free_reple_no){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}	
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/delete_free_board_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_reple_no=" + jet_board_free_reple_no );
	}
	
	
	//신고 기능
	function reportSubmitBtn() {
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no};
		var report_reason = document.getElementById("jet_board_free_report_reason").value;
		
		
		if(report_reason==""){
			alert("신고 사유를 입력해 주세요.");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
					
			}	
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/freeboard_report_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_no="+jet_board_free_no+"&jet_board_free_report_reason="+report_reason);
		
		document.getElementById("jet_board_free_report_reason").value = "";
	}
	
	function reportStateBtn() {
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.checkReport == false){
					var reportButton = document.getElementById("reportButton");
					reportButton.setAttribute("style","text-decoration: none; font-size:12px;color: red;");
					reportButton.setAttribute("data-bs-toggle","modal");
					reportButton.setAttribute("data-bs-target","#reportModal");
					reportButton.setAttribute("onclick","reportBtn()");
					reportButton.innerText= "[신고하기]";
				}else{
					var reportButton = document.getElementById("reportButton");
					reportButton.setAttribute("style","text-decoration: none; font-size:12px;");
					reportButton.innerText="[신고완료]";
				}
			}					
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/freeboard/check_report_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);		
	}
	
	function reportBtn() {
		
		if(jet_member_no == null){
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			return;
		}
	}		
	
	
	
	function refresh(){
		refreshReple();
		reportStateBtn();
	}
	
	setInterval(refresh,1000); // 1초마다 refresh호출하는 interval 세팅해줌. 댓글 저절로 뜨게.
	
	
</script>

<style>	

	@font-face{
	 font-family:'Daum';
	 font-style:normal;
	 font-weight:400;
	 src:url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff2') format('woff2'),
	     url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff') format('woff');
	}

</style>

</head>

<body onload="refresh();likeFreeboard();">

<jsp:include page="../commons/top_image.jsp"/>

	<div class="container">
		<main>
	        <div class="row mt-2">
	            <div class="col-5"></div>
	            <div class="col-5"></div>
	            <div class="col-2 text-muted" style="text-align: right;">home > board</div>
	        </div>		
	        <div class="row mt-4">
	            <div class="col text-center display-5" style="font-family: daum">글 보기</div>
	        </div>
	        <div class="row mt-4">
	            <hr> 				<!-- 선 -->
	        </div>	   
	             
			<div class="row mt-2">
				<div class="col me-3" style="width: 1000px; border-right: 1px solid #D5D5D5;"></div>
				<div class="col-10">
					<div class="row">
						<div class="col">	<!-- 여기가 가운데 -->
							<div class="row">
								<div class="col text-end">
									<span class="badge rounded-pill bg-light text-dark">조회수</span> ${result.freeboardVo.jet_board_free_readcount}<br>
								</div>
							</div>
							<div class="row">
								<div class="col" style="font-size: 20px; font: bold;">
									<span class="badge rounded-pill bg-secondary" >${result.freeboardCategoryVo.jet_board_free_category_name}</span>
									${result.freeboardVo.jet_board_free_title }<br>
								</div>							
								<div class="col-3 text-end">
									<span class="badge rounded-pill bg-light text-dark">작성자</span> ${result.memberVo.jet_member_nick }<br>
								</div>
							</div>
							<div class="row">
								<div class="col text-end">
									<span class="badge rounded-pill bg-light text-dark">작성일 </span><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${result.freeboardVo.jet_board_free_writedate}"/><br>
								</div>
							</div>
							<div class="row">
								<div class="col m-2 p-4" style="width: 1000px; border: 1px solid #D5D5D5; border-radius: 5px;">	<!-- 내용 칸 -->
									${result.freeboardVo.jet_board_free_content }<br>
									
									<c:forEach items="${result.freeboardImageVo }" var="freeboardImageVo">
										<img class="img-fluid" src="${freeboardImageVo.jet_board_free_image_link }">
									</c:forEach>
									<br>
									
									<div class="row mt-2">
										<div class="col"></div>
										<div class="col-1 text-center mb-2">
											<input id="btnLike" class="img-fluid" onclick="likeButton()" >	
										<div id="likeCount" style="font-size: 14px"></div>
										
										<%-- 
											<!-- 좋아요 버튼 만들기 -->
											<c:if test="${!empty sessionUser }">
												<c:choose>
													<c:when test="${!empty freeboardLikeVo }">	<!-- 정보가 있을 경우 색하트 표시 -->
														<form action="${pageContext.request.contextPath }/freeboard/freeboard_dislike_process.do">
															<input type="hidden" name="jet_board_free_no" value="${result.freeboardVo.jet_board_free_no }">
															<input type="image" class="img-fluid" src="${pageContext.request.contextPath}/resources/image/like.png" alt="like">
														</form>
													</c:when>
													
													<c:otherwise>	<!-- 좋아요 한 내용이 없으니까 빈하트 표시  -->
														<form action="${pageContext.request.contextPath }/freeboard/freeboard_like_process.do">
															<input type="hidden" name="jet_board_free_no" value="${result.freeboardVo.jet_board_free_no }">
															<input type="image" class="img-fluid" src="${pageContext.request.contextPath}/resources/image/dislike.png" alt="dislike">
														</form>
													</c:otherwise>
												</c:choose>
											</c:if> 
											
											<c:if test="${likeCount > 0 }"><span style="color: red;">${likeCount}</span></c:if>
											--%>
											
										</div>
										<div class="col"></div>	
									</div>
									<div class="row">
										<div class="col" style="text-align: right; font-size: 13px;">
											<img alt="report" src="${pageContext.request.contextPath}/resources/image/report.jpg" style="margin-top:-5px">
								  		  	<a id="reportButton"></a>	<%--신고 버튼  --%>
										</div>
										
										<%--모달창 시작--%>
										<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										        <form>
										          <div class="mb-3">
										            <label for="sessionUser-name" class="col-form-label">신고자</label>
										            <div class="form-control" id="sessionUser-name">${result.memberVo.jet_member_nick }</div>
										          </div>
										          <div class="mb-3">
										            <label for="jet_board_free_report_reason" class="col-form-label">신고 사유</label>
										            <textarea class="form-control" id="jet_board_free_report_reason"></textarea>
										          </div>
										        </form>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										        <button onclick="reportSubmitBtn();" type="button" class="btn btn-danger" data-bs-dismiss="modal">Send Report</button>
										      </div>
										    </div>
										  </div>
										</div>
										<%--모달 창 끝  --%>										
										
										
									</div>
								</div>
							</div>
								
							
							<div class="row">
								<div class="col text-end mt-2 pe-0">	
									<a href="${pageContext.request.contextPath }/freeboard/main_free_board.do"><button type="button" class="btn btn-warning btn-sm">목록으로</button></a>	
									
									<c:if test="${!empty sessionUser && sessionUser.jet_member_no == result.freeboardVo.jet_member_no }">
									<!-- 이렇게 if 안에 쓰면.. button이 자동으로 submit이 되버림.. -->
										<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/freeboard/update_free_board_page.do?jet_board_free_no=${result.freeboardVo.jet_board_free_no }">수정</a>
										<a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/freeboard/delete_free_board_process.do?jet_board_free_no=${result.freeboardVo.jet_board_free_no}">삭제</a>
									</c:if>					
								</div>
							</div>
							
							
							<div class="row mt-5">
								<c:if test="${result.repleCount  > 0 }">
									<div class="col">댓글 ${result.repleCount}개</div>
									<hr style="background-color:#8C8C8C;">
								</c:if>	
							</div>
							<div class="container" id="reple_list_box">	
								<%-- 댓글은 ArrayList. 출력을 위해 반복문 사용
								<c:forEach items="${repleResult}" var="reple">
									<div class="row mt-2 pe-0">

										<div class="col-1"><p style="font-weight: bold;">${reple.memberVo.jet_member_nick}</p></div>
										<div class="col"><p class="text-break">${reple.freeboardRepleVo.jet_board_free_reple_content }</p></div>
								
										<div class="col-3 pe-0" style="text-align: end;">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${reple.freeboardRepleVo.jet_board_free_reple_writedate }"/><br>
											<c:if test="${!empty sessionUser && sessionUser.jet_member_no == reple.freeboardRepleVo.jet_member_no }">
												<a href="${pageContext.request.contextPath }/freeboard/update_free_board_reple_process.do?jet_board_free_reple_no=${reple.freeboardRepleVo.jet_board_free_reple_no }">수정 </a>
												<a href="${pageContext.request.contextPath }/freeboard/delete_free_board_reple_process.do?jet_board_free_reple_no=${reple.freeboardRepleVo.jet_board_free_reple_no}&jet_board_free_no=${reple.freeboardRepleVo.jet_board_free_no }">삭제</a>
											</c:if>
										</div>
										<hr style="background-color:#8C8C8C;">
									</div>
								</c:forEach>
								 --%>
							</div>								

							<div class="row mt-2">
								<div class="col text-end">
									<c:if test="${!empty sessionUser }">			
										<textarea id="reple_content" class="form-control" name="jet_board_free_reple_content"></textarea>
										<input class="btn btn-warning btn-sm mt-2" type="button" onclick="writeReple()" value="댓글쓰기">
									</c:if>
								</div>
							</div>	
										
															
							</div>									
							</div>
							
						</div>	
					<div class="col ms-3" style="width: 1000px; border-left: 1px solid #D5D5D5;"></div>
				</div>
			</div>	
		</main>
	</div>
<jsp:include page="../party_board/popup_chat.jsp"/>
	<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>