<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
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

	
</script>
</head>
<body>
<a href="./list"><button>목록</button></a>
<a href="./update?freeBoardNo=${freeBoardView.freeBoardNo }"><button>수정</button></a>
<a href="./delete?freeBoardNo=${freeBoardView.freeBoardNo }"><button>삭제</button></a>
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
<div>
<br>
<h3>댓글입력</h3>
<textarea rows="1" cols="30" id="comment"></textarea>
<br>
<button id="btn_writeComment">댓글작성</button>
<table>
<thead>
	<tr>
		<th>댓글 내용</th>
		<th>댓글 작성자</th>
		<th>댓글 작성일</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:forEach var="freeBoardComment" items="${freeBoardCommentList }">
	<tr>
		<td>${freeBoardComment.freeBoardContent}</td>
		<td>${freeBoardComment.userNick}</td>
		<td><fmt:formatDate value="${freeBoardComment.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
		<td>
			<c:if test="${ freeBoardComment.userNick eq info.userNick}">
				<button>삭제</button>
			</c:if>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>

</div>
</body>
</html>