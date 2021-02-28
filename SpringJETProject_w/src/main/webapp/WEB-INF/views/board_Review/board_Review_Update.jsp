<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>리뷰 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../board_Review/script/board_Review_Update_script.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
   <jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>

<body>
	
	<main>
	<form action="${pageContext.request.contextPath}/board_Review/board_Review_Update_prcoess.do" method="post">
		<div class="container">
	            
	            <div class="row mt-5">
	                <div class="col-11">
	                    <hr style="margin-left: 10%;">
	                </div>
	            </div>
	            <div class="row mt-2 justify-content-center">
	                <div class="col-10">리뷰 수정하기</div>
	            </div>
	            <div class="row mt-2 justify-content-center">
	                <div class="col-8">
	                    <input name="jet_board_review_title" type="text" class="form-control" value="${result.boardReviewVo.jet_board_review_title }">
	                    
	                </div>
	                <div class="col-2 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; margin-right: 10px;">
	                   	 작성자 : ${sessionUser.jet_member_nick }
	                </div>
	                
	            </div>
	            <div class="row justify-content-center">
	            	
	                <div class="col-10">
	                	<div class="row mt-4 justify-content-center">
			                <div class="col-9" style="background-color: #F6F6F6; height: 180px; width:98%; border-radius: 5px; line-height: 26px;">
			                    <div style="margin-top: 20px;">
			                        ◎ 이곳은 게시판 작성시 주의사항을 적는곳입니다.
			                    </div>
			                </div>
			            </div>
	                    <textarea name ="jet_board_review_content"class="form-control" id="exampleFormControlTextarea1" rows="20" style="overflow-y:scroll">${result.boardReviewVo.jet_board_review_content }</textarea>
	                </div>
	            </div>
	            <c:choose>
	            	<c:when test="${!empty sessionUser }">
			            <div class="row mt-1 justify-content-center">
			                <div class="col-9"></div>
			                <div class="col-1" >
			                    <input onclick="updateBtn" type="image" src="${pageContext.request.contextPath}/resources/image/save.PNG" alt="wirteButton">
			                </div>
			            </div>
			        </c:when>
			        <c:otherwise>
			        	<div class="row mt-1">
			        		<div class="col-10"></div>
			        	</div>
			        </c:otherwise>
	            </c:choose>
	     </div>
	     <input type="hidden" name="jet_board_review_no" value="${result.boardReviewVo.jet_board_review_no }">
     </form>
     
     </main>
     <jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>