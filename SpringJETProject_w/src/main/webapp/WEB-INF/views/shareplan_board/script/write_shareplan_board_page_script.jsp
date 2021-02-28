<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

var positions = [];
var linePath = [];

<%--예외처리--%>
function shareSubmit(){
	var shareTitle = document.getElementById("share_title");
	var shareContent = document.getElementById("exampleFormControlTextarea1");
	var planBox = document.getElementById("travelPlanView");
	if(shareTitle.value==""){
		alert("제목을 작성해주세요!");
		shareTitle.focus();
		return;
	}
	if(shareContent.value==""){
		alert("내용을 작성해주세요!");
		shareContent.focus();
		return;
	}
	if(planBox.children.length==0){
		alert("여행계획을 추가해주세요.");
		return;
	}
	
	var shareForm = document.getElementById("share_form");
	shareForm.submit();
	
}






function bringPlan(jet_board_travelplan_no){

	
	var removeMap = document.getElementById("map");
	
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);

			var datailPlan = document.getElementById("travelPlanView");
			datailPlan.innerHTML = "";
			//트레블넘버 보내기
			var planNo = document.createElement("input");
			planNo.setAttribute("type","hidden");
			planNo.setAttribute("name","jet_board_travelplan_no");
			planNo.setAttribute("value",jet_board_travelplan_no);
			
			for(planDetailList of obj){

				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row");
				
				var colBox = document.createElement("div");
				colBox.setAttribute("class", "col");
				
				var details = document.createElement("details");
				details.setAttribute("class","form-control p-0 mt-1");
				
				var summary = document.createElement("summary");
				summary.setAttribute("class","form-control pt-3 pb-3");
				summary.setAttribute("style","box-shadow: 0px 2px 1px 0px #cccccc;");
				
				var interval = document.createElement("strong");
				interval.setAttribute("style","padding: 2.5%");
				var day = document.createElement("strong");
				day.setAttribute("class","ps-4 pe-5");
				day.innerText="Day " +planDetailList.detailVo.jet_board_tp_detail_day;
				
				
				var interval2 = document.createElement("strong");
				interval.setAttribute("class","ps-5 pe-4");
				var hour = document.createElement("strong");
				hour.setAttribute("class","ps-5 pe-5");
				if(planDetailList.detailVo.jet_board_tp_detail_startmin == "0"){
	                  hour.innerText=planDetailList.detailVo.jet_board_tp_detail_starthours +" : 00"; 
	               }else{
	                  hour.innerText=planDetailList.detailVo.jet_board_tp_detail_starthours +" : "+ planDetailList.detailVo.jet_board_tp_detail_startmin;
	               }
	               //분출력시 0으로 출력되는것  00으로 변경
				
				
				var interval3 = document.createElement("strong");
				interval.setAttribute("class","ps-5 pe-3");
				var placeName = document.createElement("strong");
				placeName.setAttribute("class","ps-5");
				placeName.innerText="[" +planDetailList.categoryName.jet_board_tp_detail_ctgr_name +"] " + planDetailList.detailVo.jet_board_tp_detail_placename;
				
				var detailContentBox = document.createElement("div");
				detailContentBox.setAttribute("class","mt-3 mb-3");
				
				var interval4 = document.createElement("div");
				interval4.setAttribute("class","col");
				
				var detailContent = document.createElement("div");
				interval4.setAttribute("class","col-10");
				
				var addressBox = document.createElement("div");
				addressBox.setAttribute("class","row");
				
				var address = document.createElement("div");
				address.setAttribute("class","col-3");
				address.setAttribute("style","text-align:center;");
				address.innerText="주소 : ";
				
				var latitudeBox = document.createElement("div");
				latitudeBox.setAttribute("class","col");
				
				var latitude = document.createElement("div");
				latitude.setAttribute("class","form-control text-center");
				latitude.innerText=planDetailList.detailVo.jet_board_tp_detail_latitude;
				
				var longitudeBox = document.createElement("div");
				longitudeBox.setAttribute("class","col");
				
				var longitude = document.createElement("div");
				longitude.setAttribute("class","form-control text-center");
				longitude.innerText=planDetailList.detailVo.jet_board_tp_detail_longitude;
				
				var explanationBox = document.createElement("div");
				explanationBox.setAttribute("class","row mt-2");
				
				var explanation = document.createElement("div");
				explanation.setAttribute("class","col-3");
				explanation.setAttribute("style","text-align:center;");
				explanation.innerText="간단한 설명 : ";
				
				var titleBox = document.createElement("div");
				titleBox.setAttribute("class","col-9");
				
				var title = document.createElement("div");
				title.setAttribute("class","form-control text-center");
				title.innerText=planDetailList.detailVo.jet_board_tp_detail_content;
								
				var interval5 = document.createElement("div");
				interval5.setAttribute("class","col");
				
				detailContentBox.append(interval4);
				detailContentBox.append(detailContent);
				detailContentBox.append(interval5);
				
				detailContent.append(addressBox);
				detailContent.append(explanationBox);
				
				addressBox.append(address);
				addressBox.append(latitudeBox);
				addressBox.append(longitudeBox);
	
				explanationBox.append(explanation);
				explanationBox.append(titleBox);
				
				latitudeBox.append(latitude);
				longitudeBox.append(longitude);
				
				titleBox.append(title);
				
	
				rowBox.append(colBox);
	
				colBox.append(details);
				
				details.append(summary);
				details.append(detailContentBox);
				
				summary.append(interval);
				summary.append(day);
				summary.append(interval2);
				summary.append(hour);
				summary.append(interval3);
				summary.append(placeName);
	
				datailPlan.append(rowBox);
				datailPlan.append(planNo);
				
				
				positions.push({title : planDetailList.detailVo.jet_board_tp_detail_placename, latlng: new kakao.maps.LatLng(planDetailList.detailVo.jet_board_tp_detail_latitude, planDetailList.detailVo.jet_board_tp_detail_longitude)});
				linePath.push(new kakao.maps.LatLng(planDetailList.detailVo.jet_board_tp_detail_latitude, planDetailList.detailVo.jet_board_tp_detail_longitude));
			    
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
				// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
				
				


				 // 지도에 표시할 선을 생성합니다
				 var polyline = new kakao.maps.Polyline({
				     path: linePath, // 선을 구성하는 좌표배열 입니다
				     strokeWeight: 5, // 선의 두께 입니다
				     strokeColor: '#00A500', // 선의 색깔입니다
				     strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				     strokeStyle: 'solid' // 선의 스타일입니다
				 });

				 // 지도에 선을 표시합니다 
				 polyline.setMap(map);
				 
				 
				 
				 
				 				 
				
			}
		}
			
	};
	xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/get_travel_plan.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_travelplan_no=" + jet_board_travelplan_no);
	

	}


</script>