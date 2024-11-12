<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<div class="container-lg position-relative">
	<div class="text-center position-relative">
		<h1><전체 카페></h1>
	</div><!-- <h1> End -->

<form action="./all" method="post">
<div id="up" class="mb-4 d-flex flex-row align-items-center">

	<div class="me-auto d-flex justify-content-start">
	<label for="location" class="col-sm-4 col-form-label">지역 : </label>
		<div>
		<select id="location" name="location" class="form-select">
			<option value="AllLocation" selected="disabled">전 체</option>
			<option value="Gangnamgu">강남구</option>
			<option value="Seochogu">서초구</option>
			<option value="Songpagu">송파구</option>
			<option value="jongrogu">종로구</option>
			<option value="Seodaemungu">서대문구</option>
			<option value="Mapogu">마포구</option>
		</select>
		</div>
	</div>
</div>
</form>
		
		
<!-- <div class="row row-cols-1 row-cols-md-1 g-1 grid gap-1"> -->
<div class="row row-cols-1 row-cols-md-1 g-1 grid gap-1">
	
		<div class="card text-center" style="width: 20rem;">
			<a href="./info"><img src="<c:url value='/resources/img/cafe/c01.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}"></a>
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">가타커피</p>
				<p class="card-text fw-semibold fs-5">서울 송파구</p>
				<p class="card-text fw-light fs-6">리뷰 : 111 | ★ 4.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c02.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">슬로우커피</p>
				<p class="card-text fw-semibold fs-5">서울 강남구</p>
				<p class="card-text fw-light fs-6">리뷰 : 102 | ★ 4.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c03.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">잇테이블</p>
				<p class="card-text fw-semibold fs-5">서울 강남구</p>
				<p class="card-text">리뷰 : 85 | ★ 5.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c04.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">Three Of Cups</p>
				<p class="card-text fw-semibold fs-5">서울 서초구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 91 | ★ 5.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c05.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">카페온화(익선점)</p>
				<p class="card-text fw-semibold fs-5">서울 종로구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 1,045 | ★ 5.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c06.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">일월일일</p>
				<p class="card-text fw-semibold fs-5">서울 종로구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 100 | ★ 4.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c07.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">커피앰비어스</p>
				<p class="card-text fw-semibold fs-5">서울 송파구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 65 | ★ 5.0</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c08.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">존스몰로스터리</p>
				<p class="card-text fw-semibold fs-5">서울 마포구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 94 | ★ 4.5</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c09.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">헤일우드</p>
				<p class="card-text fw-semibold fs-5">서울 서대문구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 87 | ★ 4.5</p>
			</div>
		</div>
		
		<div class="card text-center" style="width: 20rem;">
			<img src="<c:url value='/resources/img/cafe/c03.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">커피브론즈</p>
				<p class="card-text fw-semibold fs-5">서울 종로구</p>
				<p class="card-text fw-light fs-6"">리뷰 : 75 | ★ 3.5</p>
			</div>
		</div>
		
	</div>
	


</div><!-- container End -->


<%-- <c:import url="../layout/page.jsp"/> --%>

<c:import url="../layout/footer.jsp"/>
