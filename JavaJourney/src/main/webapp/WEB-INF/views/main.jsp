<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">

$(document).ready(function () {
    $(".custom-image img").css({
        width: "200px",
        height: "200px"
    });
	
    let scrollTimeout;
    $(window).on("scroll", function () {
        if (!scrollTimeout) {
            scrollTimeout = setTimeout(function () {
                const scrollPosition = $(window).scrollTop() + $(window).height();

                if ($("#background_video").offset().top < scrollPosition) {
                    $("#background_video").addClass("playing");
                }

                if ($(".banner").offset().top < scrollPosition) {
                    $(".banner").addClass("visible");
                }

                if ($("#best").offset().top < scrollPosition) {
                    $("#best").addClass("visible");
                }

                scrollTimeout = null;
            }, 100); // 100ms 간격으로 호출 제한
        }
    });

    
});






</script>

<style>

.transition {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 1s ease, transform 1s ease;
}

.transition.visible {
    opacity: 1;
    transform: translateY(0);
}

.barogagi-btn {
	display: flex;
	border: 1px solid #6f4e37;
	border-radius: 300px;
	height: 86px;
	width: 400px;
	text-align: center;
	margin: 0 auto;
	justify-content: center;
	align-items: center;
    transition: background-color 0.5s ease, color 0.5s ease, transform 0.5s ease; /* 기본 상태에도 적용 */
	
}

.barogagi-btn:hover {
    background-color: #6f4e37;
    color: white;
    transform: scale(1.05);
}

#barogagi {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 100px 80px;
}

#best {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    margin: 100px 0px 75px 0px;
}

.best {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 1s ease, transform 1s ease;
    max-width: 100%
}

.best.visible {
    opacity: 1;
    transform: translateY(0);
}

/* 배너 애니메이션 */
.banner {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 1s ease, transform 1s ease;
    max-width: 100%
}

.banner.visible {
    opacity: 1;
    transform: translateY(0);
}

#video_area {
  padding: 0;
  width: 100vw;
  overflow: hidden;
  margin-bottom: 30px;
}

/* 동영상 애니메이션 */
#background_video {
    z-index: -1;
    width: 100vw;
    height: auto;
    object-fit: cover;
    transform: translateY(30px);
    transition: opacity 1s ease, transform 1s ease;
}


#background_video.playing {
    opacity: 1;
    transform: translateY(0);
}

.custom-image img {
    border-radius: 20px;
}


.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
/*      padding: 20px; */
}

.carousel-container {
    width: 50%; /* 양쪽 배너를 나누기 위한 크기 설정 */
    position: relative;
}

.carousel-container.left .carousel-item {
    clip-path: polygon(0 0, 100% 0, 90% 100%, 0% 100%);
}

.carousel-container.right .carousel-item {
    clip-path: polygon(10% 0, 100% 0, 100% 100%, 0% 100%);
}

.carousel-item {
     background-color: #ccc;
    padding: 20px;
/*     border-radius: 10px; */
    text-align: center;
}

.carousel-indicators {
    position: flex;
   	justify-content: center;
	align-items: center;
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


</style>


<div id="video_area">
	<video id="background_video" src="/resources/bgvideo.mp4" autoplay="autoplay" loop="loop" muted="muted"></video>
</div>

<div id="best" class="container best">
	<img src="/resources/img/best_img.png">
</div>

<div class="container banner">

    <!-- Left Carousel -->
    <div class="carousel-container left">
        <div id="carouselLeft" class="carousel slide" data-bs-ride="carousel">
	         <div class="carousel-indicators" hidden="">
	             <button type="button" data-bs-target="#carouselLeft" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1""></button>
	             <button type="button" data-bs-target="#carouselLeft" data-bs-slide-to="1" aria-label="Slide 2"></button>
	             <button type="button" data-bs-target="#carouselLeft" data-bs-slide-to="2" aria-label="Slide 3"></button>
	         </div>
            <div class="carousel-inner">
                <c:forEach var="cafe" items="${cList }" varStatus="status">
                    <div class="carousel-item ${status.index == 0 ? 'active' : '' }">
	           	 		<div class="custom-image">
	                        <a href="/cafe/info?cafeNo=${cafe.cafeNo }">
							${cafe.cafeImgOriName }
	                            <p class="fw-bold fs-4">${cafe.cafeName }</p>
	                        </a>
	                        <p>${cafe.cafeLoc }</p>
	                        <p>리뷰: ${cafe.reviewCount } ★(${cafe.avgRevStarPoint })</p>
                    	</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

        <!-- Right Carousel -->
    <div class="carousel-container right">
        <div id="carouselRight" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators" hidden="">
                <button type="button" data-bs-target="#carouselRight" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselRight" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselRight" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
            	<c:if test="${not empty bList }" var="test">
	                <c:forEach var="bean" items="${bList }" varStatus="status">
	                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
	                    	 <div class="custom-image">
	                      	  <a href="/bean/info?beanNo=${bean.beanNo}">
	                                ${bean.beanOriginName}
	                            <p class="fw-bold fs-4">${bean.beanName}</p>
	                        </a>
	                        <p>${bean.origin}</p>
	                        <p>리뷰: ${bean.reviewCount} ★(${bean.avgRevStarPoint})</p>
	                    </div>
	                    </div>
	                </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>

              	  
<div id="barogagi">
	<a href="/quiz/quizForm" class="barogagi-btn">
		취향조사 하러가기
	</a>
	<a href="/comm/freeboard/list" class="barogagi-btn">
		자유게시판 바로가기
	</a>
</div>

<!-- footer -->
<c:import url="./layout/footer.jsp"/> 
