<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--아이콘 적용 CDN--%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>


<jsp:include page="../party_board/style/popup_chat_style.jsp"/>
	
	<c:if test="${!empty sessionUser }">
		<div id="root">	<%--버튼  --%>	
			<img id="myChatBtn" onclick="openPopup();setState(1,0);" src="${pageContext.request.contextPath}/resources/image/jet_talk1.jpg">		
			<%--<button id="myChatBtn" type="button"  onclick="openPopup();setState(1,0);">open chat</button> --%>
		</div>
	</c:if>


	<div class="popup d-none" id="popup_chat">
		
		<%--채팅 리스트  --%>
		<div class="row" id="popup_chat_header_main">
			
			
			<div class="col mt-3" style="font-weight: bold;font-size: 15px;text-align: center;">
				<span><i class="far fa-comment-dots me-1" style="font-size: 25px;"></i> [${sessionUser.jet_member_nick }]님의 Chat</span>
			</div>
			
			<div class="col-2 mt-1" style="text-align: right;">
				<span id='close' onclick="this.parentNode.parentNode.parentNode.setAttribute('class','popup d-none'); exitCurrentChatRoom();setState(0,0);" style="font-size: 20px;" class="btn-close"></span>
			</div>
		</div>
		
		<%--채팅 방록 들어갔을땐 글 제목 --%>
		<div class="row d-none" id="popup_chat_header_sub">
			
		</div>
<%--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ --%>
		
		<%--채팅 리스트 --%>
		<div class="row" id="popup_chat_body_main">
			<div class="col" id="chat_list_box">
				<div class="row">
					<div class="col" id="open_chat_list_box"></div>
				</div>
				<div class="row">
					<div class="col" id="attend_chat_list_box"></div>
				</div>
			</div>
		</div>
		
		<%--채팅 방 --%>
		<div class="row d-none" id="popup_chat_body_sub">
			<div class="col" id="chat_content_box">
			
			</div>
		</div>
		
<%--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ --%>
		
		<%--채팅 목록 리스트에서 광고창 --%>
		<div class="row" id="popup_chat_footer_main">
			<div class="col" style="padding: 0;">
				<a href="${pageContext.request.contextPath }/content/main_page.do">
					<img id="ad_box" src="${pageContext.request.contextPath}/resources/image/ad_chat.jpg">
 				</a>
 			</div>
 		</div>
		
		<%--채팅 방 글인서트 --%>
		<div class="row pt-2 d-none" id="popup_chat_footer_sub">
			
		</div>
		
<%--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ --%>		
		
	</div>



<jsp:include page="../party_board/script/popup_chat_script.jsp"/>

