<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<h1>뷰</h1>
<a href="./list"><button>목록</button></a>
<c:if test="${member.userNick eq userNick}">
	<a href="./update?myRipNo=${myRecipeView.myRipNo }"><button>수정</button></a>
	<a href="./delete?myRipNo=${myRecipeView.myRipNo }"><button>삭제</button></a>
</c:if>
<div>

<div id="select_quiz" >
	<label>원두이름:${myRecipeView.beanName }</label><br>
	<label>추출법:${myRecipeView.extractionName }</label><br>
	<label>분쇄도:${myRecipeView.grindName }</label><br>
	<label>맛:${myRecipeView.cupNoteName }</label><br>
	
	<c:forEach items="${cList }" var="cList">
		<label>${cList.cupNoteName }<input type="checkbox" name="cupNoteNo" value="${cList.cupNoteName }" id="${cList.cupNoteName }"class="cupNote"></label>
	</c:forEach>
</div>
<table>
<thead>



	<tr>
		<th>보드 넘버</th>
		<th>보드 제목</th>
		<th>보드 내용</th>
		<th>보드 작성자</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
		<th>파일 이름</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td class="bno">${myRecipeView.myRipNo}</td>
		<td>${myRecipeView.myRipTitle}</td>
		<td>${myRecipeView.myRipContent}</td>
		<td>${member.userNick}</td>
		<td>${myRecipeView.myRipHit}</td>
		<td><fmt:formatDate value="${myRecipeView.myRipWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
		<td>${myRecipeView.myRipFileOriginName}</td>
	</tr>

</tbody>
</table>

</div>
<button id="btn_rec">☆추천</button>

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
		<td class="cno">${freeBoardComment.commentContent}</td>
		<td>${freeBoardComment.userNick}</td>
		<td><fmt:formatDate value="${freeBoardComment.commentDate }" pattern="yyyy년 MM월 dd일"/></td>
		<td style="display: none;">${freeBoardComment.commentNo }</td>
		<td>
			<c:if test="${ freeBoardComment.userNick eq userNick}">
				<button class="btn_cDelete">삭제</button>
			</c:if>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>