<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:import url="../../layout/header.jsp" />

<style>

#title {
	cursor: pointer;
}

</style>

<script type="text/javascript">

$(function() {
	
	$("#category").change(function() {
		
		if($("#category").val() == "all") {
			location.href = "./list";
			return;
		}
		
		location.href = "./list?category=" + $("#category").val();
		
	})
	
	$("#title").click(function() {
		
		location.href = "./list";
		
	})
	
	
})


</script>


<h1 id="title">카페리뷰리스트</h1>
<br>

<div id="content">
<div class="container" id="top">

<div class="col6 text-right">
<div id="order-list">
<a href="./list?order=recent">최근리뷰순</a>
|
<a href="./list?order=star">별점높은순</a>
|
<a href="./list?order=popular">인기많은순</a>
</div> <!-- order-list -->

<div id="category-list">
카테고리
	<select id="category">
      <option hidden="none"></option>
      <option value="all">전체</option>
      <option value="서울">서울</option>
      <option value="경기">경기</option>
      <option value="인천">인천</option>
      <option value="부산">부산</option>
      <option value="제주">제주</option>
   </select>
</div> <!-- category-list -->
</div> <!-- col -->


<div class="col-6 text-right">
<div id="search">

<form class="search-box" action="./list" method="get">

	<input class="search-txt" type="text" name="search">
	<button class="search-btn" type="submit">
		<i class="bi bi-search"></i>
	</button>
	
</form>

</div> <!-- search -->
</div> <!-- col -->

</div> <!-- container -->
</div> <!-- content -->

<div class="container" id="center">

<table class="table text-center">
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">지역</th>
	<th class="col-5" scope="col">카페이름</th>
	<th class="col-2" scope="col">작성자</th>
	<th class="col-2" scope="col">작성일</th>
	<th class="col-1" scope="col">별점</th>
</tr>

<c:forEach var="list" items="${creviewList }">
	<tr>
	<td class="col-1" scope="row">${list.revNo }</td>
	<td class="col-1">${list.cafeLoc }</td>
	<td class="col-5">
		<a href="./view?revNo=${list.revNo }">
		${list.cafeName }
		</a>
	</td>
	<td class="col-2">${list.userNick }</td>
	<td class="col-2"><fmt:formatDate value="${list.revDate }" pattern="yyyy-MM-dd"/></td>
	<td class="col-1">${list.revsp }</td>
	</tr>
</c:forEach>

</table>


<div class="col-1">
	<a href="./write"><input type="button" class="btn btn-primary" value="글 작성"></a><br>
	<small>(삭제해!!!)</small>
</div>

</div>



<c:import url="../../layout/page.jsp" />

<c:import url="../../layout/footer.jsp" />





















