<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
	$(".custom-image img").css({
		width: "400px",
		height: "560px",
        objectFit: "container",		// 이미지가 썸네일 크기에 맞도록 설정
        borderRadius: "8px"		// 모서리를 둥글게 (선택 사항)
		 
	});
	
	$("#allCafe").click(function() {
		location.href = "./all";
	})
	
})
</script>

<style type="text/css">

.custom-container{
	width: 1250px;
	max-width: 100%;
}

img{
	max-width: 100%;
	transition: all 0.3s linear; /* 애니메이션 효과를 부여해줌 */
}

.custom-image{
	width: 400px;
	height: 560px;	
	margin: 0px auto;
	overflow: hidden;
	border-radius: 8px;
}

.custom-image:hover img{
	transform: scale(1.2);
}

</style>

<div class="container custom-container">

	<div class="text-center m-5">
		<h1><베스트 카페></h1>
	</div>

<nav style="--breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">best</li>
	</ol>
</nav>


<div id="BestCafeList" class="mx-auto">

<table>
<tbody>

<c:forEach var="cafe" items="${BestCafeList }" varStatus="status">
	<c:if test="${status.index % 4 == 0 }">
		<tr>
	</c:if>
	
	<td class="text-center" style="flex-shrink: 0;">
		<a href="./info?cafeNo=${cafe.cafeNo }">
			<img alt="${cafe.cafeName }" src="${cafe.cafeImgOriName }">
<%-- 			<div class="custom-image">${cafe.cafeImgOriName }</div> --%>
		</a>
			<p class="fw-bolder fs-4">${cafe.cafeName }</p>
			<p class="fw-semibold fs-5">${cafe.cafeLoc }</p>
			<p class="fw-semibold fs-6">${cafe.cafePhone }</p>
			<p>리뷰 : ${cafe.reviewCount } | ★(${cafe.avgRevStarPoint})</p>
	</td>
		<c:if test="${status.index % 4 == 3 || status.last }">
		</tr> <!-- 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
		</c:if>
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(BestCafeList) % 4 != 0 }">
	<c:forEach begin="1" end="${4 - (fn:length(BestCafeList) % 4) }">
		<td></td>
	</c:forEach>
</tr>
</c:if>

</tbody>
</table>

</div> <!-- id="BestCafeList" End -->

<!-- 	<div class="row row-cols-1 g-1 grid gap-4"> -->
	
<!-- 		<div class="card text-center " style="width: 23rem;"> -->
<%-- 			<a href="./info"><img src="<c:url value='/resources/img/cafe/c01.jpg' />" --%>
<%-- 			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}"></a> --%>
<!-- 			<div class="card-body"> -->
<%-- 				<p class="card-text fw-bolder fs-4">${cafe.cafeName }가타커피</p> --%>
<%-- 				<p class="card-text fw-semibold fs-5">${cafe.cafeLoc }서울 송파구</p> --%>
<%-- 				<p class="card-text fw-light fs-6">${cafe.cafeRev }리뷰 : 111 | ★ 4.0</p> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		<div class="card text-center" style="width: 23rem;"> -->
<%-- 			<a><img src="<c:url value='/resources/img/cafe/c02.jpg' />" --%>
<%-- 			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}"></a> --%>
<!-- 			<div class="card-body"> -->
<!-- 				<p class="card-text fw-bolder fs-4">슬로우커피</p> -->
<!-- 				<p class="card-text fw-semibold fs-5">서울 강남구</p> -->
<!-- 				<p class="card-text fw-light fs-6">리뷰 : 102 | ★ 4.0</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		<div class="card text-center" style="width: 23rem;"> -->
<%-- 			<a><img src="<c:url value='/resources/img/cafe/c05.jpg' />" --%>
<%-- 			 class="card-img-top rounded mx-auto d-block" alt="${cafeInfo.cafeName}"></a> --%>
<!-- 			<div class="card-body"> -->
<%-- 				<p class="card-text fw-bolder fs-4">${cafe.cafeName }</p> --%>
<%-- 				<p class="card-text fw-semibold fs-5">${cafe.cafeLoc }</p> --%>
<%-- 				<p class="card-text fw-light fs-6">리뷰 : ${cafe.reviewCount } | ★ 4.0</p> --%>
<!-- 				<p class="card-text fw-bolder fs-4">카페온화(익선점)</p> -->
<!-- 				<p class="card-text fw-semibold fs-5">서울 종로구</p> -->
<!-- 				<p class="card-text fw-light fs-6">리뷰 : 1,045 | ★ 5.0</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


</div><!-- container End -->

<!-- <div class="text-center"> -->
<!-- 	<a class="btn btn-secondary" href="./all" role="button">전체 카페</a> -->
<!-- </div> -->
<div class="d-flex justify-content-center">
<button id="allCafe" type="button" class="btn btn-outline-secondary btn-lg w-75">전체 카페 보러가기 >> ${ count.cafeCount }</button>
</div>

<c:import url="../layout/footer.jsp"/>

