<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"/>

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
	background-color: #faebd7; /* 배경색 설정 */
	padding: 20px; /* 내용과 배경 색 사이 여백 */
	border-radius: 10px; /* 슬라이드 모서리를 둥글게 */
}
</style>
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
            <c:forEach var="bean" items="${list}" varStatus="status">
                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                    <div class="text-center" style="flex-shrink: 0;">
                        <a href="/bean/info?beanNo=${bean.beanNo}">
                            <div class="custom-image">
                                ${bean.beanOriginName}
                            </div>
                        </a>
<%--                         <p class="fw-bold fs-4">${bean.beanName}(${bean.gram}g)</p> --%>
                        <p class="fw-bold fs-4">${bean.beanName}</p>
                        <p>${bean.origin}</p>
                        <p>리뷰 : ${bean.reviewCount}</p>
                        <p>★( ${bean.avgRevStarPoint} )</p>
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

<div id="bestCafe">
<!-- 이달의 베스트카페 -->
<%-- ${beanBestList } --%>
</div>


<!-- footer -->
<c:import url="./layout/footer.jsp"/> 

