<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<style>
	#mainbox{
		border: 1px solid rgba(0,0,0,.125);
   		border-radius: .25rem;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">MEMBER management</h1>
				</div>
			</div>

			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-2 text-muted" style="text-align: right;">
					home > controllMember
				</div>
			</div>
						
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
			
			<div class="row">	<%--탭 페이지  --%>
				<div class="col">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/admin/admin_member_management_page.do">
					    	회원리스트
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" href="${pageContext.request.contextPath }/admin/admin_member_stopedmember_page.do">
					    	블랙리스트
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/admin/admin_member_upgrade_page.do">
					    	등업신청
					    </a>
					  </li>
					</ul>
				</div>
			</div> 	<%--탭 페이지  --%>			
			
			<div class="row mt-2"> <%--문의글 테이블 --%>
				<div class="col">
					
					<div class="row">	 <%--검색 row--%>
						<div class="col-8"></div>
						<div class="col">
						<form action="${pageContext.request.contextPath }/admin/admin_member_management_page.do" method="get">
							<div class="row">
								<div class="col-3">
									<select  name="search_type" class="form-select">
										<option value="id">ID</option>
										<option value="name">이름</option>
										<option value="nick">NICK</option>
										<option>=======</option>
									</select>
								</div>
								<div class="col">
									<input name="search_word" type="text" class="form-control" placeholder="검색어를 입력해주세요">
								</div>
								<div class="col-2">
									<input type="submit" value="검색" class="btn btn-dark">
								</div>
							</div>
						</form>
						</div>
					</div><%--검색 row  끝--%>
				
					<div class="row mt-2">
						<div class="col">
							<table class="table table-hover table-responsive ">
			                <thead>
			                  <tr>
			                    <th scope="col" class="col-1 text-center">번호</th>
			                    <th scope="col" class="col">ID</td>
			                    <th scope="col" class="col-1">이름</td>
			                    <th scope="col" class="col-1">닉네임</td>
			                    <th scope="col" class="col-1">성별</td>
			                    <th scope="col" class="col-1">연락처</td>
			                    <th scope="col" class="col-1" style="padding-left: 1.5em;">카톡ID</td>
			                    <th scope="col" class="col-1 text-center">등급</td>
			                    <th scope="col" class="col-1 text-center">매너도(당도)</td>
			                    <th scope="col" class="col-1 text-center">가입날짜</td>
			                    <th scope="col" class="col-1 text-center">상태</td>
			                   </tr>
			                </thead>
			                
			                <tbody>
								<c:forEach items="${resultMemberList }" var="data">
									<c:if test="${data.memberVo.jet_member_grade < 9 && data.memberStatusVo.jet_member_status_active == 'N'}">
									<tr>
										<th class="text-center">${data.memberVo.jet_member_no }</th>
										<td><a style="text-decoration: none;color: #000000;" href="${pageContext.request.contextPath }/admin/admin_member_detailstate_page.do?jet_member_no=${data.memberVo.jet_member_no}">${data.memberVo.jet_member_id }</a></td>
										<td style="padding-right: 0em;">${data.memberVo.jet_member_name }</td>
										<td>${data.memberVo.jet_member_nick }</td>
										<td style="padding-right: 0em;">${data.memberVo.jet_member_sex }</td>
										<td style="padding-left: 0em;padding-right: 0em;">${data.memberVo.jet_member_phone }</td>
										<td style="padding-left: 1em;">${data.memberVo.jet_member_kakao }</td>
										<td class="text-center">${data.memberVo.jet_member_grade }</td>
										<td class="text-center">${data.memberVo.jet_member_credit }</td>
										<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.memberVo.jet_member_joindate }"/></td>
										<c:choose>
											<c:when test="${data.memberStatusVo.jet_member_status_active == 'N'}">
												<td id="member_state" class="text-center"><a style="color: #e60000; text-decoration: none;" href="${pageContext.request.contextPath }/admin/admin_member_detailstate_page.do?jet_member_no=${data.memberVo.jet_member_no}">정지됨</a></td>
											</c:when>
											<c:otherwise>
												<td id="member_state" class="text-center"><a style="color: #009933; text-decoration: none;" href="${pageContext.request.contextPath }/admin/admin_member_detailstate_page.do?jet_member_no=${data.memberVo.jet_member_no}">활동중</a></td>
											</c:otherwise>
										</c:choose>
									</tr>
									</c:if>	
								</c:forEach>
							</tbody>
							</table>	
						</div>
					</div><%--멤버리스트 테이블 row 끝--%>
					
					<div class="row">
						<div class="col">
							<hr>
						</div>
					</div>
<%--페이징 처리 --%><%--					
					<div class="row"> 
						<div class="col">
						
							  <ul class="pagination justify-content-center">
							    
							    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=1">&lt;&lt</a></li>
								<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${beginPage-1}">&lt;</a></li>
								
									<c:forEach begin="${beginPage }" end="${endPage }" var="index">
									
										<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${index }">${index}</a></li>
									
									</c:forEach>				      
								
								<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${endPage+1 }">&gt;</a></li>
								<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do?page_num=${pageCount}">&gt;&gt</a></li>
							  
							  </ul>
						
						</div>
					</div>
 --%>			
 <%--페이징 처리 row끝 --%>		
					
				</div> <%--멤버 리스트 테이블 col 끝--%>
			</div> <%--멤버 리스트 테이블 row 끝--%>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>