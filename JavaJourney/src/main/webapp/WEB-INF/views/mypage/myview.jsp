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

</div>

<table>
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">테마</th>
	<th class="col-1" scope="col">제목</th>
	<th class="col-1" scope="col">작성일</th>
</tr>
<tr>
	<td>카페</td>
	<td>원두</td>
</tr>


</table>




<c:import url="../layout/footer.jsp" />