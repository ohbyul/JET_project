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

<style>
	#image_size_auto{
		max-width: 100%;
		height: auto;
	  	display: block;
	}
</style>

<script type="text/javascript">

	function modalAnswer() {
	
		var contentNo = ${result.csBoardVo.jet_board_m_cs_no};	
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				
				var answerInputBox = document.getElementById("modalContent");
				
				for(answerInput of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row");
					
					var colBox = document.createElement("div");
					colBox.setAttribute("class","col");
					
					//------------------------------------------------
					var rowWriterBox = document.createElement("div");
					rowWriterBox.setAttribute("class","row mt-2");
				
					var colWriterBox1 = document.createElement("div");
					colWriterBox1.setAttribute("class","col-2");
					colWriterBox1.innerText = "작성자";
					
					var colWriterBox2 = document.createElement("div");
					colWriterBox2.setAttribute("class","col");
					colWriterBox2.innerText =${sessionUser.jet_member_nick };
					
					//------------------------------------------------
					
					rowBox.append(colBox);
					
					colBox.append(rowWriterBox);
					rowWriterBox.append(colWriterBox1);
					rowWriterBox.append(colWriterBox2);
					
					
					answerInput.append(rowBox);
				}
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/admin/admin_csboard_answer_write_page_tset.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_m_cs_no=" + contentNo );
	}

</script>

</head>
<body>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid mt-3">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div class="col me-3 border border-dark"> <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">문의 글 읽기</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>

			<div class="row">
				<div class="col-2"></div>
				<div class="col"><%--글보기 내용의 가운데메인 --%>
					<div class="row mt-2">
						<div class="col-2">제목</div>
						<div class="col">${result.csBoardVo.jet_board_m_cs_title } </div>
					</div>
					<div class="row mt-2">
						<div class="col-2">작성자</div>
						<div class="col"> ${result.memberVo.jet_member_nick} </div>
					</div>
					<div class="row mt-2">
						<div class="col-2">조회수</div>
						<div class="col"> ${result.csBoardVo.jet_board_m_cs_readcount }</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">작성일</div>
						<div class="col">${result.csBoardVo.jet_board_m_cs_writedate }</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">내용</div>
						<div class="col border border-1 overflow-auto" style="height: 200px;"">${result.csBoardVo.jet_board_m_cs_content }</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">이메일</div>
						<div class="col">${result.csBoardVo.jet_board_m_cs_customeremail }</div>
					</div>
					<div class="row mt-2"> <%--이미지박스 --%>
						<div class="col-2">첨부 파일</div>
						<div class="col border border-1">
							<c:forEach items="${result.imageVoList }" var="imageVo">
								<img id="image_size_auto" src="${imageVo.jet_board_cs_image_link }"><br>
							</c:forEach>
						</div>
					</div>	
					
				</div>
				<div class="col-2"></div>
			</div> <%--글읽기 row 끝  --%>
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
	
			<div class="row"> <%--버튼 박스.. --%>
				<div class="col"></div>	
				<div class="col"></div>
				<div class="col-1">
					<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do">목록</a>	
				</div>
				<div class="col-1 ">
					<!-- 관리자 전용 답글 버튼 -->
					<c:if test="${sessionUser.jet_member_grade ==9 }">
						
 						<button type="button" class="btn btn-primary" onclick="modalAnswer()" data-bs-toggle="modal" data-bs-target="#myModal">
							  모달 답변test
						</button>
						
					</c:if>
			
					
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					     
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">답글 달기...</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>	<%--위에 엑스창.. --%>
					      </div>
					     
					      <div class="modal-body" id="modalContent">
					        
					      </div>
					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    
					    </div>
					  </div>
					</div>
			
			

				</div>
				<div class="col"></div>	
				<div class="col"></div>
			</div>
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
			
	
			
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>




<%--
제목 : ${result.csBoardVo.jet_board_m_cs_title } <br>
작성자 :  ${result.memberVo.jet_member_nick} <br>
조회수 : ${result.csBoardVo.jet_board_m_cs_readcount }<br> 
작성일 : ${result.csBoardVo.jet_board_m_cs_writedate }<br>
내용 : ${result.csBoardVo.jet_board_m_cs_content }<br>
이메일 : ${result.csBoardVo.jet_board_m_cs_customeremail }<br>
<c:forEach items="${result.imageVoList }" var="imageVo">
	<img id="image_size_auto" src="${imageVo.jet_board_cs_image_link }"><br>
</c:forEach>
 --%>

 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>