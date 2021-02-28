<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
	.ad_box{
		width: 15rem;
		height: 25rem;
		background-color: white;
/* 		border: 3px solid orange; */
		display: block;
		position: fixed;
		right: 90px;
		top: 400px;
		z-index: 1; <%-- 0220 추가--%>
	}
	
	#title_box{
		font-size: 20px;
		font-weight: bold;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
		text-align: right;
		padding-right: 30px;
	}
	#ad_main{
		max-width: 100%;
	}
	
</style>

<div class="ad_box">
	
	<div class="row">
		<div class="col" id="title_box">
<!-- 			<i class="fas fa-ad" style="margin-right: 230px;"></i> -->
			<span id="close" onclick="this.parentNode.parentNode.parentNode.setAttribute('class','ad_box d-none');" class="btn-close"></span>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<img id="ad_main" src="${pageContext.request.contextPath}/resources/image/ad_1.png">
		</div>
	</div>

</div>