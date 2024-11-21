<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>

<ul class="pagination justify-content-center" >

	<!-- 첫 페이지로 이동 -->
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<c:choose>
				<c:when test="${order ne null }">
					<a class="page-link" href="./list?order=${order }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:when test="${search ne null }">
					<a class="page-link" href="./list?search=${search }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:when test="${category ne null }">
					<a class="page-link" href="./list?category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:when test="${order ne null && search ne null }">
					<a class="page-link" href="./list?order=${order }&search=${search }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:when test="${search ne null && category ne null }">
					<a class="page-link" href="./list?search=${search }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:when test="${category ne null && order ne null }">
					<a class="page-link" href="./list?order=${order }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:when test="${order ne null && search ne null && category ne null }">
					<a class="page-link" href="./list?order=${order }&search=${search }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="./list" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
				</c:otherwise>
			</c:choose>
		</li>
	</c:if>

	<!-- 이전 페이징 리스트로 이동 -->
	<c:if test="${paging.startPage ne 1 }">
	<li class="page-item">
		<c:choose>
			<c:when test="${order ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&order=${order }">&laquo;</a>
			</c:when>
			<c:when test="${search ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&search=${search }">&laquo;</a>
			</c:when>
			<c:when test="${category ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&category=${category }">&laquo;</a>
			</c:when>
			<c:when test="${order ne null && search ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&order=${order }&search=${search }">&laquo;</a>
			</c:when>
			<c:when test="${search ne null && category ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&search=${search }&category=${category }">&laquo;</a>
			</c:when>
			<c:when test="${category ne null && order ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&order=${order }&category=${category }">&laquo;</a>
			</c:when>
			<c:when test="${order ne null && search ne null && category ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&order=${order }&search=${search }&category=${category }">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
			</c:otherwise>
		</c:choose>
	</li>
	</c:if>

	<!-- 페이징 번호 리스트 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	
		<c:if test="${paging.curPage eq i }">
			<li class="page-item active">
			<c:choose>
				<c:when test="${order ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:when test="${search ne null }">
					<a class="page-link" href="./list?scurPage=${i }&earch=${search }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:when test="${category ne null }">
					<a class="page-link" href="./list?curPage=${i }&category=${category }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:when test="${order ne null && search ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }&search=${search }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:when test="${search ne null && category ne null }">
					<a class="page-link" href="./list?scurPage=${i }&earch=${search }&category=${category }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:when test="${category ne null && order ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }&category=${category }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:when test="${order ne null && search ne null && category ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }&search=${search }&category=${category }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="./list?curPage=${i }" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
				</c:otherwise>
			</c:choose>
			</li>
		</c:if>
		
		<c:if test="${paging.curPage ne i }">
			<li class="page-item">
			<c:choose>
				<c:when test="${order ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:when test="${search ne null }">
					<a class="page-link" href="./list?scurPage=${i }&earch=${search }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:when test="${category ne null }">
					<a class="page-link" href="./list?curPage=${i }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:when test="${order ne null && search ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }&search=${search }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:when test="${search ne null && category ne null }">
					<a class="page-link" href="./list?scurPage=${i }&earch=${search }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:when test="${category ne null && order ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:when test="${order ne null && search ne null && category ne null }">
					<a class="page-link" href="./list?curPage=${i }&order=${order }&search=${search }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="./list?curPage=${i }" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
				</c:otherwise>
			</c:choose>
			</li>
		</c:if>
		
	</c:forEach>
	
	<!-- 다음 페이징 리스트로 이동 -->
	<c:if test="${paging.endPage ne paging.totalPage }">
	<li class="page-item">
		<c:choose>
			<c:when test="${order ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&order=${order }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:when test="${search ne null }">
				<a class="page-link" href="./list?scurPage=${paging.startPage + paging.pageCount }&earch=${search }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:when test="${category ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:when test="${order ne null && search ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&order=${order }&search=${search }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:when test="${search ne null && category ne null }">
				<a class="page-link" href="./list?scurPage=${paging.startPage + paging.pageCount }&earch=${search }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:when test="${category ne null && order ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&order=${order }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:when test="${order ne null && search ne null && category ne null }">
				<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&order=${order }&search=${search }&category=${category }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
			</c:otherwise>
		</c:choose>
	</li>
	</c:if>

	<!-- 마지막 페이지로 이동 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<c:choose>
				<c:when test="${order ne null }">
					<a class="page-link" href="./list?curPage=${paging.totalPage }&order=${order }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:when test="${search ne null }">
					<a class="page-link" href="./list?scurPage=${paging.totalPage }&earch=${search }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:when test="${category ne null }">
					<a class="page-link" href="./list?curPage=${paging.totalPage }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:when test="${order ne null && search ne null }">
					<a class="page-link" href="./list?curPage=${paging.totalPage }&order=${order }&search=${search }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:when test="${search ne null && category ne null }">
					<a class="page-link" href="./list?scurPage=${paging.totalPage }&earch=${search }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:when test="${category ne null && order ne null }">
					<a class="page-link" href="./list?curPage=${paging.totalPage }&order=${order }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:when test="${order ne null && search ne null && category ne null }">
					<a class="page-link" href="./list?curPage=${paging.totalPage }&order=${order }&search=${search }&category=${category }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:when>
				<c:otherwise>
					<a class="page-link" href="./list?curPage=${paging.totalPage }" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
				</c:otherwise>
			</c:choose>
		</li>
	</c:if>
</ul>

</div>













