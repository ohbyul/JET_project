<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>

<title>클래스 개설</title>



<jsp:include page="../classboard/script/open_class_page_script.jsp"/>  
<jsp:include page="../classboard/style/open_class_page_style.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../commons/style/classboard_vertical_nav_style.jsp"/>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>


   <div class="container">
      <main>
           <div class="row mt-2">
               <div class="col-5"></div>
               <div class="col-5"></div>
               <div class="col-2 text-muted" style="text-align: right;">home > board</div>
           </div>   
           <div class="row mt-4">
               <div class="col text-center display-5" style="font-family: Daum;">강좌 개설 페이지</div>
           </div>   
           <div class="row mt-4">
               <hr>             <!-- 선 -->
           </div>   
                                    
         <div class="row mt-2">
            <div class="col"></div>
            <div class="col-9">
               <form id="form_openclass" action="${pageContext.request.contextPath}/classboard/open_class_process.do" method="post" enctype="multipart/form-data">
                  <div class="row">
                     
                     <div class="col">   <!-- 여기가 안 -->
                        <div class="row">
                           <div class="col">                              
                              <select id="jet_class_category_no" name="jet_class_category_no" class="form-select form-select-sm">
                                 <option value="1">관광지 가이드</option>
                                 <option value="2">액티비티</option>
                                 <option value="3">올레길 걷기</option>
                                 <option>=======</option>
                              </select>
                           </div>
                           <div class="col-10 mb-2">
                              <input id="input_title" name="jet_class_name" type="text" class="form-control"  placeholder="ex) 한라산 등반 정복하기 " >
                           </div>                           
                        </div>
                        <div class="row">
                           <div class="col text-end mt-2">
                              <span class="badge bg-warning text-dark">작성자</span> ${sessionUser.jet_member_nick }<br>
                           </div>
                        </div>   
                        <div class="row mt-4">
                           <div class="col">
                              <input type="file" name="files" accept="image/*" multiple class="form-control">
                           </div>
                        </div>                                               
                     <div class="row mt-1">
                         <div class="col">    
                            <div class="map_wrap">
                            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                            <div class="hAddr">
                                <span class="title">주소정보</span>
                                <span id="centerAddr"></span>
                                
                              <input type="hidden" id="latitude" name="jet_class_latitude">
                              <input type="hidden" id="longitude" name="jet_class_longitude">
                               
                               <%--
                              <input type="hidden" name="latitude" value="">
                              <input type="button" name="jet_board_review_map_latitude" value="submit" onclick=map.submit();>
                              <input type="hidden" name="longitude" value="">
                              <input type="button" name="jet_board_Review_map_longitude" value="submit" onclick=map.submit();>
                               --%>
                            </div> 
                        </div>
                          
                        <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=359480e8f9355ac0c5dff3184ff92646&libraries=services"></script>
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
                                                   
                                       var jetAddr = '지번 주소 : ' + result[0].address.address_name;  
                                    var jetAddress = '법정동 주소정보' + jetAddr
                                       // 마커를 클릭한 위치에 표시합니다 
                                       marker.setPosition(mouseEvent.latLng);
                                       marker.setMap(map);
      
                                       // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                       infowindow.setContent(content);
                                       infowindow.open(map, marker);
                                       
                                       document.getElementById("address").setAttribute("value",jetAddr);
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
                               
                               //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                               document.getElementById("latitude").setAttribute("value",latlng.getLat());
                               document.getElementById("longitude").setAttribute("value",latlng.getLng());
                               
                           });                        
                        </script>
                         </div>
                     </div>
                     <div class="row mt-2">
                        <div class="col">
                           <textarea id="input_content" name="jet_class_content" class="form-control" placeholder="내용을 입력하세요" style="height: 300px; overflow-y:scroll;"></textarea>
                        </div>
                     </div>
                                                 
 
                        <div class="row mt-4">
                           <div class="col">
                     <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cash-stack" viewBox="0 0 16 16">
                       <path d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
                       <path d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z"/>
                     </svg> 가격              
                       <input type="text" id="input_price" name="jet_class_price" class="form-control"  placeholder="15000 (단위:원)">
                       </div>
                       <div class="col">
                       <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">
                         <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>
                         <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>
                       </svg> 소요시간
                       <input type="text" id="input_totaltime" name="jet_class_totaltime" class="form-control"  placeholder="180 (단위:분)">
                       </div>           
                       <div class="col">
                       <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                         <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"/>
                       </svg>   
                          <select id="input_headcount" name="jet_class_max_headcount" class="form-select">
                             <option value="0">모집인원(강사 제외)</option>
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
                          </select>   
                       </div>
                  </div>
                        <div class="row mt-4 text-center">
                           <div class="col">
	                                          시작일 : <input id="start_date" type="date">
	                       </div>
	                       <div class="col">
	                                          종료일 : <input id="end_date" type="date"><br>
                           </div>
                        </div>                              
                        <div class="row mt-4 text-end">
                           <div class="col">
                              <input class="btn btn-warning" type="button" value="강의 개설하기" onclick="frmSubmit()">      
                           </div>
                        </div>  
                                 
                                                 
                        <div class="row mt-2 text-end">
                           <div class="col">
                              <input type="hidden" id="address" name="jet_class_address">      
                           </div>
                        </div>                  
                     </div>
                    
                  </div>
               </form>
            </div>
            <div class="col"></div>
         </div>
      </main>
   </div>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>