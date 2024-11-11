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
	
	$(".custom-image").css({
	    "margin-right": "30px", // 오른쪽 여백
	    "margin-left": "30px", // 왼쪽 여백
	    "display": "inline-block", // 가로로 나열
	    "text-align": "center", // 텍스트를 가운데 정렬
// 	    "width": "100px" // 가로 너비 설정 (필요에 따라 조정)
	});
	
	$(".custom-image img").css({
        width: "200px",
        height: "200px"
    });
	
// 	$("#info").click(function () {
// 		$.ajax({
// 			type: "get"
// 			,url: "/event/info?event=" + $("#eventNo").val()
// 			,data: {eventNo: $("#eventNo").val()}
// 			,dataType:"json"
// 			,success: function(res) {
// 				console.log("ajax 성공");	
// 			}
// 			,error: function () {
// 				console.log("ajax 실패");	
// 			}
// 		})
// 	})
	
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
            <input type="number" id="eventNo" 
            name="eventNo" value="${event.eventNo }" hidden="hidden"> 
                <!-- 이미지 표시, 크기 고정 -->
                <div id="info" class="custom-image">
                <a href="/comm/event/info?eventNo=${event.eventNo}">${event.eveImg}</a>
                </div>
<!--                 <div id="info" class="custom-image" -->
<!--                  style="cursor: pointer;"> -->
<%--                 ${event.eveImg} --%>
<!--                 </div> -->
                <div>${event.eveOriName}</div>
                <div><fmt:formatDate value="${event.eveStart}" pattern="yyyy-MM-dd"/>
                ~ <fmt:formatDate value="${event.eveEnd}" pattern="yyyy-MM-dd"/></div>
            </td>
        </c:forEach>
    </tr>
</table>
</div>
<div id="result"></div>

<c:import url="../../layout/footer.jsp" />
