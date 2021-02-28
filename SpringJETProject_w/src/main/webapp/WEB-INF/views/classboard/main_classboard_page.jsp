<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
   crossorigin="anonymous">

<title>원데이 클래스</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/classboard_vertical_nav_style.jsp"/>
<jsp:include page="../classboard/style/main_classboard_style.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

</head>

<body>
<jsp:include page="../commons/top_image.jsp"/>
<jsp:include page="../commons/classboard_vertical_nav.jsp"/>


   <div class="container">
         <main>
			<div class="row mt-2">
			    <div class="col-5"></div>
			    <div class="col-5"></div>
			    <div class="col-2 text-muted" style="text-align: right;">home > oneDay class</div>
			</div>
			<div class="row mt-4">
			    <div class="col text-center display-5" style="font-family: daum">원데이 클래스</div>
			</div>
            <div class="row mt-2">
               <div class="col d-grid gap-2 d-md-flex justify-content-md-end">
                  <c:if test="${!empty sessionUser }">
                     <a class="btn btn-warning" style="color: black; font-size: 15px; font-family: daum;" href="${pageContext.request.contextPath}/classboard/open_class_page.do" role="button">강의 개설하기</a>
                  </c:if>
               </div>
            </div>			
			<div class="row mt-3">
			    <hr> <!-- 선 -->
			</div>
      
            
            <div class="row mt-2 ms-4" style="text-align: center;">
               
               	<!--
                  <table class="table table-hover table-responsive">
                    <thead class="text-center">
                    
                      <tr>
                        <th scope="col" class="col-2">분류</th>
                        <th scope="col" class="text-start">클래스</th>
                        <th scope="col" class="col-1">신청현황</th>
                        <th scope="col" class="col-2">작성자</th>
                        <th scope="col" class="col-1">수강날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                       
                         <tr>
                           <th scope="row" class=" text-center">${data.classCategoryVo.jet_class_category_name}</th>
                           <td><a href="${pageContext.request.contextPath}/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}">${data.classboardVo.jet_class_name}</a></td>
                           <td class="text-center">${data.countReserve} / ${data.classboardVo.jet_class_max_headcount}</td>
                           <td class="text-center">${data.memberVo.jet_member_nick }</td>
                           <td class="text-center"><fmt:formatDate pattern="MM-dd" value="${data.classDetailVo.jet_class_detail_date }"/></td>
                         </tr>
                       
                    </tbody>
                  </table>
                -->  
                
           <!-- 게시판 테이블 -->     
                <c:forEach items="${resultList }" var="data">
	                <div class="col-4 mt-2 mb-4">  
						<div style="text-align: center; box-shadow: 2px 2px 4px 0px #BDBDBD; width: 350px; border-radius:5px">                 
							<c:choose>
								<c:when test="${!empty data.imageVoList }">
									<div><a href="${pageContext.request.contextPath }/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}"><img style=" width:350px; height:250px;text-align:center;" src="${data.imageVoList[0].jet_class_image_link }" alt="image"></a></div>
								</c:when>
								<c:otherwise>
									<div ><a href="${pageContext.request.contextPath }/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}"><img style=" width:250px; height:250px;text-align:center;" src="${pageContext.request.contextPath }/resources/image/logo.png" alt="image"></a></div>
								</c:otherwise>
							</c:choose>					
							
							<ul style="margin-left: -30px; margin-top: 10px">
								<li class="text-truncate" style="list-style-type: none;max-width: 320px;"><a href="${pageContext.request.contextPath }/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}" style="text-decoration:none; color:#000;">${data.classboardVo.jet_class_name }</a></li>
								
								<li style="list-style-type: none; margin-top: 10px;"><span class="badge bg-warning text-dark">작성자</span> <span style="font-size: 14px">${data.memberVo.jet_member_nick }</span></li>
							</ul>
							<div class="row" style="background-color:#FFFBEE; width:100%; margin-left:0px;border-top:1px solid #FFE08C">
								<div class="col"><img src="${pageContext.request.contextPath }/resources/image/readCt.PNG" alt="read"></div>
								<div class="col"><img src="${pageContext.request.contextPath }/resources/image/likeImg.PNG" alt="like"></div>
								<div class="col"><img src="${pageContext.request.contextPath }/resources/image/repleCt.PNG" alt="reple"></div>
							</div>
							<div class="row" style="background-color:#FFFBEE; width:100%; margin-left:0px">
								<div class="col" style="font-size:12px">신청현황</div>
								<div class="col" style="font-size:12px">별점</div>
								<div class="col" style="font-size:12px">수강날짜</div>
							</div>
							<div class="row" style="background-color:#FFFBEE; width:100%; margin-left:0px">
								<div class="col" style="font-size:12px">${data.countReserve} / ${data.classboardVo.jet_class_max_headcount}</div>
								<div class="col" style="font-size:12px">${data.starRating }</div>
								<div class="col" style="font-size:12px"><fmt:formatDate pattern="MM-dd" value="${data.classDetailVo.jet_class_detail_date }"/></div>
							</div>    
						</div> 
					</div>
				</c:forEach>
            </div>
            <div class="row mt-2">
            	 <hr> <!-- 선 -->
        	</div>
            <div class="row mt-2">
				<div class="col">
				<!-- <nav aria-label="Page navigation"> -->
				  <ul class="pagination justify-content-center">
				    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/classboard/main_classboard_page.do?page_num=1" class="page-link">&lt;&lt;</a></li>
					<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/classboard/main_classboard_page.do?page_num=${beginPage-1}" class="page-link">&lt;</a></li>
						<c:forEach begin="${beginPage }" end="${endPage }" var="index">
							<li class="page-item <c:if test="${index == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/classboard/main_classboard_page.do?page_num=${index }" class="page-link">${index}</a></li>
						</c:forEach>				      
					<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/classboard/main_classboard_page.do.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
					<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/classboard/main_classboard_page.do?page_num=${pageCount}" class="page-link">&gt;&gt;</a></li>
				  </ul>
					<!-- </nav> -->
				</div>    
			</div>        
         
    	</main>
      
	  </div>
   </div>
   <jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>