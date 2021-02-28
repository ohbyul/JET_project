<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET famous restaurant</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<%--아이콘 --%>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>


<style>
	#sidebar{
		border-right: 1px solid rgba(0,0,0,.125);
	}
	#title{
		border-left: 1px solid rgba(0,0,0,.125);
		border-right: 1px solid rgba(0,0,0,.125);
	}
</style>
</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>
<jsp:include page="../commons/orange_btn.jsp"/>
	<div class="container-fluid">
	    
	    <div class="row">
	    	<div class="col" style="background-color:#f6f6f6";></div>

	    	<div class="col-9">
	    	
	    	
	    	<div class="row" id="title">
		    	<div class="col">	
			        <div class="row mt-4">
			            <div class="col text-center display-5 font-monospace">Attractions top5</div>
			
			        </div>
			        <div class="row mt-2">
			            <div class="col-5"></div>
			            <div class="col-5"></div>
			            <div class="col-2 text-muted" style="text-align: right;">home > popular</div>
			        </div>
				</div>
			</div>
			
			<div class="row"  style="border: 1px solid rgba(0,0,0,.125);">
				
				<div class="col-2" id="sidebar">
					<div class="row" style="margin-top: 10px;">
						<h2><i class="fas fa-map-marked-alt"></i> 인기 명소</h2>
					</div>
					<div class="row" style="margin-top: 60px;margin-left: 5px;margin-right: 5px;">
						<div class="col" style="border: 1px solid rgba(0,0,0,.125);border-radius: 10px;">
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/popular_board/popular_board_page.do"><i class="fas fa-camera"></i> Attractions</a>
								</div>
							</div>
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;background-color: #90A84A;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/popular_board/popular_food_page.do"><i class="fas fa-utensils"></i> Food</a>
								</div>
							</div>
							<div class="row" style="height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/popular_board/popular_cafe_page.do"><i class="fas fa-coffee"></i> Cafe</a>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 사이드 -->
			
				<div class="col" style="margin-bottom: 100px;">	<!-- 메인 -->
			    
		        	<div class="row row-cols-1 row-cols-md-2 g-4 mt-2">
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/food_1.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">우진해장국</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;"> 제주시 서사로 11</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#해장국 #고사리육개장 #사골해장국 #녹두빈대떡</p>
					        <p class="card-text">아는 사람들 사이에선 이미 입소문이 자자했고 tvN 수요미식회 제주도 음식편 방영 후 더욱 유명해진 집이다. 해도 뜨기 전에 문을 열어 자정까지 영업하는데, 어느 시간이든 사람들로 붐비고 있어 잠깐만 한 눈을 팔면 대기번호를 받아야 입장할 수 있을 정도다.</p>
					      </div>
					    </div>
					  </div>
					 
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/food_2.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">제주 김만복 김밥</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;"> 제주시 오라로 41</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#전복김밥 #통전복주먹밥 #미역국</p>
					        <p class="card-text">제주공항과 가까운 전복김밥이 유명한 분식집이다. 본점은 포장만 가능하며 본점에서 멀지 않은 곳에 앉아서 즐길 수 있는 라운지점이 있다. 강정동에 오픈하여 서귀포에서도 방문할 수 있다. </p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/food_3.jpg"  class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">올래 국수</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;"> 제주시 귀아랑길 24 (연동)</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#고기국수 #한식 #향토음식</p>
					        <p class="card-text">이 집의 메뉴는 단 하나. 두툼한 고기와 도톰한 중면이 구수한 사골국물과 어우러져 고소하고 구수한 맛을 자랑하는 고기 국수다. 맛은 한국의 설렁탕보다는 진하고 일본의 돈코츠 라멘보다는담백하다.  </p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/food_4.jpg"  class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">돈사돈</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 우평로 19</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#근고기 #연탄구이 #목살 #오겹살 #흑돼지</p>
					        <p class="card-text">2006년 영업을 시작한 제주의 근고기 구이 전문점으로, 평일 낮 시간에도 북적거릴 정도로 인기가 좋다. 현장에서 기다리시는 손님들을 위해 예약은 받지 않는 것이 원칙이다.인기의 비결 첫 번째는 역시 신선한 재료다. </p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/food_5.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">제주선</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">서귀포시 안덕면 신화역사로304번길 38</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#한식 #흑돼지 #한우 #갈치 #고소리술</p>
					        <p class="card-text">신선한 제철 식재료와 특산물로 정성껏 차린 한 상에 제주 자연과 계절을 고스란히 담았습니다. 미식가들의 입맛을 사로잡는 제주 성게 미역국, 통갈치구이 등 해산물 밥상부터, 삼계탕, 비빔밥, 등 다양한 한식메뉴가 정갈하게 차려집니다. </p>
					      </div>
					    </div>
					  </div>
					
					</div>
		        
				</div>	<%--메인 col --%>
				
			</div>	<%--사이드 + 메인 row --%>
	    	</div>	<%--전체 col --%>
	    	<div class="col"  style="background-color:#f6f6f6";></div>
	    </div>
	</div>
	<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>