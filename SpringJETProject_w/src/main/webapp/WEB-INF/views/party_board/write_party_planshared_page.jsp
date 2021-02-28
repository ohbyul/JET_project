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

	//데이트타입 변환 과 예외 처리
	function frmSubmit() {
		
		var formPartyBoard =document.getElementById("form_partyboard");
		//폼 아이디
		
		//예외처리
		var inputTitle = document.getElementById("input_title");
		var inputStartgather = document.getElementById("input_startgather");
		var inputEndgather = document.getElementById("input_endgather");
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
			alert("모집 시작 일을 작성해 주세요.");	//정규식으로 날짜 유형이 아니면 안되게 ..
			inputStartgather.focus();
			return;
		}
		if(inputEndgather.value ==""){
			alert("모집 마감 일을 작성해 주세요.");	//정규식으로 날짜 유형이 아니면 안되게 ..
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
		/*	여행계획은 예외처리가 안됨.
		if(travelplan_box.value ==""){
			alert("여행계획을 추가해주세요.");
			return;
		}
		*/
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
		
		//데이트 변환
		var tsDayBox = document.getElementById("jet_board_party_tsday");
		var startDayBox = document.getElementById("input_startgather");
		var endDayBox = document.getElementById("input_endgather");
		
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
				hiddenBoxPk.setAttribute("id","jet_board_travelplan_no");
				//예외처리
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

</script>

</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>


	<div class="container">
	    
	    <form id="form_partyboard" action="${pageContext.request.contextPath}/party_board/write_party_board_process.do" method="post" enctype="multipart/form-data">
	    
	    <main>
	    	<div class="row">
	    		<div class="col">
			        
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > partyBoard</div>
			        </div>
			        
			        <div class="row mt-4">
			            <div class="col text-center display-5">여행친구 찾기</div>
			        </div>
			        
			        <div class="row mt-4">
			            <hr> 				<!-- 선 -->
			        </div>
					 
                    <div class="row mt-3">	<%--제목 --%>
                      <div class="col-2 text-muted">
                          	 <div class="form-control" style="background-color: #ffbf80">제목</div>
                      </div>
                      <div class="col">
                         <input type="text" id="input_title" class="form-control"  name="jet_board_party_title" placeholder="ex)2/15일 한라반 등반 같이 가실분~">
                      </div>
                    </div>
		        
		        	<div class="row mt-3">	<%--모집일 모집마감일 --%>
                      <div class="col-2 text-muted">
                      		<div class="form-control" style="background-color: #ffbf80">친구모집일</div>
                      </div>
                      <div class="col">
                         <input type="date" id="input_startgather" class="form-control">
                      </div>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">모집마감일</div>
                      </div>
                      <div class="col">
                         <input type="date" id="input_endgather" class="form-control">
                      </div>
                    </div>
	        		
	        		<div class="row mt-3">	<%--구하는 인원 --%>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">모집인원</div>
                      </div>
                      <div class="col">
                         <select class="form-select" id="input_headcount" name="jet_board_party_headcount">
                             <option value="0">몇명의 친구를 구하는지 선택해주세요[자신 제외]</option>
                             <option value="2">1</option><option value="3">2</option><option value="4">3</option>
                             <option value="5">4</option><option value="6">5</option><option value="7">6</option>
                             <option value="8">7</option><option value="9">8</option><option value="10">9</option>
                            
                          </select>
                      </div>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">여행시작일</div>
                      </div>
                      <div class="col">
                         <input type="date" id="jet_board_party_tsday" class="form-control">
                      </div>
                    </div>
                    <c:forEach items="${detailList}" var="resultList">
						<div class="row justify-content-center">
							<div class="col">
		                   	 <details class="form-control p-0 mt-1">
		                   	 	<summary class="form-control pt-3 pb-3" style="box-shadow: 0px 2px 1px 0px #cccccc; ">
		                   	 	   <strong style="padding: 2.5%"></strong><%--간격용--%>
							       <strong class="ps-4 spe-5">Day ${resultList.detailVo.jet_board_tp_detail_day }</strong>
							       <strong class="ps-5 pe-4"></strong><%--간격용--%>
			                       <strong class="ps-5 pe-5">${resultList.detailVo.jet_board_tp_detail_starthours } : 
		                       		<c:choose>
		                       			<c:when test="${resultList.detailVo.jet_board_tp_detail_startmin ==0}">
		                       				00
		                       			</c:when>
		                       			<c:otherwise>
		                       				${resultList.detailVo.jet_board_tp_detail_startmin }
		                       			</c:otherwise>
		                       		</c:choose> 
		                     	  </strong>
			                       <strong class="ps-5 pe-3"></strong><%--간격용--%>
			                       <strong class="ps-5">[${resultList.categoryName.jet_board_tp_detail_ctgr_name}]${resultList.detailVo.jet_board_tp_detail_placename }</strong>
			                    </summary>		                    
			                    <div class="row mt-3 mb-3">
			                    	<div class="col"></div>
			                    	<div class="col-10">
			                    		<div class="row">
			                    			<div class="col-3 input-group-text">주소</div>
			                    			<div class="col"><div class="form-control text-center">${resultList.detailVo.jet_board_tp_detail_adress }</div></div><%--주소 --%>
			                    			<%--<div class="col"><div class="form-control text-center">${resultList.detailVo.jet_board_tp_detail_longitude }</div></div>경도 --%>
			                    		</div>
			                    		<div class="row mt-2">
			                    			<div class="col-3 input-group-text">간단한 설명</div>
			                    			<div class="col"><div class="form-control text-center">${resultList.detailVo.jet_board_tp_detail_content}</div></div>
			                    		</div>
			                    	</div>
			                    	<div class="col">
			                    		<input type="hidden" name="jet_board_travelplan_no" value="${map.travelplanVo.jet_board_travelplan_no }">
			                    	</div>
			                    </div>
							 </details>
							</div>
						</div>
					</c:forEach>
                    <div class="row mt-3">	<%--내용--%>
                      <div class="col-2 text-muted">
                          	<div class="form-control" style="background-color: #ffbf80">내용</div>
                      </div>
                      <div class="col">
                      	 <textarea rows="10" class="form-control" id="input_content" name="jet_board_party_content" placeholder="자신의 소개나 여행스타일에 대해 소개해주세요."></textarea>
                      </div>
                    </div>
		        		
					<div class="row mt-3">
						<div class="col-2">
							<div class="form-control" style="background-color: #ffbf80">사진 첨부</div>
						</div>
						<div class="col d-grid gap-2 d">
							<input type="file" name="files" id="formFileMultiple" accept="image/*" class="form-control" id="formFileMultiple" value="파일 업로드" multiple>
						</div>
					</div>
	        		
	        		<%--글쓴 사람 픽스 인원1 명 히든으로 날려줘야함. --%>
	        		<input type="hidden" name="jet_board_party_fixcount" value="1">
	      			
	      			<div class="row mt-2">
	      				<div class="col">
	      					<input onclick="frmSubmit()" type="button" value="글쓰기">
	      				</div>
	      			</div>
	      			

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