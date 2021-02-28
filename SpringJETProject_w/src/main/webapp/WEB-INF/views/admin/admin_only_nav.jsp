<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#admin_nav{
		height: 60px;
	}
	
	#under_hover:after{
		display:block;/*a요소를 블록 요소라고 선언*/
		content: '';/*comtent안은 밑줄 디자인을 위해 비워두세요.*/
		border-bottom: solid 3px white;
		transform: scaleX(0);/*크기를 0으로 줌으로써 평상시엔 밑줄 없음*/
   		transition: transform 250ms ease-in-out; /*변형 방식*/ 
	}
	#under_hover:hover:after {
 	  transform: scaleX(1);/*a 속성에 hover시 after를 기존 크기로 변경*/
	}
</style>


	<nav id="admin_nav" class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid">
	  
	  	<div class="col-2 fw-bold" style="text-align: center;">
	   	 <a class="navbar-brand" href="${pageContext.request.contextPath }/admin/admin_main_page.do">JET ADMIN PAGE</a>
	    </div>
	    
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">

	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item fw-normal" >
	          <a id="under_hover" class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/content/main_page.do">Go JET site</a>
	        </li>

	        <li class="navbar-nav ms-auto mb-2 mb-lg-0">
	          <a class="nav-link disabled" tabindex="-1" aria-disabled="true">copyright © all rights reserved</a>
	        </li>
	       
	      </ul>
	      
	      
	      <ul class="navbar-nav ms-auto mb-2 mb-lg-1">
			 <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	           	바로가기
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/csboard/csboard_page.do">문의 게시판</a></li>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">공지사항</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="https://blog.naver.com/s001lec">선생님블로그</a></li>
	            <li><a class="dropdown-item" href="https://us02web.zoom.us/j/3253442665?pwd=emlyam9PNmpkRDJhQitNNVVlbExQdz09#success">줌 링크</a></li>
	         
	           </ul>
	        </li>
		</ul>
		
	    </div>
	  </div>
	</nav>