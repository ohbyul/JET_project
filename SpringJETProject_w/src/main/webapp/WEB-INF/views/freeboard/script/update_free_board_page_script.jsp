<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
	
	function formSubmit() {
		
		var formFreeboard = document.getElementById("form_freeboard"); 
		
		var inputTitle = document.getElementById("input_title");
		var inputContent = document.getElementById("input_content");
		
		if(inputTitle.value ==""){
			alert("제목을 작성해 주세요.");
			inputTitle.focus();
			return;
	  	}
		
		if(inputContent.value ==""){
			alert("내용을 작성해 주세요.");
			inputContent.focus();
			return;
	  	}
		
		formFreeboard.submit();
		
	}

</script>