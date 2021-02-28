<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<script type="text/javascript">
	
	function formSubmit() {
		
		var formFreeboard = document.getElementById("form_freeboard"); 
		
		var inputTitle = document.getElementById("input_title");
		var inputContent = document.getElementById("input_content");
		
		if(inputTitle.value ==""){
			alert("제목을 작성해 주세요.");
			inputTitle.focus();
			return;
	  	}
		
		if(inputContent.value ==""){
			alert("내용을 작성해 주세요.");
			inputContent.focus();
			return;
	  	}
		
		formFreeboard.submit();
		
	}

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
<body>
<jsp:include page="../commons/top_image.jsp"/>

	<div class="container">
		<main>
	        <div class="row mt-2">
	            <div class="col-5"></div>
	            <div class="col-5"></div>
	            <div class="col-2 text-muted" style="text-align: right;">home > board</div>
	        </div>		
	        <div class="row mt-4">
	            <div class="col text-center display-5" style="font-family: daum">글 수정</div>
	        </div>
	        <div class="row mt-4">
	            <hr> 				<!-- 선 -->
	        </div>
	        
			<div class="row mt-2">
				<div class="col"></div>
				<div class="col-6">
					<form id="form_freeboard" action="${pageContext.request.contextPath}/freeboard/update_free_board_process.do" method="post">
						<div class="row">
							<div class="col">	<!-- 여기가 안 -->
								<div class="row">
									<div class="col">
										<select name="category" class="form-select form-select-sm">
											<option value="daily"><span style="color: blue;">일상</span></option>
											<option value="smalltalk"><span style="color: orange;">잡담</span></option>
											<option value="gossip"><span style="color: red;">수다</span></option>
											<option>=======</option>
										</select>		
									</div>
									<div class="col-10 form-floating">
										<input type="text" id="input_title" name="jet_board_free_title" value=${result.freeboardVo.jet_board_free_title } class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"><br>
										<label for="floatingTextarea2"> 제목</label>
									</div>
								</div>
								<div class="row">
									<div class="col text-end">
										<span class="badge bg-warning text-dark">작성자</span> ${sessionUser.jet_member_nick }<br>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col form-floating">
										<textarea id="input_content" name="jet_board_free_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px" >${result.freeboardVo.jet_board_free_content }</textarea>
										<label for="floatingTextarea2"> 내용</label>
									</div>
								</div>
								<div class="row">
									<div class="col mt-2">	
										<input name="files" type="file" accept="image/*" multiple>
									</div>
								</div>
								<div class="row">
									<div class="col text-end mt-2">	
										<input class="btn btn-warning" type="button" onclick="formSubmit()" value="수정">
										<input type="hidden" name="jet_board_free_no" value="${result.freeboardVo.jet_board_free_no }">
									</div>
								</div>																
							</div>	
						</div>
					</form>
				</div>
				<div class="col"></div>
			</div>	        
	        
	        
		</main>
	  
	</div>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>