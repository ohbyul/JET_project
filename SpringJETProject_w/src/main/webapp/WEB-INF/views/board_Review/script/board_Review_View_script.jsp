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

	

	function writeReple(){
		
		var inputReple = document.getElementById("input_reple");
		if(inputReple.value == ""){
			alert("댓글을 작성해주세요!");
			inputReple.focus();
			return;
		}
		
		
		var jet_board_review_reple = document.getElementById("input_reple").value;
		var jet_board_review_no = ${result.boardReviewVo.jet_board_review_no}; 
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/write_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_review_no=" + jet_board_review_no + "&jet_board_review_reple_content=" + jet_board_review_reple);
		
		document.getElementById("input_reple").value = "";
	}
	
	
	function refreshReple(){
		
		var repleASC = document.getElementById("repleASC");
		repleASC.style.color="green";
		repleASC.style.fontWeight="bold";
		
		var repleDESC = document.getElementById("repleDESC");
		repleDESC.style.color="black";
		
		
		
		
		var jet_board_review_no = ${result.boardReviewVo.jet_board_review_no}; //...
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				//첫번째 댓글 바로 안뜨는 오류있음
				/*
				var repleCnt = document.getElementById("repleCnt");
				repleCnt.innerText="댓글 수 : "+obj.length;
				*/
				
				var repleListBox = document.getElementById("reple_list_box");
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
				
				var repleListBoxDesc = document.getElementById("reple_list_box_desc");
				
				var childCount = repleListBoxDesc.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBoxDesc.childNodes[0].remove();
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
					/*
					var reportBox = document.createElement("button");
					reportBox.setAttribute("style","border:10px;color:red;background-color:#fff;font-size:12px;width:50px;float:right;");
					reportBox.innerText="신고";
	                */
	                
					var contentBox = document.createElement("li");
					contentBox.setAttribute("style","font-size: 14px;");
					contentBox.innerText = repleData.reviewRepleVo.jet_board_review_reple_content;
					
					var dateBox = document.createElement("li");
					dateBox.setAttribute("class","text-muted");
					dateBox.setAttribute("style","font-size: 12px;");
					var d = new Date(repleData.reviewRepleVo.jet_board_review_reple_date);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					dateBox.innerText = strDate;
					
					if(jet_member_no==repleData.reviewRepleVo.jet_member_no){
					
					var deleteBox = document.createElement("button");
					deleteBox.setAttribute("onclick","deleteReple("+repleData.reviewRepleVo.jet_board_review_reple_no+")");
					deleteBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;");
					deleteBox.innerText = "삭제";					
					}else if(jet_member_no != repleData.reviewRepleVo.jet_member_no){
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
		xmlhttp.open("get","${pageContext.request.contextPath}/board_Review/get_reple_list.do?jet_board_review_no="+jet_board_review_no);
		xmlhttp.send();

	}
	
	function refreshRepleDESC(){
		
		var repleASC = document.getElementById("repleASC");
		repleASC.style.color="black";
		
		
		var repleDESC = document.getElementById("repleDESC");
		repleDESC.style.color="green";
		repleDESC.style.fontWeight="bold";
		
		
		var jet_board_review_no = ${result.boardReviewVo.jet_board_review_no};
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				/*
				var repleCnt = document.getElementById("repleCnt");
				repleCnt.innerText="댓글 수 : "+obj.length;
				*/
				
				var repleListBox = document.getElementById("reple_list_box");
				
				var childCount = repleListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
				
				
				
				var repleListBoxDesc = document.getElementById("reple_list_box_desc");
				
				var childCount = repleListBoxDesc.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					repleListBoxDesc.childNodes[0].remove();
				}
				
				
				
				
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
					contentBox.innerText = repleData.reviewRepleVo.jet_board_review_reple_content;
					
					var dateBox = document.createElement("li");
					dateBox.setAttribute("class","text-muted");
					dateBox.setAttribute("style","font-size: 12px;");
					var d = new Date(repleData.reviewRepleVo.jet_board_review_reple_date);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					dateBox.innerText = strDate;
					
					if(jet_member_no == repleData.reviewRepleVo.jet_member_no){
						
						var deleteBox = document.createElement("button");
						deleteBox.setAttribute("onclick","deleteReple("+repleData.reviewRepleVo.jet_board_review_reple_no+")");
						deleteBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;");
						deleteBox.innerText = "삭제";					
					}else if(jet_member_no!=repleData.reviewRepleVo.jet_member_no){
						var deleteBox = document.createElement("li");
						deleteBox.innerText = "";	

					}		
					
					var commentBox = document.createElement("button");
					commentBox.setAttribute("onclick","commentReple()");
					commentBox.setAttribute("style","outline:0; border:0;background-color:#fff;font-size:12px;float:right");
					commentBox.innerText="답글";
					
					var commentWrtieBox = document.createElement("div");
					commentWrtieBox.setAttribute("class","write_comment_box");
					

					var hr = document.createElement("hr");
					hr.setAttribute("style","background-color:#8C8C8C;");
					
					
					
					rowBox.append(ulBox);
					rowBox.append(deleteBox);
					rowBox.append(commentWrtieBox);
					ulBox.append(nickBox);
					ulBox.append(contentBox);
					ulBox.append(dateBox);
					ulBox.append(deleteBox);
					ulBox.append(commentBox);
					//rowBox.append(hr2);
					rowBox.append(hr);
					
					repleListBoxDesc.append(rowBox);
					
					
	            
					
				}
						
			}
				
		};
		xmlhttp.open("get","${pageContext.request.contextPath}/board_Review/get_reple_list_desc.do?jet_board_review_no="+jet_board_review_no);
		xmlhttp.send();

	}
	
	
	//대댓글 입력창
	function commentReple(boxIndex){
				
		var commentWriteBoxes = document.getElementsByClassName("write_comment_box");
		
		var commentWriteBox = commentWriteBoxes[boxIndex];
		
		var commentAreaDiv = document.createElement("div");
		
		var hr = document.createElement("hr");
		hr.setAttribute("style","background-color:#8C8C8C;");
		
		var commentNick = document.createElement("div");
		commentNick.setAttribute("style","float:left;")
		commentNick.innerText ="${sessionUser.jet_member_nick}";
		
		var commentArea = document.createElement("textarea");
		commentArea.setAttribute("id","input_comment");
		commentArea.setAttribute("style","width:700px;height40px;margin-left:30px");
		commentArea.setAttribute("placeholder","댓글을 남겨보세요");
		
		var commentEnter = document.createElement("input");
		commentEnter.setAttribute("onclick","writeComment()");
		commentEnter.setAttribute("type","submit");
		commentEnter.setAttribute("value","등록");
		commentEnter.setAttribute("style","margin-left:20px;padding: 3px; font-size: 14px; margin-bottom: 10px; background-color: #fff; border: none; outline: none;");
		
		
		commentAreaDiv.append(hr);
		commentAreaDiv.append(commentArea);
		commentAreaDiv.append(commentNick);
		commentAreaDiv.append(commentEnter);
		
		commentWriteBox.append(commentAreaDiv);

		
	}
	
	
	
	//대댓글 입력
	function writeComment(){
		var jet_board_review_comment_title = document.getElementById("input_comment").value;
		var jet_board_review_reple_no = repleData.reviewRepleVo.jet_board_review_reple_no;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refresh();
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/write_comment_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_review_reple_no=" + jet_board_review_reple_no + "&jet_board_review_comment_title=" + jet_board_review_comment_title);
		
		document.getElementById("input_comment").value = "";
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
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/delete_reple_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_review_reple_no=" + reple_no );
		
		
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
		
		var jet_board_review_no = ${result.boardReviewVo.jet_board_review_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
				
		};
		//xmlhttp.open("get","${pageContext.request.contextPath}/board_Review/board_Review_View.do?board_Review_no="+jet_board_review_no);
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/review_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_review_no=" + jet_board_review_no);
		
		
	}
	//추천 취소
	function deleteLikeButton(){
		
		var jet_board_review_no = ${result.boardReviewVo.jet_board_review_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLike();
			}
				
		};
		//xmlhttp.open("get","${pageContext.request.contextPath}/board_Review/board_Review_View.do?board_Review_no="+jet_board_review_no);
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/review_delete_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_board_review_no=" + jet_board_review_no);
	}
	//좋아요 수
	function likeView(){
		
		var jet_board_review_no = ${result.boardReviewVo.jet_board_review_no};
		
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
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/review_like_map.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_review_no=" + jet_board_review_no);
	}
	
	
	
	


	
	function refresh(){
		refreshReple();
		
	}
	
	function refreshLike(){
		likeView();
	}
	
</script>