<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<h1 class="text-center">취향결과</h1> 
<script type="text/javascript">
$(function () {
	$(".custom-image img").css({
        width: "300px",
        height: "300px"
    });
})
</script>
<style type="text/css">
#btnRestart { 
    width: 48%;
    padding: 10px;
    background-color: #d1a589;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}
</style>
<div class="container" style="width: 900px; height:350px; background-color: #f8f5f0; padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
    <div class="d-flex" style="align-items: flex-start;">
        <!-- Image Section -->
        <div class="custom-image" style="margin-right: 20px;">
            <div style="width: 310px; height: 305px; object-fit: cover; border-radius: 10px; border: 2px solid #d1a589;">
            <a href="/bean/info?beanNo=${MyQuizResult[0].beanNo }">
            ${MyQuizResult[0].beanOriginName }
            </a>	
            </div>
        </div>
        <!-- Info Section -->
        <div id="beanInfo" style="flex-grow: 1;">
            <h2 style="margin-left: 200px; color: #5d4037; font-family: 'Arial', sans-serif;">취향 정보</h2>
            <ul style="margin-left: 200px; list-style: none; padding: 0; font-size: 16px; color: #4e342e;">
                <li><strong>원두명:</strong> ${MyQuizResult[0].beanName }</li>
                <li><strong>맛:</strong> ${MyQuizResult[0].cupNoteName }, ${MyQuizResult[1].cupNoteName }</li>
                <li><strong>분쇄:</strong> ${MyQuizResult[0].grindName }</li>
                <li><strong>추출:</strong> ${MyQuizResult[0].extractionName }</li>
            </ul>
            <p style="margin-left: 200px; font-size: 14px; color: #6d4c41;">원두 정보</p>
            <p style="margin-left: 200px; font-size: 14px; color: #795548;">${MyQuizResult[0].beanComm }</p>
        </div>
    </div>
</div>
<div style="text-align:center; margin-top: 20px;">
<a style="text-decoration: none;" href="/quiz/quizForm"><button id="btnRestart">취향조사 다시하기</button></a>
</div>

<c:import url="../layout/footer.jsp"/>