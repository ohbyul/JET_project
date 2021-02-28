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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<%--카드 호버 --%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>


<style>
	.card {
		border-radius: 20px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		position: relative;
	}
	
	.card:hover{
		box-shadow: 0 0 20px 0 rgb(39, 39, 39);
	}

	.card-title{
		font-size: 20px;
		font-weight: bolder ;
	}
	#reg_count{
		float: right;
		background-color: #EF5A31 ;
	    color: #FFF ;
	    font-weight: bold ;
	    text-align: center ;
	    margin: 0 0 0 0;
	    padding: 5px 5px;
	    line-height: 20px;
	    font-size: 15px;
	    border-radius: 20%;
	}
	#reg_count1{
		float: right;
		background-color: black ;
	    color: white;
	    font-weight: bold ;
	    text-align: center ;
	    margin: 0 0 0 0;
	    padding: 5px 5px;
	    line-height: 20px;
	    font-size: 15px;
	    border-radius: 20%;
	}
	.card-footer {
	  	margin-top: 5px;
	    bottom: 0; 
	    font-size: 14px;
	    color: #9FA5A8;
	    background-color: #ffff;
	}
	
	.icon {
	    display: inline-block;
	    vertical-align: middle;
	    margin-right: 2px;
	}
	#icon_eye{
		width: 25px;
		height: 20px	
	}
	#icon_comment{
		width: 25px;
		height: 25px
		
	}
	.reg_date {
		float: right;
	}
	
	#main_page{
		font-family: 'Noto Serif KR', serif;
	}

</style>

</head>
<body>

<jsp:include page="../commons/top_image.jsp"/>


	<div class="container" id="main_page">
	    <main>
	        <div class="row mt-2">
	            <div class="col-5"></div>
	            <div class="col-5"></div>
	            <div class="col-2 text-muted" style="text-align: right;">home > partyBoard</div>
	        </div>
	        
	        <div class="row mt-4">
	            <div class="col text-center display-5 font-monospace">Find <i class="fas fa-mountain" style="color: green;"></i> friends</div>
	
	        </div>
	        
		     <%--글쓰기 버튼  --%>
			 <div class="row">
	        	<div class="col-11"></div>
	        	<div class="col d-grid gap-2 d">
			        <c:if test="${!empty sessionUser }">
			      	  <a class="btn btn-dark" href="${pageContext.request.contextPath }/party_board/write_party_board_page.do">글쓰기</a>
					</c:if>	        		
	        	</div>
	        </div>
		        
	        <div class="row mt-4">
	            <hr> 				<!-- 선 -->
	        </div>
			
			<%--카드시작 --%>
	        <div class="card-group">
			  <c:forEach items="${resultList }" var="data">
				<div class="col-4">
				<div class="card mx-2 my-2">
				
					<div class="card-head-img">
						<a href="${pageContext.request.contextPath }/party_board/read_party_board_page.do?jet_board_party_no=${data.partyBoardVo.jet_board_party_no}">
							<c:choose>
								<c:when test="${!empty data.thumbnail }">
									<div style="text-align:center;"><img style="width: 414px;height: 250px;border-top-left-radius: 20px;border-top-right-radius: 20px;" class="card-img-top" src="${data.thumbnail[0].jet_board_party_image_link }" alt="image"></div>
								</c:when>
								<c:otherwise>
									<div><img style="width: 414px;height: 250px;border-top-left-radius: 20px;border-top-right-radius: 20px;" src="${pageContext.request.contextPath }/resources/image/rock.jpg" class="card-img-top"></div>
								</c:otherwise>
							</c:choose>
						</a>	
					</div>
					
					<div class="card-body">
						
						<c:choose>
							<c:when test="${data.partyBoardVo.jet_board_party_endgather < todayData }">	<%--마감 처리 --%>
								<div class="row">
									<div class="col-10 card-title text-muted text-truncate">	
										${data.partyBoardVo.jet_board_party_title }
									</div>
									<div class="col-2">	
										<p id="reg_count1" class="font-monospace"> [${data.partyBoardVo.jet_board_party_fixcount }/${data.partyBoardVo.jet_board_party_headcount }]</p>	
									</div>
								</div>
							</c:when>
							<c:otherwise><%--노 마감 --%>
								<div class="row">
									<div class="col-10 card-title text-truncate">	
										${data.partyBoardVo.jet_board_party_title }
									</div>
									<div class="col-2">	<%--노 마감 --%>
										<p id="reg_count" class="font-monospace"> [${data.partyBoardVo.jet_board_party_fixcount }/${data.partyBoardVo.jet_board_party_headcount }]</p>	
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						 
						<div class="row">
							
							<c:choose>
								<c:when test="${data.partyBoardVo.jet_board_party_endgather < todayData }">
									<div class="col-4 text-muted"><p class="card-text">[모집마감]</p></div>
									<div class="col font-monospace" style="text-decoration:line-through;">
										<i class="far fa-calendar-alt"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_startgather }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_endgather }"/>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-4"><p class="card-text">[모집]</p></div>
									<div class="col font-monospace">
										<i class="far fa-calendar-alt"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_startgather }"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_endgather }"/>
									</div>
								</c:otherwise>
							</c:choose>
						
						</div>
						
						<div class="row">
							<div class="col-4"><p class="card-text">[여행 출발]</p></div>
							<div class="col font-monospace">
								<i class="fas fa-plane-departure"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_tsday }"/>
							</div>
						</div>
						<div class="row">
							<div class="col-4"><p class="card-text">[작성자]</p></div>
							<div class="col"><i class="fas fa-user-edit"></i> ${data.memberVo.jet_member_nick }</div>
						</div>
					</div>
					
					<div class="card-footer font-monospace" style="border-bottom-left-radius: 20px;border-bottom-right-radius: 20px;"> <!--  카드 바디 푸터 -->
						<i class="far fa-grin-alt"></i>조회 ${data.partyBoardVo.jet_board_party_readcount }회
						<i class="far fa-hand-paper"></i>참여신청 ${data.attendCount }개
						<i class="reg_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.partyBoardVo.jet_board_party_writedate }"/></i>
					</div>
				</div>
				</div>
			  </c:forEach>
			</div>
	        <%--카드 끝 --%>
	        
	        <div class="row mt-4">
	            <hr> 				<!-- 선 -->
	        </div>	        
	       
	    </main>


	</div>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>