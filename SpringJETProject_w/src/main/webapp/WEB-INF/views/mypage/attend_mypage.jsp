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

	function attendBoard(){ 


		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var attendListBox = document.getElementById("attend_list_box");
				
				var childCount = attendListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					attendListBox.childNodes[0].remove();
				}
				
				for(attendData of obj){
					
					var trBox = document.createElement("tr");
					
					var checkBox = document.createElement("td");
					checkBox.setAttribute("scope","row");
					
					var checkValue = document.createElement("input");
					checkValue.setAttribute("type","checkbox")
					checkValue.setAttribute("name","delete_chk");
					
					var titleBox = document.createElement("td");
					
					
					var title_Atag = document.createElement("a");
					title_Atag.setAttribute("href","${pageContext.request.contextPath}/party_board/read_party_board_page.do?jet_board_party_no="+attendData.partyBoardVo.jet_board_party_no);
					title_Atag.setAttribute("style","text-decoration:none;color:#000");
					title_Atag.innerText = attendData.partyBoardVo.jet_board_party_title;
					
					var recruitmentBox = document.createElement("td");
					recruitmentBox.setAttribute("class","text-center")
					recruitmentBox.innerText = attendData.partyBoardVo.jet_board_party_fixcount + "/" + attendData.partyBoardVo.jet_board_party_headcount;
					
					var endgatherDateBox = document.createElement("td");
					endgatherDateBox.setAttribute("class","text-center");
					
					var d = new Date(attendData.partyBoardVo.jet_board_party_endgather);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					endgatherDateBox.innerText = strDate;
					
					var writeDateBox = document.createElement("td");
					writeDateBox.setAttribute("class","text-center");
					
					var d = new Date(attendData.partyBoardVo.jet_board_party_tsday);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					writeDateBox.innerText = strDate;
					


					checkBox.append(checkValue);
					
					titleBox.append(title_Atag);
					
					trBox.append(checkBox);
					trBox.append(titleBox);
					trBox.append(recruitmentBox);
					trBox.append(endgatherDateBox);
					trBox.append(writeDateBox);
					
					attendListBox.append(trBox);
				}
			}
				
		};
		
		
		xmlhttp.open("get","${pageContext.request.contextPath}/mypage/get_attend_party.do");
		
		xmlhttp.send();
		
	}

	
	//전체삭제
	function selectAll(selectAll){
	  const checkboxes = document.getElementsByName('delete_chk');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
		
	}
	

</script>



</head>
<body onload="attendBoard()">
<jsp:include page="../commons/top_image.jsp"/>
<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>참가중인 파티</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>

	<%--탭 메뉴 --%>
		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/recruitment_mypage.do" style="text-decoration:none;color:#000;font-size:15px;">개설한 파티 </a>
						
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/attend_mypage.do" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">참가중 파티</a>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/after_rating_page.do" style="text-decoration:none;color:#000;font-size:15px;">친구 평가</a>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	<%--탭메뉴 끝 --%>

        <div class="container" style="margin:115px 0 700px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<table class="table table-hover table-responsive" id="board">
						<thead>
							<tr>
								<th scope="col" class="col-1"><input type="checkbox" onclick="selectAll(this)"></th>
								<th scope="col" class="col">제목</th>
								<th scope="col" class="col-2 text-center">모집현황</th>
								<th scope="col" class="col-2 text-center">모집마감일</th>
								<th scope="col" class="col-2 text-center">여행출발일</th>
								
							</tr>
						</thead>
						
						
			            
			            	<tbody id="attend_list_box">

			             											
						</tbody>
						
						
					</table>
					<input id="member_update" type="button" value="삭제" style="float:right;">
				</div>
            </div>
        </div>
        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>			
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>