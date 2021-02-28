<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../font/NanumGothicCoding.jsp"/>
  	<div class="row"></div>
	  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
	      <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
	      <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	        <img src="${pageContext.request.contextPath}/resources/image/jejupic2.jpg" class="d-block w-100" alt="..." style="height: 520px">
	
	        <div class="container">
	          <div class="carousel-caption text-start">
	            <h1 style="font-family: 'NotoSansKR';font-weight: 500;">다양한 사람들과 함께 여행을 떠날 수 있는 기회!</h1>
	            <p style="font-family: 'NotoSansKR';font-weight: 400; font-size: 1.5rem;">회원가입 후에 더 많은 사람들을 만나보세요!</p>
	            <p><a class="btn btn-lg" href="${pageContext.request.contextPath}/member/join_member_page.do" role="button" style="background-color: #009900; color: #ffffff; font-family: 'NotoSansKR';font-weight: 400;">회원가입</a></p>
	          </div>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img src="${pageContext.request.contextPath}/resources/image/jejupic_1.jpg" class="d-block w-100" alt="..." style="height: 520px">
			
	        <div class="container">
	          <div class="carousel-caption">
	            <h1 style="font-family: 'NotoSansKR';font-weight: 500;">다른 사람들의 특별한 여행계획을 살펴보세요!</h1>
	            <p style="font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">공유게시판에서 많은 사람들의 여행 계획을 확인할 수 있습니다!</p>
	            <p><a class="btn btn-lg" href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do" role="button" style="background-color: #009900; color: #ffffff; font-family: 'NotoSansKR';font-weight: 400;">이동하기</a></p>
	          </div>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img src="${pageContext.request.contextPath}/resources/image/jejupic_3.jpg" class="d-block w-100" alt="..."style="height: 520px">
	        
	
	        <div class="container">
	          <div class="carousel-caption text-end">
	            <h1 style="font-family: 'NotoSansKR';font-weight: 500;">많은 사람들과 자유로운 이야기를 나눠보세요!</h1>
	            <p style="font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">자유게시판에서 다른 사람들과 즐거운 이야기를 나눠보세요!</p>
	            <p><a class="btn btn-lg" href="${pageContext.request.contextPath}/freeboard/main_free_board.do" role="button" style="background-color: #009900; color: #ffffff; font-family: 'NotoSansKR';font-weight: 400;">살펴보기</a></p>
	          </div>
	        </div>
	      </div>
	    </div>
	    <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="visually-hidden">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#myCarousel" role="button"data-bs-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="visually-hidden">Next</span>
	    </a>
	  </div>