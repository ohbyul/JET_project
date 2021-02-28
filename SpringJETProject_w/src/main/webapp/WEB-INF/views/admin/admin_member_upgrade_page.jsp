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
	function upgradeAply(jet_member_no){
		 
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/admin/member_upgrade_aply_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no);

	}

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
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_member_management_page.do">
					    	회원리스트
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_member_stopedmember_page.do">
					    	블랙리스트
					    </a>
					  </li>
  					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="#">
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
			                    <th scope="col" class="col">ID</th>
			                    <th scope="col" class="col-1">이름</th>
			                    <th scope="col" class="col-1">닉네임</th>
			                    <th scope="col" class="col-1">성별</th>
			                    <th scope="col" class="col-1">연락처</th>
			                    <th scope="col" class="col-1" style="padding-left: 1.5em;">카톡ID</th>
			                    <th scope="col" class="col-1 text-center">등급</th>
			                    <th scope="col" class="col-1 text-center">매너도(당도)</th>
			                    <th scope="col" class="col-1 text-center">가입날짜</th>
			                    <th scope="col" class="col-1 text-center">신청</th>
			                   </tr>
			                </thead>
			                
			                <tbody>
								<c:forEach items="${resultMemberList }" var="data">
									<c:if test="${data.memberVo.jet_member_grade < 9 }">
									<tr>
										<th class="text-center">${data.memberVo.jet_member_no }</th>
										<td>${data.memberVo.jet_member_id }</td>
										<td style="padding-right: 0em;">${data.memberVo.jet_member_name }</td>
										<td>${data.memberVo.jet_member_nick }</td>
										<td style="padding-right: 0em;">${data.memberVo.jet_member_sex }</td>
										<td style="padding-left: 0em;padding-right: 0em;">${data.memberVo.jet_member_phone }</td>
										<td style="padding-left: 1em;">${data.memberVo.jet_member_kakao }</td>
										<td class="text-center">${data.memberVo.jet_member_grade }</td>
										<td class="text-center">${data.memberVo.jet_member_credit }</td>
										<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.memberVo.jet_member_joindate }"/></td>
										<c:choose>
											<c:when test="${data.memberUpgradeVo.jet_member_upgrade_check == 'N'}">
												<td class="text-center"><button onclick="upgradeAply(${data.memberVo.jet_member_no})" style="border:1px; background-color:#333;padding:5px 10px;color:#fff;border-radius:10px;">승인</button></td>
											</c:when>
											<c:otherwise>
												<td class="text-center"><button type="button" class="btn btn-secondary btn-sm" disabled>승인완료</button></td>
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
	
					
				</div> <%--멤버 리스트 테이블 col 끝--%>
			</div> <%--멤버 리스트 테이블 row 끝--%>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>