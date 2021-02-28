<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<style>
	#sidebar{
		border-right: 1px solid rgba(0,0,0,.125);
	}
	#title{
		border-left: 1px solid rgba(0,0,0,.125);
		border-right: 1px solid rgba(0,0,0,.125);
	}
</style>
</head>
<body>

<jsp:include page="../commons/top_image.jsp"/>
<jsp:include page="../commons/orange_btn.jsp"/>
	<div class="container-fluid">
	    
	    <div class="row">
	    	<div class="col" style="background-color:#f6f6f6";></div>

	    	<div class="col-9">
	    	
	    	
	    	<div class="row" id="title">
		    	<div class="col">	
			        <div class="row mt-4">
			            <div class="col text-center display-5 font-monospace">Notice</div>
			
			        </div>
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > notice</div>
			        </div>
				</div>
			</div>
			<div class="row"  style="border: 1px solid rgba(0,0,0,.125);">
				<div class="col-2" id="sidebar">
					<div class="row" style="margin-top: 10px;">
						<h2><i class="fas fa-info-circle" style="color: orange;"></i> 고객센터</h2>
					</div>
					<div class="row" style="margin-top: 60px;margin-left: 5px;margin-right: 5px;">
						<div class="col" style="border: 1px solid rgba(0,0,0,.125);border-radius: 10px;">
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;background-color: orange;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">NOTICE</a>
								</div>
							</div>
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/faboard/faboard_page.do">F A Q</a>
								</div>
							</div>
							<div class="row" style="height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 25px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/csboard/csboard_page.do">Q & A</a>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 사이드 -->
				<div class="col" style="margin-bottom: 300px;">	<!-- 메인 -->
					
					        
		        <div class="row mt-4 me-1 ms-1">
		            <table class="table table-hover table-responsive ">
	                <thead>
	                  <tr>
	                    <th scope="col" class="col-1">No</th>
	                    <th scope="col" class="col">제목</td>
	                    <th scope="col" class="col-2" style="text-align: right;">글쓴이</td>
	                    <th scope="col" class="col-1 text-center">추천</td>
	                    <th scope="col" class="col-1 text-center">조회</td>
	                    <th scope="col" class="col-2 text-center">등록일</td>
	                   </tr>
	                </thead>
	                
	                <tbody>
						<c:forEach items="${resultList }" var="data">
						<tr>
							<th>${data.noticeBoardVo.jet_board_notice_no} </th>
							<td><c:if test="${data.noticeBoardVo.jet_board_notice_writedate > today }">
								    <span class="badge rounded-pill bg-danger">new</span>
								</c:if>	
								<a href="${pageContext.request.contextPath }/notice_board/read_notice_board_page.do?jet_board_notice_no=${data.noticeBoardVo.jet_board_notice_no}" style="text-decoration: none;color: black;">
								${data.noticeBoardVo.jet_board_notice_title}</a><c:if test="${data.repleCount != 0 }"><a style="font-size : 14px; color:red;">[ ${data.repleCount } ]</a></c:if>
							</td> <%-- 글 제목 클릭시 페이지 이동 고정된 페이지 값..--%>
							<td class="col-2" style="text-align: right;"><span class="badge bg-success">관리자</span>${data.memberVo.jet_member_nick}</td>
							<td class="col-1 text-center">${data.likeCount}</td>
							<td class="col-1 text-center">${data.noticeBoardVo.jet_board_notice_readcount}</td>
							<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.noticeBoardVo.jet_board_notice_writedate}"/></td>
						</tr>
					</c:forEach>
	                </tbody>
	              </table>
		        </div>
		        
		        <div class="row">
		        	<div class="col"></div>
		        	<div class="col-2 font-monospace">
			           <%--글쓰기 버튼  --%>
					 <c:if test="${sessionUser.jet_member_grade ==9}">
						<a href="${pageContext.request.contextPath }/notice_board/write_notice_board_page.do"><button class="btn text-wrap" id="orange_btn" style="width: 8rem;font-size: 14px" >write Notice [only admin]</button></a>
					</c:if>	        	
		        	</div>
		        </div>
		
				
				<div class="col mt-2">	 	
					<!-- <nav aria-label="Page navigation"> -->
					  <ul class="pagination justify-content-center">
					    
					    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do?page_num=1">&lt;&lt</a></li>
						<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do?page_num=${beginPage-1}">&lt;</a></li>
						
							<c:forEach begin="${beginPage }" end="${endPage }" var="index">
							
								<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do?page_num=${index }">${index}</a></li>
							
							</c:forEach>				      
						
						<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do?page_num=${endPage+1 }">&gt;</a></li>
						<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do?page_num=${pageCount}">&gt;&gt</a></li>
					  
					  </ul>
					<!--  </nav> -->
				</div>
					
				</div>	<%--메인 col --%>
			</div>	<%--메인 로우 --%>
	
			

	  
	    	</div>
	    	<div class="col"  style="background-color:#f6f6f6";></div>
	    </div>
	    
	   

	</div>
<jsp:include page="../party_board/popup_chat.jsp"/>
 <jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>