<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"> 
<script type="text/javascript">
$(function() {
	
	$(".hit").click(function() {
		
		$.ajax({
			url: "./hit?freeBoardNo="+$(this).parent().prev().prev().text(),
			type: "get",
			dataType: "",
			success: function() {
				
			},
			error: function() {
				
			}
			
		});
	});
	$("#btn_search").click(function() {
// 		console.log($("#search").val());
// 		console.log($("#category").val());
		$.ajax({
			url: "./list",
			type: "get",
			data:{
				"search":$("#search").val(),
				"category":$("#category").val()
			},
			dataType: "html",
			success: function(res) {
// 				console.log(res);
				$("body").children().remove();
				$("body").html(res); 
			},
			error: function() {
				
			}
			
		});
		
	});
	
})

</script>
</head>
<body>
<h1>자유게시판 리스트</h1>
<a href="./list"><button>목록</button></a>
<a href="./write"><button>작성</button></a>
<br>
<div>
	<select id="category">
		<option value="all">전체</option>
		<option value="cafe">카페</option>
		<option value="bean">원두</option>
	</select>
	<input type="text" id="search"><button id="btn_search">검색</button>
</div>

<div>
<table>
<thead>
	<tr>
		<th>보드 넘버</th>
		<th>보드 분류</th>
		<th>보드 제목</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="freeBoardList" items="${freeBoardList }">
	<tr>
		<td>${freeBoardList.freeBoardNo}</td>
		<td>${freeBoardList.freeBoardCategory}</td>
		<td><a href="./view?freeBoardNo=${freeBoardList.freeBoardNo }"class="hit" >${freeBoardList.freeBoardTitle}</a></td>
		<td>${freeBoardList.freeBoardHit}</td>
		<td><fmt:formatDate value="${freeBoardList.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>

	</c:forEach>
</tbody>
</table>
</div>
<div>
	<a href="./list?curPage=${paging.curPage-1  }&search=${search}">이전</a>
	<a href="./list?curPage=${paging.curPage+1  }&search=${search}">다음</a>
</div>

</body>
</html>