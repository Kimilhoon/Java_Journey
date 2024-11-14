<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<div class="container-lg position-center">

	<div class="text-center ">
		<h1><베스트 카페></h1>
	</div>

<div id="BestCafeList">
<table>
<tbody>

<c:forEach var="cafe" items="${BestCafeList }" varStatus="status">
	<c:if test="${status.index % 4 == 0 }">
		<tr>
	</c:if>
	
<!-- 		<div class="card text-center" style="width: 20rem;"> -->
<%-- 			<a href="./info"><img src="<c:url value='/resources/img/cafe/c01.jpg' />" --%>
<%-- 			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}"></a> --%>
<!-- 			<div class="card-body"> -->
<!-- 				<p class="card-text fw-bolder fs-4">가타커피</p> -->
<!-- 				<p class="card-text fw-semibold fs-5">서울 송파구</p> -->
<!-- 				<p class="card-text fw-light fs-6">리뷰 : 111 | ★ 4.0</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
	
	<td class="card text-center" style="flex-shrink: 0; width: 18rem;">
		<a href="./info?cafeNo=${cafe.cafeNo }">
			<img alt="${cafe.cafeName }" src="/resources/img/cafe/${cafe.cafeImgOriName }">
<%-- 			${cafe.cafeImgOriName } --%>
		</a>
			<p class="card-text fw-bolder fs-4">${cafe.cafeName }</p>
			<p class="card-text fw-semibold fs-5">${cafe.cafeLoc }</p>
			<p class="card-text fw-semibold fs-5">${cafe.cafePhone }</p>
			<p class="card-text fw-light fs-6">리뷰 : ${cafe.reviewCount }</p>
	</td>
		<c:if test="${status.index % 4 == 3 || status.last }">
		</tr> <!-- 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
		</c:if>
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(AllCafeList) % 4 != 0 }">
	<c:forEach begin="1" end="${4 - (fn:length(AllCafeList) % 4) }">
		<td></td>
	</c:forEach>
</tr>
</c:if>

</tbody>
</table>

</div> <!-- id="AllcafeList" End -->

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

	</div>


</div><!-- container End -->
<div>
	<br>
</div>

<div class="text-center">
	<a class="btn btn-secondary" href="./all" role="button">전체 카페</a>
</div>





<c:import url="../layout/footer.jsp"/>