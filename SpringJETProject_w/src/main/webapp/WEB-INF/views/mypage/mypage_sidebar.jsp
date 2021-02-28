<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<style>
        .mypage_name{
           width: 260px;
           margin-top: 50px;
           margin-left: 100px;
           text-align: center;
        }

		.filebox label {
		    display: inline-block;
		    padding: 7px 15px;
		    color: #000;
		    font-size: 14px;
		    font-weight:bold;
		    line-height: normal;
		    vertical-align: middle;
		    background-color: #fdfdfd;
		    cursor: pointer;
		    border: 1px solid #ebebeb;
		    border-bottom-color: #e2e2e2;
		    border-radius: 5px;
		  }        
        
        .filebox input[type="file"] {  /* 파일 필드 숨기기 */
		    position: absolute;
		    width: 1px;
		    height: 1px;
		    padding: 0;
		    margin: -1px;
		    overflow: hidden;
		    clip:rect(0,0,0,0);
		    border: 0;
		}
		
		/*적용버튼*/
		#member_update{
			border:1px solid #FFCD12; 
			background-color:#FFF;
			padding:5px 15px;
			border-radius:10px;
		}
		#member_update:hover{
			color:#fff;
			background-color:#FF9436;
		}
		#member_update_cancle{
			border:1px solid #FFCD12; 
			background-color:#FFF;
			padding:5px 15px;
			border-radius:10px;
		}
		#member_update_cancle:hover{
			color:#fff;
			background-color:#FFCD12;
		}
		/*아코디언*/
		.accordion {
			width:260px;
			margin-top: 50px;
            margin-left: 100px;            
        }
		input[id*="answer"] {
			position:absolute;
			display:none;
		}
		input[id*="answer"] + label {
			display:block;
			padding:20px;
			border-bottom:0;
			color:#000;
			font-weight:900;
			background:#FF9436;
			cursor:pointer;
			position:relative;
			
		}
		input[id*="answer"] + label:hover {
			background:#FFB456;
		}
		input[id*="answer"] + label em {
			position:absolute;
			top:50%;
			right:10px;
			width:30px;
			height:30px;
			margin-top:-15px;
			display:inline-block;
			background:url('${pageContext.request.contextPath}/resources/image/arrow_1.png') 0 0 no-repeat;
		}
		input[id*="answer"] + label + div {
			max-height:0;
			transition: all .35s;
			overflow:hidden;
			background:#fff;
			font-size:11px;
		}
		input[id*="answer"] + label + div a {
			display:inline-block;
			padding:20px;
		}
		input[id*="answer"]:checked + label + div {
			max-height:175px;
		}
		input[id*="answer"]:checked + label em {
			background-position:0 -30px;
		}
		.accordion a{
            color: #000;
            text-decoration: none;
            font-weight: bold;
            letter-spacing: 3px; 
            position: relative;
            padding: 0px;
        }
	
		
		.accordion li a{
            color: #000;
            text-decoration: none;

            font-weight: bold;
            letter-spacing: 3px; 
            position: relative;
            padding: 0px;
        }
		
		.accordion li a::after{
			content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background:  #ABF200;
            transition: all .1s ease-out;
            
		}
		.accordion li a:hover::after{
            width: 100%;
        }
		#upgrade{
			border:1px solid #FF9436; 
			outline:none; 
			background-color:#fff; 
			color:#FF9436; 
			border-radius:10px; 
			padding:5px;
		}
		#upgrade:hover{
			background-color:#FF9436;
			color:#fff; 
		}
</style>
</head>
<div class="accordion">
		<input type="radio" name="accordion" id="answer00">
		<label for="answer01" style="border-bottom:1px solid #FFE08C;border-radius: 15px 15px 0 0;" ><a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a></label>
	
		<input type="radio" name="accordion" id="answer01">
		<label for="answer00" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath}/mypage/update_mypage.do">정보수정</a></label>
	
		<input type="radio" name="accordion" id="answer02">
		<label for="answer01" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">나의 여행 계획</a></label>
		
		
		<input type="radio" name="accordion" id="answer03">
		<label for="answer02" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath }/mypage/pick_mypage.do" >즐겨찾기 목록</a></label>
		
		
		<input type="radio" name="accordion" id="answer04">
		<label for="answer04" style="border-bottom:1px solid #FFE08C;" >내가 쓴 글<em></em></label>
		<div style="background-color:#FFB456">
			<ul >
				<li><a href="${pageContext.request.contextPath}/mypage/write_mypage.do" style="font-size: 14px;" >내가 쓴 글</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/wrote_reple_mypage.do" style="font-size: 14px;">내가 쓴 댓글</a></li>
			</ul>
		</div>
		
		<input type="radio" name="accordion" id="answer05">
		<label for="answer05" style="border-bottom:1px solid #FFE08C;" >원데이클래스<em></em></label>
		<div style="background-color:#FFB456">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/classlist_mypage.do" style="font-size: 14px;">나의 클래스</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/participating_class_mypage.do" style="font-size: 14px;">예약한 클래스</a></li>
			</ul>
		</div>
		
		<input type="radio" name="accordion" id="answer06">
		<label for="answer06" style="border-bottom:1px solid #FFE08C;" >여행 친구 찾기<em></em></label>
		<div style="background-color:#FFB456">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/recruitment_mypage.do">내가 개설한 파티</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/attend_mypage.do">내가 참가중인 파티</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/after_rating_page.do">여행후 친구평가</a></li>
			</ul>
		</div>
		<input type="radio" name="accordion" id="answer07">
		<label for="answer07" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath}/message/message_page.do">쪽지함</a></label>
		<input type="radio" name="accordion" id="answer08">
		<label for="answer08" style="border-radius: 0 0 15px 15px;" ><a href="${pageContext.request.contextPath}/member/my_friendList_page.do">나의 친구 목록</a></label>
		
		
	</div>