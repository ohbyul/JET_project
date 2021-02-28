<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

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
/*
	//아구찜
	function mineBoard(shareplan_no){
		
		
		
		
		//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...
		if(jet_member_no == null){
			
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			
			return;
		}
		
		
			var jet_board_shareplan_no = shareplan_no;
		
		
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_pick_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_shareplan_no=" + jet_board_shareplan_no);
		
	}
	//아구찜 취소
	function deleteLikeButton(shareplan_no){
		
		var jet_board_shareplan_no = shareplan_no;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_pick_delete_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_shareplan_no=" + jet_board_shareplan_no);
	}
	*/
	//아구찜확인
	
	function pickView(eventObject , shareplan_no){
		console.log(shareplan_no);
		var jet_board_shareplan_no = shareplan_no;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.likeChk == true){
					//var btnPick = document.getElementById("btnPick");
					var btnPick = eventObject;
					
					btnPick.setAttribute("type","image");
					btnPick.setAttribute("src","${pageContext.request.contextPath }/resources/image/onstar.png");
					btnPick.setAttribute("style","outline:none;");
					//btnPick.setAttribute("onclick","deleteLikeButton(jet_board_shareplan_no)");
					/*
					var btnPickValue = document.createElement("img")
					btnPickValue.setAttribute("src","${pageContext.request.contextPath }/resources/image/onstar.png");
					btnPickValue.setAttribute("alt","image");					
					btnPickValue.setAttribute("onclick","deleteLikeButton(${data.sharePlanBoardVo.jet_board_shareplan_no})");
		               
					btnPick.append(btnPickValue);
					*/
					
				}else{
					//var btnPick = document.getElementById("btnPick");
					var btnPick = eventObject;
					
					btnPick.setAttribute("type","text");
					btnPick.setAttribute("value","찜안됨");
					btnPick.setAttribute("style","outline:none;");
					//btnPick.setAttribute("onclick","deleteLikeButton(jet_board_shareplan_no)");
					
					/*
					var btnPickImage = document.createElement("input");
					btnPickImage.setAttribute("type","image");
					btnPickImage.setAttribute("src","${pageContext.request.contextPath }/resources/image/star.png");
					btnPickImage.setAttribute("onclick","deleteLikeButton(jet_board_shareplan_no)");
					
					btnPick.append(btnPickImage);
					/*
					var btnPickValue = document.createElement("img")
					btnPickValue.setAttribute("src","${pageContext.request.contextPath }/resources/image/star.png");
					btnPickValue.setAttribute("alt","image");					
					btnPickValue.setAttribute("onclick","mineBoard(${data.sharePlanBoardVo.jet_board_shareplan_no})");
		               
					btnPick.append(btnPickValue);
					*/
				}

			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/shareplan_pick_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
	}


	
</script>