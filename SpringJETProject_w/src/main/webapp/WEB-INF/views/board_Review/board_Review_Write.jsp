<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../board_Review/script/board_Review_Write_script.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
   <jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>


<body>
	<jsp:include page="../commons/top_image.jsp"/>
	<main>
	<form id="review_form" action="${pageContext.request.contextPath}/board_Review/board_Review_Write_Process.do" method="post" enctype="multipart/form-data" >
		<div class="container">
	            <div class="row mt-4 justify-content-center">
	                <div class="col-10  display-6">Review Write</div>
	            </div>
	            <div class="row mt-2">
	                <div class="col-11">
	                    <hr style="margin-left: 10%;">
	                </div>
	            </div>
	            <div class="row mt-2 justify-content-center">
	                <div class="col-8">
	                    <input name="jet_board_review_title" type="text" class="form-control" placeholder="제목을 입력해라" id="review_title">
	                </div>
	                <div class="col-1 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px;">
	                   	 ${sessionUser.jet_member_nick }
	                </div>
	                <div class="col-1">
                        <select name="jet_board_review_category_no" class="form-select form-select-sm" aria-label=".form-select-sm example" style="height:40px; margint-left:-50px">
                            <option selected value="1">기타</option>
                            <option value="2">숙소</option>
                            <option value="3">카페</option>
                            <option value="4">액티비티</option>
                            <option value="5">식당</option>
                         </select>
	                </div>
	            </div>
	            <div class="row mt-4 justify-content-center">
	                <div class="col-10 " style="background-color: #F6F6F6; border-radius: 5px; line-height: 15px; width: 81.5%;">
	                    
	                    <input type="file" name="upload_image" accept="image/*" value="사진 첨부">
	                    
	                </div>
	            </div>
	            <div class="row justify-content-center"><%--지도 시작 --%>
	                <div class="col-10">	 
	                	<jsp:include page="../commons/kakao_map_api.jsp"/>
	                </div>
	            </div><%--지도 끝 --%>
	            <div class="row">
	            	<div class="col"></div>
	            	<div class="col-10">
	            		<textarea name ="jet_board_review_content"class="form-control" id="exampleFormControlTextarea1" rows="20" placeholder="내용을 입력해라" style="overflow-y:scroll"></textarea>
	            	</div>
	            	<div class="col"></div>
	            </div>
	            <c:choose>
	            	<c:when test="${!empty sessionUser }">
			            <div class="row mt-1 justify-content-center">
			                <div class="col-9"></div>
			                <div class="col-1" >
			                    <%-- <input type="image" src="${pageContext.request.contextPath}/resources/image/save.PNG" alt="wirteButton" onclick="reviewSubmit()">--%>
			                    <input onclick="reviewSubmit()" id="saveBtn" class="btn btn-primary" type="button" value="작성하기">
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
	     
     </form>
     
     </main>
     <jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>  
</body>
</html>