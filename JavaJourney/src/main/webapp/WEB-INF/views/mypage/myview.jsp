<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../layout/header.jsp" />

<h1>< 작성 글 확인 ></h1>
<hr>


<div id="category-list">
카테고리
	<select id="category">
		<c:choose>
			<c:when test="${category eq '전체' }">
				<option value="all" selected="selected">전체</option>
			</c:when>
			<c:otherwise>
				<option value="all">전체</option>
			</c:otherwise>		
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '카페 리뷰' }">
				<option value="카페 리뷰" selected="selected">카페 리뷰</option>
			</c:when>
			<c:otherwise>
				<option value="카페 리뷰">카페 리뷰</option>
			</c:otherwise>		
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '원두 리뷰' }">
				<option value="원두 리뷰" selected="selected">원두 리뷰</option>
			</c:when>
			<c:otherwise>
				<option value="원두 리뷰">원두 리뷰</option>
			</c:otherwise>		
		</c:choose>	
		
		<c:choose>
			<c:when test="${category eq '자유게시판' }">
				<option value="자유게시판" selected="selected">자유게시판</option>
			</c:when>
			<c:otherwise>
				<option value="자유게시판">자유게시판</option>
			</c:otherwise>		
		</c:choose>
	
		<c:choose>
			<c:when test="${category eq '나만의 레시피' }">
				<option value="나만의 레시피" selected="selected">나만의 레시피</option>
			</c:when>
			<c:otherwise>
				<option value="나만의 레시피">나만의 레시피</option>
			</c:otherwise>		
		</c:choose>			
	</select>

</div> <!-- category-list -->

<table>
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">테마</th>
	<th class="col-1" scope="col">제목</th>
	<th class="col-1" scope="col">작성일</th>
</tr>

<c:forEach var="myView" items="${myView }" varStatus="status">
<tr>
	<td>${count - status.index}</td> <!-- 최신 글이 마지막 번호, 오래된 글이 1번 -->
	<td>${myView.cafeName}</td>
	<td>${myView.cafeNo}</td>
	<td><fmt:formatDate value="${myView.revDate}" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table>





<!-- <h2>내 리뷰</h2> -->

<!-- <!-- 카테고리 선택 --> -->
<!-- <form method="get" action="/myview"> -->
<!--     <label for="category">카테고리:</label> -->
<!--     <select name="category" id="category"> -->
<%--         <option value="all" ${category eq 'all' ? 'selected' : ''}>전체</option> --%>
<%--         <option value="카페 리뷰" ${category eq '카페 리뷰' ? 'selected' : ''}>카페 리뷰</option> --%>
<%--         <option value="원두 리뷰" ${category eq '원두 리뷰' ? 'selected' : ''}>원두 리뷰</option> --%>
<%--         <option value="자유게시판" ${category eq '자유게시판' ? 'selected' : ''}>자유게시판</option> --%>
<%--         <option value="나만의 레시피" ${category eq '나만의 레시피' ? 'selected' : ''}>나만의 레시피</option> --%>
<!--     </select> -->
<!--     <button type="submit">조회</button> -->
<!-- </form> -->

<!-- <table> -->
<!-- <tr> -->
<!--     <th class="col-1" scope="col">글번호</th> -->
<!--     <th class="col-1" scope="col">테마</th> -->
<!--     <th class="col-1" scope="col">제목</th> -->
<!--     <th class="col-1" scope="col">작성일</th> -->
<!-- </tr> -->

<%-- <c:forEach var="view" items="${myView}" varStatus="status"> --%>
<!-- <tr> -->
<%--     <td>${status.index + 1}</td> <!-- 글번호 출력 --> --%>
<!--     <td> 테마 -->
<%--         <c:choose> --%>
<%--             <c:when test="${view.class.simpleName == 'CafeRev'}"> <!-- class.simpleName이란 클래스 이름을 문자열로 반환하는 속성 --> --%>
<%--                 ${view.cafeNo} <!-- CafeRev의 cafeName 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof BeanRev}"> --%>
<%--                 ${view.beanNo} <!-- BeanRev의 beanName 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof FreeBoard}"> --%>
<%--                 ${view.freeBoardTitle} <!-- FreeBoard의 boardTitle 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof MyRecipe}"> --%>
<%--                 ${view.myRipTitle} <!-- MyRecipe의 recipeTitle 출력 --> --%>
<%--             </c:when> --%>
<%--         </c:choose> --%>
<!--     </td> -->
<!--     <td>제목 -->
<%--         <c:choose> --%>
<%--             <c:when test="${view instanceof CafeRev}"> --%>
<%--                 ${view.revContent} <!-- CafeRev의 revContent 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof BeanRev}"> --%>
<%--                 ${view.revContent} <!-- BeanRev의 revContent 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof FreeBoard}"> --%>
<%--                 ${view.boardContent} <!-- FreeBoard의 boardContent 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof MyRecipe}"> --%>
<%--                 ${view.myRipContent} <!-- MyRecipe의 recipeContent 출력 --> --%>
<%--             </c:when> --%>
<%--         </c:choose> --%>
<!--     </td> -->
<%-- <%--     <td><fmt:formatDate value="${view.revDate}" pattern="yyyy-MM-dd"/></td> --%> --%>
<!--    <td> 날짜 -->
<%--         <c:choose> --%>
<%--             <c:when test="${view instanceof CafeRev}"> --%>
<%--                 ${view.revContent} <!-- CafeRev의 revContent 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof BeanRev}"> --%>
<%--                 ${view.revContent} <!-- BeanRev의 revContent 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof FreeBoard}"> --%>
<%--                 ${view.boardContent} <!-- FreeBoard의 boardContent 출력 --> --%>
<%--             </c:when> --%>
<%--             <c:when test="${view instanceof MyRecipe}"> --%>
<%--                 ${view.myRipContent} <!-- MyRecipe의 recipeContent 출력 --> --%>
<%--             </c:when> --%>
<%--         </c:choose> --%>
<!--     </td> -->
<!-- </tr> -->
<%-- </c:forEach> --%>

<!-- </table> -->



<c:import url="../layout/footer.jsp" />