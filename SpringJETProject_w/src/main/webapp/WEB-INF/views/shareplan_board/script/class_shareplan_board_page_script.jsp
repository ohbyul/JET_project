<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	var jet_member_no = null;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var obj = JSON.parse(xmlhttp.responseText);
			
			if(obj.result == "success"){
				jet_member_no = obj.sessionNo;
			}else{
				console.log(obj.reason);
			}
			
		}
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath }/member/getSessionNo.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();

	
	function recommendClass(){
		
		var jet_board_shareplan_no = ${result.sharePlanBoardVo.jet_board_shareplan_no };
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
		
				var getRecommendClass = document.getElementById("get_recommend_class");
				
				for(qwe of obj){
					
					var box = document.createElement("div");
					box.setAttribute("class","col-6");
					box.setAttribute("style","border-bottom:1px solid #EAEAEA");
					
					var paddingBox = document.createElement("div");
					paddingBox.setAttribute("style","padding:10px");
					
					var allBox = document.createElement("div");
					allBox.setAttribute("class","row");
					
					var leftBox = document.createElement("div");
					leftBox.setAttribute("class","col-5");
					
					var imageBox = document.createElement("div");
					var image = document.createElement("img");
					
					if(qwe.classImageList != ""){
						image.setAttribute("style","width:100%; height:250px;text-align:center;");
						image.setAttribute("src",qwe.classImageList[0].jet_class_image_link);
						image.setAttribute("alt","image");
					}else{
						image.setAttribute("style","width:100%; height:250px;text-align:center;");
						image.setAttribute("src","${pageContext.request.contextPath }/resources/image/logo.png");
						image.setAttribute("alt","image");
					}
					
					var rightBox = document.createElement("div");
					rightBox.setAttribute("class","col");
					
					var rightHead = document.createElement("div");
					rightHead.setAttribute("class","row");
					
					var className = document.createElement("div");
					className.setAttribute("class","col");
					
					var classNameValue = document.createElement("div");
					classNameValue.setAttribute("style","font-size:20px;font-weight:bold");
					classNameValue.innerText="["+qwe.classCategoryVo.jet_class_category_name+"]"+ qwe.classboard.jet_class_name;
					
					var nullBox = document.createElement("div");
					nullBox.setAttribute("class","row");
					nullBox.setAttribute("style","height:50%");
					
					var addressRowBox = document.createElement("div");
					addressRowBox.setAttribute("class","row");
					
					var addressColBox = document.createElement("div");
					addressColBox.setAttribute("class","col");
					
					var addressBoxValue = document.createElement("div");
					addressBoxValue.setAttribute("style","font-size:14px");
					addressBoxValue.innerText=qwe.classboard.jet_class_address;
					
					var priceRowBox = document.createElement("div");
					priceRowBox.setAttribute("class","row");
					
					var priceColBox = document.createElement("div");
					priceColBox.setAttribute("class","col");
					
					var priceBoxValue = document.createElement("div");
					priceBoxValue.setAttribute("style","text-align:right; font-weight:bold");
					priceBoxValue.innerText=qwe.classboard.jet_class_price +"원";
					
					allBox.append(leftBox);
					allBox.append(rightBox);
					
					imageBox.append(image);
					leftBox.append(imageBox);		
					
					className.append(classNameValue);
					rightHead.append(className);					
					
					addressColBox.append(addressBoxValue);
					addressRowBox.append(addressColBox);
					
					priceColBox.append(priceBoxValue);
					priceRowBox.append(priceColBox);
					
					rightBox.append(rightHead);
					rightBox.append(nullBox);
					rightBox.append(addressRowBox);
					rightBox.append(priceRowBox);
					

					
					paddingBox.append(allBox);
					
					box.append(paddingBox);
					
					getRecommendClass.append(box);
					

					
	
				}
				
			}	
		};	
		xmlhttp.open("post","${pageContext.request.contextPath}/shareplan_board/get_recommend_class_all.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_board_shareplan_no=" + jet_board_shareplan_no);
	}
	



	
</script>