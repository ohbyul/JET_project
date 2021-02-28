<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 여행 계획</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
</head>
<!--<jsp:include page="../travelplan/style/my_page_sidebar_style.jsp"/>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>

<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>나의 여행 계획</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>  		
	
		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px;background-color:#fff;margin-top:0px;">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">여행 계획</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
					
				</div>
			</div>
			<div class="col-3"></div>
		</div>

        <div class="container" style="margin:65px 0 500px 295px;">	<%--마진 바텀 500 변경 --%>
            <div class="row justify-content-center">
                <div class="col-8">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col" style="margin-top:30px; margin-right:12px;width:300px;"> 
							<div class="col">
					        <div class="row mt-2">
					            <div class="col-4"></div>
					            <div class="col-4"></div>
					            <div class="col-4 p-0 text-muted text-end">home > my page > my travel plan</div>
					        </div>
					        <form action="${pageContext.request.contextPath }/message/message_page.do" method="get">
						        <div class="row mt-4"><!-- 선 -->
						            <hr>
						            
						            <div class="col-2 d-grid gap-2">
						            	<select class="form-select" name="search_type">
											<option value="title">제목</option>
											<option value="content">내용</option>
										</select>
									</div>
						         	<div class="col-3">
						         		<input class="form-control" name="search_word" type="text">
									</div>
									<div class="col-1 d-grid gap-2">	
										<input class="btn btn-success" type="submit" value="검색" >
									</div>
								</div>
							</form> 
						        <div class="row mt-4">
						            <table class="table table-hover table-responsive ">
						                <thead>
						                  <tr>
						                    <th scope="col" class="col-1 text-center">번호</th>
						                    <th scope="col" class="col text-center">제목</th>
						                    <th scope="col" class="col-2 text-center">작성 시간</th>
						                   </tr>
						                </thead>
				                		<tbody>
											<c:forEach items="${resultList}" var="data">
												<tr>
													<td class="col text-center">${data.travelPlanVo.jet_board_travelplan_no }</td>
													<td class="col text-center">		
														<a style="text-align: center" href="${pageContext.request.contextPath }/travelplan/read_travelplan_page.do?jet_board_travelplan_no=${data.travelPlanVo.jet_board_travelplan_no }">${data.travelPlanVo.jet_board_travelplan_title }</a>
													</td>
													<td class="col text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${data.travelPlanVo.jet_board_travelplan_writedate }"/></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>		
					        <div class="row mt-4">
					            <hr>	<!-- 선 -->
					        </div>
					        <div class="row mt-1">
								<div class="col"></div>
								<div class="col">
										<ul id="sent_page_nav" class="pagination justify-content mb-0 ms-3">
											<%--페이징 앞 --%>
											<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/travelplan/my_travel_plan_page.do?page_num=1">&lt;&lt;</a></li>
											<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/travelplan/my_travel_plan_page.do?page_num=${beginPage-1}">&lt;</a></li>
											<%--페이징 중간 --%>
											<c:forEach begin="${beginPage }" end="${endPage }" var="page">
												<li class="page-item <c:if test="${page == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/travelplan/my_travel_plan_page.do?page_num=${page }" class="page-link">${page }</a></li>
											</c:forEach>
											<%--페이징 뒤 --%>
											<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/travelplan/my_travel_plan_page.do?page_num=${endPage+1}">&gt;</a></li>
											<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/travelplan/my_travel_plan_page.do?page_num=${pageCount}">&gt;&gt;</a></li>
										</ul>
								</div>
								<div class="col text-end">
									<c:if test="${!empty sessionUser }">
										<a class="btn btn-success" type="button" href="${pageContext.request.contextPath }/travelplan/write_travel_plan_detail_page.do">여행 계획 작성</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
     </div> 



        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>