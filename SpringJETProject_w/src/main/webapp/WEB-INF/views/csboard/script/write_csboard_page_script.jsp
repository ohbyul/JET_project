<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function formSubmit() {
		//서브밋 버튼 타입 버튼으로 바꾸기.. 안그럼 그냥 서브밋 해버림
		var inputTitle = document.getElementById("input_title");
		var inputContent = document.getElementById("input_content");
		var inputEmail = document.getElementById("input_email");
		
		
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
		
		if(inputEmail.value ==""){
			alert("이메일을 작성해 주세요.");
			inputEmail.focus();
			return;
		}
		
		var formWriteCs = document.getElementById("formWriteCs");
		formWriteCs.submit();
	}
	
</script>