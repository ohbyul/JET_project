<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>나의 여행 계획</title>
<jsp:include page="../travelplan/style/read_travelplan_page_style.jsp"/>
<jsp:include page="../travelplan/script/read_travelplan_page_script.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	
	
</style>
</head>
<body onload="bringPlan()">
	
	<jsp:include page="../commons/top_image_2.jsp"/>
   
   <main> 
      <div class="container">
           <div class="row mt-4 justify-content-center">
                 <div class="col-10">
                    
                    <div class="row">
                        <div class="col"><h4>나의 여행 계획</h4></div>
                    </div>
                     
                    <div class="row mt-2">
                        <hr>
                    </div>
               	 
                    <%--제목 --%>
                    <div class="row">
                       <div class="col">
                          <div class="form-control">${result.travelplanVo.jet_board_travelplan_title }</div>
                       </div>
                    </div>
                    
                     <%--지도 --%>
                    <div class="row mt-3" style="z-index: 1;">
                        <div class="col">
                          	
		                     <div class="map_wrap">
		                         <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		                         <div class="hAddr">
		                             <span class="title">주소정보</span>
		                             <span id="centerAddr"></span>
		                             
		                           <div id="latitude"></div>
		                           <div id="longitude"></div>
		                         </div> 
		                     </div>
		                     
                    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=359480e8f9355ac0c5dff3184ff92646&libraries=services"></script>
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
                     
               		 
                    <div class="row mt-2">
                       <hr>
                    </div>
                       
              	    
                 
	                <div class="row mt-3">
	                   <div class="col-3 text-center pe-0" style="padding-left: 1%">일차</div>
	                   <div class="col-2 text-center pe-4" style="padding-left: 1.25%">시간</div>
	                   <div class="col-7 text-center pe-5">계획</div>
	                </div>
	                
	                <hr style="background-color:#8C8C8C;">
                  	
                  	<div class="row mt-3">
	                   <div class="col" id="travelPlanView">
	                   
						</div>
	                </div>
	                
	                <hr style="background-color:#8C8C8C;">
	                  
	                <div class="row mt-2">
	                   <div class="col text-start mb-2">
	                   <form id="frm_share" action="${pageContext.request.contextPath }/shareplan_board/write_shareplan_planshared_page.do" style="display: inline;">
	                   		<input type="hidden" name="jet_board_travelplan_no" value="${result.travelplanVo.jet_board_travelplan_no}">
	                   		<input onclick="shareToJetBoard()" type="button" class="btn btn-success" value="공유">
	                   </form>
	                   <form id="frm_gatherparty" action="${pageContext.request.contextPath }/party_board/write_party_planshared_page.do" style="display: inline;">
	                   		<input type="hidden" name="jet_board_travelplan_no" value="${result.travelplanVo.jet_board_travelplan_no}">
	                   		<input onclick="gatherPartyByPlan()" type="button" class="btn btn-success" value="여행 친구 찾기"/>
	                   </form>
	                   </div>
		                   <div class="col text-end">
			                <a class="btn btn-secondary" href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">목록으로</a>
			                <a class="btn btn-secondary" href="${pageContext.request.contextPath }/travelplan/delete_travelplan_process.do?jet_board_travelplan_no=${result.travelplanVo.jet_board_travelplan_no}">삭제</a>
		                   </div>
	                   </div>
	                </div>
               </div>
			</div>          
    	</main>
	<jsp:include page="../commons/global_nav.jsp"/>
   	<jsp:include page="../commons/top_blank.jsp"/>
	<jsp:include page="../commons/global_footer.jsp"/>
	

	<div id="subQQQ" class="row d-none">
		<div class="col">
			<div class="row mt-2">
				<hr>
			</div>

			<div class="row mt-2">
				<div class="col-3 text-muted">
					<div class="form-control" style="background-color: #ffbf80">주소</div>
					<%-- jet_board_tp_detail_address 여행지 주소--%>
				</div>
				<div class="col text-muted">
					<input class="form-control" type="text"
						id="jet_board_tp_detail_latitude" placeholder="위도">
				</div>
				<div class="col text-muted">
					<input class="form-control" type="text"
						id="jet_board_tp_detail_longitude" placeholder="경도">
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-3 text-muted">
					<div class="form-control" style="background-color: #ffbf80">여행지
						이름</div>
				</div>
				<div class="col text-muted">
					<input class="form-control" type="text"
						id="jet_board_tp_detail_placename">
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-3">
					<div class="form-control" style="background-color: #ffbf80">날짜</div>
				</div>
				<div class="col-2">
					<select class="form-select" id="jet_board_tp_detail_day">
						<option value="Day1">1</option>
						<option value="Day2">2</option>
						<option value="Day3">3</option>
						<option value="Day4">4</option>
						<option value="Day5">5</option>
						<option value="Day6">6</option>
						<option value="Day7">7</option>
						<option value="Day8">8</option>
						<option value="Day9">9</option>
						<option value="Day10">10</option>
					</select>
				</div>
				<div class="col-1 p-0 mt-3">
					<div>일차</div>
				</div>
				<div class="col-2">
					<select class="form-select" id="jet_board_tp_detail_starthours">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
					</select>
				</div>
				<div class="col-1 p-0 mt-3">
					<div>시</div>
				</div>
				<div class="col-2">
					<select class="form-select" id="jet_board_tp_detail_startmin">
						<option value="0">00:00</option>
						<option value="30">00:30</option>
					</select>
				</div>
				<div class="col-1 p-0 mt-3">
					<div>분</div>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-3 text-muted">
					<div class="form-control" style="background-color: #ffbf80">간단한
						설명</div>
				</div>
				<div class="col text-muted">
					<input type="text" class="form-control"
						id="jet_board_tp_detail_content">
				</div>
			</div>
		</div>
	</div>

	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>