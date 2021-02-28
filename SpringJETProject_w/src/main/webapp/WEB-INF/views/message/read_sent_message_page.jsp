<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

</head>
<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>내가 보낸쪽지 </h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>
 
        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-10">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col"></div>
						<div class="col-8">
							<div class="row mt-2">
					            <div class="col-4"></div>
					            <div class="col-4"></div>
					            <div class="col text-end" >home > message</div>
					        </div>
					        <div class="row mt-2">
								<div class="col">
									<h4>보낸 쪽지</h4>
								</div>
							</div>
					        <div class="row">
					        	<div class="col">
					        		<hr>
					        	</div>
					        </div>
							<div class="row">
								<div class="col-2 d-grid gap-2 input-group-text">작성자</div>
								<div class="col d-grid gap-2 form-control text-center">${result.memberVo.jet_member_nick }</div>
							</div>
							<div class="row mt-1"><%--현재는 임시로 받는 사람을 작성하도록 함. insert가 목표 --%>
								<div class="col-2 d-grid gap-2 input-group-text">받는 사람</div> 
								<div class="col d-grid gap-2 text-center form-control">
									${result.memberReceiverNick.jet_member_nick}
								</div>
							</div>
							<div class="row mt-2">
								<div class="col-2 d-grid gap-2 input-group-text">제목</div>
								<div class="col d-grid gap-2 form-control">
									${result.messageVo.jet_message_title }
								</div>
							</div>
							<div class="row mt-2">
								<div class="col d-grid gap-2 text-center input-group-text ps-0 pe-0">내용</div>
							</div>
							<div class="row mt-1">
								<div class="col d-grid gap-2 ps-0 pe-0">
									<textarea style="resize: none;" name="jet_message_content" rows="10" cols="70" class="form-control ps-0 pe-0" disabled>  ${result.messageVo.jet_message_content }</textarea>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col d-grip gap-2"></div>
								<div class="col d-grip gap-2"></div>
								<div class="col-3 d-grip gap-2 text-end pe-0">
									<a class="btn btn-outline-success" type="button" href="${pageContext.request.contextPath }/message/sent_message_page.do">목록으로</a>
								</div>
							</div>
						</div>
						<div class="col"></div>
                </div>
                
            </div>
        </div>
     </div>

        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>        	
</body>
</html>