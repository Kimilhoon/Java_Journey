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

	<div class="row row-cols-1 g-1 grid gap-4">
	
		<div class="card text-center " style="width: 25rem;">
			<a href="./info"><img src="<c:url value='/resources/img/cafe/c01.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">가타커피</p>
				<p class="card-text fw-semibold fs-5">서울 송파구</p>
				<p class="card-text fw-light fs-6">리뷰 : 111 | ★ 4.0</p>
			</div></a>
		</div>
		
		<div class="card text-center" style="width: 25rem;">
			<a><img src="<c:url value='/resources/img/cafe/c02.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">슬로우커피</p>
				<p class="card-text fw-semibold fs-5">서울 강남구</p>
				<p class="card-text fw-light fs-6">리뷰 : 102 | ★ 4.0</p>
			</div></a>
		</div>
		
		<div class="card text-center" style="width: 25rem;">
			<a><img src="<c:url value='/resources/img/cafe/c05.jpg' />"
			 class="card-img-top rounded mx-auto d-block" alt="${cafe.cafeName}">
			<div class="card-body">
				<p class="card-text fw-bolder fs-4">카페온화(익선점)</p>
				<p class="card-text fw-semibold fs-5">서울 종로구</p>
				<p class="card-text fw-light fs-6">리뷰 : 1,045 | ★ 5.0</p>
			</div></a>
		</div>

	</div>

	<div></div>

	<div class="d-grid gap-2 col-6 mx-auto" >
		<a href="./all"><button class="btn btn-primary" type="button">전체카페 보러가기</button></a>
	</div>

</div><!-- container End -->

    




<%-- <c:import url="../layout/footer.jsp"/> --%>