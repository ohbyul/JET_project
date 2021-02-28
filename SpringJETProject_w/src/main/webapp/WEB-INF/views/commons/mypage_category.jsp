<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
</head>
<style>
        .mypage_category{
            margin-top: 136px;
            width: 260px;
            height: 355px;      
            background-color: #FF9436;      
            left: 80px;
            position: fixed;
            border-radius: 15px;
        }

        .mypage_ul{
            text-align: center;
            margin: 0;
            padding: 0;
            margin-top: 30px;
        }
        .mypage_ul li{
            list-style:none;
            margin: 30px;
            font-weight: bold;
        }
</style>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	<jsp:include page="../commons/top_blank.jsp"/>
        <div class="mypage_category">
            <div>
                <ul class="mypage_ul">
                    <li>
                        <a onclick="update_mypage()">정보수정</a>
                    </li>
                    <li>
                        <a onclick="myplan()">나의 여행 계획</a>
                    </li>
                    <li>
                        <a onclick="likeboard()">좋아한 글</a>
                    </li>
                    <li>
                        <a>내가 쓴 글</a>
                    </li>
                    <li>
                        <a>내가 쓴 댓글</a>
                    </li>
                    <li>
                        <a>쪽지함</a>
                    </li>
                </ul>
            </div>
        </div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">                
</body>
</html>