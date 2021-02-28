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
function pickBoard(){ 
	
	var reviewBtn = document.getElementById("pickBtn");
	reviewBtn.style.fontWeight="bold";
	reviewBtn.style.color="#7DAB12";
	
	var freeBtn = document.getElementById("likeBtn");
	freeBtn.style.fontWeight="normal";
	freeBtn.style.color="#000";
	
	var pickListBox = document.getElementById("pick_list_box");
	
	var childCount = pickListBox.childNodes.length;
	for(var i = 0 ; i < childCount ; i++){
		pickListBox.childNodes[0].remove();
	}
	
	var xmlhttp = new XMLHttpRequest();

	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var obj = JSON.parse(xmlhttp.responseText);
			


			for(pickData of obj){
				
				var trBox = document.createElement("tr");
				
				var checkBox = document.createElement("td");
				checkBox.setAttribute("scope","row");
				
				var checkValue = document.createElement("input");
				checkValue.setAttribute("type","checkbox");
				checkValue.setAttribute("name","delete_chk");
				
				var titleBox = document.createElement("td");
				
				
				var titleBoxAtag = document.createElement("a");
				titleBoxAtag.setAttribute("href","${pageContext.request.contextPath}/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no="+pickData.sharePlanBoardVo.jet_board_shareplan_no);
				titleBoxAtag.setAttribute("style","text-decoration:none;color:#000");
				titleBoxAtag.innerText = pickData.sharePlanBoardVo.jet_board_shareplan_title;
				
				var writeDateBox = document.createElement("td");
				writeDateBox.setAttribute("class","text-center");
				
				var d = new Date(pickData.sharePlanBoardVo.jet_board_shareplan_writedate);
				var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
				writeDateBox.innerText = strDate;
				
				var readCountBox = document.createElement("td");
				readCountBox.setAttribute("class","text-center");
				readCountBox.innerText = pickData.sharePlanBoardVo.jet_board_shareplan_readcount;
				
				var shareBox = document.createElement("td");
				shareBox.setAttribute("class","text-center");
				shareBox.innerText = "공유하기";
				
				
				checkBox.append(checkValue);
				
				titleBox.append(titleBoxAtag);
				
				trBox.append(checkBox);
				trBox.append(titleBox);
				trBox.append(writeDateBox);
				trBox.append(readCountBox);
				trBox.append(shareBox);
				
				pickListBox.append(trBox);
			}
		}
			
	};
	
	
	xmlhttp.open("get","${pageContext.request.contextPath}/mypage/get_pick_board.do");
	
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
<body onload="pickBoard()">
<jsp:include page="../commons/top_image.jsp"/>


<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>찜한 글</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>

		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;" onclick="pickBoard()" id="pickBtn">찜한 글</a>
						
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath }/mypage/like_mypage.do" style="text-decoration:none;color:#000;font-size:15px;" id="likeBtn">좋아한 글</a>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>

		

        <div class="container" style="margin:65px 0 600px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<table class="table table-hover table-responsive" id="board">
						<thead>
							<tr>
								<th scope="col" class="col-1"><input type="checkbox" onclick="selectAll(this)"></th>
								<th scope="col" class="col">제목</th>
								<th scope="col" class="col-2 text-center">작성일</th>
								<th scope="col" class="col-1 text-center">조회수</th>
								<th scope="col" class="col-2 text-center">공유하기</th>
							</tr>
						</thead>
						<tbody id="pick_list_box">
						
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