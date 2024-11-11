<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="../../layout/header.jsp" />
<script type="text/javascript">
$(function() {

	$("#btnManagerMenu").click(function () {
		location.href="/manager/menu";
	})

	$("#btnEventWrite").click(function () {
		location.href="/comm/event/write";
	})
	
	$("#btnBack").click(function () {
	 	   history.back();
	});
	
	$(".custom-image img").css({
        width: "200px",
        height: "200px"
    });
	
})
</script>
<style type="text/css">
 .image-container { 
         display: flex;/
         gap: 100px; /* 이미지 간 간격  
     } 
</style>

<h1>이벤트 목록</h1>

<div>
<button id="btnManagerMenu">관리자메뉴로가기</button>
<button id="btnEventWrite">이벤트 등록</button>
<button id="btnBack">뒤로가기</button>
</div>


<div class="d-flex justify-content-center">
<table>
    <tr>
        <c:forEach var="event" items="${eventList}">
            <td style="text-align: center; padding: 10px;">
                <!-- 이미지 표시, 크기 고정 -->
                <div class="custom-image">
                <a href="/comm/event/info">${event.eveImg}</a>
                </div>
                <div>${event.eveOriName}</div>
                <div><fmt:formatDate value="${event.eveStart}" pattern="yyyy-MM-dd"/>
                ~ <fmt:formatDate value="${event.eveEnd}" pattern="yyyy-MM-dd"/></div>
            </td>
        </c:forEach>
    </tr>
</table>
</div>


<c:import url="../../layout/footer.jsp" />
