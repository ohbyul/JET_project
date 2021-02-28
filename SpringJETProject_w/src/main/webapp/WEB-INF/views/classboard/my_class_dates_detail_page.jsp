<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>

   
<title>원데이클래스 상세 페이지</title>


<jsp:include page="../classboard/style/my_class_dates_page_style.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../commons/style/classboard_vertical_nav_style.jsp"/>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
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
		    <div class="col text-center display-5" style="font-family: daum">나의 클래스 상세</div>
		</div>		
		<div class="row mt-4">
		    <hr> <!-- 선 -->
		</div>
	   
   
      <div class="row">
         <div class="col-1"></div>
            <div class="col">    <!-- 중앙 -->
               
                  <div class="row p-3" style="background-color: #F5F5F5;">
                     <div class="col">
                        <c:choose>
                           <c:when test="${!empty data.imageVo}">
                                <img src="${data.imageVo[0].jet_class_image_link}" class="d-block w-100" alt="image">
                           </c:when>
                           <c:otherwise>
                           		<img src="${pageContext.request.contextPath}/resources/image/tree0000.png" class="d-block w-100" alt="tree">
                           </c:otherwise>
                        </c:choose>                        
                     </div>                        
                     <div class="col"> <!-- 오른쪽 부분 -->
                        <div class="row">
                           <div class="col text-center" style="width: 4rem; font-size:20px; font-weight: bold;">
                           [ ${data.classCategoryVo.jet_class_category_name} ] ${data.classboardVo.jet_class_name}
                           </div>
                        </div>                     
                     	<div class="row mt-3">
                            <div class="col text-end">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
								  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
								  <path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
								</svg>								
								${data.classboardVo.jet_class_price}원        
							</div>
						</div>
						<div class="row">
                            <div class="col text-end">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
								  <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
								</svg>								
								${data.reserveCount} / ${data.classboardVo.jet_class_max_headcount}                            
                            </div>
                        </div>                                       

	                    <div class="row mt-2">
	                      <div class="col"> ${data.classboardVo.jet_class_content}</div>
	                    </div>

                     </div>
                     
                  </div>
                  
               
                  <div class="col mt-4">  
                     <c:if test="${!empty reserve}"> 
                        <table class="table table-bordered">
                          <thead>
                            <tr>
                              <th scope="col" class="col-2 text-center">예약 번호</th>
                              <th scope="col" class="col-2 text-center">ID</th>
                              <th scope="col" class="col-2 text-center">이름</th>
                              <th scope="col" class="col-2 text-center">핸드폰</th>
                              <th scope="col" class="col-2 text-center">카톡ID</th>
                              <th scope="col" class="col-2 text-center">예약일</th>
                            </tr>
                          </thead>
                          <tbody>
                             <c:forEach items="${reserve}" var="reserve">
                               <tr>
                                 <th scope="row" class=" text-center">${reserve.reservationVo.jet_class_reservation_no }</th>
                                 <td class="text-center">${reserve.memberVo.jet_member_id }</td>
                                 <td class="text-center">${reserve.memberVo.jet_member_name }</td>
                                 <td class="text-center">${reserve.memberVo.jet_member_phone }</td>
                                 <td class="text-center">${reserve.memberVo.jet_member_kakao }</td>
                                 <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${reserve.reservationVo.jet_class_reservation_date }"/></td>
                               </tr>
                             </c:forEach>
                          </tbody>
                        </table>
                     </c:if>    
                  </div>   
                  
            </div>
         <div class="col-1"></div>
      </div>
   </div>
   

<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>