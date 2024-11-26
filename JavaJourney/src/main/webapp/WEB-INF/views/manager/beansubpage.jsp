<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.pagination .page-link {
    color: #6c757d; /* 기본 회색 */
    background-color: #f8f9fa; /* 버튼 배경 */
    border: 1px solid #dee2e6; /* 버튼 테두리 */
    transition: background-color 0.2s ease, color 0.2s ease;
}

.pagination .page-item.active .page-link {
    color: #fff; /* 텍스트 색 */
    background-color: #adb5bd; /* 활성 상태  */
    border-color: #adb5bd; /* 활성 상태 테두리 */
}

.pagination .page-item:hover .page-link {
    color: #495057; /* 호버 시 색상 */
    background-color: #e9ecef; /* 호버 시 배경 */
    border-color: #ced4da; /* 호버 시 테두리 */
}
</style>

<div>

<ul class="pagination justify-content-center" >

	<!-- 첫 페이지로 이동 -->
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
		<c:choose>
		<c:when test="${search ne null }">
			<a class="page-link" href="/manager/subuser?curPage=${paging.startPage }&search=${search}">&larr; 처음</a>
		</c:when>
		<c:otherwise>
		<li class="page-item">
			<a class="page-link" href="/manager/subuser">&larr; 처음</a>
		</c:otherwise>
		 </c:choose>
		</li>	 
	</c:if> 
	
	<!-- 이전 페이징 리스트로 이동 -->
	<c:if test="${paging.startPage ne 1 }">
		<li class="page-item">
		<c:choose>
		<c:when test="${search ne null }">
			<a class="page-link" href="/manager/subuser?curPage=${paging.startPage }&search=${search}">&laquo;</a>
		</c:when>
		<c:otherwise>
			<a class="page-link" href="/manager/subuser?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
		</c:otherwise>
		 </c:choose>
		</li>	 
	</c:if>
	
	
	<!-- 페이징 번호 리스트 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	
		<c:if test="${paging.curPage eq i }">
			<li class="page-item active">
			<c:choose>
			<c:when test="${search ne null }">
				<a class="page-link" href="/manager/subuser?curPage=${i }&search=${search}">${i }</a>
			</c:when>
			<c:otherwise>
				<a class="page-link" href="/manager/subuser?curPage=${i }">${i }</a>
			</c:otherwise>
			</c:choose>
			</li>
		</c:if>
		
		<c:if test="${paging.curPage ne i }">
		<li class="page-item">
		<c:choose>
			<c:when test="${search ne null }">
				<a class="page-link" href="/manager/subuser?curPage=${i }&search=${search}">${i }</a>
			</c:when>		
			<c:otherwise>
				<a class="page-link" href="/manager/subuser?curPage=${i }">${i }</a>
			</c:otherwise>
			</c:choose>
			</li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이징 리스트로 이동 -->
	<c:if test="${paging.endPage ne paging.totalPage }">
		<li class="page-item">
		<c:choose>
		<c:when test="${search ne null }">
			<a class="page-link" href="/manager/subuser?curPage=${paging.startPage + paging.pageCount }&search=${search}">&raquo;</a>
		</c:when>
		<c:otherwise>
				<a class="page-link" href="/manager/subuser?curPage=${paging.startPage + paging.pageCount }">&raquo;</a>
		</c:otherwise>
		</c:choose>
		</li>
	</c:if>
	
	<!-- 마지막 페이지로 이동 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
		<c:choose>
		<c:when test="${search ne null }">
			<a class="page-link" href="/manager/subuser?curPage=${paging.startPage + paging.pageCount }&search=${search}">&rarr; 마지막</a>
		</c:when>
		<c:otherwise>
			<a class="page-link" href="/manager/subuser?curPage=${paging.endPage }">&rarr; 마지막</a>
		</c:otherwise>
		</c:choose>
		</li>
	</c:if>
</ul>

</div>


