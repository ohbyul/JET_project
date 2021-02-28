<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="class-category">
            <div>
                <ul class="class-ul">
                    <li>
                        <%--<a onclick="classMain()">메인</a> --%>
                        <a style="text-decoration: none; color: #000000;" href="${pageContext.request.contextPath}/classboard/main_classboard_page.do">원데이 클래스</a>
                    </li>
                    <li>
                        <%-- <a onclick="myReservation()">나의 예약</a>--%>
                        <a style="text-decoration: none; color: #000000;" href="${pageContext.request.contextPath}/classboard/my_reservation_page.do">나의 예약</a>
                        
                    </li>
                    <li>
                        <%--<a onclick="myClass()">나의 클래스</a>--%>
                        
                        <a style="text-decoration: none; color: #000000;" href="${pageContext.request.contextPath }/classboard/my_class_page.do">나의 클래스</a>
                         
                    </li>
                </ul>
            </div>
        </div>