<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../shareplan_board/script/update_shareplan_board_page_script.jsp"/>
</head>
<body onload="originalPlan();">
<jsp:include page="../commons/top_image.jsp"/>
	<main>
	<form id="share_form" action="${pageContext.request.contextPath}/shareplan_board/update_shareplan_board_process.do"  method="post" enctype="multipart/form-data">
            <div class="container">
                <div class="row mt-2">
                    <div class="col-5"></div>
                    <div class="col-4"></div>
                    <div class="col-2 text-muted" style="text-align: right;">게시판 > 제트기 > 글쓰기</div>
                </div>
                <div class="row mt-4 justify-content-center">
                    <div class="col-9  display-6">JET Write</div>
                    <div class="col-1">
                        
                    </div>
                </div>
                <div class="row justify-content-center">
	                <div class="col-10 ">
                        <hr>
                    </div>
                </div>

	                <div class="row justify-content-center">
	                    <div class="col-10">
	                        <div>
	                            <input id="share_title" name="jet_board_shareplan_title" type="text" class="form-control" value="${result.sharePlanBoardVo.jet_board_shareplan_title}">
	                        </div>
	                    </div>
	
	                </div>
	                <div class="row mt-3 justify-content-center">
		                <div class="col-10">
	                        <div style="background-color: #F6F6F6; height: 180px; border-radius: 5px; line-height: 26px;">
	                            <div style="padding: 25px;">
	                                ◎ 이곳은 게시판 작성시 주의사항을 적는곳입니다.
	                            </div>
	                        </div>
		                </div>
	                </div>
	
	                <div class="row mt-4 justify-content-center">
	                    <div class="col-1 ">	                    
	                        <div>
	                            <input type="file" name="upload_image" accept="image/*" value="사진 첨부"  style="background-color: #F6F6F6; border-radius: 5px;">
	                        </div>
	                    </div>
	                    <div class="col-9">
						<div class="row" style="float:right">
							<%--여행계획 불러오기--%>
							<div class="col">

								<div class="row">
									<%--여행 계획 출력 박스  --%>
									<div class="col" id="travel_plan_list"></div>
								</div>

								<div class="row">
									
									<div class="col mx-auto my-auto alert alert-warning alert-dismissible fade show" role="alert">
										<div class="text-center" style="width:105%;">
											여행계획 변경시, <strong>여행 계획 </strong>을 다시 선택해주세요!
										</div>
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
									<div class="col-1 mx-auto my-auto">
										<input type="button" id="call_myplan" value="plan추가"
											class="btn btn-primary" data-bs-toggle="modal"
											data-bs-target="#selectplanModal">
									</div>
									<div class="col-2"></div>
								</div>
								
																<div class="row mt-2">
									<div class="col mx-auto my-auto alert alert-warning alert-dismissible fade show" role="alert">
										<div class="text-center">
											내가 찜한 <strong>여행 계획</strong>을 추가하세요!
										</div>
										<button type="button" class="btn-close"
											data-bs-dismiss="alert" aria-label="Close"></button>
									</div>
									<div class="col-2 mx-auto my-auto">
										<input type="button" id="call_myplan" value="찜한 plan추가"
											class="btn btn-primary" data-bs-toggle="modal"
											data-bs-target="#selectpickplanModal">
									</div>
									<div class="col-2"></div>
								</div>

								<%--모달창 --%>
								<div class="modal fade" id="selectplanModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">

											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">나의 여행 계획
													목록</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>

											<div class="modal-body">
												<c:forEach items="${planList }" var="planList">
													<c:if
														test="${sessionUserVo.jet_member_no == planList.travelPlanVo.jet_member_no }">
														<div class="row mt-1">
															<div class="col d-grid gap-2">
																<input type="button" onclick="bringPlan('${planList.travelPlanVo.jet_board_travelplan_no}')" class="btn btn-outline-success" value="${planList.travelPlanVo.jet_board_travelplan_title }">
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>

											<div class="modal-footer">
												<div class="row">
													<div class="col d-grid gap-2">
														<!-- 버튼왜 풀로 안채워지냐 귀찮게 하지마라 진짜개빡치게  -->
														<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="선택 취소">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<%--모달창 끝 --%>
								<%--찜 모달창 --%>
								<div class="modal fade" id="selectpickplanModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">

											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">내가 찜한 여행 목록</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>

											<div class="modal-body">
												<c:forEach items="${pickList }" var="pickList">
													<c:if test="${(sessionUserVo.jet_member_no == pickList.pickBoardVo.jet_member_no) && (pickList.sharePlanBoardVo.jet_board_shareplan_no != null )}">
														<div class="row mt-1">
															<div class="col d-grid gap-2">
																<input type="button" onclick="bringPlan('${pickList.sharePlanBoardVo.jet_board_travelplan_no}')" class="btn btn-outline-success" value="${pickList.sharePlanBoardVo.jet_board_shareplan_title }">
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>

											<div class="modal-footer">
												<div class="row">
													<div class="col d-grid gap-2">
														<!-- 버튼왜 풀로 안채워지냐 귀찮게 하지마라 진짜개빡치게  -->
														<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="선택 취소">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<%--찜 모달창 끝 --%>								
								
								
							</div>
						</div>
					</div>
	                    
		            </div>
                   	<%--지도 --%>
                    <div class="row mt-3 justify-content-center">
                        <div class="col-10">
                          	
		                     <div class="map_wrap">
		                         <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
		                         

		                     </div>
		                     
                    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9add28148ee115953c9a2954f4561428&libraries=services"></script>
					<script >
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(33.381576, 126.566148), // 지도의 중심좌표
                                level: 10, // 지도의 확대 레벨
                                mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
                            }; 
               
                     // 지도를 생성한다 
                     var map = new kakao.maps.Map(mapContainer, mapOption);

					// 마커 이미지의 이미지 주소입니다
					 var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					 for (var i = 0; i < positions.length; i ++) {
					     
					     // 마커 이미지의 이미지 크기 입니다
					     var imageSize = new kakao.maps.Size(24, 35); 
					     
					     // 마커 이미지를 생성합니다    
					     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					     
					     // 마커를 생성합니다
					     var marker = new kakao.maps.Marker({
					         map: map, // 마커를 표시할 지도
					         position: positions[i].latlng, // 마커를 표시할 위치
					         title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					         image : markerImage // 마커 이미지 
					     });
					     
					 }
					 
                     </script>		            
		            
                        </div>
                     </div>		            
		            
					<div class="row mt-3">
						<div class="col-10" style="margin-left:110px">
							<div id="travelPlanView"></div>
						</div>
					</div>
	                <div class="row mt-3 justify-content-center">
	                    <div class="col-10">
	                        <div>
	                            <textarea name ="jet_board_shareplan_content"class="form-control" id="exampleFormControlTextarea1" rows="20" style="overflow-y:scroll">${result.sharePlanBoardVo.jet_board_shareplan_content }</textarea>
	                        </div>                            
	                    </div>
	
	                </div>
                	<div class="row mt-3" style="margin-bottom:100px">
                		<div class="col-10">
                		</div> 
                    	<div class="col">
                    		<input type="hidden" name="jet_board_shareplan_no" value="${result.sharePlanBoardVo.jet_board_shareplan_no}">
                        	<input onclick="shareSubmit()" id="saveBtn" class="btn btn-primary" type="button" value="작성하기">
                        </div>
                    </div>
            
                
            </div>
            </form>
            </main>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>