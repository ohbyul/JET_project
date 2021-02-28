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
</head>
<style>
		
        .mypage_name{
           width: 260px;
           margin-top: 50px;
           margin-left: 100px;
           text-align: center;
        }
		/*
        .mypage_category{
            margin-top: 40px;
            width: 260px;
            height: 355px;      
            background-color: #FFFBEE;      
            left: 80px;
            position: fixed;
            border-radius: 15px;
        }

        .mypage_ul{
            text-align: center;
            margin: 0;
            padding: 0;
            margin-top: 30px;
        }
        .mypage_ul li{
            list-style:none;
            margin: 30px;
            font-weight: bold;
        }
        */
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
			background-color:#FFCD12;
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
			background:#FFFBEE;
			cursor:pointer;
			position:relative;
			
		}
		input[id*="answer"] + label:hover {
			background:#F7F3E6;
		}
		input[id*="answer"] + label em {
			position:absolute;
			top:50%;
			right:10px;
			width:30px;
			height:30px;
			margin-top:-15px;
			display:inline-block;
			background:url('${pageContext.request.contextPath}/resources/image/arrow.png') 0 0 no-repeat;
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
			max-height:125px;
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

</style>
<script type="text/javascript">
	
</script>
<body>
<jsp:include page="../commons/top_image.jsp"/>
		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/update_mypage.do" style="text-decoration:none;color:#000;font-size:15px;font-weight:bold;">회원정보</a>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/member/check_pw_page.do" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">보안설정</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	<%--마이페이지 사이드바 --%>
				<div style="display: inline; position: absolute;">
				<div class="mypage_name"><h2>정보 수정</h2></div>
				<div class="accordion">
					<input type="radio" name="accordion" id="answer01">
					<label for="answer01" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a></label>
				
					<input type="radio" name="accordion" id="answer00">
					<label for="answer00" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath }/mypage/update_mypage.do">정보수정</a></label>
				
					<input type="radio" name="accordion" id="answer01">
					<label for="answer01" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">나의 여행 계획</a></label>
					
					
					<input type="radio" name="accordion" id="answer02">
					<label for="answer02" style="border-bottom:1px solid #FFE08C;"><a>좋아한 글</a></label>
					
					
					<input type="radio" name="accordion" id="answer03">
					<label for="answer03" style="border-bottom:1px solid #FFE08C;background-color:#F7F3E6;">내가 쓴 글<em></em></label>
					<div>
						<ul>
						<li><a href="${pageContext.request.contextPath}/mypage/write_mypage.do" style="font-size: 14px;">내가 쓴 글</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/wrote_reple_mypage.do" style="font-size: 14px;">내가 쓴 댓글</a></li>
						</ul>
					</div>
				
					<input type="radio" name="accordion" id="answer04">
					<label for="answer04"><a>쪽지함</a></label>
					
				</div>
				</div>
		<%--마이페이지 사이드바 끝--%>	
	<div class="container mt-4">
		<div class="row">
			<div class="col-3">
				
			</div>
			<div class="col">
				<div class="row mt-5"></div>
				<div class="row mt-3"></div>
				<div class="row border mt-5">
					<div class="col">
						<div class="row mt-5"></div>
						<div class="row mt-5">
							<div class="col ps-0 text-center"><h3>회원확인을 위해 비밀번호를 입력해주세요.</h3></div>
						</div>
						<form action="${pageContext.request.contextPath }/member/check_pw_process.do">
							<div class="row mt-4">
								<div class="col"></div>
								<div class="col-6 me-4">
									<input class="form-control" type="password" name="jet_member_pw" placeholder="password">
								</div>
								<div class="col"></div>
							</div>
							<div class="row mt-5">
								<div class="col g-gird gap-2 me-4 text-center">
									<input class="btn btn-success" type="submit" value="비밀번호 확인">
								</div>
							</div>
							<div class="row mt-5"></div>
						</form>
					</div>
				</div>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
			</div>
		</div>
	</div>


<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>