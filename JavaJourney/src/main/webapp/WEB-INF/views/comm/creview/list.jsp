<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:import url="../../layout/header.jsp" />

<style>

input:focus {
    outline: none;  /* 기본 파란색 테두리 제거 */
    box-shadow: 0 0 5px #6f4e37;  /* 원하는 색상으로 그림자 설정 */
    border-color: #6f4e37;  /* 테두리 색상 변경 (선택 사항) */
}

a {
	color: #6f4e37;
}

.btn{
   background: transparent;
   border: 1px solid #6f4e37;
   color: black;
}
.btn:hover{
   background: #6f4e37;
   color: white;
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
지역 &nbsp;|&nbsp;
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
			<c:when test="${category eq '강남구' }">
				<option value="강남구" selected="selected">강남구</option>
			</c:when>
			<c:otherwise>
				<option value="강남구">강남구</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '서초구' }">
				<option value="서초구" selected="selected">서초구</option>
			</c:when>
			<c:otherwise>
				<option value="서초구">서초구</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '송파구' }">
				<option value="송파구" selected="selected">송파구</option>
			</c:when>
			<c:otherwise>
				<option value="송파구">송파구</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '종로구' }">
				<option value="종로구" selected="selected">종로구</option>
			</c:when>
			<c:otherwise>
				<option value="종로구">종로구</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '서대문구' }">
				<option value="서대문구" selected="selected">서대문구</option>
			</c:when>
			<c:otherwise>
				<option value="서대문구">서대문구</option>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${category eq '마포구' }">
				<option value="마포구" selected="selected">마포구</option>
			</c:when>
			<c:otherwise>
				<option value="마포구">마포구</option>
			</c:otherwise>
		</c:choose>
		
   </select>
</div> <!-- category-list -->
</div>

<div id="search" class="col-6">

<form class="search-box d-flex" action="./list" method="get">

	<input class="form-control me-2" type="text" name="search" placeholder="검색어를 입력하세요">
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


<!-- <div class="col-1"> -->
<!-- 	<a href="./write"><input type="button" class="btn btn-primary" value="글 작성"></a><br> -->
<!-- 	<small>(삭제해!!!)</small> -->
<!-- </div> -->

</div><!-- content -->



<c:import url="../../layout/page_irooni.jsp" />

<c:import url="../../layout/footer.jsp" />





















