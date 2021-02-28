<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>

<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>예약한 클래스 </h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>

<%--탭 메뉴 --%>
	<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
		<div class="col-3"></div>
		<div class="col">
			<div class="row" style="padding:10px 0px;margin-left:30px;">
				<div class="col-1" style="width:110px;">
					<a href="${pageContext.request.contextPath}/mypage/classlist_mypage.do" style="text-decoration:none;color:#000;font-size:15px;">나의 클래스 </a>
					
				</div>
				<div class="col-1" style="width:120px;">
					<a href="${pageContext.request.contextPath}/mypage/participating_class_mypage.do" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">예약한 클래스</a>
				</div>
			</div>
		</div>
		<div class="col-3"></div>
	</div>
<%--탭메뉴 끝 --%>


       <div class="container" style="margin:115px 0 700px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<table class="table table-hover table-responsive" id="board">
						<thead>
							<tr>
								<th scope="col" class="col-1 text-center">번호</th>
								<th scope="col" class="col">제목</th>
								<th scope="col" class="col-2 text-center">가격</th>
								<th scope="col" class="col-2 text-center">예약날짜</th>
								<th scope="col" class="col-2 text-center">수강날짜</th>
							</tr>
						</thead>
						
			            <tbody>
							<c:forEach items="${resultList}" var="data">
							<tr>
								<td class="col-1 text-center">${data.reserveVo.jet_class_reservation_no }</td>
								<td class="col"><a style="text-decoration:none; color: black;" href="${pageContext.request.contextPath }/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no }">
								${data.classboardVo.jet_class_name }</a></td>
								<td class="col-2 text-center">${data.classboardVo.jet_class_price }</td>
								<td class="col-2 text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.reserveVo.jet_class_reservation_date }"/></td>
								<td class="col-2 text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.classDetailVo.jet_class_detail_date }"/></td>
							</tr>
							</c:forEach>
						</tbody>
						
						
					</table>
				</div>
            </div>
        </div>


<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>			
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>