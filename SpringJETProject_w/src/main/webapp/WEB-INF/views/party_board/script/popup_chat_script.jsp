<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//세션 처리 세션없을시 댓글 안보이는 현상떄문에..
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
	xmlhttp.open("get","${pageContext.request.contextPath }/member/getSessionNo.do" , false);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();

	
	
	
	
	
	var chatIntervalHandler = null;

	//버튼 클릭시 채팅 창 오픈
	function openPopup(){
		var popupMainBox = document.getElementById("popup_chat")
		popupMainBox.setAttribute("class","popup");
		
		refreshChatList();
	}

	//채팅 목록 출력(내가 참여한 + 내가 개설한 )
	function refreshChatList(){

		var chatListBox = document.getElementById("chat_list_box");
		//채팅 리스트 출력 박스 맨위로.


		var attendChatListBox = document.getElementById("attend_chat_list_box");
		var openChatListBox = document.getElementById("open_chat_list_box");

		attendChatListBox.innerHTML = "";
		openChatListBox.innerHTML = "";
		
		//내가 참여중인 채팅방 목록
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
			
				
				var lineAttend = document.createElement("div");
				lineAttend.setAttribute("style","font-size:10px;");
				lineAttend.innerText = "▼ Attend Chat List";
				
				attendChatListBox.append(lineAttend);
				
				console.log('참여 : ' + obj.length);
				
				for(chatListData of obj){
					
					var bigBox = document.createElement("div");
					bigBox.setAttribute("class","mt-2 mx-1 py-1 px-1");
					bigBox.setAttribute("style","background-color: white;border: 1px solid gray;border-radius: 10px;");
					bigBox.setAttribute("onclick","openChatContent("+chatListData.partyBoardVo.jet_board_party_no+");setState(2,"+chatListData.partyBoardVo.jet_board_party_no+");");
					
					var listBox = document.createElement("div");
					listBox.setAttribute("class","row");

					var titleBox = document.createElement("div");
					titleBox.setAttribute("class","col");
					titleBox.setAttribute("style","font-size:15px;font-weight: bold;");
					titleBox.innerText=chatListData.partyBoardVo.jet_board_party_title;
					
					var countBox = document.createElement("div");
					countBox.setAttribute("class","col-3");
					countBox.setAttribute("style","font-size:12px;text-align: right;color:red;");
					countBox.innerText=chatListData.partyBoardVo.jet_board_party_fixcount +" / " + chatListData.partyBoardVo.jet_board_party_headcount;
					
					var tsDayBox = document.createElement("div");
					tsDayBox.setAttribute("class","row");
					tsDayBox.setAttribute("style","font-size:12px;color:gray;margin:0;");
					var d = new Date(chatListData.partyBoardVo.jet_board_party_tsday);
					//밀리 세컨드 - > 데이트 타입
					var strDate =(d.getMonth() + 1) + "/" + d.getDate() + "/" +d.getFullYear();
					tsDayBox.innerText ="[여행출발일]"+ strDate;

					bigBox.append(listBox);
					bigBox.append(tsDayBox);
					
					listBox.append(titleBox);
					listBox.append(countBox);
					
					attendChatListBox.append(bigBox);
					chatListBox.append(attendChatListBox);
					
				}	//포문
				
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/get_chat_list_process.do" );
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no);
	
		var lineOpened = document.createElement("div");
		lineOpened.setAttribute("style","font-size:10px;");
		lineOpened.innerText = "▼ Opened Chat List";
			
		openChatListBox.append(lineOpened);
		
		//내가 오픈한 채팅 목록
		var xmlhttp2 = new XMLHttpRequest();
		
		xmlhttp2.onreadystatechange = function(){
			if(xmlhttp2.readyState == 4 && xmlhttp2.status == 200){
				var obj = JSON.parse(xmlhttp2.responseText);
				
				console.log('오픈 : ' + obj.length);
				
				for(openchatList of obj){
					
					var bigBox = document.createElement("div");
					bigBox.setAttribute("class","mt-2 mx-1 py-1 px-1");
					bigBox.setAttribute("style","background-color: white;border: 1px solid gray;border-radius: 10px;");
					bigBox.setAttribute("onclick","openChatContent("+openchatList.partyBoardVo.jet_board_party_no+");setState(2,"+openchatList.partyBoardVo.jet_board_party_no+");");
					
					var listBox = document.createElement("div");
					listBox.setAttribute("class","row");

					var titleBox = document.createElement("div");
					titleBox.setAttribute("class","col");
					titleBox.setAttribute("style","font-size:15px;font-weight: bold;");
					titleBox.innerText=openchatList.partyBoardVo.jet_board_party_title;
					
					var countBox = document.createElement("div");
					countBox.setAttribute("class","col-3");
					countBox.setAttribute("style","font-size:12px;text-align: right;color:red;");
					countBox.innerText=openchatList.partyBoardVo.jet_board_party_fixcount +" / " + openchatList.partyBoardVo.jet_board_party_headcount;
					
					var tsDayBox = document.createElement("div");
					tsDayBox.setAttribute("class","row");
					tsDayBox.setAttribute("style","font-size:12px;color:gray;margin:0;");
					var d = new Date(openchatList.partyBoardVo.jet_board_party_tsday);
					//밀리 세컨드 - > 데이트 타입
					var strDate =(d.getMonth() + 1) + "/" + d.getDate() + "/" +d.getFullYear();
					tsDayBox.innerText ="[여행출발일]"+ strDate;
					chatListBox.append(openChatListBox);					

					openChatListBox.append(bigBox);
					
					
					bigBox.append(listBox);
					bigBox.append(tsDayBox);
					
					listBox.append(titleBox);
					listBox.append(countBox);
					
					
				}	//포문
			}
		};
		
		xmlhttp2.open("post","${pageContext.request.contextPath }/party_board/get_open_chat_list_process.do");
		xmlhttp2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp2.send("jet_member_no=" + jet_member_no);		
		
	}
	
	//채팅 내용 
	function refreshChatContent(party_no){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var chatContentBox = document.getElementById("chat_content_box")
				
				var childCount = chatContentBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					chatContentBox.childNodes[0].remove();
				}
				
				for(chatData of obj){
					
					var bigBox = document.createElement("div");
					
	               if(chatData.partyChatVo.jet_member_no ==jet_member_no){
	                   var nickBox = document.createElement("div");
	                   nickBox.setAttribute("class","row mt-3");

	                   var chatAndDaterowBox = document.createElement("div");
	                   chatAndDaterowBox.setAttribute("class","row");
	                   chatAndDaterowBox.setAttribute("style","text-align:right");
	                   
	                   var dateBox = document.createElement("div");
	                   dateBox.setAttribute("class","col text-muted font-monospace");
	                   dateBox.setAttribute("style","font-size: 12px;text-align: right;");
	                   var d = new Date(chatData.partyChatVo.jet_party_chat_writedate);
	                   var strDate =d.getHours() + ":" + d.getMinutes();
	                   dateBox.innerText = strDate;
	                   
	                   var chatBox = document.createElement("div");
	                   chatBox.setAttribute("class","col-1 text-wrap");
	                   chatBox.setAttribute("style","padding:5px 10px;max-width:180px;word-wrap:break-word;width:auto;font-size: 14px;border: 1px solid gray;border-radius: 5px;background-color:#fef01b;");
	                   chatBox.innerText=chatData.partyChatVo.jet_party_chat_content;
	                   
	                   bigBox.append(nickBox);
	                   bigBox.append(chatAndDaterowBox);
	                   chatAndDaterowBox.append(dateBox);
	                   chatAndDaterowBox.append(chatBox);
	                   
	                   chatContentBox.append(bigBox);
	                   
	                }else{
	                   var nickBox = document.createElement("div");
	                   nickBox.setAttribute("class","row");
	                   nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
	                   nickBox.innerText=chatData.chatMembernick;
	                   //데이터 최적화와 암호화를 위해 닉네임만 가져옴 
	    
	                   var chatAndDaterowBox = document.createElement("div");
	                   chatAndDaterowBox.setAttribute("class","row");
	                   
	                   var chatBox = document.createElement("div");
	                   chatBox.setAttribute("class","col-8 text-wrap");
	                   chatBox.setAttribute("style","padding:5px 10px;max-width:180px;word-wrap:break-word;width:auto;font-size: 14px;border: 1px solid gray;border-radius: 5px;background-color:white;");
	                   chatBox.innerText=chatData.partyChatVo.jet_party_chat_content;
	                   
	                   var dateBox = document.createElement("div");
	                   dateBox.setAttribute("class","col-4 text-muted font-monospace");
	                   dateBox.setAttribute("style","font-size: 12px;");
	                   var d = new Date(chatData.partyChatVo.jet_party_chat_writedate);
	                   var strDate =(d.getMonth() + 1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes();
	                   dateBox.innerText = strDate;
	                   
	                   bigBox.append(nickBox);
	                   bigBox.append(chatAndDaterowBox);
	                   chatAndDaterowBox.append(chatBox);
	                   chatAndDaterowBox.append(dateBox);
	                   
	                   chatContentBox.append(bigBox);
	                   
	                   
	                }
				
				}	//포문
				
				const $messageTextBox = $('#popup_chat_body_sub');
				$messageTextBox.scrollTop($messageTextBox[0].scrollHeight);
				//스크롤 아래로 세팅!
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/get_chat_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no=" + party_no);		
		
		
	}
	
	
	function exitCurrentChatRoom(){
		if(chatIntervalHandler != null){
			clearInterval(chatIntervalHandler);
			chatIntervalHandler = null;
		}		
	}
	
	
	//채팅방 클릭스 채팅 내용 출력  화면 전환하는 코드 
	function openChatContent(party_no) {

	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				var popupBox = document.getElementById("popup_chat")
				
				
				var popupHeaderBox = document.getElementById("popup_chat_header_main")
				popupHeaderBox.setAttribute("class","row d-none");
				var popupHeaderBox = document.getElementById("popup_chat_header_sub")
				popupHeaderBox.setAttribute("class","row");
				
				var childCount = popupHeaderBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					popupHeaderBox.childNodes[0].remove();
				}
				
				
				var mainTitleBox = document.createElement("div");
				mainTitleBox.setAttribute("class","col mt-1")
				mainTitleBox.setAttribute("style",";padding-right: 0px;");
				
				var arrowBox = document.createElement("i");
				arrowBox.setAttribute("class","fas fa-arrow-left mt-2 me-2");
				arrowBox.setAttribute("style","font-size:20px;");
				arrowBox.setAttribute("onclick","replaceList();setState(1,0);");
				
				if(obj.partyBoardVo.jet_board_party_no ==party_no){
					var titleBox = document.createElement("a");
					titleBox.setAttribute("style","font-weight: bold;font-size: 12px;");
					titleBox.innerText =obj.partyBoardVo.jet_board_party_title;
					var countBox = document.createElement("span");
					countBox.setAttribute("class","font-monospace");
					countBox.setAttribute("style","color: red;font-size: 12px;");
					countBox.innerText =" [" + obj.partyBoardVo.jet_board_party_fixcount +"/" + obj.partyBoardVo.jet_board_party_headcount + "]";
				}//여기
				
				var closeBox = document.createElement("div");
				closeBox.setAttribute("class","col-1 mt-1"); 
				closeBox.setAttribute("style","text-align: right;padding-left: 0px;"); 
				var closeBtn = document.createElement("span");
				closeBtn.setAttribute("id","close");  
				closeBtn.setAttribute("onclick","this.parentNode.parentNode.parentNode.setAttribute('class','popup d-none');exitCurrentChatRoom();setState(0,0);");  
				closeBtn.setAttribute("style","font-size: 20px;"); 
				closeBtn.setAttribute("class","btn-close"); 
				
				var popupBodyBox = document.getElementById("popup_chat_body_main")
				popupBodyBox.setAttribute("class","row d-none");
				var popupBodyBox = document.getElementById("popup_chat_body_sub")
				popupBodyBox.setAttribute("class","row");
				
				var popupfooterBox = document.getElementById("popup_chat_footer_main")
				popupfooterBox.setAttribute("class","row d-none");
				var popupfooterBox = document.getElementById("popup_chat_footer_sub")
				popupfooterBox.setAttribute("class","row");
				
				
				var childCount = popupfooterBox.childNodes.length ;
				for(var i =0 ; i < childCount ; i++){
					popupfooterBox.childNodes[0].remove();
				}
				
				
				var inputBox = document.createElement("div");
				inputBox.setAttribute("class","col mt-1 ps-1");
				inputBox.setAttribute("style","padding: 0;");
				var textareaBox = document.createElement("textarea");
				textareaBox.setAttribute("rows","2");
				textareaBox.setAttribute("cols","30");
				textareaBox.setAttribute("onkeyup","enterkey("+party_no+")");
				//엔터키로 인서트 
				textareaBox.setAttribute("id","jet_party_chat_content");
				var btnBox = document.createElement("div");
				btnBox.setAttribute("class","col-2 mt-1");
				btnBox.setAttribute("style","padding: 0;");
				var submitbtn = document.createElement("input");
				submitbtn.setAttribute("type","button");
				submitbtn.setAttribute("onclick","submitChat("+party_no+")");
				submitbtn.setAttribute("style","background-color: #fef01b;border: 1px solid gray;border-radius: 5px;");
				submitbtn.setAttribute("value","전송");
				
				popupBox.append(popupHeaderBox);
				popupHeaderBox.append(mainTitleBox);
				popupHeaderBox.append(closeBox);
				mainTitleBox.append(arrowBox);
				mainTitleBox.append(titleBox);
				mainTitleBox.append(countBox);
				closeBox.append(closeBtn);
				
				popupBox.append(popupBodyBox);
				popupBox.append(popupfooterBox);
				
				popupfooterBox.append(inputBox);
				inputBox.append(textareaBox);
				popupfooterBox.append(btnBox);
				btnBox.append(submitbtn);
				
				
				
				if(chatIntervalHandler != null){
					clearInterval(chatIntervalHandler);
					chatIntervalHandler = null;
				}
				
				if(chatIntervalHandler == null){
					chatIntervalHandler = setInterval(refreshChatContent , 1000 , party_no);
				}	
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/get_chat_title.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no=" + party_no);
		
		
	}
	
	//뒤로 가기 버튼
	function replaceList() {
		var popupBox = document.getElementById("popup_chat")
		
		var popupHeaderBox = document.getElementById("popup_chat_header_main")
		popupHeaderBox.setAttribute("class","row");
		var popupHeaderBox = document.getElementById("popup_chat_header_sub")
		popupHeaderBox.setAttribute("class","row d-none");
		
		var popupBodyBox = document.getElementById("popup_chat_body_main")
		popupBodyBox.setAttribute("class","row");
		var popupBodyBox = document.getElementById("popup_chat_body_sub")
		popupBodyBox.setAttribute("class","row d-none");
		
		var popupfooterBox = document.getElementById("popup_chat_footer_main")
		popupfooterBox.setAttribute("class","row");
		var popupfooterBox = document.getElementById("popup_chat_footer_sub")
		popupfooterBox.setAttribute("class","row d-none");
		

		
		popupBox.append(popupHeaderBox);
		popupBox.append(popupBodyBox);
		popupBox.append(popupfooterBox);
		
		exitCurrentChatRoom();
		
	}

	function enterkey(party_no) {
        if (window.event.keyCode == 13) {
 
        	//엔터키로 인서트 
         	 submitChat(party_no);
        }
	}
	
	//채팅 입력
	function submitChat(party_no) {
		
		var chatContent = document.getElementById("jet_party_chat_content").value;
		
		if(chatContent==""){
			alert("채팅 입력후 전송해주세요^^");
			return;
		}
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//refresh();
				refreshChatContent(party_no);
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/write_chat_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_party_no=" + party_no + "&jet_party_chat_content=" + chatContent);
		
		document.getElementById("jet_party_chat_content").value = "";

	
	}	
	
	
	//setInterval(openChatContent,3000);
	
	
	//refreshChatList();
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);
			
			if(obj.state == null || obj.state == 0){
				
			}else if(obj.state == 1) {
				openPopup();
				//refreshChatList();
			}else if(obj.state == 2){
				openPopup();
				//refreshChatList();
				openChatContent(obj.chatNum);
			}
			
		}
	};
	xmlhttp.open("get","${pageContext.request.contextPath }/party_board/get_current_state.do" , false);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();	
	
	
	
	function setState(state,chatNum){
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/party_board/set_current_state.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("chatNum=" + chatNum + "&state=" + state);	
	}
	

</script>