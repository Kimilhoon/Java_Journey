<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<div class="container">

<div class="text-center mb-5">
	<h1><전체 카페></h1>
</div>

	<div class="mb-2">
	<label for="location">지역 : </label>
		<select id="location" name="location">
			<option value="AllLocation">전체</option>
			<option value="Gangnamgu">강남구</option>
			<option value="Seochogu">서초구</option>
			<option value="Songpagu">송파구</option>
			<option value="jongrogu">종로구</option>
			<option value="Seodaemungu">서대문구</option>
			<option value="Mapogu">마포구</option>
		</select>
	</div>

	<div id="AllCafeList" class="cafe-grid">
		<c:forEach var="cafe" items="${AllCafeList }">
			<div class="cafe-item">
				<a href=".info?cafeNo=${cafe.cafeNo }">
					<img alt="${cafe.cafeName }" src="/resources/img/cafe/c01.jpg" style="width: 70%;">
				</a>
				<div class="cafe-details">
					<p class="cafe-name">${cafe.cafeName}</p>
			        <p class="cafe-comm">${cafe.cafeComm}</p>
			        <p class="cafe-add">${cafe.cafeAdd1}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div><!-- div:container End -->

<c:import url="../layout/page.jsp"/>

<c:import url="../layout/footer.jsp"/>
