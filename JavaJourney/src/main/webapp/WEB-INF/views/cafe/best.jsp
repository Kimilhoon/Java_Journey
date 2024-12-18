<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
	$(".custom-image img").css({
		width: "370px",
		height: "390px",
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
	width: 370px;
	height: 390px;	
	margin: 3px auto;
	overflow: hidden;
	border-radius: 8px;
}

.custom-image:hover img{
	transform: scale(1.2);
}

</style>

<div class="container custom-container">


<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./all">cafe</a></li>
		<li class="breadcrumb-item active" aria-current="page">best</li>
	</ol>
</nav>

<!-- <div class="text-center m-5"> -->
<!-- 	<h1><베스트 카페></h1> -->
<!-- </div> -->

<div class="d-flex justify-content-center">
    <div id="BestCafeList">

<table>
<tbody>

<c:forEach var="cafe" items="${BestCafeList }" varStatus="status">
	<c:if test="${status.index % 4 == 0 }">
		<tr>
	</c:if>
	
	<td class="text-center" style="flex-shrink: 0;">
		<a href="./info?cafeNo=${cafe.cafeNo }">
			<div class="custom-image">${cafe.cafeImgOriName }</div>
		</a>
			<p class="fw-bolder fs-4">${cafe.cafeName }</p>
			<p class="fw-semibold fs-5">${cafe.cafeLoc }</p>
			<p class="fw-semibold fs-6">${cafe.cafePhone }</p>
			<p>리뷰( ${cafe.reviewCount } ) | ★( ${cafe.avgRevStarPoint} )</p>
	</td>
		<c:if test="${status.index % 4 == 3 || status.last }">
		<tr></tr> <!-- 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
		</c:if>
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(BestCafeList) % 4 != 0 }">
	<c:forEach begin="1" end="${4 - (fn:length(BestCafeList) % 4) }">
		<td></td>
	</c:forEach>
<tr></tr>
</c:if>

</tbody>
</table>

</div> <!-- id="BestCafeList" End -->

</div><!-- container End -->

<div class="d-flex justify-content-center">
<button id="allCafe" type="button" class="btn btn-outline-secondary btn-lg w-75">전체 카페 보러가기 >> ${ count.cafeCount }</button>
</div>

</div>

<c:import url="../layout/footer.jsp"/>

