<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

   function frmSubmit(){
      
     var formOpenClass = document.getElementById("form_openclass"); 
      
     //예외처리
     var inputTitle = document.getElementById("input_title");
     var inputLatitude = document.getElementById("input_latitude");
     var inputLongitude = document.getElementById("input_longitude");
     var inputContent = document.getElementById("input_content"); 
     var inputHeadcount = document.getElementById("input_headcount");
     var inputPrice = document.getElementById("input_price");
     var inputTotaltime = document.getElementById("input_totaltime");
     var longitude = document.getElementById("longitude");
     var latitude = document.getElementById("latitude");
     
   
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
     
     var num = /^[0-9]*$/;
     if(!num.test(inputPrice.value) || inputPrice.value ==""){
         alert("가격은 숫자로 입력해 주세요");
         inputPrice.focus();
         return;
     }
     
     
     var num = /^[0-9]*$/;
     if(!num.test(inputTotaltime.value) || inputTotaltime.value ==""){
         alert("시간은 숫자로 입력해 주세요");
         inputTotaltime.focus();
         return;
     }
     
     if(inputHeadcount.value =="0"){
         alert("참여인원을 선택해 주세요");
         inputHeadcount.focus();
         return;
     }
     
     if(longitude.value ==""){
         alert("지도로 위치를 잡아주세요.");
         return;
     }
     
     //달력 입력일 예외 처리 부분
     var start_date_value_temp = document.getElementById("start_date");
      var end_date_value_temp = document.getElementById("end_date");
      
      var today = new Date();
      today = new Date(today.getFullYear(),today.getMonth(),today.getDate());
      
      var start_date = new Date(start_date_value_temp.value);   //모집일... 
      
      if(today > start_date){
         alert("강습 날짜는 오늘 이후로 선택 가능합니다.");
         start_date_value_temp.focus();
         return;
      }
      if(start_date_value_temp.value > end_date_value_temp.value){
         alert("잘못 선택하셨습니다. 마지막 날짜가 시작일보다 빠릅니다.");
         end_date_value_temp.focus();
         return;
      }
      
      
     
     // 날짜
      var start_date_value = document.getElementById("start_date").value.replaceAll("-","/");
      var end_date_value = document.getElementById("end_date").value.replaceAll("-","/");

      var start_hidden_box = document.createElement("input");
      start_hidden_box.setAttribute("type","hidden");
      start_hidden_box.setAttribute("name","start_date");
      start_hidden_box.setAttribute("value",start_date_value);
      formOpenClass.appendChild(start_hidden_box);
      
      var end_hidden_box = document.createElement("input");
      end_hidden_box.setAttribute("type","hidden");
      end_hidden_box.setAttribute("name","end_date");
      
      end_hidden_box.setAttribute("value",end_date_value);
      formOpenClass.appendChild(end_hidden_box);
      
      formOpenClass.submit();
   }

</script>