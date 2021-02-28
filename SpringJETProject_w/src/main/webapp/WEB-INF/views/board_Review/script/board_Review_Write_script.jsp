<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function reviewSubmit(){
		
		var title = document.getElementById("review_title");
		var content = document.getElementById("exampleFormControlTextarea1");
		//var content = document.getElementById("exampleFormControlTextarea1");
		
		if(title.value==""){
			alert("제목을 작성해주세요!");
			title.focus();
			return;
		}
		
		
		if(content.value==""){
			alert("내용을 작성해주세요!");
			content.focus();
			return;
			
			
		}
		
		var reviewForm = document.getElementById("review_form");
		reviewForm.submit();
		
	}



</script>