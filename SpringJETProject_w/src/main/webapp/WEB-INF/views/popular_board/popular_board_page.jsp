<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET Attractions</title>
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
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;background-color: #90A84A;">
									<a style="text-decoration: none;color: black;" href="${pageContext.request.contextPath }/popular_board/popular_board_page.do"><i class="fas fa-camera"></i> Attractions</a>
								</div>
							</div>
							<div class="row" style="border-bottom: 1px solid rgba(0,0,0,.125);height: 50px;">
								<div class="col font-monospace" style="text-align: center;font-size: 22px;padding-top: 5px;">
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
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/att_1.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">성산일출봉</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주 서귀포시 성산읍 성산리 1</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#일출 #오름 #경관 #포토 #부모</p>
					        <p class="card-text">(UNESCO 세계자연유산) 푸른 바다 사이에 우뚝 솟은 성채와 같은 모양, 봉우리 정상에 있는 거대한 사발 모양의 분화구, 그리고 그 위에서 맞이하는 일출의 장관 때문에 성산일출봉은 많은 사람들의 감흥과 탄성을 자아낸다. </p>
					      </div>
					    </div>
					  </div>
					 
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/att_2.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">협재 해수욕장</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 한림읍 한림로 329-10</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#일몰 #해수욕장 #액티비티 #아이 #맑음 #여름</p>
					        <p class="card-text">제주도 서쪽에 가볼만한 해수욕장을 꼽으라 하면 단연 1,2위로 꼽아 추천하는 곳이 협재해수욕장이다. 제주시 한림읍에 자리하며, 제주올레 14코스의 일부다. 금능해수욕장과 이웃하고 있는 쌍둥이해수욕장이기도 하다.</p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/att_3.jpg"  class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">섭지코지</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">서귀포시 성산읍 고성리</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#일출 #해변 #경관/포토 #커플 #맑음 #가을</p>
					        <p class="card-text">들머리의 신양해변백사장, 끝머리 언덕위 평원에 드리워진 유채밭, 여유롭게 풀을 뜯는 제주조랑말들, 바위로 둘러친 해안절벽과 우뚝 치솟은 전설어린 선바위 등은 전형적인 제주의 아름다움을 만날 수 있다. </p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/att_4.jpg"  class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">우도</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 우도면 삼양고수물길 1</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#섬속의섬 #경관/포토 #아이 #맑음</p>
					        <p class="card-text">우도는 소가 누워있는 모양을 닮았다고 해서 일찍부터 소섬 또는 쉐섬으로 불리웠다. 완만한 경사와 옥토, 풍부한 어장, 우도팔경 등 자연조건을 갖춘 관광지로 관광객이 찾는 제주의 대표적인 부속섬이다.  </p>
					      </div>
					    </div>
					  </div>
					  
					  <div class="col">
					    <div class="card">
					      <img style="overflow: hidden;height: 250px;" src="${pageContext.request.contextPath }/resources/image/att_5.jpg" class="card-img-top" alt="...">
					      <div class="card-body">
					        <h5 class="card-title" style="text-align: center;font-weight: bold;">한라산</h5>
					        <p class="card-text text-muted" style="text-align: center;font-size: 14px;margin-bottom: 1px;">제주시 1100로 2070-61</p>
					        <p class="card-text" style="text-align: center;font-size: 12px;color: orange;">#산 #걷기/등산 #경관/포토 #친구 #사계절</p>
					        <p class="card-text">지리산, 북한의 금강산과 함께 한반도의 3대 영산에 속하는 한라산은 한반도의 최남단에 위치하고 있으며,높이 해발 1,950m로 남한에서 가장 높다.사계절이 뚜렷하고 아름답다. </p>
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