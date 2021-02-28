<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<!-- Font Awesome Icon Library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<title>나의 예약</title>
<jsp:include page="../commons/style/classboard_vertical_nav_style.jsp"/>
<jsp:include page="../classboard/style/my_reservation_page_style.jsp"/>

<script type="text/javascript">
		// 완료 버튼 클릭 시
		function reviewSubmit(targetobj) {

			var reviewStar = targetobj.closest(".accordion")
					.getElementsByClassName("review-star")[0];
			var reviewText = targetobj.closest(".accordion")
					.getElementsByClassName("review-text")[0];
			var reviewDetailNumber = targetobj.closest(".accordion")
					.getElementsByClassName("review-detail-number")[0];

			// var detailNo = ${data.detailVo.jet_class_detail_no};

			// 예외 처리
			if (reviewStar.value == "") {
				alert("별점을 작성해 주세요.");
				starRating.focus();
				return;
			}

			if (reviewText.value == "") {
				alert("후기를 작성해 주세요.");
				reviewText.focus();
				return;
			}

			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					refreshReview(targetobj.closest(".accordion"),
							reviewDetailNumber.value);
					// refreshReview();
				}
			}
			xmlhttp
					.open(
							"post",
							"${pageContext.request.contextPath}/classboard/write_class_review_process.do",
							true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("jet_class_review_star_rating=" + reviewStar.value
					+ "&jet_class_review_content=" + reviewText.value
					+ "&jet_class_detail_no=" + reviewDetailNumber.value);
		}

		//셀렉트.... 리뷰들 읽기     
		// 이게 고정되길 바라고 onload에 써봤지만 안 먹어요. 
		// 막 작성한 것들만 바로 화면에 붙고,  창을 새로고침하면 아코디언만 있던 첫 상태로 돌아가
		function refreshReview(targetAccordion, detailNo) {

			colBox = targetAccordion.closest(".col");

			targetAccordion.remove();

			//ajax 호출 후..... 해야 될일....

			var xmlhttp = new XMLHttpRequest();

			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var obj = JSON.parse(xmlhttp.responseText);
					console.log(obj);

					//var rowBox = document.createElement("div");

					// 후기 별점
					var reviewStarBox = document.createElement("div");
					reviewStarBox.setAttribute("class", "col mt-1");
					reviewStarBox.innerText = "별점 " + obj.reviewVo.jet_class_review_star_rating;

					// 후기 내용
					var reviewTextBox = document.createElement("div");
					reviewTextBox.setAttribute("class", "col mt-1");
					reviewTextBox.innerText = obj.reviewVo.jet_class_review_content;

					colBox.append(reviewStarBox);
					colBox.append(reviewTextBox);

				}
			}

			xmlhttp
					.open(
							"get",
							"${pageContext.request.contextPath}/classboard/get_class_review.do?jet_class_detail_no="
									+ detailNo);
			xmlhttp.send();
		}
	</script>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>

<body>
	<jsp:include page="../commons/top_blank.jsp"/>
	<jsp:include page="../commons/classboard_vertical_nav.jsp"/>   
	<div class="container mt-5">
	
		<main>
			<div class="row mt-2">
				<div class="col-5"></div>
				<div class="col-5"></div>
				<div class="col-2 text-muted" style="text-align: right;">home
					> my reservation</div>
			</div>
			<div class="row mt-4">
				<div class="col text-center display-5" style="font-family: daum">나의
					예약</div>

			</div>
			<div class="row mt-4">
				<hr>
			</div>
			<c:forEach items="${resultList}" var="data">
				<div class="row mt-4" style="background-color: #F5F5F5;">

					<div class="row">
						<div class="col-4" id="thumbnail">
							<c:choose>
								<c:when test="${!empty data.imageVo}">

									<div class="d-block w-100">
										<img src="${data.imageVo[0].jet_class_image_link}"
											class="img-thumbnail" alt="thumbnail"
											style="max-height: 200px;">
									</div>

								</c:when>
								<c:otherwise>

									<div class="d-block w-100">
										<img
											src="${pageContext.request.contextPath}/resources/image/jejupic3.jpg"
											class="img-thumbnail" alt="basic_image"
											style="max-height: 200px;">
									</div>

								</c:otherwise>
							</c:choose>
						</div>

						<div class="text col" id="text-box">

							<div class="row">
								<div class="reserve_date_col">
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${data.reserveVo.jet_class_reservation_date}" />
									예약
								</div>

							</div>
							<div class="row mt-3">
								<div id="title_col">
									<a id="my_reserv_a"
										href="${pageContext.request.contextPath}/classboard/detail_class_page.do?jet_class_detail_no=${data.detailVo.jet_class_detail_no}">[${data.categoryVo.jet_class_category_name}]
										${data.classVo.jet_class_name}</a>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									수강일:
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${data.detailVo.jet_class_detail_date}" />
								</div>
							</div>



							<div class="row mt-3">
								<div class="col">

									<c:if test="${data.reviewVo == null}">


										<!-- 아코디언 시작 -->
										<div class="accordion"
											id="accordionExample-${data.detailVo.jet_class_detail_no}">
											<div class="accordion-item">
												<h2 class="accordion-header"
													id="headingOne-${data.detailVo.jet_class_detail_no}">
													<button class="accordion-button" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#collapseOne-${data.detailVo.jet_class_detail_no}"
														aria-expanded="true"
														aria-controls="collapseOne-${data.detailVo.jet_class_detail_no}">
														별점 및 후기 작성</button>
												</h2>
												<div id="collapseOne-${data.detailVo.jet_class_detail_no}"
													class="accordion-collapse collapse"
													aria-labelledby="headingOne"
													data-bs-parent="#accordionExample-${data.detailVo.jet_class_detail_no}">
													<div class="accordion-body">

														별점 <input type="number" class="form-control review-star"
															min="1.0" max="5.0" step="0.5" class="review-star">

														후기
														<textarea class="form-control review-text"
															class="review-text"></textarea>

														<input class="review-detail-number" type="hidden"
															value="${data.detailVo.jet_class_detail_no }">
														<button type="button" class="btn btn-success mt-3 "
															onclick="reviewSubmit(this)">완료</button>

													</div>
												</div>
											</div>
										</div>
										<!--  아코디언 끝 -->
									</c:if>

									<!-- 후기 출력... -->
									
									<!-- 후기 출력... -->
									<c:if test="${data.reviewVo != null}">

										<div class="row">
											<div class="col">
												별점 <span class="fa fa-star checked"></span> 
												${data.reviewVo.jet_class_review_star_rating}
											</div>
										</div>
										<div class="row mt-2">
											<div class="col">
												${data.reviewVo.jet_class_review_content}</div>
										</div>
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>

		</main>
	</div>
	<div class="col-1"></div>
	
	<jsp:include page="../party_board/popup_chat.jsp"/>
	<jsp:include page="../commons/global_footer.jsp"/>
	<jsp:include page="../commons/global_nav.jsp"/>
	

	


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
		
</body>
</html>