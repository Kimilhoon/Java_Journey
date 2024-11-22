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
         display: flex;
         gap: 100px;   
     }
#btnEventWrite{
    padding: 7px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}     
#btnCancel{
    padding: 7px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}     
</style>

<h1 class="text-center">이벤트 목록</h1>

<button id="btnEventWrite">등록</button>
<!-- <button id="btnManagerMenu">관리자메뉴로가기</button> -->
<!-- <button id="btnBack">뒤로가기</button> -->


<div class="d-flex justify-content-center">
<table class="table text-center">
	<tr>
		<td>이벤트 번호</td>
		<td>이벤트 이름</td>
		<td>이벤트 기간</td>
		<td>삭제</td>
	</tr>
    <c:forEach var="event" items="${eventList}">
    <tr>
	    <td style="text-align: center; padding: 10px;">
	    	${event.eventNo }
	    </td>
	        <!-- 이미지 표시, 크기 고정 -->
	<!--                 <div id="info" class="custom-image" -->
	<!--                  style="cursor: pointer;"> -->
	<%--                 ${event.eveImg} --%>
	<!--                 </div> -->
	    <td>
	        <div><a href="/comm/event/info?eventNo=${event.eventNo}">${event.eventName}</a></div>
		</td>
	    <td>   
	        <div><fmt:formatDate value="${event.eveStart}" pattern="yyyy-MM-dd"/>
	        ~ <fmt:formatDate value="${event.eveEnd}" pattern="yyyy-MM-dd"/></div>
	    </td>
	    <td><a href="./delete?eventNo=${event.eventNo }"><button id="btnCancel" type="button"> 삭제</button></a></td>
    </tr>
    </c:forEach>
</table>
</div>
<div id="result"></div>

<c:import url="../../layout/footer.jsp" />
