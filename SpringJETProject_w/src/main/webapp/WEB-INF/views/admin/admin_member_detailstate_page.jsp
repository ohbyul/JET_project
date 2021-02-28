<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 활동상태 상세확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<style>
		#mainbox{
			border: 1px solid rgba(0,0,0,.125);
	   		border-radius: .25rem;
		}
		@font-face{
			 font-family:'Daum';
			 font-style:normal;
			 font-weight:400;
			 src:url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff2') format('woff2'),
			     url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff') format('woff');
		}
	</style>
	<script type="text/javascript">
		
		function updateStatus(){
			var inputPeriod = document.getElementById("input_period");
			var inputReason = document.getElementById("input_reason");
			var memberNo = document.getElementById("member_no");

			var stopPeriod = inputPeriod.value;
			var stopReason = inputReason.value;
			var userNo = memberNo.value;
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
					if(xmlhttp.responseText == 'rejectActive'){
						Swal.fire({
							  title: "잠깐!",
							  text: "특별한 이유 없이 정지 기간이 지나지 않은 사용자의 상태를 변경할 수 없습니다. 정말로 변경하시겠습니까?",
							  icon: "warning",
							  showCancelButton: true,
							  confirmButtonColor: '#e60000',
							  confirmButtonText: '<a onclick="forceChange()" href="${pageContext.request.contextPath}/member/update_member_status_force_process.do" style="color:#ffffff;text-decoration:none;">확인</a>',
							  cancelButtonColor : 'gray',
							  cancelButtonText : '취소',
							})
						return;
					}
					
					if(xmlhttp.responseText == 'reject'){
						var state = document.getElementById("state");
						state.setAttribute("class","col text-center");
						state.setAttribute("style","color:#e60000");
						state.innerText = "[정지됨]";
						
					}else{
						var state = document.getElementById("state");
						var stateBox = document.getElementById("stateBox");
						state.setAttribute("class","col text-center");
						state.setAttribute("style","color:#009900");
						state.innerText = "[활동중]";
						
					}
				}
			}
			
			xmlhttp.open("post","${pageContext.request.contextPath }/member/update_member_status_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("jet_member_no="+userNo+"&jet_stopstate_reason_no="+stopReason+"&jet_stopstate_period_no="+stopPeriod);
			
		}
		
		function forceChange(){
			var memberNo = document.getElementById("member_no");
			var userNo = memberNo.value;
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						var state = document.getElementById("state");
						var stateBox = document.getElementById("stateBox");
						state.setAttribute("class","col text-center");
						state.setAttribute("style","color:#009900");
						state.innerText = "[활동중]";
						
						window.location.href="${pageContext.request.contextPath }/admin/admin_member_detailstate_page.do?jet_member_no="+userNo;
				}
			}
			xmlhttp.open("post","${pageContext.request.contextPath }/member/update_member_status_force_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("jet_member_no="+userNo);
		}
	</script>
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">MEMBER management</h1>
				</div>
			</div>

			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-2 text-muted" style="text-align: right;">
					home > controllMember
				</div>
			</div>
						
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
			
			<div class="row">	<%--탭 페이지  --%>
				<div class="col">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/admin/admin_member_management_page.do">
					    	회원리스트
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_member_stopedmember_page.do">
					    	블랙리스트
					    </a>
					  </li>
					  
					</ul>
				</div>
			</div> 	<%--탭 페이지  --%>			
			
			<div class="row mt-2"> <%--활동 상세 확인 테이블 --%>
				<div class="col">
					<div class="row mt-3">
						<div class="col"></div>
						<div class="col text-center"><h3 style="font-family: 'Daum'">활동 상태 상세 확인</h3></div>
						<div class="col"></div>
					</div>
				
					<div class="row mt-2"><%--본문 시작 --%>
						<div class="col-2"></div>
						
						<div class="col-4 border"><%--사용자 내용 --%>
							
							<div class="row mt-2">
								 <div class="col text-center" style="font-family: 'Daum';"><h5>사용자 정보</h5></div>
							</div>
							<hr>
							<div class="row mt-4"></div>
							<div class="row mt-4">
								<div class="col-1"></div>
								<div class="col form-text" style="margin: auto;">사용자 ID</div>
								<div class="col form-control">${data.memberVo.jet_member_id }</div>
								<div class="col-1"></div>
							</div>
							<div class="row mt-2">
								<div class="col-1"></div>
								<div class="col form-text" style="margin: auto;">사용자 이름</div>
								<div class="col form-control">${data.memberVo.jet_member_name }</div>
								<div class="col-1"></div> 
							</div>
							<div class="row mt-2">
								<div class="col-1"></div>
								<div class="col form-text" style="margin: auto;">사용자 닉네임</div>
								<div class="col form-control">${data.memberVo.jet_member_nick }</div>
								<div class="col-1"></div>
							</div>
							<div class="row mt-2">
								<div class="col-1"></div>
								<div class="col form-text">전화번호</div>
								<div class="col form-control">${data.memberVo.jet_member_phone }</div>
								<div class="col-1"></div>
							</div>
							<div class="row mt-5"></div>
						</div>
						
						
			            <div class="col-4 border"><%--사용자 상태 내용 --%>
			            	<div class="row mt-2">
								 <div class="col text-center"style="font-family: 'Daum';"><h5>사용자 활동정보 상세</h5></div>
							</div>
							<hr>
							<form id="frm_update_memberstate">
				            	<div class="row mt-5"> <%--활동상태 --%>
				            		<div class="col-4 text-center" style="margin: auto;">활동 상태</div>
				            		<c:choose>
				            			<c:when test="${data.memberStatusVo.jet_member_status_active == 'N' }">
				            				<div id="state" class="col text-center" style="color: #e60000;">[정지됨]</div>
				            			</c:when>
				            			<c:otherwise>
				            				<div id="state" class="col text-center" style="color: #009900;">[활동중]</div>
				            			</c:otherwise>
				            		</c:choose> 
				            	</div>
				            	<div class="row mt-4">
				            		<div class="col-4 text-center" style="margin: auto;">정지 기간</div>
				            		<div class="col"><%--활동상태 변경 셀렉트바 --%>
				            			<select id="input_period" name="jet_stopstate_period_name" class="form-select">
				            				<option value="0">정지 해제</option>
				            				<option value="1">1일 정지</option>
				            				<option value="7">7일 정지</option>
				            				<option value="30">30일 정지</option>
				            				<option value="999">영구 정지</option>
				            			</select>
				            		</div>
				            	</div> 
				            	<div class="row mt-2">
				            		<div class="col-4 text-center" style="margin: auto;">정지 사유</div>
				            		<div class="col"><%--활동상태 변경 사유 셀렉트바 --%>
				            			<select id="input_reason" name="jet_stopstate_reason_detail" class="form-select">
				            				<option value="0">사유 없음</option>
				            				<option value="1">비정상적인 접근 및 사용</option>
				            				<option value="2">다수의 성희롱 행위 적발</option>
				            				<option value="3">다수의 폭력적인 언어 사용 적발</option>
				            				<option value="4">무분별한 게시물 도배</option>
				            			</select>
				            		</div>
				            	</div> 
				            	<div class="row mt-5">
				            		<input id="member_no" name="jet_member_no" type="hidden" value="${data.memberVo.jet_member_no}">
				            		<div class="col text-end"><input type="button" onclick="updateStatus()" class="btn btn-dark" value="상태 변경"></div>
				            	</div>
			            	</form>
			            </div>
			            <div class="col-2"></div>
					</div><%--본문 끝 --%>
					<div class="row mt-5"></div>
					<div class="row">
						<div class="col">
							<hr>
						</div>
					</div>
				</div> <%--멤버 리스트 테이블 col 끝--%>
			</div> <%--멤버 리스트 테이블 row 끝--%>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>