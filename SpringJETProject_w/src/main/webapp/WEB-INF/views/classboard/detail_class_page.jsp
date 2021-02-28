<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>원데이클래스 상세 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../classboard/script/detial_class_page_script.jsp"/>  
<jsp:include page="../classboard/style/detail_class_page_style.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../commons/style/classboard_vertical_nav_style.jsp"/>
</head>
<body onload="reserveOnedayClass(); pickClass(); refreshSingo();">
<jsp:include page="../commons/top_image.jsp"/>

<jsp:include page="../commons/classboard_vertical_nav.jsp"/>  

   <div class="container">
      <div class="row mt-2">
          <div class="col-5"></div>
          <div class="col-5"></div>
          <div class="col-2 text-muted" style="text-align: right;">home > oneDay class</div>
      </div>
      <div class="row mt-4">
          <div class="col text-center display-5" style="font-family: Daum;">클래스 상세 페이지</div>
      </div>       
      <div class="row mt-4">
          <hr> <!-- 선 -->
      </div>
            
      <div class="row">
         <div class="col-1"></div>
         <div class="col">   <!-- 중앙 -->

            <div class="row p-3" style="background-color: #F5F5F5;">
               <div class="col">
                  <c:choose>
                     <c:when test="${!empty result.imageVoList}">
                        <img src="${result.imageVoList[0].jet_class_image_link}" class="d-block w-100" alt="image">
                     </c:when>
                     <c:otherwise>
                        <img src="${pageContext.request.contextPath}/resources/image/tree0000.png" class="d-block w-100" alt="tree">
                     </c:otherwise>
                  </c:choose>                        
               </div>      

               <div class="col">
                  <div class="row p-2">
                     <div class="col text-center" style="width: 4rem; font-size:20px; font-weight: bold;">
                        [ ${result.categoryVo.jet_class_category_name} ] ${result.classboardVo.jet_class_name}
                        
                     </div>
                     <div class="col-1">
                     	<div onclick="pickClass()"> 
			                <input id="btnPick" onclick="pickButton()">
                   		</div>
                     </div>
                  </div>

                  <div class="row mt-4">
                     <div class=" col">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                          <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                        </svg>                        
                        ${result.memberVo.jet_member_nick}
                     </div>
                     <div class="col">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                          <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                          <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                        </svg>
                        <fmt:formatDate pattern="MM-dd" value="${result.detailVo.jet_class_detail_date }"/>                  
                     </div>
                     <div class="col">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cash" viewBox="0 0 16 16">
                          <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
                          <path d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z"/>
                        </svg>                        
                        ${result.classboardVo.jet_class_price}원
                     </div>   
                     <div class="col">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
						  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>                       
                        ${result.starRating}
                     </div>                                       
                  </div>
                  <div class="row mt-4">
                     <div class="col">
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                          <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                          <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                        </svg>   
                        ${result.classboardVo.jet_class_address}
                     </div>
                  </div>
                  <c:if test="${sessionUser.jet_member_no != result.classboardVo.jet_member_no && countReserve < result.classboardVo.jet_class_max_headcount}">
                     <div class="row mt-4">   
                        <div class="col d-grid gap-2">
                           <input type="button" class="btn btn-primary btn-lg" id="btnReserve" onclick="reserveButton()">
                        </div>
                        <div class="col">   
                           <button type="button" class="btn btn-secondary btn-lg" disabled>
                            	예약 가능 인원 <span id="countReserve"></span> / ${result.classboardVo.jet_class_max_headcount}
                           </button>   
                        </div>
                     </div>
                  </c:if>
                  
                  <div class="row mt-3">
                  	<c:if test="${!empty sessionUser}">
                  		<div class="col" id="singoBox">
	                  		<!-- 모달 버튼. Button trigger modal -->
							<button type="button" class="badge bg-danger"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								style="float: right;">글 신고
							</button>
                  		</div>
                  	</c:if>
                  	
                  
                  	

						<!-- Modal. 모달 창 시작 -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<label for="sessionUser-name" class="col-form-label">신고자</label>
											<div class="form-control" id="sessionUser-name">${sessionUser.jet_member_nick}</div>
										</div>
										<div class="mb-3">
											<label for="jet_board_notice_singo_reason"
												class="col-form-label">신고 사유</label>
											<textarea class="form-control"
												id="jet_board_class_singo_reason"></textarea>

											<div class="row mt-1">
												<div id="confirm-singo-alert-box" class="col"></div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary"
											onclick="singoSubmitBtn()">완료</button>
									</div>
								</div>
							</div>
						</div>
						<%-- modal. 모달 창 끝 --%>
					
					<%--신고 row 끝 --%>
				
                  	
                  	
                  	
                  </div>
               </div>         
            </div>
            
            
                                  <%--지도 --%>
            <div class="row mt-3 justify-content-center">
                <div class="col p-0">
                     
                   <div class="map_wrap">
                       <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
                   </div>
                           
               <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=359480e8f9355ac0c5dff3184ff92646&libraries=services"></script>
               <script >
               
               var latitude = ${result.classboardVo.jet_class_latitude};
               var longitude = ${result.classboardVo.jet_class_longitude};
               
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                   mapOption = { 
                       center: new kakao.maps.LatLng(33.381576, 126.566148), // 지도의 중심좌표
                       level: 10 // 지도의 확대 레벨
                   };
   
               var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
               
               // 마커가 표시될 위치입니다 
               var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
   
               // 마커를 생성합니다
               var marker = new kakao.maps.Marker({
                   position: markerPosition
               });
   
               // 마커가 지도 위에 표시되도록 설정합니다
               marker.setMap(map);
                
                     </script>
                     
               </div>
            </div>
            <div class="row mt-5">
               <div class="col">${result.classboardVo.jet_class_content}</div>
            
            
	            <c:forEach items="${result.imageVoList}" var="imageVo">
	               <div class="row mt-5">
	                  <div class="col">
	                     <img src="${imageVo.jet_class_image_link}" class="rounded img-fluid mx-auto d-block" alt="classImage">
	                  </div>
	               </div>
	            </c:forEach>
	        </div>

         </div>
     
         <div class="col-1"></div>
         
        <div class="row mt-4">	<!-- 별점, 수강후기 -->
        	<div class="col">
        	<span style="font: bold; font-family:daum;">수강후기</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-text" viewBox="0 0 16 16">
				  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
				  <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
				</svg>        	
        	</div>
        </div>          
        <div class="row mt-4">
        	<hr> <!-- 선 -->
        </div>   
        
       
			<div class="row">
			<c:forEach items="${reviewVo }" var="reviewVo">
			  <div class="col-sm-6 mt-2">
			    <div class="card">
			      <div class="card-body">
			        <div class="card-title">
			        	<div class="row">
				        	<div class="col-7">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg>      	 		
								${reviewVo.memberVo.jet_member_nick }
							</div>
							<div class="col text-end">
								별점 <span class="fa fa-star checked" style="text-align: center"></span> ${reviewVo.reviewVo.jet_class_review_star_rating }
							</div>
							<div class="col text-end">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${reviewVo.reviewVo.jet_class_review_writedate }"/>
							</div>
						</div>
					</div>
			        <p class="card-text">${reviewVo.reviewVo.jet_class_review_content }</p>
			      </div>
			    </div>
			  </div>
			</c:forEach>        
			</div>
			          
             
		</div>
      </div>
   </div>
   

   
   <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
   

<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>