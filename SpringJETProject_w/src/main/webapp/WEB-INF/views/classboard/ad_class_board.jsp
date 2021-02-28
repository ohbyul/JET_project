<style>
	
	.ad_box{
		width: 200px;
		height: auto;
		background-color: white;
		border: 3px solid green;
		display: block;
		position: fixed;
		right: 80px;
		top: 400px;
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
			<i class="fas fa-ad" style="margin-right: 130px;"></i>
			<span id="close" onclick="this.parentNode.parentNode.parentNode.setAttribute('class','ad_box d-none');" class="btn-close"></span>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
		<img id="ad_main" src="${pageContext.request.contextPath}/resources/image/ad_3.png">		
		</div>
	</div>

</div>