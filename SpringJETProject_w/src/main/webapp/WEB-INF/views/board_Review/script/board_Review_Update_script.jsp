<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function updateBtn(){
				
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				window.loaction.href="${pageContext.request.contextPath}/board_Review/board_Review.do";
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/board_Review/board_Review_Update_prcoess.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		
		
	}
	
</script>