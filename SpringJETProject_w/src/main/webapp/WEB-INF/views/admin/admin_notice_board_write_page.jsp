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
<style>
	#mainbox{
		border: 1px solid rgba(0,0,0,.125);
   		border-radius: .25rem;
	}
</style>
<script type="text/javascript">
	
	
	function formSubmit(){
		var titleInput = document.getElementById("title_input");
		var taInput = document.getElementById("ta_input");
		
		if(titleInput.value == "" || titleInput.value.trim() == ""){
	 		var bottomCol = document.getElementById("bottom_col");
	 		var alertBox = document.createElement("div");
	 		alertBox.setAttribute("class","text-end");
	 		alertBox.setAttribute("style","color : red;");
	 		alertBox.innerText = "공지사항의 제목을 입력해주세요.";
	 		bottomCol.append(alertBox);
	 		
	 		setTimeout(function(){
	 			bottomCol.innerHTML = "";
	 		},1500);
	 		return;
	 	}
	 	
	 	if(taInput.value == "" || taInput.value.trim() == ""){
	 		var bottomCol = document.getElementById("bottom_col");
	 		var alertBox = document.createElement("div");
	 		alertBox.setAttribute("class","text-end");
	 		alertBox.setAttribute("style","color : red;");
	 		alertBox.innerText = "공지사항의 내용을 입력해주세요.";
	 		bottomCol.appendChild(alertBox);
	 		
	 		setTimeout(function(){
	 			bottomCol.innerHTML = "";
	 		},1500);
	 		return;
	 	}
		
		var frmNoticeWrite = document.getElementById("frm_notice_write");
		frmNoticeWrite.submit();
	}
</script>
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">공지사항 쓰기</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
			
			<div class="row">
				<div class="col-2"></div>
				<div class="col">
					<%-- enctype="multipart/form-data" 이거 일단 뺌 아직 이미지 전 --%>
					<form id="frm_notice_write" action="${pageContext.request.contextPath }/admin/admin_notice_board_write_process.do" method="post" enctype="multipart/form-data">
						
						<div class="row mt-2">
							<div class="col-2">작성자</div>
							<div class="col"> ${sessionUser.jet_member_nick }</div>
						</div>
						<div class="row mt-2">
							<div class="col-2">제목</div>
							<div class="col"><input id="title_input" class="form-control" type="text" name="jet_board_notice_title"> </div>
						</div>
						<div class="row mt-2">
							<div class="col-2">내용</div>
							<div class="col"><textarea id="ta_input" class="form-control" rows="10" cols="60" name="jet_board_notice_content"></textarea></div>
						</div>
						<div class="row mt-2">
							<div class="col-2">파일첨부</div>
							<div class="col"><input type="file" name="files" id="formFileMultiple" accept="image/*" value="파일 업로드" multiple></textarea></div>
						</div>
						
						<div class="row mt-2">
							<div class="col-5"></div>
							<div id="bottom_col" class="col-5 p-0" style="margin: auto;"></div>
							<div class="col-2 text-end"><input onclick="formSubmit()" class="btn btn-danger" type="button" value="글 쓰기"></div>
						</div>
						
					</form>
				</div>
				<div class="col-2"></div>
			</div>

			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
			
		
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>

<%--
작성자 : ${sessionUser.jet_member_nick } <br>
제목 : 
<input type="text" name="jet_board_notice_title"> <br>
내용 : <br>
<textarea rows="10" cols="60" name="jet_board_notice_content"></textarea> <br>
이미지 : 
<input type="file" name="files" id="formFileMultiple" accept="image/*" value="파일 업로드" multiple>
<br>
<input type="submit" value="글 쓰기">
 --%>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>