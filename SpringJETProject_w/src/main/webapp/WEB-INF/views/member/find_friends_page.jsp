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
	function findFriend(){
		var inputWord = document.getElementById("input_word");
		
		if(inputWord.value == "" || inputWord.value.trim() == ""){
				window.location.href ="./find_friends_page.do";
				return;
		}
		
		var frmSearch = document.getElementById("frm_search");
		frmSearch.submit();
	}
</script>
</head>
<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>친구 찾기</h2></div>
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
					            <div class="col-4"></div>
					            <div class="col text-end">home > find friends</div>
					        </div>
					        <div class="row">
					        	<div class="col">
					        		<hr>
					        	</div>
					        </div>
							<div class="row mt-2">
								<div class="col-3 d-grid gap-2"></div>
								<div class="col d-grid gap-2 text-center">
									<h4>친구 찾기</h4>
								</div>
								<div class="col-3 d-grid gap-2 text-center">
									<a class="btn btn-outline-success" style="display: inline; background-color:#ffffff; color: #20c497;">친구 찾기</a>
									<a class="btn" style="display: inline; background-color: #20c497; color: #ffffff;"href="${pageContext.request.contextPath }/member/my_friendList_page.do">나의 친구</a>
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<form id="frm_search" action="${pageContext.request.contextPath }/member/find_friends_page.do" method="get">
									<div class="row"><%--나의 친구 --%>
										<div class="col ps-0">
											<select class="form-select" name="search_type">
												<option value="member_nick">닉네임</option>
												<option value="member_kakao">카카오톡 아이디</option>
												<%--<option value="member_grade">이메일</option> --%>
											</select>
										</div>
										<div class="col-6 p-0"><input id="input_word" class="form-control" name="search_word" type="text"></div>
										<div class="col-3 p-0"><input onclick="findFriend()" class="btn form-control" style="background-color: #FF9436; color: white;" type="button" value="찾기" ></div>
									</div>
									</form>
									<c:forEach items="${memberList }" var="data">
									<div class="row mt-2 p-0">
										<div class="col p-0">
											<table id="member_table" class="table m-0">
												  <tbody class="border">	  	
												    <tr class="text-center">
												      <td class="col-2 pt-4">${data.jet_member_grade }</td>
												      <td class="col pt-4">${data.jet_member_nick }</td>
												      <td class="col-3 pt-3 pb-3"><a id="add_friend" class="btn" style="background-color: #198654; color: #ffffff" href="${pageContext.request.contextPath }/member/add_friends_process.do?jet_friends_member_no=${data.jet_member_no}">친구추가</a></td>
												    </tr> 
												  </tbody>
											</table>
										</div>
									</div>
									</c:forEach>
									<div class="row mt-2">
										<div class="col">
											
												<ul class="pagination justify-content-center">
													<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=1">&lt;&lt;</a></li>
													<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${beginPage-1 }">&lt;</a></li>
													<c:forEach begin="${beginPage }" end="${endPage }" var="page">
														<li class="page-item <c:if test="${page == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${page }" class="page-link">${page}</a></li>
													</c:forEach>
													<li class="page-item <c:if test="${endPage >= listCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${endPage+1 }">&gt;</a></li>
													<li class="page-item<c:if test="${currentPage == listCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${listCount }">&gt;&gt;</a></li>
												</ul>
											
										</div>
									</div>
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