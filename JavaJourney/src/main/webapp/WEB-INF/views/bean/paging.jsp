<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div>
<ul class="pagination justify-content-center ">
	
	<%-- 첫 페이지로 이동 --%>
	<c:if test="${ paging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="./all">&larr; 처음</a>
		</li>
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:if test="${ paging.startPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="./all?curPage=${ paging.startPage - paging.pageCount }">&laquo</a>
		</li>
	</c:if>

	<li class="page-item">
		<a class="page-link" href="./all?curPage=${ paging.curPage - 1 }">&lt</a>
	</li>

	<%-- 페이징 번호 리스트 --%>
	<c:forEach var="i" begin="${ paging.startPage }" end="${ paging.endPage }">
	
	<c:if test="${ paging.curPage eq i }">
		<li class="page-item active">
			<a class="page-link" href="./all?curPage=${ i }">${ i }</a>
		</li>
	</c:if>

	<c:if test="${ paging.curPage ne i }">
		<li class="page-item">
			<a class="page-link" href="./all?curPage=${ i }">${ i }</a>
		</li>
	</c:if>
	
	</c:forEach>
	
	<li class="page-item">
		<a class="page-link" href="./all?curPage=${ paging.curPage + 1 }">&gt</a>
	</li>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:if test="${ paging.endPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="./all?curPage=${ paging.startPage + paging.pageCount }">&raquo</a>
		</li>
	</c:if>
	
	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${ paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="./all?curPage=${ paging.totalPage }">&rarr; 마지막</a>
		</li>
	</c:if>
	
</ul>
</div>