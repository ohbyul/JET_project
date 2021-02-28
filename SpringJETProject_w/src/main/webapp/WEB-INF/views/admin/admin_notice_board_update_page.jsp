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
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">공지사항 수정</h1>
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
			
				<form action="${pageContext.request.contextPath }/admin/admin_notice_board_update_process.do" method="post">
					<div class="row mt-2">
						<div class="col-2">작성자</div>
						<div class="col"> ${result.memberVo.jet_member_nick }</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">제목</div>
						<div class="col"> 
							<input class="form-control" type="text" name="jet_board_notice_title" value="${result.noticeBoardVo.jet_board_notice_title } ">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">내용</div>
						<div class="col"> 
							<textarea class="form-control" rows="10" cols="60" name="jet_board_notice_content">${result.noticeBoardVo.jet_board_notice_content }</textarea>
						</div>
					</div>
					
					<input type="hidden" name="jet_board_notice_no" value="${result.noticeBoardVo.jet_board_notice_no }"> 
					
					<div class="row mt-2">
						<div class="col-5"></div>
						<div class="col d-grid gap-2 d"><input class="btn btn-danger" type="submit" value="글  수정"></div>
						<div class="col-5"></div>
					</div>
					
					
				</form>
			
				</div>
				<div class="col-2"></div>
			</div>
			
			
	        <div class="row mt-4">
	            <hr>	<!-- 선 -->
	        </div>			
			
				

		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


<%--
작성자 : ${result.memberVo.jet_member_nick } <br>
제목 : 
<input type="text" name="jet_board_notice_title" value="${result.noticeBoardVo.jet_board_notice_title } "><br>
내용 : <br>
<textarea rows="10" cols="60" name="jet_board_notice_content">${result.noticeBoardVo.jet_board_notice_content }</textarea> <br>
<input type="hidden" name="jet_board_notice_no" value="${result.noticeBoardVo.jet_board_notice_no }"> <br>
<input type="submit" value="글  수정">
 --%>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>