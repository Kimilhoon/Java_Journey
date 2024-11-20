<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<h1 class="text-center">취향결과</h1> 
<script type="text/javascript">
$(function () {
	$(".custom-image img").css({
        width: "200px",
        height: "200px"
    });
})
</script>
<style>
.carousel-item{
	background-color: #ece6cc; /* 배경색 설정 */
	padding: 20px; /* 내용과 배경 색 사이 여백 */
	border-radius: 10px; /* 슬라이드 모서리를 둥글게 */
}
</style>
<div class="container">
<!--  -->
<div class="container" style="width: 330px;">
<div id="bestBean">
    <!-- 이달의 베스트원두 -->
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <!-- Indicators (optional) -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <!-- carousel items -->
        <div class="carousel-inner">
            <c:forEach var="myresult" items="${MyQuizResult }" varStatus="status">
                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                    <div class="text-center" style="flex-shrink: 0;">
                        <a href="/bean/info?beanNo=${myresult.beanNo}">
                            <div class="custom-image">
                                ${myresult.beanOriginName}
                            </div>
                        </a>
                        <p>${myresult.cupNoteName}</p>
                        <p>${myresult.grindName}</p>
                        <p>${myresult.extractionName}</p>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Controls -->
        <button class="carousel-control-prev btn btn-dark" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next btn btn-dark" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
</div>
</div>



<c:import url="../layout/footer.jsp"/>