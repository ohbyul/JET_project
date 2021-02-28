<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../commons/style/global_footer_style.jsp"/>
	<footer id="footer">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-5" id="center_box">
				<div class="row mt-3">
					<div class="col pt-3">
						<p id="footer_title"">ABOUT US</p>
						<p class="footer_p">JET은 나의 제주여행계획을 공유하고 나만의 계획으로 다른 사람들과 동행해 함께 여행할 수 있는 여행 플랫폼입니다.</p>
						<p class="footer_p">몇 번의 클릭만으로 제주 여행에 도움이 되는 다양한 정보들을 찾을 수 있고  </p>
						<p class="footer_p">나만의 여행계획을 작성해 다른 사람들과 공유하거나 함께 여행할 사람들을 찾을 수 있습니다.</p>
						<p class="footer_p">때로는 가족,친구들과 때로는 새로운 사람들과 다녀온 제주도의 여행지와 맛집 정보를 공유해보세요!</p>
						<p class="footer_p">나만의 여행계획을 만들 수 있는 JET에서 여러분의 제주 여행을 더욱 풍성하게 해드립니다!</p>
					</div>
				</div>	
			</div>
			<div class="col-1"></div>
			<div class="col-1">
				<dl id="footer_dt">
					<dt><a href="${pageContext.request.contextPath }/content/Terms_of_service.do" target="_blank">이용약관</a></dt>
					<dt><a href="${pageContext.request.contextPath }/content/Privacy_Policy.do" target="_blank">개인정보 처리방침</a></dt>
					<dt><a href="${pageContext.request.contextPath }/content/operation_policy.do" target="_blank">운영정책</a></dt>
					<dt><a href="${pageContext.request.contextPath }/csboard/csboard_page.do">고객센터</a></dt>
					<dt><a href="${pageContext.request.contextPath }/notice_board/notice_board_page.do">공지사항</a></dt>
				</dl>
				
			</div>
			<div class="col-3 pt-4">
				<div class="row">
					<div class="col pt-3 text-end">
						<img id="logo_img" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/lettering_logo_gray.png" style="height: 4.8rem; display: inline;">
					</div>
				</div>
				<div class="row mt-4 me-1">
					<div class="col text-end">
						<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/snslogos.png" style="height: 3rem">
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col"><hr style="color: white; margin-top: 10px; margin-bottom: 10px"></div>
			<div class="col-1"></div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<div class="text-start" style="color: #bfbfbf; font-family: 'NotoSansKR';font-weight: 300;">
				Copyright ⓒ JET Project. All rights reserved.
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	</footer>