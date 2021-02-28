	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<jsp:include page="../shareplan_board/style/class_shareplan_board_page_style.jsp"/>
<jsp:include page="../shareplan_board/script/class_shareplan_board_page_script.jsp"/>

</head>

<body onload="recommendClass();">
<article>
<jsp:include page="../commons/top_image.jsp"/>

        <!-- ------------------------------------------------------- -->

        <div class="row mt-4 justify-content-center" style="margin-bottom:500px;">
        
           	<div class="col-7" style="width:53%;">
           		<div class="row" style="heigt:100px;">
           			<div class="col">
           			 	<div><img alt="recommendClass" src="${pageContext.request.contextPath }/resources/image/recommendClass.jpg">${result.sharePlanBoardVo.jet_board_shareplan_title} 주변 놀거리</div>
           			</div>
           		</div>
           		<div class="row" id="get_recommend_class">      			
           		</div>
           	</div>
        
        </div>


	</article>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>		
</body>
</html>
