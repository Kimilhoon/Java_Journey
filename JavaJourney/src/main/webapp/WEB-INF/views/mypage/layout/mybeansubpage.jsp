<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div>

<ul class="pagination justify-content-center">

	<!-- 첫 페이지로 이동 -->
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;" href="/mypage/subscribe?userNo=${beanSubList[0].userNo }&curPage=${paging.startPage }">&larr; 처음</a>
		</li>
	</c:if>

	<!-- 이전 페이징 리스트로 이동 -->
	<c:if test="${paging.startPage ne 1 }">
	<li class="page-item">
		<a class="page-link" href="/mypage/subscribe?userNo=${beanSubList[0].userNo }&curPage=${paging.startPage - paging.pageCount }">&laquo;</a>
	</li>
	</c:if>

	<!-- 페이징 번호 리스트 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	
		<c:if test="${paging.curPage eq i }">
			<li class="page-item active">
				<a class="page-link" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;" href="/mypage/subscribe?userNo=${beanSubList[0].userNo }&curPage=${i }">${i }</a>
			</li>
		</c:if>
		
		<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" style="background: white; color: black; border: 1px solid #ebddcc;"  href="/mypage/subscribe?userNo=${beanSubList[0].userNo }&curPage=${i }">${i }</a>
			</li>
		</c:if>
		
	</c:forEach>
	
	<!-- 다음 페이징 리스트로 이동 -->
	<c:if test="${paging.endPage ne paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="/mypage/subscribe?userNo=${beanSubList[0].userNo }&curPage=${paging.startPage + paging.pageCount }">&raquo;</a>
	</li>
	</c:if>

	<!-- 마지막 페이지로 이동 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;" href="/mypage/subscribe?userNo=${beanSubList[0].userNo }&curPage=${paging.endPage }">&rarr; 마지막</a>
		</li>
	</c:if>

</ul>

</div>


