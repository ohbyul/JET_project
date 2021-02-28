<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	var jet_member_no = null;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);  //여기가 뭘까.
			
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
	

	//좋아요 버튼 기능.
	function likeButton() {
		
		//예외 처리.... 로그인 안하고 좋아요 버튼 눌렀을때...
		if(jet_member_no == null){
			
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}
			return;
		}
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
		};	
		
		xmlhttp.open("post","${pageContext.request.contextPath }/freeboard/freeboard_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);
		
	}
	
	function dislikeButton() {
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/freeboard/freeboard_dislike_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");	
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);
	}


	function likeFreeboard(){
		
		var jet_board_free_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);		
				
				if(obj.likeCheck == true){
					var btnLike = document.getElementById("btnLike");
					   btnLike.setAttribute("type","image");
		               btnLike.setAttribute("src","${pageContext.request.contextPath}/resources/image/heart.png");
		               btnLike.setAttribute("style","outline:none;");
		               btnLike.setAttribute("onclick","dislikeButton()");
					
				}else{
					var btnLike = document.getElementById("btnLike");
					   btnLike.setAttribute("type","image");
		               btnLike.setAttribute("src","${pageContext.request.contextPath}/resources/image/heart_blank.png");
		               btnLike.setAttribute("style","outline:none;");
		               btnLike.setAttribute("onclick","likeButton()");
					
				
				}
				
				var btnLikeCount = document.getElementById("likeCount");
				btnLikeCount.innerText = obj.likeCount;
				
			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/freeboard_like_map.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_no=" + jet_board_free_no);
	}
	

	function refreshLike() {
		likeFreeboard();
	}

	//리플 예외처리 + 기본 submit 도 이제 ajax 처리 필요.
	function writeReple() {
		
		var reple_content = document.getElementById("reple_content").value;
		var freeboard_no = ${result.freeboardVo.jet_board_free_no };
		
		if(reple_content ==""){
			alert("댓글을 입력해 주세요.");
			inputReple.focus();
			return;
	  	}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/write_free_board_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");//post방식 헤더 세팅
		xmlhttp.send("jet_board_free_no="+freeboard_no + "&jet_board_free_reple_content="+reple_content);
		
		//초기화
		document.getElementById("reple_content").value = "";
	}
	
	function refreshReple() {
		
		var freeboard_no = ${result.freeboardVo.jet_board_free_no };
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				
				var repleListBox = document.getElementById("reple_list_box");
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0; i < childCount; i++){	
					repleListBox.childNodes[0].remove();
				}
				
				for(reple of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class", "row p-4");			
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class", "col-1")
					nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
					nickBox.innerText = reple.memberVo.jet_member_nick;
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class", "col")
					contentBox.innerText = reple.freeboardRepleVo.jet_board_free_reple_content;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col-3 pe-0 text-muted");
					dateBox.setAttribute("style","text-align: end; font-size: 12px;");
					var d = new Date(reple.freeboardRepleVo.jet_board_free_reple_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					dateBox.innerText = strDate;
					
					/*댓글 수정ㅜ
					if(jet_member_no == reple.freeboardRepleVo.jet_member_no){
						
						var updateBox = document.createElement("button");
						updateBox.setAttribute("onclick","commentForm");
						updateBox.setAttribute("style","text-align:end; outline:0; border:0;background-color:#fff;font-size:12px;");
						updateBox.innerText = "수정";		
						
					}else if(jet_member_no != reple.freeboardRepleVo.jet_member_no){
							var deleteBox = document.createElement("div");
							deleteBox.innerText = "";	
					}
					*/

					//댓글 삭제
					if(jet_member_no == reple.freeboardRepleVo.jet_member_no){
						
						var deleteBox = document.createElement("button");
						deleteBox.setAttribute("onclick","deleteReple("+reple.freeboardRepleVo.jet_board_free_reple_no+")");
						deleteBox.setAttribute("style","text-align:end; outline:0; border:0;background-color:#fff;font-size:12px;");
						deleteBox.innerText = "삭제";	
						
					}else if(jet_member_no != reple.freeboardRepleVo.jet_member_no){
							var deleteBox = document.createElement("div");
							deleteBox.innerText = "";	
					}

					var hr = document.createElement("hr");
					hr.setAttribute("style","background-color:#8C8C8C;");
					

					rowBox.append(nickBox);
					rowBox.append(contentBox);
					rowBox.append(dateBox);
					rowBox.append(updateBox);
					rowBox.append(deleteBox);
					rowBox.append(hr);
					
					repleListBox.append(rowBox);
					
				}
				
			}
				
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/freeboard/get_free_board_reple_list.do?jet_board_free_no="+freeboard_no);
		xmlhttp.send();
		
	}
	
	function deleteReple(jet_board_free_reple_no){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}	
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/delete_free_board_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_reple_no=" + jet_board_free_reple_no );
	}
	
	/*수정 폼?
	function commentForm() {
		
		var commentBox = document.createElement("div");
		commentBox.setAttribute("class", "comment_form");
		
	}
	
	//댓글 수정하기..
	function updateReple(jet_board_free_reple_no){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				
				
				refresh();
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/update_free_board_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_free_reple_no=" + jet_board_free_reple_no );
		
	}	
	
	*/
	
	function refresh(){
		refreshReple();
	}
	
	setInterval(refresh,1000); // 1초마다 refresh호출하는 interval 세팅해줌. 댓글 저절로 뜨게.
	
	
</script>