<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>

<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
</head>
<body>
<jsp:include page="../commons/top_image.jsp"/>
	<main>
	<form action="${pageContext.request.contextPath}/shareplan_board/write_shareplan_board_process.do"  method="post" enctype="multipart/form-data">
            <div class="container">
                <div class="row mt-2">
                    <div class="col-5"></div>
                    <div class="col-4"></div>
                    <div class="col-2 text-muted" style="text-align: right;">게시판 > 제트기 > 글쓰기</div>
                </div>
                <div class="row mt-4 justify-content-center">
                    <div class="col-9  display-6">Review Write</div>
                    <div class="col-1">
                        <div> 
                            <input type="image" src="${pageContext.request.contextPath}/resources/image/save.PNG" alt="wirteButton">
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
	                <div class="col-10 ">
                        <hr>
                    </div>
                </div>
	                <div class="row mt-3 justify-content-center">
	                    <div class="col-10">
	                        <div>
	                            <input name="jet_board_shareplan_title" type="text" class="form-control" placeholder="제목을 입력해라">
	                        </div>
	                    </div>
	
	                </div>
	                <div class="row mt-3 justify-content-center">
		                <div class="col-10">
	                        <div style="background-color: #F6F6F6; height: 180px; border-radius: 5px; line-height: 26px;">
	                            <div style="padding: 25px;">
	                                ◎ 이곳은 게시판 작성시 주의사항을 적는곳입니다.
	                            </div>
	                        </div>
		                </div>
	                </div>
	
	                <div class="row mt-4 justify-content-center">
	                    <div class="col-3 ">	                    
	                        <div>
	                            <input type="file" name="upload_image" accept="image/*" value="사진 첨부"  style="background-color: #F6F6F6; border-radius: 5px;">
	                        </div>
	                    </div>
	                    <div class="col-2">
	                        <div>
	                            <button style="outline:0; border:0;background-color:#F6F6F6; height: 30px; width: 100px; border-radius: 5px;">제트기 첨부</button>
	                        </div>
	                    </div>
	                    <div class="col-5"></div>
		            </div>
		            <c:if test="${map.travelplanVo.jet_board_travelplan_no != 0 && map.travelplanVo.jet_travelplan_sharestatus == 'Y' }">
		            	<c:forEach items="${detailList}" var="resultList">
							<div class="row justify-content-center">
								<div class="col">
			                   	 <details class="form-control p-0 mt-1">
			                   	 	<summary class="form-control pt-3 pb-3" style="box-shadow: 0px 2px 1px 0px #cccccc; ">
			                   	 	   <strong style="padding: 2.5%"></strong><%--간격용--%>
								       <strong class="ps-4 spe-5">Day ${resultList.detailVo.jet_board_tp_detail_day }</strong>
								       <strong class="ps-5 pe-4"></strong><%--간격용--%>
				                       <strong class="ps-5 pe-5">${resultList.detailVo.jet_board_tp_detail_starthours } : ${resultList.detailVo.jet_board_tp_detail_startmin }</strong>
				                       <strong class="ps-5 pe-3"></strong><%--간격용--%>
				                       <strong class="ps-5">[${resultList.categoryName.jet_board_tp_detail_ctgr_name}]${resultList.detailVo.jet_board_tp_detail_placename }</strong>
				                    </summary>		                    
				                    <div class="row mt-3 mb-3">
				                    	<div class="col"></div>
				                    	<div class="col-10">
				                    		<div class="row">
				                    			<div class="col-3 input-group-text">주소</div>
				                    			<div class="col"><div class="form-control text-center">${resultList.detailVo.jet_board_tp_detail_latitude }</div></div><%--위도 --%>
				                    			<div class="col"><div class="form-control text-center">${resultList.detailVo.jet_board_tp_detail_longitude }</div></div><%--경도 --%>
				                    		</div>
				                    		<div class="row mt-2">
				                    			<div class="col-3 input-group-text">간단한 설명</div>
				                    			<div class="col"><div class="form-control text-center">${resultList.detailVo.jet_board_tp_detail_content}</div></div>
				                    		</div>
				                    	</div>
				                    	<div class="col">
				                    		<input type="hidden" name="jet_board_travelplan_no" value="${map.travelplanVo.jet_board_travelplan_no }">
				                    	</div>
				                    </div>
								 </details>
								</div>
							</div>
						</c:forEach>
					</c:if>
	                <div class="row mt-3 justify-content-center" style="margin-bottom: 100px;">
	                    <div class="col-10">
	                        <div>
	                            <textarea name ="jet_board_shareplan_content"class="form-control" id="exampleFormControlTextarea1" rows="20" placeholder="내용을 입력해라" style="overflow-y:scroll"></textarea>
	                        </div>                            
	                    </div>
	
	                </div>
                
            
                
            </div>
            </form>
            </main>
<jsp:include page="../party_board/popup_chat.jsp"/>
<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>