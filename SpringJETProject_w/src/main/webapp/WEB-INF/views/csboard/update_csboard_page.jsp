<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>
<body>

<jsp:include page="../commons/top_image.jsp"/>


	<div class="container-fluid">
		<main>
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				
				<div class="row mt-5">
					<div class="col text-center">
						<h1>문의 글 수정</h1>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
				<form action="${pageContext.request.contextPath }/csboard/update_csboard_process.do" method="post">
				
				<div class="row mt-3">
					<div class="col-2">
						작성자
					</div>
					<div class="col">
						${result.memberVo.jet_member_nick }
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						제목
					</div>
					<div class="col">
						<input class="form-control" type="text" name="jet_board_m_cs_title" value="${result.csBoardVo.jet_board_m_cs_title } ">
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						내용
					</div>
					<div class="col">
						<textarea class="form-control" rows="10" cols="60" name="jet_board_m_cs_content">${result.csBoardVo.jet_board_m_cs_content }</textarea>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col-2">
						이메일
					</div>
					<div class="col">
						<input class="form-control" type="text" name="jet_board_m_cs_customeremail" value="${result.csBoardVo.jet_board_m_cs_customeremail  }">
					</div>
				</div>

				<input type="hidden" name="jet_board_m_cs_no" value="${result.csBoardVo.jet_board_m_cs_no }">				
				
				<div class="row mt-3">
					<div class="col-10"></div>
					<div class="col d-grid gap-2 d">
						<input class="btn btn-primary" type="submit" value="글  수정">
					</div>
				</div>
				
				</form>
				
				<div class="row mt-3">
					<div class="col">
						<hr>
					</div>
				</div>
				
			</div>
			<div class="col-2"></div>
		</div>
		</main>
	</div>


<%-- 
<h1>글 수정</h1>
	<form action="${pageContext.request.contextPath }/csboard/update_csboard_process.do" method="post">
		작성자 : ${result.memberVo.jet_member_nick } <br>
		제목 : 
		<input type="text" name="jet_board_m_cs_title" value="${result.csBoardVo.jet_board_m_cs_title } "><br>
		내용 : <br>
		<textarea rows="10" cols="60" name="jet_board_m_cs_content">${result.csBoardVo.jet_board_m_cs_content }</textarea> <br>
		이메일 : <input type="text" name="jet_board_m_cs_customeremail" value="${result.csBoardVo.jet_board_m_cs_customeremail  }">
		<input type="hidden" name="jet_board_m_cs_no" value="${result.csBoardVo.jet_board_m_cs_no }"> <br>
		<input type="submit" value="글  수정">
	</form>
--%>	
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>