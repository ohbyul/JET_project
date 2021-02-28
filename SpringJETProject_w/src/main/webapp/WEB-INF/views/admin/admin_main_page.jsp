<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<%--여기 아래로 복사 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  
  <%-- 일별 신규 가입자 수 --%>
  	google.charts.load("current", {'packages':["corechart"]});
  
    function drawNewMemberCount(datas) {
      var datas = google.visualization.arrayToDataTable(datas);

      var options = {
        width: 750,
        height: 270,
        
      };
      var chart = new google.visualization.LineChart(document.getElementById("chart_div"));
      chart.draw(datas, options); 
  
 	}
  
    
	  function refreshNewMemberCount(){
		  var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					var obj = JSON.parse(xmlhttp.responseText);
					datas = [];
					columns = ['날짜','인원 수'];
					datas.push(columns);
					
					for(x of obj){
						arr = [];
						arr.push(x.JOINDATE);
						arr.push(x.NEW_MEMBER);
						
						datas.push(arr);
					}
				drawNewMemberCount(datas);
			}
	  	};
		  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_new_member_count_by_date.do");
			xmlhttp.send();
	  }

 google.charts.load("current", {'packages':["corechart"]});
 	<%-- 문의글 답변글 미답변글 --%>
  function drawCsCount(datas) {
    var datas = google.visualization.arrayToDataTable(datas);

    var options = {
      width: 620,
      height: 270,
      legend: { position: "none" },
      
    };
    
    var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values2'));
    chart.draw(datas, options);

	}

  function refreshCsCount(){
	  var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				datas = [];
				columns = ['문의','수', { role: 'style' }];
				datas.push(columns);
				
				for(x of obj){
					arr = [];
					arr.push(x.CS);
					arr.push(x.COUNT);
					
		
					datas.push(arr);
				}
				
				//datas[0].push('color: red');
				datas[1].push('color: #9966ff');
				datas[2].push('color: #33d6ff');
				datas[3].push('color: #ff6699');
				
				
				
				
			drawCsCount(datas);
		}
  	};
	  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_cs_count.do");
		xmlhttp.send();
  }
  
//   google.charts.load("current", {'packages':["corechart"]});
<%-- 	<%-- 문의글 답변글 미답변글 --%>
// 	function drawBoardGender(datas) {
// 	  var datas = google.visualization.arrayToDataTable(datas);
	
// 	    var options = {
// 	    	width: 720,
// 	    	height: 270,
//             vAxis: {title: 'Gender'},
//             hAxis: {title: 'Board'},
//             seriesType: 'bars',
//           };
	  
// 	  var chart = new google.visualization.ColumnChart(document.getElementById('combo_chart_div'));
// 	  chart.draw(datas, options);
	
// 		}
//   function refreshBoardGender(){
// 	  var xmlhttp = new XMLHttpRequest();
		
// 		xmlhttp.onreadystatechange = function(){
// 			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
// 				var obj = JSON.parse(xmlhttp.responseText);
// 				datas = [];
// 				columns = ['남성''게시판'/*, { role: 'style' }*/];
				
// 				datas.push(columns);
				
// 				for(x of obj){
// 					arr = [];
// //  					arr.push(x.FEMALE);
//  					arr.push(x.MALE);
// 					arr.push(x.BOARD);
// 					datas.push(arr);
// 				}
				
// 				//datas[0].push('color: red');
// // 				datas[1].push('color: #9966ff');
// // 				datas[2].push('color: #33d6ff');
// // 				datas[3].push('color: #ff6699');
				
				
				
// 			drawBoardGender(datas);
// 		}
//   	};
// 	  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/board_gender_ratio.do");
// 		xmlhttp.send();
//   }
	 <%-- 게시판 별 게시글 수 --%>
	  google.charts.load("current", {'packages':["corechart"]});
	  
	  function drawPostsCount(data) {
	    var datas = google.visualization.arrayToDataTable(data);

	    var options = {
	      width: 750,
	      height: 270,
	      legend: { position: "none" },
	    };
	    
	    var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values'));
	    chart.draw(datas, options);

		}

	  function refreshPostsCount(){
		  var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					var obj = JSON.parse(xmlhttp.responseText);
					datas = [];
					columns = ['게시판','게시물 수' , { role: 'style' }];
					datas.push(columns);
					
					for(x of obj){
						arr = [];
						arr.push(x.POSTS);
						arr.push(x.COUNT);
						
						//var colorCode = '#' + Math.round(Math.random() * 0xffffff).toString(16);
						//arr.push('color: ' + colorCode);
						
						datas.push(arr);
					}
					
					//datas[0].push('color: red');
					datas[1].push('color: #9966ff');
					datas[2].push('color: #33d6ff');
					datas[3].push('color: #ff6699');
					datas[4].push('color: #99ff66');
					datas[5].push('color: #ffff66');
					datas[6].push('color: #ff8000');
					
					
					
				drawPostsCount(datas);
			}
	  	};
		  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_posts_count.do");
			xmlhttp.send();
	  }
  function refresh(){
	  refreshNewMemberCount();
	  refreshCsCount();
	  //refreshBoardGender();
	  refreshPostsCount();
  }
  
  setInterval(refresh,60000);
  </script>
  <jsp:include page="../font/NanumGothicCoding.jsp"/>
</head>
<body style="background-color:#f6f6f6"; onload="refresh()">

<jsp:include page="../admin/admin_only_nav.jsp"/>
<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		<div class="col">
			<div class="row mt-3""></div>
			<div class="row ms-1 me-1"style="box-shadow: 1px 1px 2px 0px #BDBDBD">
				<div class="col pt-3" style="background-color: #ffffff;">
					<p style="margin-left:1rem; font-family: 'NotoSansKR'; font-weight: 500; font-size: 2rem;">관리자 페이지</p>
				</div>
			</div>
			<div class="row ms-2" style="margin-top: 1.5rem;">
				<div class="col-5">
					<div class="row"style="background-color: #ffffff;border-radius: .5rem;box-shadow: 1px 1px 2px 0px #BDBDBD">
						<div class="col">
							<div class="row"><%--문의글, 답변글, 미답변  수 --%>
								<div class="col"><p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">문의글, 답변글, 미답변  수</p></div>
								<div class="col-2 pt-4"><a style="text-decoration: none; font-family: 'NotoSansKR';font-weight: 500;font-size: 1rem;color: #333333;"href="${pageContext.request.contextPath }/admin/admin_dashboard_page.do">더보기▶</a></div>
							</div>
							<div class="row mt-2">
								<hr>
								<div id="columnchart_values2" class="col-4" style="width: 800px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col ps-5">
					<div class="row me-1"style="background-color: #ffffff;border-radius: .5rem;box-shadow: 1px 1px 2px 0px #BDBDBD">
						<div class="col">
							<div class="row"><%--일별 가입자 수 --%>
								<div class="col">
									<p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">일별 가입자 수</p>
								</div>
								<div class="col-2 pt-4"><a style="text-decoration: none; font-family: 'NotoSansKR';font-weight: 500;font-size: 1rem;color: #333333;"href="${pageContext.request.contextPath }/admin/admin_dashboard_page.do">더보기▶</a></div>
							</div>
							<div class="row mt-2"style="background-color: #ffffff;border-bottom-right-radius: .5rem;border-bottom-left-radius: .5rem;">
								<hr>
								<div id="chart_div" class="col-4"style="width: 800px; height: 300px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>			
			<div class="row mt-3 ms-2 mb-2">
				<div class="col-5">
					<div class="row"style="background-color: #ffffff;border-radius: .5rem;box-shadow: 1px 1px 2px 0px #BDBDBD;height: 359px;">
						<div class="col">
							<div class="row">
								<div class="col"><p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">여행 파티 참여 신고리스트</p></div>
								<div class="col-2 pt-4"><a style="text-decoration: none; font-family: 'NotoSansKR';font-weight: 500;font-size: 1rem;color: #333333;"href="${pageContext.request.contextPath }/admin/admin_declaration_party_list_page.do">더보기▶</a></div>
								<hr style="margin-top: .5rem;">							
							</div>
							<div class="row">
								<div class="row m-0">
									<div class="col">
										<table class="table table-hover table-responsive ">
						                <thead>
						                  <tr>
						                    <th scope="col" class="col-1 text-center">번호</th>
						                    <th scope="col" class="col-4 text-center">글제목</td>
						                    <th scope="col" class="col-5 text-center">신고 사유</td>
						                    <th scope="col" class="col-2 text-center">신고 날짜</td>
						                   </tr>
						                </thead>
						                
						                <tbody>
											<c:forEach items="${resultList }" var="data">
												<c:forEach items="${newSingo }" var="newSingo">
													<c:if test="${data.partySingoVo.jet_board_party_no == newSingo.jet_board_party_no }">
														<tr>
															<th class="text-center">${data.partySingoVo.jet_board_party_singo_no  }</th>
															<td><a href="${pageContext.request.contextPath }/party_board/read_party_board_page.do?jet_board_party_no=${data.partyBoardVo.jet_board_party_no}">
																${data.partyBoardVo.jet_board_party_title }
															</a></td>
															<td>${data.partySingoVo.jet_board_party_singo_reason }</td>
															<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.partySingoVo.jet_board_party_singo_date }"/></td>
														</tr>
													</c:if>
												</c:forEach>
											</c:forEach>
										</tbody>
										</table>	
									</div>
								</div><%--멤버리스트 테이블 row 끝--%>
							</div>
						</div>
					</div>
				</div>
				<div class="col ps-5">
					<div class="row me-1"style="background-color: #ffffff;border-radius: .5rem;box-shadow: 1px 1px 2px 0px #BDBDBD;height: 359px;">
						<div class="col">
							<div class="row">
								<div class="col"><p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">게시판 별 게시글 수</p></div>
								<div class="col-2 pt-4"><a style="text-decoration: none; font-family: 'NotoSansKR';font-weight: 500;font-size: 1rem;color: #333333;"href="#">더보기▶</a></div>
								<hr style="margin-top: .5rem;">
							</div>
							<div class="row mt-2 me-0">
								<div <%--id="combo_chart_div"--%>id="columnchart_values"  style="width: 800px; height: 300px;"></div>
								
							</div>
						</div>
					</div>
				</div>
			</div> <%--관리자 메인 페이지 박스 끝 --%>
			<div class="row pt-2">
				<div class="col" style="background-color: #262626; color:#ffffff;font-family: 'NotoSansKR';font-weight: 300;">
					Copyright ⓒ JET Project/CJO. All rights reserved.
				</div>
			</div>   
		</div><%--가장 큰 col박스 끝 --%> 
	</div> <%--가장 큰 row박스 끝 --%>
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<%--여기까지 복사 --%>
</body>
</html>