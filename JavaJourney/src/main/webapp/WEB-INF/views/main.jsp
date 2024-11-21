<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(function () {
   $(".custom-image img").css({
        width: "200px"
        , height: "200px"
    });
})

document.addEventListener("DOMContentLoaded", function () {
    const banner = document.querySelector(".banner");
    const video = document.getElementById("background_video");

    // 스크롤 이벤트 처리
    window.addEventListener("scroll", function () {
        const scrollPosition = window.scrollY + window.innerHeight;

        // 배너 표시: 스크롤 시 배너가 보이면 애니메이션 적용
        if (banner && banner.getBoundingClientRect().top < scrollPosition) {
            banner.classList.add("visible");
        }

        // 동영상 재생 효과
        if (video && video.getBoundingClientRect().top < scrollPosition) {
            video.classList.add("playing");
        }
    });
});



</script>

<style>

/* 배너 애니메이션 */
.banner {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 1s ease, transform 1s ease;
}

.banner.visible {
    opacity: 1;
    transform: translateY(0);
}

/* 동영상 애니메이션 */
#background_video {
    opacity: 0;
    transition: opacity 1s ease;
}

#background_video.playing {
    opacity: 1;
}

.custom-image img {
	padding: 20px;
	background-color: f5f5f5;
}

.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
/*      padding: 20px; */
/*      background-color: #f5f5f5; */
}

.carousel-container {
    width: 48%; /* 양쪽 배너를 나누기 위한 크기 설정 */
    position: relative;
}

.carousel-container.left .carousel-item {
    clip-path: polygon(0 0, 100% 0, 90% 100%, 0% 100%);
}

.carousel-container.right .carousel-item {
    clip-path: polygon(10% 0, 100% 0, 100% 100%, 0% 100%);
}

.carousel-item {
    background-color: #faebd7;
    padding: 20px;
/*     border-radius: 10px; */
    text-align: center;
}

.carousel-indicators {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 5px;
}

.carousel-indicators button {
    background-color: #666; /* 기본 색상 */
    border: none; /* 테두리 제거 */
    opacity: 0.8; /* 약간의 투명도 */
    transition: background-color 0.3s ease, transform 0.3s ease; /* 클릭 시 애니메이션 효과 */
}

#video_area {
  padding: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}
#background_video {
    z-index: -1;
    width: 100vw;
}

</style>

<div id="video_area">
<video id="background_video" src="/resources/bgvideo.mp4" autoplay="autoplay" loop="loop" muted="muted"></video>
</div>

<div class="container banner">

    <!-- Left Carousel -->
    <div class="carousel-container left">
        <div id="carouselLeft" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselLeft" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselLeft" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselLeft" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <c:forEach var="cafe" items="${cList }" varStatus="status">
                    <div class="carousel-item ${status.index == 0 ? 'active' : '' }">
            	 		<div class="custom-image">
                                ${cafe.cafeImgOriName }
                          </div>
                        <a href="/cafe/info?cafeNo=${cafe.cafeNo }">
                            <p class="fw-bold fs-4">${cafe.cafeName }</p>
                        </a>
                        <p>${cafe.cafeLoc }</p>
                        <p>리뷰: ${cafe.reviewCount } ★(${cafe.avgRevStarPoint })</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Left Carousel -->
    <div class="carousel-container right">
        <div id="carouselRight" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselRight" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselRight" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselRight" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <c:forEach var="bean" items="${bList}" varStatus="status">
                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                    	 <div class="custom-image">
                                ${bean.beanOriginName}
                          </div>
                        <a href="/bean/info?beanNo=${bean.beanNo}">
                            <p class="fw-bold fs-4">${bean.beanName}</p>
                        </a>
                        <p>${bean.origin}</p>
                        <p>리뷰: ${bean.reviewCount} ★(${bean.avgRevStarPoint})</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- footer -->
<c:import url="./layout/footer.jsp"/> 
