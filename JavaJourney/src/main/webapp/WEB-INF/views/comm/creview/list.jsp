<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>


</style>

</head>
<body>

<c:import url="../../layout/header.jsp" />

<h1>카페리뷰리스트</h1>
<br>

<div id="content">
<div class="container" id="top">

<div class="col6 text-right">
<div id="order-list">
<a href="./list?order=recent">최근리뷰순</a>
|
<a href="./list?order=star">별점높은순</a>
|
<a href="./list?order=popular">인기많은순</a>
</div> <!-- order-list -->

<div id="category-list">
카테고리
<select id="category">
      <option value="all">전체</option>
      <option value="seoul">서울</option>
      <option value="gyeonggi">경기</option>
      <option value="incehon">인천</option>
      <option value="busan">부산</option>
      <option value="jeju">제주</option>
   </select>
</div> <!-- category-list -->
</div> <!-- col -->


<div class="col-6 text-right">
<div id="search">
<form class="search-box" action="./list" method="get">
	<input class="search-txt" type="text" name="search">
	<button class="search-btn" type="submit">
		<i class="bi bi-search"></i>
	</button>
</form>
</div> <!-- search -->
</div> <!-- col -->

</div> <!-- container -->
</div> <!-- content -->

<div class="container" id="center">

<table class="table text-center">
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">지역</th>
	<th class="col-5" scope="col">카페이름</th>
	<th class="col-2" scope="col">작성자</th>
	<th class="col-2" scope="col">작성일</th>
	<th class="col-1" scope="col">별점</th>
</tr>

<c:forEach var="list" items="${creviewList }">
	<tr>
	<td class="col-1" scope="row">${list.revNo }</td>
	<td class="col-1">${list.cafeLoc }</td>
	<td class="col-5">
		<a href="./view?revNo=${list.revNo }">
		${list.cafeName }
		</a>
	</td>
	<td class="col-2">${list.userNo }</td>
	<td class="col-2"><fmt:formatDate value="${list.revDate }" pattern="yyyy-MM-dd"/></td>
	<td class="col-1">${list.revsp }</td>
	</tr>
</c:forEach>

</table>

<div id="write-btn" class="row">
        <div class="col-1">
        <a href="./write"><input type="button" class="btn btn-primary" value="글 작성"></a>
        </div>
</div>

</div>

</body>
</html>





















