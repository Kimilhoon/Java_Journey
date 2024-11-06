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

<h1>카페리뷰상세보기</h1>
<br>

<div id="content">

<div id="table">
<table class="table table-bordered text-center">
	<tr>
		<td>카페명</td>
		<td colspan="3">${cafeRev.cafeName }</td>
		<td>작성자</td>
		<td colspan="2">${writerId }</td>
	</tr>
	<tr>
		<td>지역</td>
		<td>${cafeRev.cafeLoc }</td>
		<td>별점</td>
		<td>${cafeRev.revsp }</td>
		<td>작성일</td>
		<td><fmt:formatDate value="${cafeRev.revDate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<td colspan="9">${cafeRev.revContent }</td>
	</tr>
</table>
</div> <!-- table -->

<div id="bottom">
	<i class="bi bi-share"></i>
	
	<c:if test="${userId eq writerId }">
		<span><a href="./update?revNo=${cafeRev.revNo }">수정</a></span>
		<span><a href="./delete?revNo=${cafeRev.revNo }">삭제</a></span>
	</c:if>

<a href="./list"><button>목록</button></a>
<a href="./view?revNo="><button>이전</button></a>
<a href="./view?revNo="><button>다음</button></a>
</div>


</body>
</html>





















