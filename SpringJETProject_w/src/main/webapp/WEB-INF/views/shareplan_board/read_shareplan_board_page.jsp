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
<jsp:include page="../shareplan_board/style/read_shareplan_board_page_style.jsp"/>
<jsp:include page="../shareplan_board/script/read_shareplan_board_page_script.jsp"/>

</head>

<body onload="refresh();likeView();pickView();bringPlan();recommendClass();">
<article>
<jsp:include page="../commons/top_image.jsp"/>

        <!-- ------------------------------------------------------- -->
        <div class="container mt-4" style="width: 1000px; border: 1px solid #D5D5D5; border-radius: 5px;">

            <div class="row mt-4 justify-content-center">
                <div class="col-11 text-success">
                    <a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do" style="text-decoration:none;" class="text-success">board > JET</a>
                </div>
                <div class="col" onclick="pickView()">
                	<input id="btnPick" onclick="pickButton()">
        			
        		</div>
                	
                
            </div>
            <div class="row mt-2 " >
                <div class="col" >
                    <h3>${result.sharePlanBoardVo.jet_board_shareplan_title }</h3>
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
                    <fmt:formatDate pattern="yy.MM.dd hh:mm" value="${result.sharePlanBoardVo.jet_board_shareplan_writedate }"/> 
                </div>
                <div class="col-2 text-muted" style="font-size: 13px; margin-left:-60px;">
                    	조회수 : ${result.sharePlanBoardVo.jet_board_shareplan_readcount }
                </div>
                <div class="col"  style="font-size: 13px; text-align: right;">
                
							<div class="row my-3">
								<div class="col"></div>
								<div class="col" style="text-align: right;font-size: 13px;">
								    <img alt="report" src="${pageContext.request.contextPath}/resources/image/report.jpg" style="margin-top:-5px">
								    <a id="singoButton"></a>	<%--신고 버튼  --%>
								</div>
								
								<%--모달창 시작--%>
							<div class="modal fade" id="singoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="mb-3">
							            <label for="sessionUser-name" class="col-form-label">신고자</label>
							            <div class="form-control" id="sessionUser-name">${sessionUser.jet_member_nick}</div>
							          </div>
							          <div class="mb-3">
							            <label for="jet_board_notice_singo_reason" class="col-form-label">신고 사유</label>
							            <textarea class="form-control" id="jet_board_share_report_reason"></textarea>
							          </div>
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button onclick="singoSubmitBtn();" type="button" id="toast_singo" class="btn btn-danger" data-bs-dismiss="modal">Send Declaration</button>
							      </div>
							    </div>
							  </div>
							</div>
							<%--모달 창 끝  --%>
							</div>	<%--신고 row끝 --%>
                    
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
                                 <%--지도 --%>
                    <div class="row mt-3" style="z-index: 1;">
                        <div class="col">
                          	
		                     <div class="map_wrap">
		                         <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		                         <div class="hAddr">
		                             <span class="title">주소정보</span>
		                             <span id="centerAddr"></span>
		                             
		                           <div id="latitude"></div>
		                           <div id="longitude"></div>
		                         </div> 
		                     </div>
		                     
                    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=359480e8f9355ac0c5dff3184ff92646&libraries=services"></script>
					<script >
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(33.381576, 126.566148), // 지도의 중심좌표
                                level: 10, // 지도의 확대 레벨
                                mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
                            }; 
               
                     // 지도를 생성한다 
                     var map = new kakao.maps.Map(mapContainer, mapOption);

					// 마커 이미지의 이미지 주소입니다
					 var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					 for (var i = 0; i < positions.length; i ++) {
					     
					     // 마커 이미지의 이미지 크기 입니다
					     var imageSize = new kakao.maps.Size(24, 35); 
					     
					     // 마커 이미지를 생성합니다    
					     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					     
					     // 마커를 생성합니다
					     var marker = new kakao.maps.Marker({
					         map: map, // 마커를 표시할 지도
					         position: positions[i].latlng, // 마커를 표시할 위치
					         title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					         image : markerImage // 마커 이미지 
					     });
					 }

                     </script>
                     
                        </div>
                     </div>
			<%--디테일 리스트 작성됨 --%>
           	<div class="row mt-3">
               	<div class="col" id="travelPlanView">
	                   
				</div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <div>
                       ${result.sharePlanBoardVo.jet_board_shareplan_content }
                       <c:forEach items="${result.imageVoList }" var="sharePlanImageVo">
                       		<img class="img-fluid" src="${sharePlanImageVo.jet_board_shareplan_image_link }">
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
                    <a href="${pageContext.request.contextPath}/shareplan_board/shareplan_board_page.do" style="text-decoration:none;" class="text-muted">목록</a> | 
					 <a href="#comment" style="text-decoration:none; font-size:14px;"class="text-muted">댓글</a><c:if test="${repleCount != 0 }">
                   		<a style="font-size : 14px; color:red;">(${repleCount })</a>
                   		<div id="repleCnt"></div>
                    </c:if>
                    </div>
                    <c:if test="${!empty sessionUser && sessionUser.jet_member_no == result.sharePlanBoardVo.jet_member_no}">
                    	<div style="margin-top: -28px; font-size: 14px; float: right;">
                    		
                    		<a href="${pageContext.request.contextPath}/shareplan_board/update_shareplan_board_page.do?jet_board_shareplan_no=${result.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none;" class="text-muted">수정</a>                    		
                    		<a href="${pageContext.request.contextPath}/shareplan_board/delete_shareplan_process.do?jet_board_shareplan_no=${result.sharePlanBoardVo.jet_board_shareplan_no}" style="text-decoration:none;" class="text-muted">삭제</a>
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
        <div class="row mt-4 justify-content-center">
        
           	<div class="col-7" style="width:53%;">
           		<div class="row" style="heigt:100px;">
           			<div class="col">
           			 	<div><img alt="recommendClass" src="${pageContext.request.contextPath }/resources/image/recommendClass.jpg">주변 놀거리</div>
           			</div>
           			<div class="col" style="text-align:right;font-size:14px;">
           				<br><br><br><a href="${pageContext.request.contextPath }/shareplan_board/class_shareplan_board_page.do?jet_board_shareplan_no=${result.sharePlanBoardVo.jet_board_shareplan_no }" style="text-decoration:none;color:red;">MORE+</a>
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
