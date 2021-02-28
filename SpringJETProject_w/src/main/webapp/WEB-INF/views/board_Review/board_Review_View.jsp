<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<title>리뷰 게시판</title>

<jsp:include page="../board_Review/style/board_Review_View_style.jsp"/>
<jsp:include page="../board_Review/script/board_Review_View_script.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
   <jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>

<body onload="refresh();likeView();">

<jsp:include page="../commons/top_image.jsp"/>
<article>
        <!-- ------------------------------------------------------- -->
        <div class="container mt-4" style="width: 1000px; border: 1px solid #D5D5D5; border-radius: 5px;">
            <div class="row mt-4 justify-content-center">
                <div class="col text-success">
                    <a href="${pageContext.request.contextPath}/board_Review/board_Review.do" style="text-decoration:none;" class="text-success">board > review</a>
                </div>
            </div>
            <div class="row mt-2 " >
                <div class="col" >
                    <h3>${result.boardReviewVo.jet_board_review_title }</h3>
                </div>
            </div>
            <div class="row">
            	<div class="col-1" style="font-size:14px">
	                <c:choose>
	                	<c:when test="${result.memberVo.jet_member_grade == 9 }">
	                		<img src="${pageContext.request.contextPath}/resources/image/admin.jpg">
	                	</c:when>
	                	<c:when test="${result.memberVo.jet_member_grade ==  0}">
	                		<img src="${pageContext.request.contextPath}/resources/image/sprout.PNG">
	                	</c:when>
	                </c:choose>
                </div>
                <div class="col-1" style="font-size: 14px; margin-left:-50px; margin-top:5px;">
                    <strong>${result.memberVo.jet_member_nick }</strong> 
                </div>
                
                <div class="col"></div>
            </div>
            <div class="row">
                <div class="col-2 text-muted" style="font-size: 14px;">
                    <fmt:formatDate pattern="yy.MM.dd hh:mm" value="${result.boardReviewVo.jet_board_review_writedate }"/> 
                </div>
                <div class="col-2 text-muted" style="font-size: 13px; margin-left:-60px;">
                    	조회수 : ${result.boardReviewVo.jet_board_review_readcount }
                </div>
                <div class="col"  style="font-size: 13px; text-align: right;">
                    <img alt="report" src="${pageContext.request.contextPath}/resources/image/report.jpg" style="margin-top:-5px"><a href="#" class="text-danger" style="text-decoration: none; font-size:12px">[신고하기]</a>
                    
                    
                </div>
            </div>
            <hr style="background-color:#8C8C8C;">
            <div class="row mt-4 justify-content-center">
                <div class="col-12" style="background-color: #F6F6F6; height: 180px; width:98%; border-radius: 5px; line-height: 26px;">
                    <div style="margin-top: 20px;">
                        ◎ 이곳은 게시판 작성시 주의사항을 적는곳입니다.
                    </div>
                </div>
            </div>
            <%-- <jsp:include page="../commons/kakao_map_api.jsp"/>--%>
            <div class="row mt-4">
                <div class="col">
                    <div class="text-center">
                       ${result.boardReviewVo.jet_board_review_content }
                       <c:forEach items="${result.imageVoList }" var="reviewImageVo">
                       		<img class="img-fluid" src="${reviewImageVo.jet_board_review_image_link }">
                       </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row mt-4 justify-content-center">
                <div class="col-2 text-center" style="border:1px solid #d5d5d5; border-radius:15px">

                     	<div onclick="likeView()"> 
	                    	
			                <input id="btnLike" onclick="likeButton()">
                        	
    
                   		</div>
                    
                    	<%-- ${likeCount }--%>
                    	<div id = "likeCnt" style="border-top:1px solid #d5d5d5; font-size:14px"></div>
                    
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col text-muted">
                    <div style="margin-top: -28px; font-size: 14px;">
                    <a href="${pageContext.request.contextPath}/board_Review/board_Review.do" style="text-decoration:none;" class="text-muted">목록</a> | 
					 <a href="#comment" style="text-decoration:none; font-size:14px;"class="text-muted">댓글</a><c:if test="${repleCount != 0 }">
                   		<a style="font-size : 14px; color:red;">(${repleCount })</a>
                   		<div id="repleCnt"></div>
                    </c:if>
                    </div>
                    <c:if test="${!empty sessionUser && sessionUser.jet_member_no == result.memberVo.jet_member_no}">
                    	<div style="margin-top: -28px; font-size: 14px; float: right;">
                    		
                    		<input type="button" value="수정" onclick="fetch('${pageContext.request.contextPath}/board_Review/board_Review_Update.do?jet_board_review_no=${result.boardReviewVo.jet_board_review_no}').then(function(response){response.text().then(function(text){document.querySelector('article').innerHTML = text;})})" style=" border:none; outline:none; background-color:#fff;" class="text-muted">                    		
                    		<a href="${pageContext.request.contextPath}/board_Review/board_Review_Delete_process.do?jet_board_review_no=${result.boardReviewVo.jet_board_review_no}" style="text-decoration:none;" class="text-muted">삭제</a>
                    	</div>
                    </c:if>
                </div>
            </div>
            <hr style="background-color:#8C8C8C;">
            <div class="row mt-4">
                <div class="col-1 h5">
                    <div>
                        <p id="comment">댓글</p>
                    </div>
                </div>
                <div class="col-2" style="margin-left:-30px;">
                    <div class="repleTab">
                        <button id="repleASC" onclick="refreshReple()"  style="background-color: #fff; border: none; outline: none; font-size: 13px;">등록순</button> |
                        <button id="repleDESC" onclick="refreshRepleDESC()"  style="background-color: #fff; border: none; outline: none; font-size: 13px;">최신순</button>
                    </div>
                </div>
                
                <div class="col-9"></div>
            </div>
            <hr style="background-color:#8C8C8C;">
            <%-- 여기가 댓글 불러오는곳 --%>
            
           	<div class="container" id="reple_list_box"></div>
		
           
      		<div class="container" id="reple_list_box_desc"></div>
             
             			
			<c:if test="${!empty sessionUser }">
            <div class="row mb-4">
                <div class="col">
                    <div style="border: 2px solid #D5D5D5; border-radius: 5px;">
                        <div class="row">
                            <div class=col>
                                <div style="margin: 10px 0 10px 15px"><strong>${sessionUser.jet_member_nick }</strong></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div style="margin-left:15px">
                                    <!--위에는 실제 아래는 숨김-->
                                    <textarea onclick="enter()" id="input_reple" style="width:900px; height:40px; overflow-y:hidden; border: none; outline: none;" placeholder="댓글을 남겨보세요"></textarea>
                                    <textarea id="input_reple_hidden" style="width:900px;height:1px;overflow-y:hidden;position:absolute;top:-9px" disabled></textarea>
                                    <script>
                                        function xSize(e)
                                        {
                                            var xe = document.getElementById('input_reple_hidden'),
                                                t;

                                            e.onfocus = function()
                                            {
                                                t = setInterval(
                                                    function()
                                                    {
                                                        xe.value = e.value;
                                                        e.style.height = (xe.scrollHeight + 12) + 'px';
                                                    }, 100);
                                            }

                                            e.onblur = function()
                                            {
                                                clearInterval(t);
                                            }
                                        }

                                        xSize(document.getElementById('input_reple'));
                                    </script>
                                    <input type="submit" id="registration" value="등록" onclick="writeReple()" style="padding: 3px; font-size: 14px; margin-bottom: 10px; background-color: #fff; border: none; outline: none;">
                                    <script>
                                        function enter(){
                                            var x = document.getElementById("registration");
                                            x.style.backgroundColor="#FFFF90";
                                            x.style.borderRadius="5px";
                                            x.style.outline="none";
                                            x.style.padding="5px";
                                            x.style.fontSize="14px";
                                            x.style.marginBottom="10px";
                                            x.style.color="#FF9436"
                                            
                                        }
                                    </script>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>

        </div>
        
        
        
        </article>
        <jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>		
</body>
</html>
