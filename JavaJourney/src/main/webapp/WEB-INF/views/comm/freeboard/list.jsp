<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
	$(".hit").click(function() {
		
		$.ajax({
			url: "./hit?freeBoardNo="+$(this).parent().prev().prev().prev().text(),
			type: "get",
			dataType: "",
			success: function() {
				
			},
			error: function() {
				
			}
			
		});
	});
	$("#btn_search").click(function() {
// 		console.log($("#search").val());
// 		console.log($("#category").val());
		$.ajax({
			url: "./list",
			type: "get",
			data:{
				"search":$("#search").val(),
				"category":$("#category").val()
			},
			dataType: "html",
			success: function(res) {
// 				console.log(res);
				$("body").children().remove();
				$("body").html(res); 
			},
			error: function() {
				
			}
			
		});
		
	});
	
	
	
})

</script>
<style>
.btn{
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}
.btn:hover{
	background: #6f4e37;
	color: white;
}

#search_div{
	
	float: right;
}
a {
	color: #6f4e37;
}
	

</style>
<div class="container" >
<div id="order_search_wrap">
<div id="order" style="float: left;">
<a href="./list" id="W">최근리뷰순</a>
<a href="./list" id="R">추천순</a>
<a href="./list" id="C">댓글많은순</a>
</div> <!-- order-list -->
<div id="search_div">
	<button id="btn_search" class="btn " style="float: right;  display: inline-block; "><i class="bi bi-search"></i></button>
	<input type="text" id="search" class="form-control me-2 " placeholder="검색어를 입력하세요." style="float: right;  display: inline-block; width: 200px; margin-left: 10px;">
	<select id="category" class="form-select" style="width: 80px; float: right; display: inline-block;">
		<option value="all">전체</option>
		<option value="cafe">카페</option>
		<option value="bean">원두</option>
	</select>
	
</div>
</div>

<div>
<table class="table text-center">
<thead>
	<tr>
		<th>글번호</th>
		<th>분류</th>
		<th></th>
		<th>제목</th>
		<th>조회수</th>
		<th>추천수</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="freeBoardList" items="${freeBoardList }">
	<tr>
		<td>${freeBoardList.freeBoardNo}</td>
		<td>${freeBoardList.freeBoardCategory}</td>
		<td>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
			<fmt:formatDate value="${freeBoardList.freeBoardWriteDate}" pattern="yyyyMMdd" var="wDate" /> 
			<c:if test="${nowDate eq wDate }">
				<span style="color: #fff; background: #fedcba; border-radius: 5px;
			font-size: 14px; box-shadow: 1px 1px 3px #ddd">
			&nbsp;New&nbsp;</span>
			</c:if>
		</td>
		<td>
		
			<a href="./view?freeBoardNo=${freeBoardList.freeBoardNo }"class="hit" >
				${freeBoardList.freeBoardTitle}
			</a>
				[${freeBoardList.freeBoardCommentCount}]
		</td>
		
		<td>${freeBoardList.freeBoardHit}</td>
		<td>${freeBoardList.freeBoardRecommendCount}</td>
		<td><fmt:formatDate value="${freeBoardList.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>

	</c:forEach>
</tbody>
</table>
</div>
<div >
<!-- <a href="./list"><button class="btn">목록</button></a> -->
<a href="./write"><button class="btn">작성</button></a>
</div>

<div>
<ul class="pagination justify-content-center" >

	<!-- 첫 페이지로 이동 -->
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item">
			<a class="page-link" href="./list" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&larr; 처음</a>
		</li>
	</c:if>

	<!-- 이전 페이징 리스트로 이동 -->
	<c:if test="${paging.startPage ne 1 }">
	<li class="page-item">
		<a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }&search=${search}&category=${category}" style=" color: black; border: 1px solid #ebddcc;">&laquo;</a>
	</li>
	</c:if>

	<!-- 페이징 번호 리스트 -->
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	
		<c:if test="${paging.curPage eq i }">
			<li class="page-item active" >
				<a class="page-link" href="./list?curPage=${i }&search=${search}&category=${category}" style="background:#6f4e37; color: white; border: 1px solid #6f4e37;">${i }</a>
			</li>
		</c:if>
		
		<c:if test="${paging.curPage ne i }">
			<li class="page-item">
				<a class="page-link" href="./list?curPage=${i }&search=${search}&category=${category}" style=" color: black; border: 1px solid #ebddcc;">${i }</a>
			</li>
		</c:if>
		
	</c:forEach>
	
	<!-- 다음 페이징 리스트로 이동 -->
	<c:if test="${paging.endPage ne paging.totalPage }">
	<li class="page-item">
		<a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }&search=${search}&category=${category}" style=" color: black; border: 1px solid #ebddcc;">&raquo;</a>
	</li>
	</c:if>

	<!-- 마지막 페이지로 이동 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item">
			<a class="page-link" href="./list?curPage=${paging.totalPage }&search=${search}&category=${category}" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">&rarr; 마지막</a>
		</li>
	</c:if>
</ul>
</div><!-- 페이징 -->

</div><!-- container -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>