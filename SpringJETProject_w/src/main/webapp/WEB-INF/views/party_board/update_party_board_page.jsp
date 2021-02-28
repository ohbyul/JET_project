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
<script type="text/javascript">

	//데이트타입 변환
	function frmSubmit() {
		
		var formPartyBoard =document.getElementById("form_partyboard");
		
		//예외처리
		var inputTitle = document.getElementById("input_title");
		var inputStartgather = document.getElementById("jet_board_party_startgather");
		var inputEndgather = document.getElementById("jet_board_party_endgather");
		var inputHeadcount = document.getElementById("input_headcount");
		var inputTsday = document.getElementById("jet_board_party_tsday");
		var planBox = document.getElementById("travelplan_box");
		var inputContent = document.getElementById("input_content");
		
		if(inputTitle.value ==""){
			alert("제목을 작성해 주세요.");
			inputTitle.focus();
			return;
		}
		if(inputStartgather.value ==""){	
			alert("모집 시작 일을 작성해 주세요.");
			inputStartgather.focus();
			return;
		}
		if(inputEndgather.value ==""){
			alert("모집 마감 일을 작성해 주세요.");	
			inputEndgather.focus();
			return;
		}
		if(inputHeadcount.value =="0"){
			alert("참여인원을 선택해주세요");
			inputHeadcount.focus();
			return;
		}
		if(inputTsday.value ==""){
			alert("여행 시작일을 선택 주세요.");
			inputTsday.focus();
			return;
		}
		
		//여행계획추가.. 존재 하지않으면.. 수정 부분 안먹힘 근데 생각해보면 글쓸때 예외처리가되잇어서 무조건 여행계획이 추가 됨
		if(planBox.children.length==0){
			alert("여행계획을 추가해주세요.");
			return;
		}
		
		if(inputContent.value ==""){
			alert("내용을 작성해주세요.");
			inputContent.focus();
			return;
		}
		

		var today = new Date();
		today = new Date(today.getFullYear(),today.getMonth(),today.getDate());
		
		var tsdate = new Date(inputStartgather.value);
		
		if(today > tsdate){
			alert("모집시작일은 오늘 이후부터 선택 가능하십니다.");
			inputStartgather.focus();
			return;
		}
		if(inputStartgather.value > inputEndgather.value){
			alert("모집 마감일이 모집 시작일보다 빠릅니다. 다시 선택 부탁드립니다.");
			inputEndgather.focus();
			return;
		}
		if(inputEndgather.value > inputTsday.value){
			alert("여행시작은 모집이 마감된후 설정 가능합니다.");
			inputTsday.focus();
			return;
		}
		
		//데이트 타입 변환 
		var tsDayBox = document.getElementById("jet_board_party_tsday");
		var startDayBox = document.getElementById("jet_board_party_startgather");
		var endDayBox = document.getElementById("jet_board_party_endgather");
		
		var dateValue1 = tsDayBox.value.replaceAll("-","/");
		var dateValue2 = startDayBox.value.replaceAll("-","/");
		var dateValue3 = endDayBox.value.replaceAll("-","/");
		
		var tsDayHiddenBox = document.createElement("input");
		tsDayHiddenBox.setAttribute("type","hidden");
		tsDayHiddenBox.setAttribute("name","jet_board_party_tsday");
		tsDayHiddenBox.setAttribute("value",dateValue1);
		
		var startDayHiddenBox = document.createElement("input");
		startDayHiddenBox.setAttribute("type","hidden");
		startDayHiddenBox.setAttribute("name","jet_board_party_startgather");
		startDayHiddenBox.setAttribute("value",dateValue2);
		
		var endDayHiddenBox = document.createElement("input");
		endDayHiddenBox.setAttribute("type","hidden");
		endDayHiddenBox.setAttribute("name","jet_board_party_endgather");
		endDayHiddenBox.setAttribute("value",dateValue3);
		
		formPartyBoard.appendChild(tsDayHiddenBox);
		formPartyBoard.appendChild(startDayHiddenBox);
		formPartyBoard.appendChild(endDayHiddenBox);
		formPartyBoard.submit();
	}
	
	//여행계획 출력
	function addplanbtn(travelplan_no) {

		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				var planBox = document.getElementById("travelplan_box");
				planBox.innerHTML = "";
				
				
				var hiddenBoxPk = document.createElement("input");
				//travelplan_no
				hiddenBoxPk.setAttribute("type","hidden");
				hiddenBoxPk.setAttribute("name","jet_board_travelplan_no");
				hiddenBoxPk.setAttribute("value",travelplan_no);
					
				planBox.appendChild(hiddenBoxPk);
				
				
				for(planDetailList of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row");		//젤큰 로우
					
					var colBox = document.createElement("div");
					colBox.setAttribute("class", "col");	//젤큰 컬
					
					var details = document.createElement("details");
					details.setAttribute("class","form-control p-0 mt-1");
					
					var summary = document.createElement("summary");
					summary.setAttribute("class","form-control pt-3 pb-3");
					summary.setAttribute("style","box-shadow: 0px 2px 1px 0px #cccccc;");
					
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
					detailContentBox.setAttribute("class","mt-3 mb-3");
					
					var interval4 = document.createElement("div");
					interval4.setAttribute("class","col");
					
					var detailContent = document.createElement("div");
					interval4.setAttribute("class","col-10");
					
					var addressBox = document.createElement("div");
					addressBox.setAttribute("class","row");
					
					var address = document.createElement("div");
					address.setAttribute("class","col-3 input-group-text");
					address.setAttribute("style","text-align:center;");
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
					explanationBox.setAttribute("class","row mt-2");
					
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
					
				}
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/get_travelplan_list.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_travelplan_no="+travelplan_no);
		
	}	//addplanbtn 젤 바깥 닫기

	//원래 선택된 디테일 리스트출력
	function originalPlan() {
		
		var travelplan_no = ${result.partyBoardVo.jet_board_travelplan_no}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				var planBox = document.getElementById("travelplan_box");
				//planBox.innerHTML = "";
				
				
				var hiddenBoxPk = document.createElement("input");
				hiddenBoxPk.setAttribute("type","hidden");
				hiddenBoxPk.setAttribute("name","jet_board_travelplan_no");
				hiddenBoxPk.setAttribute("value",travelplan_no);
					
				planBox.appendChild(hiddenBoxPk);
				
				
				for(planDetailList of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row");		//젤큰 로우
					
					var colBox = document.createElement("div");
					colBox.setAttribute("class", "col");	//젤큰 컬
					
					var details = document.createElement("details");
					details.setAttribute("class","form-control p-0 mt-1");
					
					var summary = document.createElement("summary");
					summary.setAttribute("class","form-control pt-3 pb-3");
					summary.setAttribute("style","box-shadow: 0px 2px 1px 0px #cccccc;");
					
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
					detailContentBox.setAttribute("class","mt-3 mb-3");
					
					var interval4 = document.createElement("div");
					interval4.setAttribute("class","col");
					
					var detailContent = document.createElement("div");
					interval4.setAttribute("class","col-10");
					
					var addressBox = document.createElement("div");
					addressBox.setAttribute("class","row");
					
					var address = document.createElement("div");
					address.setAttribute("class","col-3 input-group-text");
					address.innerText="주소"
					
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
					
					var explanationBox = document.createElement("div");
					explanationBox.setAttribute("class","row mt-2");
					
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
					addressBox.append(latitudeBox);
					latitudeBox.append(latitude);
					addressBox.append(longitudeBox);
					longitudeBox.append(longitude);
					
					detailContent.append(explanationBox);
					explanationBox.append(explanation);
					explanationBox.append(contentBox);
					contentBox.append(content);
					
					detailContentBox.append(interval5);
					
					
					planBox.append(rowBox);
					
				}
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/get_travelplan_list.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_travelplan_no="+travelplan_no);
		
	}	


</script>

</head>
<body onload="originalPlan();">
<jsp:include page="../commons/top_image.jsp"/>


	<div class="container">
	    
	    <form id="form_partyboard" action="${pageContext.request.contextPath}/party_board/update_party_board_process.do" method="post">
	    
	    <main>
	    	<div class="row">
	    		<div class="col">
			        
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > partyBoard</div>
			        </div>
			        
			        <div class="row mt-4">
			            <div class="col text-center display-5">수정 </div>
			        </div>
			        
			        <div class="row mt-4">
			            <hr> 				<!-- 선 -->
			        </div>
					 
                    <div class="row mt-3">	<%--제목 --%>
                      <div class="col-2 text-muted">
                          	 <div class="form-control" style="background-color: #ffbf80">제목</div>
                      </div>
                      <div class="col">
                         <input type="text" id="input_title" class="form-control" name="jet_board_party_title" value="${result.partyBoardVo.jet_board_party_title }">
                      </div>
                    </div>
		        
		        	<div class="row mt-3">	<%--모집일 모집마감일 --%>
                      <div class="col-2 text-muted">
                      		<div class="form-control" style="background-color: #ffbf80">친구모집일</div>
                      </div>
                      <div class="col">
                         <input type="date" class="form-control" id="jet_board_party_startgather" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${result.partyBoardVo.jet_board_party_startgather }"/>">
                      </div>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">친구마감일</div>
                      </div>
                      <div class="col">
                         <input type="date" class="form-control" id="jet_board_party_endgather" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${result.partyBoardVo.jet_board_party_endgather }"/>">
                      </div>
                    </div>
	        		
	        		<div class="row mt-3">	<%--구하는 인원 --%>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">모집인원</div>
                      </div>
                      <div class="col">
                         <select class="form-select" id="input_headcount" name="jet_board_party_headcount">
                         	 <option value="0">모집 인원을 선택해주세요.[자신을 제외한]</option>
                             <c:choose>
                                <c:when test="${result.partyBoardVo.jet_board_party_headcount ==2}">
									<option value="2" selected="selected">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10">9</option>	
								</c:when>
	                             <c:when test="${result.partyBoardVo.jet_board_party_headcount ==3}">
	                             	<option value="2">1</option><option value="3" selected="selected">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10">9</option>	
								 </c:when>
	                             <c:when test="${result.partyBoardVo.jet_board_party_headcount ==4}">
	                             	<option value="2">1</option><option value="3">2</option><option value="4" selected="selected">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10">9</option>	
								 </c:when>
	                             <c:when test="${result.partyBoardVo.jet_board_party_headcount ==5}">
	                             	<option value="2">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5" selected="selected">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10">9</option>	
								 </c:when>
	                             <c:when test="${result.partyBoardVo.jet_board_party_headcount ==6}">
	                             	<option value="2">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6" selected="selected">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10">9</option>	
								 </c:when>
	                             <c:when test="${result.partyBoardVo.jet_board_party_headcount ==7}">
	                             	<option value="2">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7" selected="selected">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10">9</option>	
								 </c:when>
	                             <c:when test="${result.partyBoardVo.jet_board_party_headcount ==8}">
	                             	<option value="2">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8" selected="selected">7</option><option value="9">8</option><option value="10">9</option>	
								 </c:when>
	                           	 <c:when test="${result.partyBoardVo.jet_board_party_headcount ==9}">
	                           	 	<option value="2">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9" selected="selected">8</option><option value="10">9</option>	
								 </c:when>
	                           	 <c:when test="${result.partyBoardVo.jet_board_party_headcount ==10}">
	                           	 	<option value="2">1</option><option value="3">2</option><option value="4">3</option>
	                             	<option value="5">4</option><option value="6">5</option><option value="7">6</option>
	                             	<option value="8">7</option><option value="9">8</option><option value="10" selected="selected">9</option>	
								 </c:when>
                           </c:choose>
                          </select>
                      </div>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">여행시작일</div>
                      </div>
                      <div class="col">
                         <input type="date" id="jet_board_party_tsday" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${result.partyBoardVo.jet_board_party_tsday }"/>">
                      </div>
                    </div>
                    
                    <div class="row mt-3">	<%--여행계획 불러오기--%>
                      <div class="col">
						
						<div class="row">	<%--여행 계획 출력 박스  --%>
							<div class="col-2"></div>
							<div class="col" id="travelplan_box">

							</div>
						</div>
						
						<div class="row mt-2">	<%--알람 창? --%>
							<div class="col-3"></div>
							<div class="col mx-auto my-auto alert alert-warning alert-dismissible fade show" role="alert">
							 	 	<div class="text-center"> 여행계획 변경시, <strong>여행 계획 </strong>을 다시 선택해주세요!</div>
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							<div class="col-1 mx-auto my-auto"><%--여행 추가 모달창 불러오는 버튼 --%>
								<input type="button" id="call_myplan" value="plan변경" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectplanModal">
							</div>
							<div class="col-3"></div>
						</div>
						
						<%--모달창 --%>
						<div class="modal fade" id="selectplanModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						     
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">나의 여행 계획 목록</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						     
						      <div class="modal-body">
						      		
						      		<c:forEach items="${planList }" var="planList">
						      			<c:if test="${sessionUserVo.jet_member_no == planList.travelPlanVo.jet_member_no }">
						      				<div class="row mt-1">
							      				<div class="col d-grid gap-2">
									      			<input type="button" onclick="addplanbtn(${planList.travelPlanVo.jet_board_travelplan_no })" class="btn btn-outline-success" value="${planList.travelPlanVo.jet_board_travelplan_title } [<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${planList.travelPlanVo.jet_board_travelplan_writedate }"/>]">
									      		</div>
								      		</div>
						      			</c:if>
						      		</c:forEach>
								      		
						      	</div>
						      
						      <div class="modal-footer">
						      	<div class="row">
						      		<div class="col d-grid gap-2">	<!-- 버튼왜 풀로 안채워지냐 귀찮게 하지마라 진짜개빡치게  -->
						      			<input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="선택 완료">
						      		</div>  
						      </div>
						    </div>
						    
						  </div>
						 </div>
						</div>
						<%--모달창 끝 --%>
                      </div>
                    </div>
                    
                    <div class="row mt-3">	<%--내용--%>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">내용</div>
                      </div>
                      <div class="col">
                      	 <textarea rows="10" class="form-control" id="input_content" name="jet_board_party_content">${result.partyBoardVo.jet_board_party_content }</textarea>
                      </div>
                    </div>
	        		

	        		
	        		<%--글쓴 사람 픽스 인원1 명 히든으로 날려줘야함 수정 페이지도 바뀌지않음 왜냐면 픽스된 인원이 2명이상이 되면 수정을 못하도록 설정 할것 --%>
	        		<input type="hidden" name="jet_board_party_fixcount" value="1">
	      			<input type="hidden" name="jet_board_party_no" value="${result.partyBoardVo.jet_board_party_no }">
	      			<input type="hidden" name="jet_member_no" value="${result.memberVo.jet_member_no }">
	      			
	      			<input onclick="frmSubmit()" type="button" value="글쓰기">

			 </div>	<%--젤큰 col박스 --%>
	      </div>  <%--젤큰 row박스 --%>
	    </main>
	  	
	  	</form>

	</div><%--컨테이너 박스끝 --%>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>