<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
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