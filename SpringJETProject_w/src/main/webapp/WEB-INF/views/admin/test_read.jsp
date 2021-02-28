<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>

<style>
</style>

<script type="text/javascript">
	
	//탭 리스트
	function listTab(evt, tabName) {
	
		var i, tabList, tabmenu;
		tabList = document.getElementsByClassName("tabList");
		for (i = 0; i < tabList.length; i++) {
			tabList[i].style.display = "none";
		}
		tabmenu = document.getElementsByClassName("tabmenu");
		for (i = 0; i < tabmenu.length; i++) {
			tabmenu[i].className = tabmenu[i].className.replace(" active", "");
		}
		document.getElementById(tabName).style.display = "block";

		evt.currentTarget.className += "active";
	}
	
	//두번쨰 버튼 부터 출력
	function refreshAllcsBefore() {
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);

				var dataBox = document.getElementById("allcsBefore");
				
				var childCount = dataBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					dataBox.childNodes[0].remove();
				}			//이코드를 안쓰면 버튼 클릭시 리스트 통채로 추가됨 꼭 써줘야함
				
				
				for(listData of obj){
					
					if(${empty data.csBoardAnswerVo }){	//아마 여기가 틀린듯... data 가 아니니꼐..
						
						//var tbodyBox = document.createElement("tbody");
						
						var TrBox = document.createElement("tr");
							
						var contentNoBox = document.createElement("td");
						contentNoBox.innerText = listData.csBoardVo.jet_board_m_cs_no;
						
						if(listData.csBoardVo.jet_board_m_cs_category_no==1){
							var categoryBox = document.createElement("td");
							categoryBox.innerText = "[가입]";
						}else if(listData.csBoardVo.jet_board_m_cs_category_no==2){
							var categoryBox = document.createElement("td");
							categoryBox.innerText = "[여행친구]";
						}else if(listData.csBoardVo.jet_board_m_cs_category_no==3){
							var categoryBox = document.createElement("td");
							categoryBox.innerText = "[회원등급]";
						}else if(listData.csBoardVo.jet_board_m_cs_category_no==4){
							var categoryBox = document.createElement("td");
							categoryBox.innerText = "[포인트]";
						}else{
							var categoryBox = document.createElement("td");
							categoryBox.innerText = "[기타]";
						}
						
						var aBox =  document.createElement("a");
						aBox.setAttribute("href","${pageContext.request.contextPath }/admin/admin_csboard_read_page.do?jet_board_m_cs_no=${data.csBoardVo.jet_board_m_cs_no }");
						aBox.innerText=listData.csBoardVo.jet_board_m_cs_title;
						
						var titleBox = document.createElement("td");
						
						var nickNoBox = document.createElement("td");
						nickNoBox.innerText = listData.memberVo.jet_member_nick;
						
						var readCountBox = document.createElement("td");
						readCountBox.innerText = listData.csBoardVo.jet_board_m_cs_readcount;
						
						var dateBox = document.createElement("td");
						var d = new Date(listData.csBoardVo.jet_board_m_cs_writedate);
						var strDate =(d.getMonth() + 1) + "/" + d.getDate() + "/" +d.getFullYear() ;
						dateBox.innerText = strDate;
					
						
					}
	

					TrBox.append(contentNoBox);
					TrBox.append(categoryBox);

					TrBox.append(titleBox);
					titleBox.append(aBox);

					TrBox.append(nickNoBox);
					TrBox.append(readCountBox);
					TrBox.append(dateBox);

					dataBox.append(TrBox);
			}
		}
	};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/admin/admin_csboard_before_page_test.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();	//보내는값 없음 일단 검색 기능 뺴고 도전

	}

</script>
</head>
<body>

	<jsp:include page="../admin/admin_only_nav.jsp" />

	<div class="container-fluid mt-3">
		<div class="row">
			<jsp:include page="../admin/admin_only_sidebar.jsp"/>
			
			<div class="col me-3 border border-dark"><%--관리자 메인 페이지 --%>

				<div class="row mt-5">
					<div class="col">
						<h1 class="text-center">TEST TAP</h1>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<hr>
					</div>
				</div>

			<div class="row">
				<div class="col text-center">
					 <div class="btn-group" role="group">
					 	<div class="listTab">
						  <label class="btn btn-outline-primary tabmenu active" onclick="listTab(event,'tab1')">ALL CS</label>
					     
						  <label class="btn btn-outline-primary tabmenu" onclick="listTab(event,'tab2')">ALL 미답변 </label>
						
						  <label class="btn btn-outline-primary tabmenu" onclick="listTab(event,'tab3')">ALL 답변 완료</label>
						 
						  <label class="btn btn-outline-primary tabmenu" onclick="listTab(event,'tab4')">My Assign(미답변)</label>
						
						  <label class="btn btn-outline-primary tabmenu" onclick="listTab(event,'tab5')">My Assign(답변 완료)</label>
						 </div>
					</div>
				</div>
			</div>
			 

			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
		
			<div class="row">
				<div class="col">
					<table class="table table-hover table-responsive ">
						<thead>
							<tr>
								<th scope="col" class="col-1 text-center">번호</th>
								<td scope="col" class="col-1">카테고리</td>
								<td scope="col" class="col">제목</td>
								<td scope="col" class="col-2 text-center">글쓴이</td>
								<td scope="col" class="col-1 text-center">조회</td>
								<td scope="col" class="col-1 text-center">등록일</td>
							</tr>
						</thead>

						<tbody><%--에이작스 출력 페이지.. --%>
							
						</tbody>

					</table>
				</div>
			</div>
					
			<div class="row">
				<div id="tab1" class="tabList" style="display: block;">
	            	<div class="container" id="allcs">123</div>
				</div>
	            <div id="tab2" class="tabList" style="display: none;">
	           		<div class="container" id="allcsBefore"></div>
	             </div>
	             <div id="tab3" class="tabList" style="display: none;">
	           		<div class="container" id="allcsComplete">789</div>
	             </div>
	             <div id="tab4" class="tabList" style="display: none;">
	           		<div class="container" id="assigncsBefore">ㅁㅁㅁㅁ</div>
	             </div>
	             <div id="tab5" class="tabList" style="display: none;">
	           		<div class="container" id="assigncsComplete">ㅍㅍㅍㅍㅍ</div>
	             </div>			            
			</div>





			</div>
			<%--관리자 메인 페이지 col끝--%>
		</div>
		<%--가장 큰 row박스 끝 --%>
	</div>
	<%--컨테이너 박스 끝 --%>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>

</html>