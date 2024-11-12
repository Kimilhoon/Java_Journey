<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<h1>찜목록</h1> 

<div class="col-6 d-flext flex-column">
<div id="order-list" class="mb-2">
<a href="#">전체보기</a>
&nbsp;|&nbsp;
<a href="#">카페</a>
&nbsp;|&nbsp;
<a href="#">원두</a>
</div> <!-- order-list -->
</div>

<div class="container mt-5">
<form class="d-flex justify-content-end" action="">
	<div class="col-2">
	<input class="form-control me-2" type="search" placeholder="검색어 입력" aria-label="Search">
	</div>
	<span style="margin-right: 5px;"></span>
	<button class="btn btn-primary" type="submit">검색</button>
</form>
</div>



<div class="container">
<table>
<c:forEach var="cafe" items="${cafeWishNoList }">
<tr>
	<td>${cafe.cafeInfo }</td>
	<td>${cafe.cafeName }</td>
</tr>
</c:forEach>
</table>
<table>
<c:forEach var="bean" items="${beanWishList }">
<tr>
	<td>${bean.beanOriginName }</td>
	<td>${bean.beanName }</td>
</tr>
</c:forEach>
</table>
</div>



<c:import url="../layout/footer.jsp"/>