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
	
	
	function shareplan_write(){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refreshSharePlan();
	
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
		
	
	}
	
	function sharePlanWrite(){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var sharePlanBox = document.getElementById("mypage_box");
				
				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row mt-2");
	
				var ulBox = document.createElement("ul");
				
				
				var nickBox = document.createElement("li");
				nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
				nickBox.innerText = "닉네임이다";
				
				
				rowBox.append(ulBox);
	
				ulBox.append(nickBox);
				
				sharePlanBox.append(rowBox);
	
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
	
	function boardTab(evt, tabName) {
	    var i, tabcontent, tablinks; 
	    tabcontent = document.getElementsByClassName("tabcontent");                           
	    for (i = 0; i < tabcontent.length; i++) { 
	            tabcontent[i].style.display = "none";                                   
	        } 
	        tablinks = document.getElementsByClassName("tablinks");                                                   
	        for (i = 0; i < tablinks.length; i++) { 
	            tablinks[i].className = tablinks[i].className.replace(" active", "");                                       
	        }   
	        document.getElementById(tabName).style.display = "block";                                                           
	        evt.currentTarget.className += " active";                                                                             
	}
	
	function refreshSharePlan(){
		sharePlanWrite();
	}

</script>
</head>

<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>나의 친구 목록</h2></div>
		<jsp:include page="../mypage/mypage_sidebar.jsp"/>
        </div>	
<%--사이드바 끝 --%>
 
        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col-11">
							<div class="row mt-2">
					            <div class="col-4"></div>
					            <div class="col-2"></div>
					            <div class="col text-end" >home > my page > My friends</div>
					        </div>
					        <div class="row">
					        	<div class="col">
					        		<hr>
					        	</div>
					        </div>
							<div class="row mt-2">
								<div class="col-3 d-grid gap-2"></div>
								<div class="col d-grid gap-2 text-center">
									<h4>나의 친구</h4>
								</div>
								<div class="col-3 d-grid gap-2 text-center">
									<a class="btn" style="display: inline; background-color: #20c497; color: #ffffff;" href="${pageContext.request.contextPath }/member/find_friends_page.do">친구 찾기</a>
									<a class="btn btn-outline-success" style="display: inline; background-color: #ffffff; color: #20c497;" <%--href="${pageContext.request.contextPath }/member/my_friendList_page.do"--%>>나의 친구</a>
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<form action="${pageContext.request.contextPath }/member/my_friendList_page.do" method="get">
									<div class="row"><%--친구 찾기 --%>
										<div class="col ps-0">
											<select class="form-select" name="search_type">
												<option value="member_nick">닉네임</option>
												<option value="member_kakao">카카오톡 아이디</option>
												<%--<option value="member_grade">이메일</option> --%>
											</select>
										</div>
										<div class="col-6 p-0"><input class="form-control" name="search_word" type="text"></div>
										<div class="col-3 p-0"><input class="btn form-control" style="background-color: #FF9436; color: white;" type="submit" value="찾기" ></div>
									</div>
									</form>
									<c:choose>
										<c:when test="${!empty sessionUser}">
											<c:forEach items="${resultList }" var="resultList">
												<div class="row mt-1 p-0">
													<div class="col p-0">
														<table class="table m-0">
														  	<c:if test="${sessionUser.jet_member_no == resultList.friendVo.jet_member_no }">
													  			<tbody class="border">
																    <tr class="text-center">
																      <td class="col-2">${resultList.memberVo.jet_member_grade }</td>
																      <td class="col">${resultList.memberNick.jet_member_nick }</td>
																      <td class="col-3"><a class="btn" style="background-color: #dc3245; color: #ffffff" href="${pageContext.request.contextPath }/member/delete_friend_process.do?jet_friends_no=${resultList.friendVo.jet_friends_no}">친구 삭제</a></td>      
																    </tr>
																</tbody>
															</c:if>
														</table>
													</div>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
										  	<tbody>
											    <tr class="form-control pt-3 mb-3">
											      <td class="col-2"></td>
											      <td class="col text-center"><div class="text-center pt-4 pb-4">로그인 후 이용해주시기 바랍니다.</div></td>
											      <td class="col-3"></td>      
											    </tr>
											</tbody>
											<tbody class="mt-3">
												<tr class="form-control pt-3">
											      <td class="col-2"></td>
											      <td class="col"><div class="text-center"><a class="btn btn-success" href="${pageContext.request.contextPath }/member/login_page.do">로그인</a></div></td>
											      <td class="col-3"></td>      
											    </tr>
											</tbody>
										</c:otherwise>
									</c:choose>
									<c:if test="${!empty sessionUser }">
										<div class="row mt-2"><!-- 페이징 + 글쓰기 -->
											<div class="col">
												
													<ul class="pagination justify-content-center mb-0">
														<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/my_friendList_page.do?page_num=1">&lt;&lt;</a></li>
														<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/my_friendList_page.do?page_num=${beginPage-1 }">&lt;</a></li>
														<!-- 페이징 처리 -->
														<c:forEach begin="${beginPage }" end="${endPage }" var="page">
															<li class="page-item <c:if test="${page == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/member/my_friendList_page.do?page_num=${page }" class="page-link">${page }</a></li>
														</c:forEach>
														<li class="page-item <c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/my_friendList_page.do?page_num=${endPage+1 }">&gt;</a></li>
														<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/my_friendList_page.do?page_num=${pageCount }">&gt;&gt;</a></li>
													</ul>
												
											</div>
										</div>
									</c:if>
									<div class="row mt-5"></div>
									<div class="row mt-5"></div>
									<div class="row mt-5"></div>
									<div class="row mt-5"></div>
									<div class="row mt-5"></div>
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