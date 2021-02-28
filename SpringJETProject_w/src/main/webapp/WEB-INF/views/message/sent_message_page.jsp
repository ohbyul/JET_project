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

<script type="text/javascript">

	function findReceiver(){
		var inputWord = document.getElementById("input_word");
		
		if(inputWord.value == "" || inputWord.value.trim() == ""){
			window.location.href ="./sent_message_page.do";
			return;
		}
		
		
		var frmSentMessage = document.getElementById("frm_sent_message");
		frmSentMessage.submit();
	}
	
	
</script>
</head>

<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>보낸 쪽지함</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>
 
        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-10">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col-11">
							<div class="row">
					            <div class="col-5"></div>
					            <div class="col-4"></div>
					            <div class="col-3 text-muted" style="text-align: right;">home > message</div>
					        </div>
					        <div class="row mt-3">
					        	<div class="col-7">
					        		<div class="row">
										<div class="col">
											<h4>보낸 쪽지</h4>
										</div>
									</div>
					        	</div>
					        	<div class="col"></div>
					        	<div class="col"></div>
					        </div>
					        <form id="frm_sent_message" action="${pageContext.request.contextPath }/message/sent_message_page.do" method="get">
						        <div class="row mt-4"><!-- 선 -->
						            <hr>
						            <div class="col-2 d-grid gap-2">
						            	<select class="form-select" name="search_type">
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="receiver">받는 사람</option>
										</select>
									</div>
						         	<div class="col-3">
						         		<input id="input_word" class="form-control" name="search_word" type="text">
									</div>
									<div class="col-1 d-grid gap-2">	
										<input onclick="findReceiver()" class="btn btn-success" type="button" value="검색" >
									</div>
									<div class="col text-end">
										<a class="btn btn-success" type="button"  href="${pageContext.request.contextPath }/message/message_page.do">받은 쪽지함</a>
										<a class="btn btn-outline-success" type="button">보낸 쪽지함</a>
									</div>			
						        </div>
					        </form>
					        <div class="row mt-4">
					            <table class="table table-hover table-responsive ">
					            
					                <thead>
					                  <tr>
					                    <th scope="col" class="col-1 text-center">번호</th>
					                    <th scope="col" class="col text-center">제목</th>
					                    <th scope="col" class="col-3 text-center">받는 사람</th>
					                    <th scope="col" class="col-2 text-center">보낸 시간</th>
					                   </tr>
					                </thead>
					                <tbody>
					                	<c:forEach items="${messageList }" var="data">
												<tr>
													<td class="col text-center">${data.messageVo.jet_message_no }</td>
													<td class="col text-center">		
														<a style="text-align: center" href="${pageContext.request.contextPath }/message/read_sent_message_page.do?jet_message_no=${data.messageVo.jet_message_no}">${data.messageVo.jet_message_title}</a>
													</td>
													<td class="col text-center">${data.memberReceiverNick.jet_member_nick}</td>
													<td class="col text-center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${data.messageVo.jet_message_senddate }"/></td>
												</tr>
										</c:forEach>
										<c:if test="${empty sessionUser}">
											<tr>
												<td class="col"></td>
												<td class="col text-end pe-4">보낸 쪽지가 없습니다.</td>
												<td class="col"></td>
												<td class="col"></td>
											</tr>
										</c:if>
									</tbody>
					            </table>
					        </div>
					        <div class="row mt-4">
					            <hr>	<!-- 선 -->
					        </div>
					        <div class="row mt-1">
								<div class="col-5"></div>
								<div class="col-4">
									<nav aria-label="Page navigation example" style="display: inline;">
										<div id="PageNavCol" class="col-5"><%--나중에 고칠 것 --%>
											<ul id="sent_page_nav" class="pagination justify-content mb-0 ms-3">
												<%--페이징 앞 --%>
												<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/message/sent_message_page.do?page_num=1">&lt;&lt;</a></li>
												<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/message/sent_message_page.do?page_num=${beginPage-1}">&lt;</a></li>
												<%--페이징 중간 --%>
												<c:forEach begin="${beginPage }" end="${endPage }" var="page">
													<li class="page-item <c:if test="${page == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/message/sent_message_page.do?page_num=${page }">${page }</a></li>
												</c:forEach>
												<%--페이징 뒤 --%>
												<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/message/sent_message_page.do?page_num=${endPage+1}">&gt;</a></li>
												<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/message/sent_message_page.do?page_num=${pageCount}">&gt;&gt;</a></li>
											</ul>
										</div>
									</nav>
								</div>
								<div class="col text-end">
									<c:if test="${!empty sessionUser }">
										<a class="btn btn-success" type="button" href="${pageContext.request.contextPath }/message/write_message_page.do">쪽지 보내기</a>
									</c:if>
								</div>
							</div>		
						</div>	
                </div>
            </div>
        </div>
     </div> 

        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>