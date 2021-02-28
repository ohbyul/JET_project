<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Update travel plan detail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

<script type="text/javascript">
	
	function updatePlanTitle(){
		var updateTitle = document.getElementById("frm_updateTitle");	
		updateTitle.submit();
	}
	
</script>
<body>
<jsp:include page="../commons/global_nav.jsp"/>
	
   <main>
   <form id="frm_updateTitle" action="${pageContext.request.contextPath}/travelplan/update_travelplan_process.do" method="post" enctype="multipart/form-data" name="map"> 
      <div class="container">
           <div class="row mt-4 justify-content-center">
                 <div class="col-10">
                    
                    <div class="row">
                        <div class="col"><h4>나의 여행 계획 수정</h4></div>
                    </div>
                     
                    <div class="row mt-2">
                        <hr>
                    </div>
                     
                     <%--제목 --%>
                    <div class="row">
                       <div class="col">
                          <input type="text" class="form-control" name="jet_board_travelplan_title" value="${result.travelplanVo.jet_board_travelplan_title }">
                          
                       </div>
                    </div>
                    
                     <%--지도 --%>
                     <div class="row mt-3">
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
		                     
                     <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=9add28148ee115953c9a2954f4561428&libraries=services"></script>
                     <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(33.381576, 126.566148), // 지도의 중심좌표
                                level: 10, // 지도의 확대 레벨
                                mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
                            }; 
               
                     // 지도를 생성한다 
                     var map = new kakao.maps.Map(mapContainer, mapOption); 
               
                     var geocoder = new kakao.maps.services.Geocoder();

                     var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                         infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

                     // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
                     searchAddrFromCoords(map.getCenter(), displayCenterInfo);

                     // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
                     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                         searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                             if (status === kakao.maps.services.Status.OK) {
                                 var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                                 detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                                 
                                 var content = '<div class="bAddr">' +
                                                 '<span class="title">법정동 주소정보</span>' + 
                                                 detailAddr + 
                                             '</div>';

                                 // 마커를 클릭한 위치에 표시합니다 
                                 marker.setPosition(mouseEvent.latLng);
                                 marker.setMap(map);

                                 // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                 infowindow.setContent(content);
                                 infowindow.open(map, marker);
                             }   
                         });
                     });

                     // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
                     kakao.maps.event.addListener(map, 'idle', function() {
                         searchAddrFromCoords(map.getCenter(), displayCenterInfo);
                     });

                     function searchAddrFromCoords(coords, callback) {
                         // 좌표로 행정동 주소 정보를 요청합니다
                         geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                     }

                     function searchDetailAddrFromCoords(coords, callback) {
                         // 좌표로 법정동 상세 주소 정보를 요청합니다
                         geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                     }
                     
                     // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
                     function displayCenterInfo(result, status) {
                         if (status === kakao.maps.services.Status.OK) {
                             var infoDiv = document.getElementById('centerAddr');

                             for(var i = 0; i < result.length; i++) {
                                 // 행정동의 region_type 값은 'H' 이므로
                                 if (result[i].region_type === 'H') {
                                     infoDiv.innerHTML = result[i].address_name;
                                     break;
                                 }
                             }
                         }    
                     }
                     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                         
                         // 클릭한 위도, 경도 정보를 가져옵니다 
                         var latlng = mouseEvent.latLng; 
                         
                         // 마커 위치를 클릭한 위치로 옮깁니다
                         marker.setPosition(latlng);
                         
                         var message = latlng.getLat();
                         //message += '경도 : ' + latlng.getLng();
                         var message2 = latlng.getLng();
                         
                         var latitude = document.getElementById('latitude'); 
                         latitude.innerHTML = message;
                         
                         var longitude = document.getElementById('longitude');
                         longitude.innerHTML = message2;
                         /*
                         document.map.latitude.value=latitude;
                         document.map.longitude.value=longitude;
                         */
                     });                        
                     </script>
                        </div>
                     </div>  
                     <div class="row mt-2">
                        <hr>
                     </div>
              	    <hr style="background-color:#8C8C8C;">
                 
	                  <div class="row">
	                     <table class="table">
	                        <thead>
	                           <tr class="table-warning">
	                             <th scope="col" class="col-3 text-center">일차</th>
	                             <th scope="col" class="col-3 text-center">시간</th>
	                             <th scope="col" class="col-5 text-center">계획</th>
	                             <th scope="col" class="col-1 text-center"><input type="checkbox"></th>
	                            </tr>
	                         </thead>
	                         
	                         <tbody id="detail_list_box">
	                         	<c:forEach items="${resultList }" var="data">
		                         	<tr class="tr_top">
		                         		<td class="col text-center">Day ${data.detailVo.jet_board_tp_detail_day }</td>
		                         		<td class="col text-center">${data.detailVo.jet_board_tp_detail_starthours } : ${data.detailVo.jet_board_tp_detail_startmin }</td>
		                         		<td class="col text-center">
		                         			[${data.categoryName.jet_board_tp_detail_ctgr_name}]${data.detailVo.jet_board_tp_detail_placename }
		                         		</td>
		                         		<td class="col text-center" onclick="deleteBox(this)">삭제
		                         			<%--<input type="hidden" name="jet_board_tp_detail_ctgr_no" value="2">
		                         			<input type="hidden" name="jet_board_tp_detail_latitude" value="1324">
		                         			<input type="hidden" name="jet_board_tp_detail_longitude" value="13241234">
		                         			<input type="hidden" name="jet_board_tp_detail_day" value="1">
		                         			<input type="hidden" name="jet_board_tp_detail_starthours" value="12">
		                         			<input type="hidden" name="jet_board_tp_detail_startmin" value="30">
		                         			<input type="hidden" name="jet_board_tp_detail_placename" value="튤립 공원"> --%>
		                         		</td>	
		                         	</tr>			
	                         	</c:forEach>  
	                       	 </tbody>
	                       	 
	                     
	                     </table>
	                  </div>
                  
	                  <hr style="background-color:#8C8C8C;">
	                  
	                  <div class="row mt-2">
	                     <div class="col text-end mb-2">
	                        <input class="btn btn-success ps-3 pe-3" onclick="updatePlanTitle()" type="button" value="수정">
	                     </div>
	                  </div>
                  
               </div>
			</div>
		</div>
		
      </form> 
                 
    </main>



















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