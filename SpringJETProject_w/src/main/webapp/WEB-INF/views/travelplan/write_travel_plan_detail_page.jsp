<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Write travel plan detail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

<script type="text/javascript">

/*
   function insertDetail() {
      
      //var contentNo = 게시물 저장 전이라 아직 글번호가 없음.
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            
         }
      };
      
      xmlhttp.open("post","${pageContext.request.contextPath }/travelplan/write_travel_plan_detail_process.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send();
      
   }
*/
   
   function deleteBox(ttt){
      //alert("ateat : " + ttt);   //1번
      //var value = ttt.getAttribute("qwer");   //2번.. 키 값 키값 넣은걸 뽑아오기
      //alert(value);   //2번
      var trBox = ttt.closest(".trrrrr");
      trBox.remove();
      
      //ttt.parentElement.remove();      //3번 부모..
      
      //alert(value);
   }


   //var index = 0;   //1번

   function writeDetail() {
      
      /* 템플릿 숨겨 놓고... 활용...
      var qqq = document.getElementById("subQQQ");
      var apBox = qqq.cloneNode(true);
      
      apBox.setAttribute("class","row");
      apBox.removeAttribute("id");
      
      var sub_listBox = document.getElementById("sub_list");
      sub_listBox.appendChild(apBox);
      
      
      return;
      */
      
      //에이작스 로 넘길시에는 content No 가 필요하므로 지금 불가 아래 출력만
      var tbCategoryNo = document.getElementById("jet_board_tp_detail_ctgr_no");
      var tbLatitude = document.getElementById("jet_board_tp_detail_latitude");
      var tbLongitude = document.getElementById("jet_board_tp_detail_longitude");
      var tbDay = document.getElementById("jet_board_tp_detail_day");
      var tbStarthours = document.getElementById("jet_board_tp_detail_starthours");
      var tbStartmin = document.getElementById("jet_board_tp_detail_startmin");
      var tbPlacename = document.getElementById("jet_board_tp_detail_placename");
      var tbAdress = document.getElementById("jet_board_tp_detail_adress");
      var tbContent = document.getElementById("jet_board_tp_detail_content");
      
      //var xxx = [tbCategoryNo,tbLatitude,tbLongitude,tbDay,tbStarthours,tbStartmin,tbPlacename,tbContent];
    	//공백 예외처리
	   if(tbCategoryNo.value =="0"){
			alert("카테고리를 선택해주세요.");
			tbCategoryNo.focus();
			return;
		}
	   if(tbLatitude.value =="" || tbLatitude.value.trim() ==""){
			alert("지도를 클릭해서 주소를 가져요세요");
			tbLatitude.focus();
			return;
		}
	   if(tbPlacename.value =="" || tbPlacename.value.trim() ==""){
			alert("여행지 이름을 작성해주세요.");
			tbPlacename.focus();
			return;
		}
	   if(tbContent.value =="" || tbContent.value.trim() ==""){
			alert("여행일정에 대한 간단한 설명을 작성해주세요.");
			tbContent.focus();
			return;
		}
	   
      var detailListBox = document.getElementById("detail_list_box");
      
      //var childCount = detailListBox.childNodes.length ;
      //for(var i =0 ; i < childCount ; i++){
         //detailListBox.childNodes[0].remove();
         
         var trBox = document.createElement("tr");
         trBox.setAttribute("class" , "trrrrr");
         
         var dayBox = document.createElement("td");
         dayBox.setAttribute("class","col text-center");
         dayBox.innerText = "DAY" + tbDay.value;
         
         var timeBox = document.createElement("td");
         timeBox.setAttribute("class","col text-center");
         timeBox.innerText = tbStarthours.value + " : " + tbStartmin.value;
         
         var aBox = document.createElement("a");
         aBox.setAttribute("style","text-align: center;");
         aBox.setAttribute("href","#");
         aBox.innerText = tbPlacename.value;
         
         var placeBox = document.createElement("td");
         placeBox.setAttribute("class","col text-center");

         
         var deleteBox = document.createElement("td");
         deleteBox.setAttribute("class","col text-center");
         deleteBox.innerText = "삭제";
         //deleteBox.setAttribute("onclick" , "deleteBox(" + index + ")"); // 1번... 번호 가 올라가는
         //deleteBox.setAttribute("qwer" , "value1");   //2번
         deleteBox.setAttribute("onclick" , "deleteBox(this)");   //3번..this
         
         
         //index++;   //1번
         
         
         
         trBox.append(dayBox);
         
         trBox.append(timeBox);
         
         trBox.append(placeBox);

         trBox.append(deleteBox);
         

         placeBox.append(aBox);
         
               
         var input_tbCategoryNo = document.createElement("input");
         input_tbCategoryNo.setAttribute("type","hidden");
         input_tbCategoryNo.setAttribute("name","jet_board_tp_detail_ctgr_no");
         input_tbCategoryNo.setAttribute("value",tbCategoryNo.value);
         deleteBox.appendChild(input_tbCategoryNo);
         
         var input_tbLatitude = document.createElement("input");
         input_tbLatitude.setAttribute("type","hidden");
         input_tbLatitude.setAttribute("name","jet_board_tp_detail_latitude");
         input_tbLatitude.setAttribute("value",tbLatitude.value);
         deleteBox.appendChild(input_tbLatitude);
         
         var input_tbLongitude = document.createElement("input");
         input_tbLongitude.setAttribute("type","hidden");
         input_tbLongitude.setAttribute("name","jet_board_tp_detail_longitude");
         input_tbLongitude.setAttribute("value",tbLongitude.value);
         deleteBox.appendChild(input_tbLongitude);

         //주소
         var input_tbAdress = document.createElement("input");
         input_tbAdress.setAttribute("type","hidden");
         input_tbAdress.setAttribute("name","jet_board_tp_detail_adress");
         input_tbAdress.setAttribute("value",tbAdress.value);
         deleteBox.appendChild(input_tbAdress);
         
         var input_tbDay = document.createElement("input");
         input_tbDay.setAttribute("type","hidden");
         input_tbDay.setAttribute("name","jet_board_tp_detail_day");
         input_tbDay.setAttribute("value",tbDay.value);
         deleteBox.appendChild(input_tbDay);

         var input_tbStarthours = document.createElement("input");
         input_tbStarthours.setAttribute("type","hidden");
         input_tbStarthours.setAttribute("name","jet_board_tp_detail_starthours");
         input_tbStarthours.setAttribute("value",tbStarthours.value);
         deleteBox.appendChild(input_tbStarthours);

         var input_tbStartmin = document.createElement("input");
         input_tbStartmin.setAttribute("type","hidden");
         input_tbStartmin.setAttribute("name","jet_board_tp_detail_startmin");
         input_tbStartmin.setAttribute("value",tbStartmin.value);
         deleteBox.appendChild(input_tbStartmin);

         var input_tbPlacename = document.createElement("input");
         input_tbPlacename.setAttribute("type","hidden");
         input_tbPlacename.setAttribute("name","jet_board_tp_detail_placename");
         input_tbPlacename.setAttribute("value",tbPlacename.value);
         deleteBox.appendChild(input_tbPlacename);

         var input_tbContent = document.createElement("input");
         input_tbContent.setAttribute("type","hidden");
         input_tbContent.setAttribute("name","jet_board_tp_detail_content");
         input_tbContent.setAttribute("value",tbContent.value);
         deleteBox.appendChild(input_tbContent);
         
         
         
         //detailListBox.append(trBox);
      //}
      
      //for(detailDate of xxx){}
         
      document.getElementById("jet_board_tp_detail_ctgr_no").value = 0;
      document.getElementById("jet_board_tp_detail_latitude").value = "";
      document.getElementById("jet_board_tp_detail_longitude").value = "";
      //document.getElementById("jet_board_tp_detail_day").value = 0;
      document.getElementById("jet_board_tp_detail_starthours").value = 0;
      document.getElementById("jet_board_tp_detail_startmin").value = 0;
      document.getElementById("jet_board_tp_detail_placename").value = "";
      document.getElementById("jet_board_tp_detail_content").value = "";
      
      
      var trs = detailListBox.querySelectorAll("tr");
      
      var targetValue = parseInt(tbDay.value);	//새로 들어온값
      
      var index = 0;
      
      for(trr of trs){
         
         var dayValue = parseInt(trr.children[0].innerText.substring(3));
      	 //기존 값
      	 
        if(targetValue < dayValue){
              break;
        
        }
         index++;
      }
      
      detailListBox.insertBefore(trBox , detailListBox.childNodes[index]);
      
   }
   
   
</script>

</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>	<%--나의 여행계획 위에 네비바 씹혀서 추가했습니다. 오별--%>
   <main>
   <form action="${pageContext.request.contextPath}/travelplan/write_travel_plan_process.do" method="post" enctype="multipart/form-data" name="map"> 
      <div class="container">
           <div class="row mt-4 justify-content-center">
                 <div class="col-10">
                    
                    <div class="row">
                        <div class="col"><h4>나의 여행 계획</h4></div>
                    </div>
                     
                    <div class="row mt-2">
                        <hr>
                    </div>
                     
                     <%--제목 --%>
                    <div class="row">
                       <div class="col">
                          <input type="text" class="form-control" name="jet_board_travelplan_title" value="${sessionUser.jet_member_nick }님의 여행계획">
                          
                       </div>
                    </div>
                    
                     <%--지도 --%>      
                     <jsp:include page="../commons/kakao_map_api.jsp"/>
                     <%--시간 --%>
                     <div class="row mt-3">
                        <div class="col">
                           <div>출발날짜와 시간을 체크해주세요</div>
                        </div>
                     </div>
                     
                     <div class="row mt-2">
                        <div class="col">
                           <div>작성 후 일차 별 계획의 수정은 불가능합니다.</div>
                        </div>
                     </div>
                     
                     <div class="row mt-2">
                        <hr>
                     </div>
                     
                      <%--카테고리 --%>
                    <div class="row">
                        <div class="col">
                           <select id="jet_board_tp_detail_ctgr_no" class="form-select form-select-sm" aria-label=".form-select-sm example" style="height:40px;">
                              <option value="0" selected="selected">카테고리를 설정해주세요.</option>
                              <option value="1">관광지</option>
                          <option value="2">액티비티</option>
                          <option value="3">맛집</option>
                          <option value="4">카페</option>
                          <option value="5">힐링</option>
                          <option value="6">숙소</option>
                           </select>
                        </div>
                     </div>
                     
                     <div class="row mt-3">
                         <div class="col-3 text-muted">
                             <div class="form-control" style="background-color: #ffbf80">주소</div><%-- jet_board_tp_detail_address 여행지 주소--%>
                         </div>
                         <div class="col text-muted">
                             <input class="form-control" type="text" id="jet_board_tp_detail_adress">
                         </div>
                         
                  
                        <input class="form-control" type="hidden" id="jet_board_tp_detail_latitude" placeholder="위도">
                        <input class="form-control" type="hidden" id="jet_board_tp_detail_longitude" placeholder="경도">
               
                     </div>
                     
                     <div class="row mt-3">
                         <div class="col-3 text-muted">
                             <div class="form-control" style="background-color: #ffbf80">여행지 이름</div>
                         </div>
                         <div class="col text-muted">
                             <input class="form-control" type="text" id="jet_board_tp_detail_placename">
                         </div>
                     </div>
                     
                     <div class="row mt-3">
                         <div class="col-3">
                             <div class="form-control" style="background-color: #ffbf80">날짜</div>
                         </div>
                         <div class="col-2">
                             <select class="form-select" id="jet_board_tp_detail_day">
                                <option value="1">1</option><option value="2">2</option><option value="3">3</option>
                                <option value="4">4</option><option value="5">5</option><option value="6">6</option>
                                <option value="7">7</option><option value="8">8</option><option value="9">9</option>
                                <option value="10">10</option>
                             </select>
                         </div>
                         <div class="col-1 p-0 mt-3">
                             <div>일차</div>
                         </div>
                         <div class="col-2">
                             <select class="form-select" id="jet_board_tp_detail_starthours">
                                <option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option>
                                <option value="4">4</option><option value="5">5</option><option value="6">6</option>
                                <option value="7">7</option><option value="8">8</option><option value="9">9</option>
                                <option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                <option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                <option value="16">16</option><option value="17">17</option><option value="18">18</option>
                                <option value="19">19</option><option value="20">20</option><option value="21">21</option>
                                <option value="22">22</option><option value="23">23</option>
                             </select>
                         </div>
                         <div class="col-1 p-0 mt-3">
                             <div>시</div>
                         </div>
                         <div class="col-2">
                             <select class="form-select" id="jet_board_tp_detail_startmin">
                                <option value="00">00:00</option><option value="30">00:30</option>
                             </select>
                         </div>
                         <div class="col-1 p-0 mt-3">
                             <div>분</div>
                         </div>
                     </div>
                     
                     <div class="row mt-3">
                         <div class="col-3 text-muted">
                             <div class="form-control" style="background-color: #ffbf80">간단한 설명</div>
                         </div>
                         <div class="col text-muted">
                             <input type="text" class="form-control" id="jet_board_tp_detail_content">
                         </div>
                     </div>
                    
                    <!-- test code -->
                    <div class="row">
                       <div id="sub_list" class="col"></div>
                    </div>
                    
                    
                        
                     <div class="row mt-3">
                         <div class="col text-muted text-end">
                             <input onclick="writeDetail()" class="btn btn-success ps-3 pe-3" type="button" value="추가">
                         </div>
                     </div>
                     
                     <hr style="background-color:#8C8C8C;">
                 
                     <div class="row">
                        <table class="table">
                           <thead>
                              <tr class="table-warning">
                                <th scope="col" class="col-3 text-center">일차</th>
                                <th scope="col" class="col-3 text-center">시간</th>
                                <th scope="col" class="col-5 text-center">계획</th>
                                <th scope="col" class="col-1 text-center"><input type="checkbox"></th>
                               </tr>
                            </thead>
                            
                            <tbody id="detail_list_box">
                            
                              
                              </tbody>
                        
                        </table>
                     </div>
                  
                     <hr style="background-color:#8C8C8C;">
                     
                     <div class="row mt-2">
                        <div class="col text-end mb-2">
                           <input class="btn btn-success ps-3 pe-3" <%--onclick="insertDetail()"--%> type="submit" value="저장">
                        </div>
                     </div>
                  
               </div>
         </div>
      </div>
      
      </form> 
                 
    </main>

   <jsp:include page="../commons/global_nav.jsp"/>
   <jsp:include page="../commons/global_footer.jsp"/>
















   <div id="subQQQ" class="row d-none">
      <div class="col">
         <div class="row mt-2">
            <hr>
         </div>

         <div class="row mt-2">
            <div class="col-3 text-muted">
               <div class="form-control" style="background-color: #ffbf80">주소</div>
               <%-- jet_board_tp_detail_address 여행지 주소--%>
            </div>
            <div class="col text-muted">
               <input class="form-control" type="text"
                  id="jet_board_tp_detail_latitude" placeholder="위도">
            </div>
            <div class="col text-muted">
               <input class="form-control" type="text"
                  id="jet_board_tp_detail_longitude" placeholder="경도">
            </div>
         </div>

         <div class="row mt-3">
            <div class="col-3 text-muted">
               <div class="form-control" style="background-color: #ffbf80">여행지
                  이름</div>
            </div>
            <div class="col text-muted">
               <input class="form-control" type="text"
                  id="jet_board_tp_detail_placename">
            </div>
         </div>

         <div class="row mt-3">
            <div class="col-3">
               <div class="form-control" style="background-color: #ffbf80">날짜</div>
            </div>
            <div class="col-2">
               <select class="form-select" id="jet_board_tp_detail_day">
                  <option value="Day1">1</option>
                  <option value="Day2">2</option>
                  <option value="Day3">3</option>
                  <option value="Day4">4</option>
                  <option value="Day5">5</option>
                  <option value="Day6">6</option>
                  <option value="Day7">7</option>
                  <option value="Day8">8</option>
                  <option value="Day9">9</option>
                  <option value="Day10">10</option>
               </select>
            </div>
            <div class="col-1 p-0 mt-3">
               <div>일차</div>
            </div>
            <div class="col-2">
               <select class="form-select" id="jet_board_tp_detail_starthours">
                  <option value="0">0</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
               </select>
            </div>
            <div class="col-1 p-0 mt-3">
               <div>시</div>
            </div>
            <div class="col-2">
               <select class="form-select" id="jet_board_tp_detail_startmin">
                  <option value="0">00:00</option>
                  <option value="30">00:30</option>
               </select>
            </div>
            <div class="col-1 p-0 mt-3">
               <div>분</div>
            </div>
         </div>

         <div class="row mt-3">
            <div class="col-3 text-muted">
               <div class="form-control" style="background-color: #ffbf80">간단한
                  설명</div>
            </div>
            <div class="col text-muted">
               <input type="text" class="form-control"
                  id="jet_board_tp_detail_content">
            </div>
         </div>
      </div>
   </div>


   













   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>