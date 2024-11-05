<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
</head>
<body>
<a href="./list"><button>목록</button></a>
<div>
<table>
<thead>
	<tr>
		<th>보드 넘버</th>
		<th>보드 분류</th>
		<th>보드 제목</th>
		<th>보드 내용</th>
		<th>보드 작성자</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${freeBoardView.freeBoardNo}</td>
		<td>${freeBoardView.freeBoardCategory}</td>
		<td>${freeBoardView.freeBoardTitle}</td>
		<td>${freeBoardView.freeBoardContent}</td>
		<td>${member.userNick}</td>
		<td>${freeBoardView.freeBoardHit}</td>
		<td><fmt:formatDate value="${freeBoardView.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>

</tbody>
</table>
</div>
</body>
</html>