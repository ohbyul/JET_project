<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<%--카드 호버 --%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%--제이 쿼리  --%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type="text/javascript">
	
var positions = [];
var linePath = [];

	//댓글쓰기
	function writeAttend() {
		
		var attendContent = document.getElementById("jet_party_attend_content").value;
		var contentNo = ${result.partyBoardVo.jet_board_party_no};
		
		if(attendContent==""){
			alert("참여 신청을 원하시면 내용을 입력해주세요.");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/write_attend_party_board_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no=" + contentNo + "&jet_party_attend_content=" + attendContent + "&jet_party_attend_state_no=1");
		//히든으로 날려주는건 폼 태그가 있을때 가능 그냥 샌드에 값넣어서 넘겨주면 넘어감
		document.getElementById("jet_party_attend_content").value = "";
	
	}
	
	//참여(리플) 출력
	function refreshAttend() {
		
		var contentNo = ${result.partyBoardVo.jet_board_party_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				//참여 댓글 갯수 출력 백엔드로 처리했지만 그냥 자바 스크립크 로 뽑아오기
				var AttendCntBox = document.getElementById("attend_count_box");
				AttendCntBox.innerText = "신청("+obj.length +")명";
				
				var attendListBox = document.getElementById("attend_list_box");

				var childCount = attendListBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					attendListBox.childNodes[0].remove();
				}
				
				for(attendData of obj){
					
					var bigBox = document.createElement("div");
					bigBox.setAttribute("style","border-bottom: 1px solid rgb(160, 160, 160);");
					
					var rowBox1 = document.createElement("div");
					rowBox1.setAttribute("class","row");
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class","col-2 mt-2");
					nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					nickBox.innerText=attendData.memberVo.jet_member_nick;
					
					var ratingBox = document.createElement("div");
					ratingBox.setAttribute("class","col-2 mt-2");
					ratingBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					ratingBox.setAttribute("id","rating_box");
					
					if(attendData.rating == "5"){
						ratingBox.innerText="❤❤❤❤❤"
					}else if(attendData.rating == "4"){
						ratingBox.innerText="❤❤❤❤"
					}else if(attendData.rating == "3"){
						ratingBox.innerText="❤❤❤"
					}else if(attendData.rating == "2"){
						ratingBox.innerText="❤❤"
					}else if(attendData.rating == "1"){
						ratingBox.innerText="❤"
					}else {
						ratingBox.innerText=" "
					}
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col text-muted");
					dateBox.setAttribute("style","text-align: right;font-size: 12px;");
					var d = new Date(attendData.partyBoardAttendVo.jet_party_attend_writedate);
					//밀리 세컨드 - > 데이트 타입
					var strDate =(d.getMonth() + 1) + "/" + d.getDate() + "/" +d.getFullYear() +" " + d.getHours() + ":" + d.getMinutes() + ":" +d.getSeconds();
					dateBox.innerText = strDate;
					
					var rowBox2 = document.createElement("div");
					rowBox2.setAttribute("class","row mt-2");
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class","col");
					contentBox.setAttribute("style","font-size: 14px;");
					contentBox.innerText=attendData.partyBoardAttendVo.jet_party_attend_content;
					
					var rowBox3 = document.createElement("div");
					rowBox3.setAttribute("class","row mb-2");
					
					var blankBox = document.createElement("div");
					blankBox.setAttribute("class","col-8");
					
					var approveBox = document.createElement("div");
					approveBox.setAttribute("class","col");
					
					var rejectBox = document.createElement("div");
					rejectBox.setAttribute("class","col");
					
					if(jet_member_no == ${result.partyBoardVo.jet_member_no}){	//파티장만 승인 거절 할수있게
						if(attendData.partyBoardAttendVo.jet_party_attend_state_no=="1"){	//보류상태면 파티장이 승인거절 버튼 둘다 보이고
							var approvebtn = document.createElement("button");
							approvebtn.setAttribute("style","outline:0; border-radius:5px;border:1;border-color:skyblue; background-color:skyblue;color:white;font-size:12px;float:right;");
							approvebtn.setAttribute("onclick","approveAttend("+attendData.partyBoardAttendVo.jet_party_attend_no+")");
							//approvebtn.setAttribute("id","approvebtn");
							approvebtn.innerText="승인";
							
							var rejectbtn = document.createElement("button");
							rejectbtn.setAttribute("style","outline:0;border-radius:5px;border:2;border-color:indianred;background-color:indianred;color:white;font-size:12px;float:right;");
							rejectbtn.setAttribute("onclick","rejectAttend("+attendData.partyBoardAttendVo.jet_party_attend_no+")");
							rejectbtn.innerText="거절";
						}else if(attendData.partyBoardAttendVo.jet_party_attend_state_no=="2"){		//승인 상태면 승인완료된 파티원이라 알려줌
							var approvebtn = document.createElement("div");
							approvebtn.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;color:blue;");
							approvebtn.innerText="[승인 완료]";
							
							var rejectbtn = document.createElement("div");
							rejectbtn.innerText="";
							
						}else if(attendData.partyBoardAttendVo.jet_party_attend_state_no=="3"){		//거절 상태시 거절 완료된 신청자라고 알려줌
							var approvebtn = document.createElement("div");
							approvebtn.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;color:red;");
							approvebtn.innerText="[거절 완료]";
							
							var rejectbtn = document.createElement("div");
							rejectbtn.innerText="";
						}
					
					}else{	//파티장이 아닐경우
						if(jet_member_no == attendData.partyBoardAttendVo.jet_member_no){	//내가 내댓글 에서
							
							if(attendData.partyBoardAttendVo.jet_party_attend_state_no=="1"){	//아직 파티장이 신청자 댓글을 보류중일때
								var approvebtn = document.createElement("div");
								approvebtn.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;");
								approvebtn.innerText="[신청 완료]";
								
								var rejectbtn = document.createElement("div");
								rejectbtn.innerText="";
							
							}else if(attendData.partyBoardAttendVo.jet_party_attend_state_no=="2"){	//파티장이 승원해줬을때
								var approvebtn = document.createElement("div");
								approvebtn.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;color:blue;");
								approvebtn.innerText="[승인됨]";
								
								var rejectbtn = document.createElement("div");
								rejectbtn.innerText="";
								
							}else if(attendData.partyBoardAttendVo.jet_party_attend_state_no=="3"){	//파티장에 거절했을때
								var approvebtn = document.createElement("div");
								approvebtn.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;color:red;");
								approvebtn.innerText="[거절됨]";
								
								var rejectbtn = document.createElement("div");
								rejectbtn.innerText="";
							}
						}else{	//내가 아닌 다른 사람 댓글볼때
							var approvebtn = document.createElement("div");
							approvebtn.innerText="";
							
							var rejectbtn = document.createElement("div");
							rejectbtn.innerText="";
						}
						
					}	
					var deleteBox = document.createElement("div");
					deleteBox.setAttribute("class","col");
					
					if(jet_member_no == attendData.partyBoardAttendVo.jet_member_no){	
						if(attendData.partyBoardAttendVo.jet_party_attend_state_no =="2"){
							var deletebtn = document.createElement("button");
							deletebtn.setAttribute("style","outline:0;border-radius:5px;border:2;background-color:black;color:white;font-size:12px;float:right;");
							deletebtn.setAttribute("onclick","delelteMyAttendAndFixcount("+attendData.partyBoardAttendVo.jet_party_attend_no+")");
							deletebtn.innerText=" 참여탈퇴 ";
						}else{
							var deletebtn = document.createElement("button");
							deletebtn.setAttribute("style","outline:0;border-radius:5px;border:2;background-color:black;color:white;font-size:12px;float:right;");
							deletebtn.setAttribute("onclick","delelteMyAttend("+attendData.partyBoardAttendVo.jet_party_attend_no+")");
							deletebtn.innerText=" 삭제 ";
						}
						
					}else if(jet_member_no != attendData.partyBoardAttendVo.jet_member_no){
						var deletebtn = document.createElement("div");
						deletebtn.innerText="";
					}	
					
					bigBox.append(rowBox1);
					bigBox.append(rowBox2);
					bigBox.append(rowBox3);
					
					rowBox1.append(nickBox);
					rowBox1.append(ratingBox);
					rowBox1.append(dateBox);
					
					rowBox2.append(contentBox);
					
					rowBox3.append(blankBox);
					rowBox3.append(approveBox);
					approveBox.append(approvebtn);
					rowBox3.append(rejectBox);
					rejectBox.append(rejectbtn);
					rowBox3.append(deleteBox);
					deleteBox.append(deletebtn);
					
					attendListBox.append(bigBox);
					
				}				
			}
		};
		xmlhttp.open("get","${pageContext.request.contextPath }/party_board/get_party_attend_list.do?jet_board_party_no="+contentNo);
		xmlhttp.send();	
	}		

	//댓글삭제
	function delelteMyAttend(attend_no) {
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/delete_attend_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_party_attend_no=" + attend_no );
	}

	//참여 탈퇴  + 댓글삭제
	function delelteMyAttendAndFixcount(attend_no) {
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/delete_attend_and_fixcount_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_party_attend_no=" +attend_no);
	}
	//승인
	function approveAttend(attendNo) {
	
	if(${result.partyBoardVo.jet_board_party_headcount ==result.partyBoardVo.jet_board_party_fixcount}){
		alert("모집이 완료 되었습니다.더이상 승인 불가 합니다.");
		return;
	}
	
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/update_approve_proces.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_party_attend_no=" +attendNo);
	}
	
	//거절
	function rejectAttend(attendNo) {
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/update_reject_proces.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_party_attend_no="+attendNo );
			
	}
	
	/* 댓글창 한사람이 한댓글만 작성할수있게..*/	
	function checkAttendprocess() {
	var xmlhttp = new XMLHttpRequest();
		
		var partyNo =  ${result.partyBoardVo.jet_board_party_no }
	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				var isWrote = false;
				
				for(attendList of obj){
					if(attendList.partyBoardAttendVo.jet_member_no == jet_member_no){
						isWrote = true;
						break;
					}
				}//포문 닫기
				
				
				if(isWrote == false){
					if(${result.partyBoardVo.jet_member_no}==jet_member_no){
						var attendBox = document.getElementById("write_attend_box");
						attendBox.setAttribute("class","row d-none");
					}else{
						var attendBox = document.getElementById("write_attend_box");
						attendBox.setAttribute("class","row");
					}
					//파티장 본인이 쓴 글에는 댓글 창 안보이게 
				}else{
					var attendBox = document.getElementById("write_attend_box");
					attendBox.setAttribute("class","row d-none");
				}
				
				
				
			}//큰이프 닫기
				
		}; //펑션 닫기
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/check_attend_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no=" + partyNo );
	}
	
	
	//확정 닉네임 출력
	function approveList() {
		
		var partyNo =  ${result.partyBoardVo.jet_board_party_no }
		var approveMemberBox = document.getElementById("approve_member_list");
		
		var childCount = approveMemberBox.childNodes.length ;
		for(var i =0 ; i < childCount ; i++){
			approveMemberBox.childNodes[0].remove();
		}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				for(approveData of obj){
					
					var spanBox = document.createElement("span");
					spanBox.innerText=" ◾ "+approveData.memberVo.jet_member_nick;
					
					approveMemberBox.append(spanBox);
				}
			}	
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/get_approve_membervo_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no="+partyNo );
		
	}
/*	
	function getRating() {
		//aaa
		var rating_box = document.getElementById("rating_box");
		
		var childCount = rating_box.childNodes.length ;
		for(var i =0 ; i < childCount ; i++){
			rating_box.childNodes[0].remove();
		}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				for(Data of obj){
					
					var rating = document.createElement("span");
					rating.innerText="["+결과값.+"]";
					
					approveMemberBox.append(spanBox);
				}
			}	
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/party_board/get_rating_value.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no="+jet_member_no );
		
	}
*/
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
//여행계획 출력
function refreshPlan() {

	var travelplan_no = ${result.partyBoardVo.jet_board_travelplan_no };
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);
			
			var planBox = document.getElementById("travelplan_box");
			
			for(planDetailList of obj){
				
				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row");		//젤큰 로우
				
				var colBox = document.createElement("div");
				colBox.setAttribute("class", "col");	//젤큰 컬
				
				var details = document.createElement("details");
				details.setAttribute("class","form-control p-0 mt-1");
				details.setAttribute("style","border-width: 0px;");
				
				var summary = document.createElement("summary");
				summary.setAttribute("class","form-control pt-3 pb-3");
				summary.setAttribute("style","border: 2px dashed olive;border-radius: 20px;");
				
				/*
				var details = document.createElement("details");
				details.setAttribute("class","form-control p-0 mt-1");
				
				var summary = document.createElement("summary");
				summary.setAttribute("class","form-control pt-3 pb-3");
				summary.setAttribute("style","box-shadow: 0px 2px 1px 0px #cccccc;");
				
				*/
				
				var interval = document.createElement("strong");
				interval.setAttribute("style","padding: 2.5%");
				var day = document.createElement("strong");
				day.setAttribute("class","ps-4 pe-5");
				day.innerText="Day  " + planDetailList.detailVo.jet_board_tp_detail_day;
				
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
				placeName.innerText="[" +planDetailList.categoryName.jet_board_tp_detail_ctgr_name +"] " + planDetailList.detailVo.jet_board_tp_detail_placename ;
				
				var detailContentBox = document.createElement("div");
				detailContentBox.setAttribute("class","pt-3 pb-3");
				//detailContentBox.setAttribute("style","border: 1px solid gray;border-top: 0px;");
				
				var interval4 = document.createElement("div");
				interval4.setAttribute("class","col");
				
				var detailContent = document.createElement("div");
				interval4.setAttribute("class","col-10");
				
				var addressBox = document.createElement("div");
				addressBox.setAttribute("class","row mx-2");
				
				var address = document.createElement("div");
				address.setAttribute("class","col-3 input-group-text");
				address.setAttribute("style","text-align:center;");
				//address.setAttribute("style","background-color: olive;"); 구림
				address.innerText="주소"
				/*
				var latitudeBox = document.createElement("div");
				latitudeBox.setAttribute("class","col");
				
				var latitude = document.createElement("div");
				latitude.setAttribute("class","form-control text-center");
				latitude.innerText=planDetailList.detailVo.jet_board_tp_detail_latitude ;
				
				var longitudeBox = document.createElement("div");
				longitudeBox.setAttribute("class","col");
				
				var longitude = document.createElement("div");
				longitude.setAttribute("class","form-control text-center");
				longitude.innerText=planDetailList.detailVo.jet_board_tp_detail_longitude ;
				*/
				var jetAddressBox = document.createElement("div");
				jetAddressBox.setAttribute("class","col");
				
				var jetAddress = document.createElement("div");
				jetAddress.setAttribute("class","form-control text-center");
				jetAddress.innerText=planDetailList.detailVo.jet_board_tp_detail_adress;
				
				var explanationBox = document.createElement("div");
				explanationBox.setAttribute("class","row mt-2 mx-2");
				
				var explanation = document.createElement("div");
				explanation.setAttribute("class","col-3");
				explanation.innerText="간단한 설명";
				
				var contentBox = document.createElement("div");
				contentBox.setAttribute("class","col");
				
				var content = document.createElement("div");
				content.setAttribute("class","form-control text-center");
				content.innerText=planDetailList.detailVo.jet_board_tp_detail_content;
				
				var interval5 = document.createElement("div");
				interval5.setAttribute("class","col");
				
				rowBox.append(colBox);
				colBox.append(details);	
				
				details.append(summary);
				summary.append(interval);
				summary.append(day);
				summary.append(interval2);
				summary.append(hour);
				summary.append(interval3);
				summary.append(placeName);
				
				details.append(detailContentBox);
				detailContentBox.append(interval4);
				
				detailContentBox.append(detailContent);
				detailContent.append(addressBox);
				addressBox.append(address);
				//addressBox.append(latitudeBox);
				//latitudeBox.append(latitude);
				//addressBox.append(longitudeBox);
				//longitudeBox.append(longitude);
				addressBox.append(jetAddressBox);
				jetAddressBox.append(jetAddress);
					
				detailContent.append(explanationBox);
				explanationBox.append(explanation);
				explanationBox.append(contentBox);
				contentBox.append(content);
				
				detailContentBox.append(interval5);
				
				
				planBox.append(rowBox);
				
				
				//지도
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
	
	xmlhttp.open("post","${pageContext.request.contextPath }/party_board/get_travelplan_list.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("jet_board_travelplan_no="+travelplan_no);
	
}	//여행계획 가져오기

//----------------------------------------------------
	//신고인서트
	function singoSubmitBtn() {
		
		var partyNo = ${result.partyBoardVo.jet_board_party_no };
		var singoReason = document.getElementById("jet_board_party_singo_reason").value;
/*
		if(${SessionMemberVo==""}==false){
			alert("로그인 후 이용 가능합니다.");
			return;
		}
*/		
		if(singoReason==""){
			alert("신고사유를 입력해주세요.");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					refresh();
						
				}	
			};
			xmlhttp.open("post","${pageContext.request.contextPath}/party_board/singo_party_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("jet_board_party_no="+partyNo+"&jet_board_party_singo_reason="+singoReason);
			
			document.getElementById("jet_board_party_singo_reason").value = "";
	}
	
	//신고 예외처리
	function singoStateBtn() {
		var jet_board_party_no =${result.partyBoardVo.jet_board_party_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.existSingoVo == false ){
					var singoButton = document.getElementById("singoButton");
					singoButton.setAttribute("style","text-decoration: none; font-size:12px;color: red;");
					singoButton.setAttribute("data-bs-toggle","modal");
					singoButton.setAttribute("data-bs-target","#singoModal");
					singoButton.setAttribute("onclick","singoBtn()");
					singoButton.innerText= "[신고하기]";
				}else{
					var singoButton = document.getElementById("singoButton");
					singoButton.setAttribute("style","text-decoration: none; font-size:12px;");
					singoButton.innerText= "[신고완료]";
				}
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/check_singo_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no=" + jet_board_party_no);
	}
	
	//예외처리 미로그인 시 로그인 페이지로 여기서 오류는 취소를 누를시 신고 모달창이 뜸
	function singoBtn() {
	
		if(jet_member_no == null){
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			return;
		}
	}	


//----------------------------------------------------
	function refresh() {
		refreshAttend();
		checkAttendprocess();
		singoStateBtn();
		approveList();
		
		//refreshChatList();
		//openChatContent();
	}
	
  	//댓글 신청시 토스트창
	$().ready(function () {
        $("#toast_TEST").click(function () {
            const Toast = Swal.mixin({
                toast: true,
                position: 'bottom-right',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'success',
                title: '참여 신청이 정상적으로 완료 되었습니다.'
                
            })
        });
    });

  	//신고 토스트창 
	$().ready(function () {
        $("#toast_singo").click(function () {
            const Toast = Swal.mixin({
                toast: true,
                position: 'bottom-right',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'success',
                title: '신고가 완료 되었습니다.'
                
            })
        });
    });
  	
</script>
<style>
	 
	 #image_size_auto{
		max-width: 100%;
		height: auto;
  		display: block;
	}
	
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/

	#main_read_page{
		border: 2px solid rgba(0,0,0,.125);
		border-radius: 15px;
		box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	#title_box{
		text-align: center;
		font-size: 25px;
		font-weight: bold;
		
	}
	#writer_box{
		background-color:rgb(178, 197, 141);
	}
	/*
	#ffbf80;
	rgb(178, 197, 141);
	 rgb(174, 202, 122);
	*/
	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
	
	
</style>
</head>
<body onload="refresh();refreshPlan();">
<jsp:include page="../commons/top_image.jsp"/>


	<div class="container">
	    <main>
	    	<div class="row">
	    		<div class="col">
			        
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > partyBoard</div>
			        </div>
					 
					<div class="row mt-4" id="main_read_page">
						<div class="col"> <%--메인 col--%>
							
							<div class="row py-2">
								<div class="col" id="title_box">
									${result.partyBoardVo.jet_board_party_title } 
								</div>
							</div>
							
							<div class="row">
								<div class="col text-muted font-monospace" style="text-align: right;">
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${result.partyBoardVo.jet_board_party_writedate }"/>
								</div> 
							</div>
							
							
							<div class="row mt-2 py-3" id="writer_box">
								<div class="col" style="text-align: left;">
									 <i class="fas fa-user-edit"></i> ${result.memberVo.jet_member_nick } 
								</div>
								<div class="col font-monospace" style="text-align:center;font-weight: bold;">
									[모집인원] ${result.partyBoardVo.jet_board_party_fixcount } / ${result.partyBoardVo.jet_board_party_headcount }
								</div>
								<div class="col font-monospace" style="text-align: right;">
									조회 : ${result.partyBoardVo.jet_board_party_readcount }
								</div>
							</div>
							
							<div class="row py-2">
								<div class="col" id="gather_box">
									<span style="font-size: 14px;">[모집]</span> 
									<span class="font-monospace"><fmt:formatDate pattern="yyyy-MM-dd" value="${result.partyBoardVo.jet_board_party_startgather }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${result.partyBoardVo.jet_board_party_endgather }"/></span>
								</div>
								<div class="col" style="text-align: right;font-size: 14px" >
									[확정 파티원]
								</div>
							</div>
							
							<div class="row py-2">
								<div class="col" id="travel_startday_box">
									<span style="font-size: 14px;">[여행출발]</span> 
									<span class="font-monospace"><fmt:formatDate pattern="yyyy-MM-dd" value="${result.partyBoardVo.jet_board_party_tsday }"/></span>
								</div>
								<div class="col font-monospace" id="approve_member_list" style="text-align: right;" >
									<%--확정 친구들 닉네임 출력 --%>
								</div>
							</div>
							
							<div class="row mt-3">	<%--여행계획 불러오기--%>
		                      <div class="col">
								<div class="row">	<%--여행 계획 출력 박스  --%>
									<div class="col-1"></div>
									<div class="col" id="travelplan_box"></div>
									<div class="col-1"></div>
								</div>
		                      </div>
		                    </div>	<%--여행계획 불러오기--%>
		                    
		                    
		                    <div class="row mt-2" style="z-index: 1;"><%--지도 --%>
		                    	<div class="col-1"></div>
								<div class="col my-1">
									
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
								<div class="col-1"></div>
							</div>	<%--지도 끝 --%>
				    
				   			
		                    
		                    <div class="row mt-2">
		                    	<div class="col-1"></div>
								<div class="col my-5" id="content_box">
									${result.partyBoardVo.jet_board_party_content }
								</div>
								<div class="col-1"></div>
							</div>
		                    
		                    <div class="row mt-2">
		                    	<div class="col-1"></div>
								<div class="col my-2" id="image_box">
									<c:forEach items="${result.imageVoList }" var="imageVo">
									<img id="image_size_auto" src="${imageVo.jet_board_party_image_link }"><br>
								</c:forEach>
								</div>
								<div class="col-1"></div>
							</div>
							
							<div class="row my-3">
								<div class="col"></div>
								<div class="col" style="text-align: right;font-size: 13px;">
								    <img alt="report" src="${pageContext.request.contextPath}/resources/image/report.jpg" style="margin-top:-5px">
								    <a id="singoButton"></a>	<%--신고 버튼  --%>
								</div>
								
								<%--모달창 시작--%>
							<div class="modal fade" id="singoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="mb-3">
							            <label for="sessionUser-name" class="col-form-label">신고자</label>
							            <div class="form-control" id="sessionUser-name">${SessionMemberVo.jet_member_nick}</div>
							          </div>
							          <div class="mb-3">
							            <label for="jet_board_notice_singo_reason" class="col-form-label">신고 사유</label>
							            <textarea class="form-control" id="jet_board_party_singo_reason"></textarea>
							          </div>
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button onclick="singoSubmitBtn();" type="button" id="toast_singo" class="btn btn-danger" data-bs-dismiss="modal">Send Declaration</button>
							      </div>
							    </div>
							  </div>
							</div>
							<%--모달 창 끝  --%>
							</div>	<%--신고 row끝 --%>
						
						</div>
					</div> <%--메인 row끝  --%>

	        		<div class="row mt-4">
	        			<div class="col"></div>
		        		
		        		<c:if test="${result.partyBoardVo.jet_member_no==SessionMemberVo.jet_member_no }">	
		        			<div class="col-1">
		        				<a class="btn btn-secondary" href="${pageContext.request.contextPath }/party_board/delete_party_board_process.do?jet_board_party_no=${result.partyBoardVo.jet_board_party_no }">삭제</a>
		        			</div>
		        			<div class="col-1">
		        			  	<c:if test="${result.partyBoardVo.jet_board_party_fixcount==1}">
		        			  		<a class="btn btn-secondary" href="${pageContext.request.contextPath }/party_board/update_party_board_page.do?jet_board_party_no=${result.partyBoardVo.jet_board_party_no }">수정</a>
		        			 	</c:if>
		        			 </div>
		        		
		        		</c:if>	
	        			<div class="col-1">
	                    	<a class="btn btn-success" href="${pageContext.request.contextPath }/party_board/party_board_page.do">목록</a>
	        			</div>
	        		</div>

	        		<div class="row">
	        			<div class="col">
	        				<hr>
	        			</div>
	        		</div>	        		
	        		
	        		<div class="row">
	        			<div class="col"></div>
	        			<div class="col-8">
							
							<div class="row mt-2"> <!-- 리플박스-->
							<div class="col">
								<c:if test="${!empty SessionMemberVo }">	<!--  순수 AJAX는 form 없어도됨 JS로 다 처리 할것이기 떄문.  -->
									<c:choose>
										<c:when test="${result.partyBoardVo.jet_board_party_fixcount ==result.partyBoardVo.jet_board_party_headcount }">
											<div class="row">
												<div class="alert alert-danger alert-dismissible fade show" role="alert">
												  <div class="text-center"><strong>${SessionMemberVo.jet_member_nick}</strong>님 아쉽지만, 모집이 완료 되었습니다.</div>
												  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="row">
												<div class="alert alert-success alert-dismissible fade show" role="alert">
												  <div class="text-center"><strong>${SessionMemberVo.jet_member_nick}</strong>님 여행 참여를 원하시면 아래 댓글로 신청하세요! </div>
												  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
												</div>
											</div>
											<div class="row" id="write_attend_box">
												<div class="col-2 text-center">${SessionMemberVo.jet_member_nick}</div>
												<div class="col px-0"><textarea class="form-control" id="jet_party_attend_content" rows="2" cols="60"></textarea></div>
												<div class="col-1"><input onclick="writeAttend()" id="toast_TEST" type="button" value="작성" class="btn btn-outline-dark"></div>				
											</div>
										</c:otherwise>
									</c:choose>
									
								</c:if>
							</div>
							</div>
						
							<div class="row mt-3">
								<div class="col text-center font-monospace" id="attend_count_box"></div><%--댓글 카운트 출력 박스 --%>
							</div>
							
							<div class="row">	<%--댓글 리스트 --%>
								<div class="col" id="attend_list_box"></div>
							</div>
	        				
	        			</div>
	        			<div class="col"></div>
	        		</div>	        		

	        		
			 </div>	<%--젤큰 col박스 --%>
	      </div>  <%--젤큰 row박스 --%>
	    </main>

	</div><%--컨테이너 박스끝 --%>



	 <jsp:include page="../party_board/popup_chat.jsp"/>

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>