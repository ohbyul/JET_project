<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET popular Cafe</title>
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
			            <div class="col text-center display-5 font-monospace">CAFE top5</div>
			
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
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/popular_board/popular_food_page.do"><i class="fas fa-utensils"></i> Food</a>
								</div>
							</div>
							<div class="row" style="height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;background-color: #90A84A;">
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
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/cafe_1.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">몽살드애월(GD카페)</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 애월읍 애월북서길 56-1</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#카페 #커피 #음료 #디저트</p>
					        <p class="card-text">애월에 위치한 봄날카페와 인접하여 많은 관광객들이 찾으며, 통유리로 만들어진 벽면으로 따뜻한 제주의 햇살, 푸르른 제주 바다를 전망할 수 있어 인기가 많다.유명해서 좋은 자리를 차지하기가 쉽지 않다. </p>
					      </div>
					    </div>
					  </div>
					 
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/cafe_2.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">서연의집(영화 건축학개론)</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">서귀포시 남원읍 위미해안로 86</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#카페 #커피 #아메리카노</p>
					        <p class="card-text">카페 내부 이곳저곳에 영화의 추억을 느낄 수 있는 사진이나 도구가 있다. 첫사랑의 향수를 새삼 느끼고 싶은 이들에게 좋은 추억을 주고 있다.영화 속의 남자 주인공이 누워서 낮잠을 잤던 2층에는 잔디가 있다.</p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/cafe_3.jpg"  class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">봄날카페</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 애월읍 애월로1길 25</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#카페 #커피 #음료</p>
					        <p class="card-text">드라마의 주인공이 일하던 카페라서 유명해졌다.해변을 바라보며 차 한잔의 여유를 즐기기에 좋으며 제주 돌담의 정취를 느낄 수 있다.카페견 웰시코키 네마리가 반겨주는데 애견인들에게는 반가운 소식이 아닐 수 없다. </p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/cafe_4.jpg"  class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">모래비카페</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 구좌읍 해맞이해안로 462</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#카페 #한라봉차 #커피</p>
					        <p class="card-text">모래비 카페는 흰모래와 에메랄드빛의 바다가 어우러져 너무나 아름다운 월정리 해변 길 가운데 위치하고 있다. 월정리 해변은 사계절 내내 관광객의 발길이 끊이지 않는 해변 중 하나이다.</p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/cafe_5.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">카페리</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">구좌읍 평대2길 39</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#카페 #커피 #비엔나커피#죠리퐁라떼</p>
					        <p class="card-text">평대해수욕장에 위치한 소규모 카페 스튜디오로, 셀프웨딩촬영 등 사진 촬영이 가능한 카페이다.카페 내부 곳곳에 다양한 화분 식물들로 꾸며져 있고, 바깥 테라스는 하얀색 천으로 꾸며져 있어 사진 배경으로 담기 좋다.</p>
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