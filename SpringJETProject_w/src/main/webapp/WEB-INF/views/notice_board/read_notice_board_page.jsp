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

<%--제이 쿼리  --%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<style>

    #image_size_auto{
		max-width: 100%;
		height: auto;
  		display: block;
	}
	.notice_reple{
            list-style: none;
            line-height: 25px;
            float: left;
        }
/*---------------------------------------------------------------*/        
	#main_row{
		border: 2px solid rgba(0,0,0,.125);
		border-radius: 15px;
		box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	#title_box{
		text-align: center;
		font-size: 25px;
		font-weight: bold;
	}
	#date_box{
		background-color: rgb(200, 200, 200);
	}
	.listbtn{
		outline:0; border:0;background-color:#fff;font-size:15px; text-decoration: none;color: black;
	}
	.reple_box{
		font-size: 15px;
	}
	#btnLike{
		width: 40px;
		height: 40px;
	}
</style>

<script type="text/javascript">


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



	function writeNoticeReple() {
		
		var repleContent = document.getElementById("jet_notice_reple_content").value;
		var contentNo = ${result.noticeBoardVo.jet_board_notice_no};		//갑자기 나온 EL 이건 자바 코드
		
		if(repleContent==""){
			alert("댓글을 입력해주세요.");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/notice_board/write_notice_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_notice_no=" + contentNo + "&jet_notice_reple_content=" + repleContent);
		
		document.getElementById("jet_notice_reple_content").value = "";
	
	}
	
	function refreshReple() {
		
		var contentNo =  ${result.noticeBoardVo.jet_board_notice_no};		//또 나온 EL 이건 자바 코드
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);

				//갯수 업데이트 
				var boxCommentCnt = document.getElementById("relpeCount");
				boxCommentCnt.innerText = "댓글(" + obj.length + ")";
				
				
				//이후.. JS 로 태그 생성 및 꾸미기.
				
				var repleListBox = document.getElementById("reple_list_box");
				//repleListBox.innerHTML= "";
				//박스 안쪽 초기화
				
				var childCount = repleListBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
				
				
				for(repleData of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row mx-0 px-0");
					
					var ulBox = document.createElement("ul");
					ulBox.setAttribute("class","notice_reple");
					
					var contentBox = document.createElement("li");
					contentBox.setAttribute("style","font-size: 14px;");
					contentBox.innerText = repleData.noticeRepleVo.jet_notice_reple_content;
					
					var nickBox = document.createElement("li");
					nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					nickBox.innerText = repleData.memberVo.jet_member_nick;
					
					var dateBox = document.createElement("li");
					dateBox.setAttribute("class","text-muted");
					dateBox.setAttribute("style","font-size: 12px;");
					var d = new Date(repleData.noticeRepleVo.jet_notice_reple_writedate);
					//밀리 세컨드 - > 데이트 타입
					var strDate =(d.getMonth() + 1) + "/" + d.getDate() + "/" +d.getFullYear() +" " + d.getHours() + ":" + d.getMinutes() + ":" +d.getSeconds();
					dateBox.innerText = strDate;
					
					if(jet_member_no==repleData.noticeRepleVo.jet_member_no){
						var deleteBox = document.createElement("button");
						deleteBox.setAttribute("onclick","deleteReple("+repleData.noticeRepleVo.jet_notice_reple_no+")");
						deleteBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;");
						deleteBox.innerText = "삭제";
						//댓글삭제
					}else if(jet_member_no != repleData.noticeRepleVo.jet_member_no){
		                  var deleteBox = document.createElement("li");
		                  deleteBox.innerText = "";   
		            }
					
					var hr = document.createElement("hr");
					hr.setAttribute("style","background-color:#8C8C8C;");
					
					
					rowBox.append(ulBox);
					
					ulBox.append(nickBox);
					ulBox.append(contentBox);
					ulBox.append(dateBox);
					ulBox.append(deleteBox);
					
					rowBox.append(hr);
					
					repleListBox.append(rowBox);	
					
					
				}				
			}
		};
		xmlhttp.open("get","${pageContext.request.contextPath }/notice_board/get_notice_reple_list.do?jet_board_notice_no="+contentNo);
		xmlhttp.send();	
	}	
	
	//댓글삭제
	function deleteReple(reple_no) {
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/notice_board/delete_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_notice_reple_no=" + reple_no );
		
		
	}
//------------------------------------------------------------------------------
	//좋아요
	function noticeLikeButton() {
	
		//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...
		if(jet_member_no == null){
			
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			
			return;
		}
		
	
		//var jet_member_no = ${sessionUser.jet_member_no };
		var jet_board_notice_no = ${result.noticeBoardVo.jet_board_notice_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/notice_board/like_notice_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_notice_no=" + jet_board_notice_no + "&jet_member_no=" + jet_member_no);
		
		
		
	}
	//좋아요 취소
	function deleteNoticeLikeButton() {
		//var jet_member_no = ${sessionUser.jet_member_no };
		var jet_board_notice_no = ${result.noticeBoardVo.jet_board_notice_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/notice_board/delete_like_notice_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_notice_no=" + jet_board_notice_no + "&jet_member_no=" + jet_member_no);
		
	}
	//좋아요 Vo 체크..
	function checkLikeVo() {
		
		var jet_board_notice_no = ${result.noticeBoardVo.jet_board_notice_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.existLikeVo == true){
					
					var btnLike = document.getElementById("btnLike");
					 btnLike.setAttribute("type","image");
		             btnLike.setAttribute("src","${pageContext.request.contextPath }/resources/image/haert.png");
		             btnLike.setAttribute("onclick","deleteNoticeLikeButton()");
					
				} else{
					
					var btnLike = document.getElementById("btnLike");
					btnLike.setAttribute("type","image");
		            btnLike.setAttribute("src","${pageContext.request.contextPath }/resources/image/blankhaert.png");
		            btnLike.setAttribute("onclick","noticeLikeButton()");
				}
				
				var btnLikeCnt = document.getElementById("likeCnt");
				
				btnLikeCnt.innerText = "Like( " + obj.likeCount +" )";
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/notice_board/like_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_notice_no=" + jet_board_notice_no);
		
	}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	//신고인서트
	function singoSubmitBtn() {
		
		var noticeNo = ${result.noticeBoardVo.jet_board_notice_no };
		var singoReason = document.getElementById("jet_board_notice_singo_reason").value;

// 		if(${sessoinUserVo==""}==false){
// 			alert("로그인 후 이용 가능합니다.");
// 			return;
// 		}
		
		if(singoReason==""){
			alert("신고사유를 입력해주세요.");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					refresh();
						
				}	
			};
			xmlhttp.open("post","${pageContext.request.contextPath}/notice_board/singo_notice_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("jet_board_notice_no="+noticeNo+"&jet_board_notice_singo_reason="+singoReason);
			
			document.getElementById("jet_board_notice_singo_reason").value = "";
	}
	
	//신고 상태에따른
	function singoStateBtn() {
		
		var jet_board_notice_no = ${result.noticeBoardVo.jet_board_notice_no };
		
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
		xmlhttp.open("post","${pageContext.request.contextPath }/notice_board/check_singo_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_notice_no=" + jet_board_notice_no);
	}
	
	//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...	
	function singoBtn() {
	
		if(jet_member_no == null){
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			return;
		}
	}
	
	$().ready(function () {
        $("#toast_TEST").click(function () {
            const Toast = Swal.mixin({
                toast: true,
                position: 'bottom-right',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'success',
                title: '신고가 완료 되었습니다.'
                
            })
        });
    });
	
//----------------------------------------------------------------------------------
	function refresh() {
		refreshReple();
		singoStateBtn();
	
	}
	function refreshLike() {
		checkLikeVo();
	
	}
	
	
</script>
</head>
<body  onload="refresh();checkLikeVo();">

<jsp:include page="../font/NanumMyeongjo.jsp"/>

<jsp:include page="../commons/top_image.jsp"/>

<div class="container-fluid" id="main_font_jet">
	<main>
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				
				<div class="row mt-5" id="main_row">
					<div class="col">
						
						<div class="row mt-1">
							<div class="col" style="text-align: right;">home > Notice</div>
						</div>
						
						<div class="row">
							<div class="col" id="title_box">
								<img id="nitice_icon" src="${pageContext.request.contextPath }/resources/image/noticeicon.gif">
								${result.noticeBoardVo.jet_board_notice_title }
							</div>
						</div>
						
						<div class="row py-1" id="date_box">
							<div class="col"></div>
							<div class="col" style="text-align: center;">
								<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${result.noticeBoardVo.jet_board_notice_writedate }"/>
							</div>
							<div class="col" style="text-align: right;">조회 : ${result.noticeBoardVo.jet_board_notice_readcount } </div>
						</div>
						
						<div class="row">
							<div class="col"></div>
							<div class="col-2" style="text-align: right;">
								<img id="nitice_icon" src="${pageContext.request.contextPath }/resources/image/admin.jpg">
								${result.memberVo.jet_member_nick}
							</div>
						</div>
						
						<div class="row mt-2">
							<div class="col mx-5 my-2">${result.noticeBoardVo.jet_board_notice_content }</div>
						</div>
						
						<div class="row">
							<div class="col mx-5 my-2">
								<c:forEach items="${result.imageVoList }" var="imageVo">
									<img id="image_size_auto" src="${imageVo.jet_board_notice_image_link }"><br>
								</c:forEach>
						    </div>
						</div>
						
						<div class="row">
							<div class="col-4"></div>
							<div class="col-4" style="text-align: center;">
								<div class="row">
									<div class="col">
										<div onclick="checkLikeVo();">
									
											<input id="btnLike" onclick="noticeLikeButton();">

										</div>
									</div>
								</div>
								<div class="row">
									<div class="col" id ="likeCnt"></div>
								</div>
							</div>
							<div class="col-4"></div>
						</div>
						
						<div class="row my-3">
							<div class="col-4">	
								<div class="row">
									<div class="col-2" style="text-align:right;">
										<a class="listbtn" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">목록</a>
									</div>
									|<div class="col reple_box" style="text-align:left;" id="relpeCount"></div>
								</div>	
							</div>
							
							<div class="col-4"></div>
							
							<div class="col-4" style="text-align: right;font-size: 13px;">
								<img alt="report" src="${pageContext.request.contextPath}/resources/image/report.jpg" style="margin-top:-5px">
								<a id="singoButton"></a>	<%--신고 버튼  --%>
							</div>


							<%--모달창 시작--%>
							<div class="modal fade" id="singoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
							            <div class="form-control" id="sessionUser-name">${sessionUser.jet_member_nick}</div>
							          </div>
							          <div class="mb-3">
							            <label for="jet_board_notice_singo_reason" class="col-form-label">신고 사유</label>
							            <textarea class="form-control" id=jet_board_notice_singo_reason></textarea>
							          </div>
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button onclick="singoSubmitBtn();" id="toast_TEST" type="button" class="btn btn-danger" data-bs-dismiss="modal">Send Declaration</button>
							      </div>
							    </div>
							  </div>
							</div>
							<%--모달 창 끝  --%>
						</div>
						
					</div>
				</div>	<%--메인 로우 끝 --%>

				
				<div class="row mt-3 mb-3">
					<div class="col"></div>
					
					<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.noticeBoardVo.jet_member_no }">
						<div class="col-1 d-grid gap-2 d">
							<a class="btn btn-outline-danger" href="${pageContext.request.contextPath }/notice_board/delete_notice_board_process.do?jet_board_notice_no=${result.noticeBoardVo.jet_board_notice_no}">
							삭제</a>			
						</div>
						<div class="col-1 d-grid gap-2 d">
							<a class="btn btn-outline-success"  href="${pageContext.request.contextPath }/notice_board/update_notice_board_page.do?jet_board_notice_no=${result.noticeBoardVo.jet_board_notice_no}">
							수정</a>
						</div>
					</c:if>
					
					<div class="col-1 d-grid gap-2 d">
						<a class="btn btn-primary"  href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">목록</a>	
					</div>
				</div>		
				
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col-8"> 	<%--댓글 전체 박스 --%>
						
						<div class="row mt-2"> <!-- 리플박스-->
							<div class="col">
								<c:if test="${!empty sessionUser }">	<!--  순수 AJAX는 form 없어도됨 JS로 다 처리 할것이기 떄문.  -->
									<div class="row">		
										<div class="col-2">${sessoinUserVo.jet_member_nick}</div>
										<div class="col px-0"><textarea class="form-control" id="jet_notice_reple_content" rows="2" cols="60"></textarea></div>
										<div class="col-1"><input onclick="writeNoticeReple()" type="button" value="작성" class="btn btn-outline-dark"></div>				
									</div>		
								</c:if>
							</div>
						</div>
						
						<div class="row mt-3">	<%--댓글 리스트 --%>
							<div class="col">
								<div class="row" id="reple_list_box"></div>	
							</div>
						</div>
						
					</div>
					<div class="col"></div>
				</div>
				
			</div>
			<div class="col-2"></div>
		</div>
	</main>
</div>

<%--
<h1>read_공지사항_page</h1>
제목 : ${result.noticeBoardVo.jet_board_notice_title } <br>
작성자 :  ${result.memberVo.jet_member_nick} <br>
조회수 : ${result.noticeBoardVo.jet_board_notice_readcount }<br> <!-- 리드카운트 cs빠졌다 ㅜㅜ -->
작성일 : ${result.noticeBoardVo.jet_board_notice_writedate }<br>
내용 : ${result.noticeBoardVo.jet_board_notice_content }<br>

<c:forEach items="${result.imageVoList }" var="imageVo">
	<img id="image_size_auto" src="${imageVo.jet_board_notice_image_link }"><br>
</c:forEach>

<div id = "likeCnt"> </div>

<!-- 좋아요 버튼 -->
<c:if test="${!empty sessionUser }">
	<div onclick="checkLikeVo();">
		<input id="btnLike" onclick="noticeLikeButton();" type="button" value="좋아요">
	</div>
</c:if>

<a href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">목록으로</a>	

<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.noticeBoardVo.jet_member_no }">
	<a href="${pageContext.request.contextPath }/notice_board/delete_notice_board_process.do?jet_board_notice_no=${result.noticeBoardVo.jet_board_notice_no}">
	삭제</a>
	<a href="${pageContext.request.contextPath }/notice_board/update_notice_board_page.do?jet_board_notice_no=${result.noticeBoardVo.jet_board_notice_no}">
	수정</a>
</c:if>

<!-- 댓글 갯수.. -->
<div id="relpeCount"></div>	

<!-- 댓글 리스트 -->
<div class="row" id="reple_list_box"></div>	


<c:if test="${!empty sessionUser }">	<!--  순수 AJAX는 form 없어도됨 JS로 다 처리 할것이기 떄문.  -->
	<div class="row">		 <!-- 리플박스-->
		<div class="col"><textarea id="jet_notice_reple_content" rows="3" cols="60"></textarea></div>
		<div class="col"><input onclick="writeNoticeReple()" type="button" value="작성"></div>				
	</div>		
</c:if>

 --%>
 <jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>