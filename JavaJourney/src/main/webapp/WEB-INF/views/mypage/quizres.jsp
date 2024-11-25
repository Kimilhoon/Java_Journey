<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function () {
	$(".custom-image img").css({
        width: "400px",
        height: "300px",
        objectFit: "container",      // 이미지가 썸네일 크기에 맞도록 설정
        borderRadius: "8px"      // 모서리를 둥글게 (선택 사항)
    });
	
	$("#btnRestart").click(function() {
		location.href = "/quiz/quizForm?userNo=" + "${MyQuizResult[0].userNo }";
	});
})
</script>
<style type="text/css">
#btnRestart { 
    width: 900px;
    padding: 10px;
    background-color: #d1a589;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}
</style>

<div class="container" style="width: 900px; height:385px; background-color: #f8f5f0; padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
    <div class="d-flex" style="align-items: flex-start;">
        <!-- Image Section -->
        <div class="custom-image" style="margin-right: 20px; margin-top: 20px; margin-left: 30px;">
            <a href="/bean/info?beanNo=${MyQuizResult[0].beanNo }">
            ${MyQuizResult[0].beanOriginName }
            </a>	
        </div>
        <!-- Info Section -->
        <div id="beanInfo" style="flex-grow: 1;">
            <h2 style="margin-left: 40px; margin-top: 20px; color: #5d4037; font-family: 'Arial', sans-serif;">취향 정보</h2>
            <ul style="margin-left: 40px; margin-top: 20px; list-style: none; padding: 0; font-size: 16px; color: #4e342e;">
                <li><strong>원두명:</strong> ${MyQuizResult[0].beanName }</li>
                <li><strong>맛:</strong> ${MyQuizResult[0].cupNoteName }, ${MyQuizResult[1].cupNoteName }</li>
                <li><strong>분쇄:</strong> ${MyQuizResult[0].grindName }</li>
                <li><strong>추출:</strong> ${MyQuizResult[0].extractionName }</li>
            </ul>
            <p style="margin-left: 40px; margin-top: 20px; margin-bottom: 5px; font-size: 16px; color: #6d4c41;"><strong>원두 정보</strong></p>
			<p style="margin-left: 40px; font-size: 14px; color: #795548;
	          	max-width: 300px; max-height: 200px;
          		overflow: hidden; text-overflow: ellipsis; 
          		display: -webkit-box; -webkit-line-clamp: 5; 
          		-webkit-box-orient: vertical;">
    			${MyQuizResult[0].beanComm}
			</p>
        </div>
    </div>
</div>
<div style="text-align:center; margin-top: 20px;">
<a style="text-decoration: none;"><button id="btnRestart">취향조사 다시하기</button></a>
</div>

<c:import url="../layout/footer.jsp"/>