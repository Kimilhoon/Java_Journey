<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:import url="../../layout/header.jsp" />

<style>

	
	
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
	
})


</script>

<div id="content">
<div class="container col-12" id="top">

<div class="d-flex justify-content-between">

<div class="col-6 d-flext flex-column">
<div id="order-list" class="mb-2">
<a href="./list?order=recent">최근리뷰순</a>
&nbsp;|&nbsp;
<a href="./list?order=star">별점높은순</a>
&nbsp;|&nbsp;
<a href="./list?order=popular">인기많은순</a>
</div> <!-- order-list -->

<div id="category-list">
카테고리&nbsp;|&nbsp;
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
			<c:when test="${category eq '서울' }">
				<option value="서울" selected="selected">서울</option>
			</c:when>
			<c:otherwise>
				<option value="서울">서울</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '경기' }">
				<option value="경기" selected="selected">경기</option>
			</c:when>
			<c:otherwise>
				<option value="경기">경기</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '인천' }">
				<option value="인천" selected="selected">인천</option>
			</c:when>
			<c:otherwise>
				<option value="인천">인천</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '부산' }">
				<option value="부산" selected="selected">부산</option>
			</c:when>
			<c:otherwise>
				<option value="부산">부산</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '제주' }">
				<option value="제주" selected="selected">제주</option>
			</c:when>
			<c:otherwise>
				<option value="제주">제주</option>
			</c:otherwise>
		</c:choose>
		
   </select>
</div> <!-- category-list -->
</div>

<div id="search" class="col-6">

<form class="search-box d-flex" action="./list" method="get">

	<input class="form-control me-2" type="text" name="search">
	<button class="btn btn-outline-primary" type="submit">
		<i class="bi bi-search"></i>
	</button>
	
</form>

</div> <!-- search -->

</div> <!-- container -->
</div> <!-- top -->
</div>

<br>

<div class="container" id="center">

<table class="table text-center">
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">지역</th>
	<th class="col-1" scope="col"></th>
	<th class="col-4" scope="col">카페이름</th>
	<th class="col-2" scope="col">작성자</th>
	<th class="col-2" scope="col">작성일</th>
	<th class="col-1" scope="col">별점</th>
</tr>

<c:forEach var="list" items="${creviewList }">
	<tr>
		<td class="col-1" scope="row">
		
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="nowDate" /> 
			<fmt:formatDate value="${list.revDate }" pattern="yyyyMMdd" var="wDate" /> 

			${list.revNo }
		</td>
	<td class="col-1">${list.cafeLoc }</td>
	<td class="col-1">
		<c:if test="${nowDate eq wDate }">
			<span style="color: #fff; background: #fedcba; border-radius: 5px;
			font-size: 14px; box-shadow: 1px 1px 3px #ddd">
			&nbsp;New&nbsp;</span>
		</c:if>
	</td>
	<td class="col-4">
		<a href="./view?revNo=${list.revNo }">
			${list.cafeName}
		</a>
		<c:if test="${list.cafeRevCommCount >= 1 }">
			&nbsp;[${list.cafeRevCommCount }]
		</c:if>
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

</div><!-- content -->



<c:import url="../../layout/page_irooni.jsp" />

<c:import url="../../layout/footer.jsp" />





















