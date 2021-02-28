<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="row mt-3">
 
               <div class="col">
                             
                     <div class="map_wrap">
                         <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                         <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=359480e8f9355ac0c5dff3184ff92646&libraries=services"></script>
                         <div class="hAddr">
                             <span class="title">주소정보</span>
                             <span id="centerAddr"></span>
                         </div> 
                     </div>
 
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
                                var jetAddress = '법정동 주소정보' + jetAddr;


                                 // 마커를 클릭한 위치에 표시합니다 
                                 marker.setPosition(mouseEvent.latLng);
                                 marker.setMap(map);

                                 // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                 infowindow.setContent(content);
                                 infowindow.open(map, marker);
                                 
                                 document.getElementById("jet_board_tp_detail_adress").setAttribute("value",jetAddr);
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
                         
                         var latitude = document.getElementById('jet_board_tp_detail_latitude'); 
                         latitude.value = message;
                         
                         var longitude = document.getElementById('jet_board_tp_detail_longitude');
                         longitude.value = message2;
                         /*
                         document.map.latitude.value=latitude;
                         document.map.longitude.value=longitude;
                         */
                     });                        
                     </script>
                </div>          
            </div>               