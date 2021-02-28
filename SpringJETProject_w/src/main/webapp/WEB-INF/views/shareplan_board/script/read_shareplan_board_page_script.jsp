<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
var positions = [];
var linePath = [];
	var jet_member_no = null;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);
			
			if(obj.result == "success"){
				jet_member_no = obj.sessionNo;
			}else{
				console.log(obj.reason);
			}
			
		}
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath }/member/getSessionNo.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();



	function writeReple(){
		
		var inputReple = document.getElementById("input_reple");
		if(inputReple.value == ""){
			alert("댓글을 작성해주세요!");
			inputReple.focus();
			return;
		}
		
		var jet_shareplan_reple_content = document.getElementById("input_reple").value;
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no}; 
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/write_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no + "&jet_shareplan_reple_content=" + jet_shareplan_reple_content);
		
		document.getElementById("input_reple").value = "";
	}
	
	
	function refreshReple(){
		
		var repleASC = document.getElementById("repleASC");
		repleASC.style.color="green";
		repleASC.style.fontWeight="bold";
		
		var repleDESC = document.getElementById("repleDESC");
		repleDESC.style.color="black";
		
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no}; 
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);

				
				var repleListBox = document.getElementById("reple_list_box");
				var repleListBoxDESC = document.getElementById("reple_list_box_desc");
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
				
				var childCount = repleListBoxDESC.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBoxDESC.childNodes[0].remove();
				}
				
				var index = 0;
				
				for(repleData of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row mt-2 ml-2");
					
					var ulBox = document.createElement("ul");
					ulBox.setAttribute("class","review_reple");
					
					var nickBox = document.createElement("li");
					nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					nickBox.innerText = repleData.memberVo.jet_member_nick;

	                
					var contentBox = document.createElement("li");
					contentBox.setAttribute("style","font-size: 14px;");
					contentBox.innerText = repleData.sharePlanRepleVo.jet_shareplan_reple_content;
					
					var dateBox = document.createElement("li");
					dateBox.setAttribute("class","text-muted");
					dateBox.setAttribute("style","font-size: 12px;");
					var d = new Date(repleData.sharePlanRepleVo.jet_shareplan_reple_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					dateBox.innerText = strDate;
					
					if(jet_member_no==repleData.sharePlanRepleVo.jet_member_no){
					
					var deleteBox = document.createElement("button");
					deleteBox.setAttribute("onclick","deleteReple("+repleData.sharePlanRepleVo.jet_shareplan_reple_no+")");
					deleteBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;");
					deleteBox.innerText = "삭제";					
					}else if(jet_member_no != repleData.sharePlanRepleVo.jet_member_no){
						var deleteBox = document.createElement("li");
						deleteBox.innerText = "";	

					}
					
					
					var commentBox = document.createElement("button");
					commentBox.setAttribute("onclick","commentReple(" + index + ")");
					commentBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;");
					commentBox.innerText="답글";
					
					var commentWrtieBox = document.createElement("div");
					commentWrtieBox.setAttribute("class","write_comment_box");
					
					var viewCommentBox = document.createElement("div");
					viewCommentBox.setAttribute("class","comment_list_box");
					

					
					var hr = document.createElement("hr");
					hr.setAttribute("style","background-color:#8C8C8C;");
					
					
					//rowBox.append(reportBox);
					rowBox.append(ulBox);
					rowBox.append(deleteBox);
					rowBox.append(commentWrtieBox);
					
					ulBox.append(nickBox);
					ulBox.append(contentBox);
					ulBox.append(dateBox);
					ulBox.append(deleteBox);
					ulBox.append(commentBox);
					
					//rowBox.append(hr2);
					rowBox.append(commentWrtieBox);
					rowBox.append(viewCommentBox);
					rowBox.append(hr);
					
					
					repleListBox.append(rowBox);
					
					
					index++;	
					
					
				}
						
			}
				
		};
		xmlhttp.open("get","${pageContext.request.contextPath}/shareplan_board/get_reple_list.do?jet_board_shareplan_no="+jet_board_shareplan_no);
		xmlhttp.send();

	}
	function refreshRepleDESC(){
		
		var repleASC = document.getElementById("repleASC");
		repleASC.style.color="black";
		
		
		var repleDESC = document.getElementById("repleDESC");
		repleDESC.style.color="green";
		repleDESC.style.fontWeight="bold";
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no}; 
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);

				var repleListBox = document.getElementById("reple_list_box");
				var repleListBoxDESC = document.getElementById("reple_list_box_desc");
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
				
				var childCount = repleListBoxDESC.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBoxDESC.childNodes[0].remove();
				}
				
				
				var index = 0;
				
				for(repleData of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row mt-2 ml-2");
					
					var ulBox = document.createElement("ul");
					ulBox.setAttribute("class","review_reple");
					
					var nickBox = document.createElement("li");
					nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					nickBox.innerText = repleData.memberVo.jet_member_nick;

	                
					var contentBox = document.createElement("li");
					contentBox.setAttribute("style","font-size: 14px;");
					contentBox.innerText = repleData.sharePlanRepleVo.jet_shareplan_reple_content;
					
					var dateBox = document.createElement("li");
					dateBox.setAttribute("class","text-muted");
					dateBox.setAttribute("style","font-size: 12px;");
					var d = new Date(repleData.sharePlanRepleVo.jet_shareplan_reple_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					dateBox.innerText = strDate;
					
					if(jet_member_no==repleData.sharePlanRepleVo.jet_member_no){
					
					var deleteBox = document.createElement("button");
					deleteBox.setAttribute("onclick","deleteReple("+repleData.sharePlanRepleVo.jet_shareplan_reple_no+")");
					deleteBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;");
					deleteBox.innerText = "삭제";					
					}else if(jet_member_no != repleData.sharePlanRepleVo.jet_member_no){
						var deleteBox = document.createElement("li");
						deleteBox.innerText = "";	

					}
					
					
					var commentBox = document.createElement("button");
					commentBox.setAttribute("onclick","commentReple(" + index + ")");
					commentBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right;");
					commentBox.innerText="답글";
					
					var commentWrtieBox = document.createElement("div");
					commentWrtieBox.setAttribute("class","write_comment_box");
					
					var viewCommentBox = document.createElement("div");
					viewCommentBox.setAttribute("class","comment_list_box");
					

					
					var hr = document.createElement("hr");
					hr.setAttribute("style","background-color:#8C8C8C;");
					
					
					//rowBox.append(reportBox);
					rowBox.append(ulBox);
					rowBox.append(deleteBox);
					rowBox.append(commentWrtieBox);
					
					ulBox.append(nickBox);
					ulBox.append(contentBox);
					ulBox.append(dateBox);
					ulBox.append(deleteBox);
					ulBox.append(commentBox);
					
					//rowBox.append(hr2);
					rowBox.append(commentWrtieBox);
					rowBox.append(viewCommentBox);
					rowBox.append(hr);
					
					
					repleListBoxDESC.append(rowBox);
					
					
					index++;	
					
					
				}
						
			}
				
		};
		xmlhttp.open("get","${pageContext.request.contextPath}/shareplan_board/get_reple_list_desc.do?jet_board_shareplan_no="+jet_board_shareplan_no);
		xmlhttp.send();

	}
	
	//댓글삭제
	function deleteReple(reple_no){
		
/*		
		var jet_board_review_reple_no = repleData.reviewRepleVo.jet_board_review_reple_no; 
		//var jet_board_review_reple_no = ${result.reviewRepleVo.jet_board_review_reple_no};
		alert(jet_board_review_reple_no+"번 삭제");
*/		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/delete_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_shareplan_reple_no=" + reple_no );
		
		
	}
	
	//좋아요 버튼~
	function likeButton(){
		
		//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...
		if(jet_member_no == null){
			
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			
			return;
		}
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_shareplan_no=" + jet_board_shareplan_no);
		
		
	}
	//추천 취소
	function deleteLikeButton(){
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
				
		};
		//xmlhttp.open("get","${pageContext.request.contextPath}/board_Review/board_Review_View.do?board_Review_no="+jet_board_review_no);
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_delete_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_shareplan_no=" + jet_board_shareplan_no);
	}
	//좋아요 수
	function likeView(){
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.likeChk == true){
					var btnLike = document.getElementById("btnLike");
		               btnLike.setAttribute("type","image");
		               btnLike.setAttribute("src","${pageContext.request.contextPath}/resources/image/recommendOk.PNG");
		               btnLike.setAttribute("style","outline:none;");
		               btnLike.setAttribute("onclick","deleteLikeButton()");
		            
		               
				}else{
		            var btnLike = document.getElementById("btnLike");
		               btnLike.setAttribute("type","image");
		               btnLike.setAttribute("src","${pageContext.request.contextPath}/resources/image/recommend.PNG");
		               btnLike.setAttribute("style","outline:none;");
		               btnLike.setAttribute("onclick","likeButton()");
		               

				}
				
				var btnLikeCount = document.getElementById("likeCnt");
				btnLikeCount.innerText = "추천수 : " + obj.likeCnt;

				
			}
			
			
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_like_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
	}
	
	//아구찜
	function pickButton(){
		
		
		
		
		//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...
		if(jet_member_no == null){
			
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			
			return;
		}
		
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no};
		

		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshPick();
				
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_pick_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_shareplan_no=" + jet_board_shareplan_no);
		
	}
	//아구찜 취소
	function deletePickButton(){
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshPick();
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_pick_delete_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_shareplan_no=" + jet_board_shareplan_no);
	}
	//아구찜확인
	
	function pickView(){
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.pickChk == true){
					var btnPick = document.getElementById("btnPick");
					btnPick.setAttribute("type","image");
					btnPick.setAttribute("src","${pageContext.request.contextPath}/resources/image/pick_on.png");
					btnPick.setAttribute("style","outline:none;width:40px;height:50px");
					btnPick.setAttribute("onclick","deletePickButton()");

					
				}else{
					var btnPick = document.getElementById("btnPick");
					btnPick.setAttribute("type","image");
					btnPick.setAttribute("src","${pageContext.request.contextPath}/resources/image/pick_off.png");
					btnPick.setAttribute("style","outline:none;width:40px;height:50px");
					btnPick.setAttribute("onclick","pickButton()");

				}

			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_pick_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
	}

	function bringPlan(){

		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);

				var datailPlan = document.getElementById("travelPlanView");

				
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
					day.innerText="Day " +planDetailList.travelPlanDetailVo.jet_board_tp_detail_day;
					
					
					var interval2 = document.createElement("strong");
					interval.setAttribute("class","ps-5 pe-4");
					var hour = document.createElement("strong");
					hour.setAttribute("class","ps-5 pe-5");
					if(planDetailList.travelPlanDetailVo.jet_board_tp_detail_startmin == "0"){
		                  hour.innerText=planDetailList.travelPlanDetailVo.jet_board_tp_detail_starthours +" : 00"; 
		               }else{
		                  hour.innerText=planDetailList.travelPlanDetailVo.jet_board_tp_detail_starthours +" : "+ planDetailList.travelPlanDetailVo.jet_board_tp_detail_startmin;
		               }
		               //분출력시 0으로 출력되는것  00으로 변경
					
					
					var interval3 = document.createElement("strong");
					interval.setAttribute("class","ps-5 pe-3");
					var placeName = document.createElement("strong");
					placeName.setAttribute("class","ps-5");
					placeName.innerText="[" +planDetailList.categoryName.jet_board_tp_detail_ctgr_name +"] " + planDetailList.travelPlanDetailVo.jet_board_tp_detail_placename;
					
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
					latitude.innerText=planDetailList.travelPlanDetailVo.jet_board_tp_detail_latitude;
					
					var longitudeBox = document.createElement("div");
					longitudeBox.setAttribute("class","col");
					
					var longitude = document.createElement("div");
					longitude.setAttribute("class","form-control text-center");
					longitude.innerText=planDetailList.travelPlanDetailVo.jet_board_tp_detail_longitude;
					
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
					title.innerText=planDetailList.travelPlanDetailVo.jet_board_tp_detail_content;
					
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
					
					
					
					
					positions.push({title : planDetailList.travelPlanDetailVo.jet_board_tp_detail_placename, latlng: new kakao.maps.LatLng(planDetailList.travelPlanDetailVo.jet_board_tp_detail_latitude, planDetailList.travelPlanDetailVo.jet_board_tp_detail_longitude)});
					
					linePath.push(new kakao.maps.LatLng(planDetailList.travelPlanDetailVo.jet_board_tp_detail_latitude, planDetailList.travelPlanDetailVo.jet_board_tp_detail_longitude));
				    
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
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/get_travelplan_share.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
		

		}
	var classPositions = [];
	function recommendClass(){
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no };
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
		
				var getRecommendClass = document.getElementById("get_recommend_class");
				
				for(qwe of obj){
					
					var box = document.createElement("div");
					box.setAttribute("class","col-6");
					box.setAttribute("style","border-bottom:1px solid #EAEAEA");
					
					var paddingBox = document.createElement("div");
					paddingBox.setAttribute("style","padding:10px");
					
					var allBox = document.createElement("div");
					allBox.setAttribute("class","row");
					
					var leftBox = document.createElement("div");
					leftBox.setAttribute("class","col-5");
					
					var imageBox = document.createElement("div");
					var image = document.createElement("img");
					
					if(qwe.classImageList != ""){
						image.setAttribute("style","width:100%; height:250px;text-align:center;");
						image.setAttribute("src",qwe.classImageList[0].jet_class_image_link);
						image.setAttribute("alt","image");
					}else{
						image.setAttribute("style","width:100%; height:250px;text-align:center;");
						image.setAttribute("src","${pageContext.request.contextPath }/resources/image/logo.png");
						image.setAttribute("alt","image");
					}
					
					var rightBox = document.createElement("div");
					rightBox.setAttribute("class","col");
					
					var rightHead = document.createElement("div");
					rightHead.setAttribute("class","row");
					
					var className = document.createElement("div");
					className.setAttribute("class","col");
					
					var classNameValue = document.createElement("div");
					classNameValue.setAttribute("style","font-size:20px;font-weight:bold");
					classNameValue.innerText="["+qwe.classCategoryVo.jet_class_category_name+"]"+ qwe.classboard.jet_class_name;
					
					var nullBox = document.createElement("div");
					nullBox.setAttribute("class","row");
					nullBox.setAttribute("style","height:50%");
					
					var addressRowBox = document.createElement("div");
					addressRowBox.setAttribute("class","row");
					
					var addressColBox = document.createElement("div");
					addressColBox.setAttribute("class","col");
					
					var addressBoxValue = document.createElement("div");
					addressBoxValue.setAttribute("style","font-size:14px");
					addressBoxValue.innerText=qwe.classboard.jet_class_address;
					
					var priceRowBox = document.createElement("div");
					priceRowBox.setAttribute("class","row");
					
					var priceColBox = document.createElement("div");
					priceColBox.setAttribute("class","col");
					
					var priceBoxValue = document.createElement("div");
					priceBoxValue.setAttribute("style","text-align:right; font-weight:bold");
					priceBoxValue.innerText=qwe.classboard.jet_class_price +"원";
					
					allBox.append(leftBox);
					allBox.append(rightBox);
					
					imageBox.append(image);
					leftBox.append(imageBox);		
					
					className.append(classNameValue);
					rightHead.append(className);					
					
					addressColBox.append(addressBoxValue);
					addressRowBox.append(addressColBox);
					
					priceColBox.append(priceBoxValue);
					priceRowBox.append(priceColBox);
					
					rightBox.append(rightHead);
					rightBox.append(nullBox);
					rightBox.append(addressRowBox);
					rightBox.append(priceRowBox);
					

					
					paddingBox.append(allBox);
					
					box.append(paddingBox);
					
					getRecommendClass.append(box);
					
					classPositions.push({title : qwe.classboard.jet_class_name, latlng: new kakao.maps.LatLng(qwe.classboard.jet_class_latitude, qwe.classboard.jet_class_longitude)});					
					
					 for (var i = 0; i < classPositions.length; i ++) {
					     
							
					     
					     // 마커를 생성합니다
					     var marker = new kakao.maps.Marker({
					         map: map, // 마커를 표시할 지도
					         position: classPositions[i].latlng, // 마커를 표시할 위치
					         title : classPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					         image : markerImage // 마커 이미지 
					     });
					 }
					
	
				}
				
			}	
		};	
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/get_recommend_class.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
	}
	//신고인서트
	function singoSubmitBtn() {
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no };
		var jet_board_share_report_reason = document.getElementById("jet_board_share_report_reason").value;
/*
		if(${SessionMemberVo==""}==false){
			alert("로그인 후 이용 가능합니다.");
			return;
		}
*/		
		if(jet_board_share_report_reason==""){
			alert("신고사유를 입력해주세요.");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					refresh();
						
				}	
			};
			xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/report_shareplan_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("jet_board_shareplan_no="+jet_board_shareplan_no+"&jet_board_share_report_reason="+jet_board_share_report_reason);
			
			document.getElementById("jet_board_share_report_reason").value = "";
	}
	
	//신고 예외처리
	function singoStateBtn() {
		var jet_board_shareplan_no =${result.sharePlanBoardVo.jet_board_shareplan_no };
		
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
		xmlhttp.open("post","${pageContext.request.contextPath }/shareplan_board/check_report_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
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
	


	
	function refresh(){
		refreshReple();
		singoStateBtn();
	}
	
	
	function refreshLike(){
		likeView();
	}
	function refreshPick(){
		pickView();
	}
	
</script>