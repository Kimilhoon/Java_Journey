<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
</head>
<body>
<h1>자유게시판 리스트</h1>
<a href="./list"><button>목록</button></a>
<a href="./write"><button>작성</button></a>
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
		<td><a href="./view?freeBoardNo=${freeBoardList.freeBoardNo }" >${freeBoardList.freeBoardTitle}</a></td>
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