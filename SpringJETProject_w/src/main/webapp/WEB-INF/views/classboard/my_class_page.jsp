<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<title>나의 클래스</title>
<jsp:include page="../commons/style/classboard_vertical_nav_style.jsp"/>
<jsp:include page="../classboard/style/my_class_page_style.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>

<body>
<jsp:include page="../commons/top_image.jsp"/>
<jsp:include page="../commons/classboard_vertical_nav.jsp"/>   

   <div class="container">
			<div class="row mt-2">
			    <div class="col-5"></div>
			    <div class="col-5"></div>
			    <div class="col-2 text-muted" style="text-align: right;">home > my class</div>
			</div>
			<div class="row mt-4">
			    <div class="col text-center display-5" style="font-family: daum">나의 클래스</div>
			</div>
			<div class="row mt-4">
			    <hr> <!-- 선 -->
			</div>
            
            <div class="row mt-3">
               
               <!-- 게시판 테이블 -->
               <div class="col">    
                  <table class="table table-hover table-responsive">
                    <thead>
                      <tr>
                        <th scope="col" class="col-2 text-center">분류</th>
                        <th scope="col" class="col-1 text-center">번호</th>
                        <th scope="col" class="col">클래스</th>
                        <th scope="col" class="col-2 text-center">등록일</th>
                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${myresultList }" var="data">
                         <tr>
                           <th scope="row" class=" text-center">${data.classCategoryVo.jet_class_category_name}</th>
                           <td class="text-center">${data.classboardVo.jet_class_no }</td>
                           <td><a style="text-decoration:none; color: black;" href="${pageContext.request.contextPath }/classboard/my_class_dates_page.do?jet_class_no=${data.classboardVo.jet_class_no }">
                           ${data.classboardVo.jet_class_name}</a></td>
                           <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${data.classboardVo.jet_class_writedate}"/></td>
                         </tr>
                       </c:forEach>
                    </tbody>
                  </table>
                     
               </div>
            </div>
         </div>
         <div class="col-1"></div>
   <jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>