<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="../../layout/header.jsp" />

<style>
input:focus {
	outline: none; /* 기본 파란색 테두리 제거 */
	box-shadow: 0 0 5px #6f4e37; /* 원하는 색상으로 그림자 설정 */
	border-color: #6f4e37; /* 테두리 색상 변경 (선택 사항) */
}

a {
	color: #6f4e37;
}

.btn {
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}

.btn:hover {
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
					<a href="./list?order=recent">최근리뷰순</a> &nbsp;|&nbsp; <a
						href="./list?order=star">별점높은순</a> &nbsp;|&nbsp; <a
						href="./list?order=popular">인기많은순</a>
				</div>
				<!-- order-list -->

				<div id="category-list">
					카테고리&nbsp;|&nbsp; <select id="category">
						<c:choose>
							<c:when test="${category eq '전체' }">
								<option value="all" selected="selected">전체</option>
							</c:when>
							<c:otherwise>
								<option value="all">전체</option>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${category eq '새콤' }">
								<option value="새콤" selected="selected">새콤</option>
							</c:when>
							<c:otherwise>
								<option value="새콤">새콤</option>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${category eq '달콤' }">
								<option value="달콤" selected="selected">달콤</option>
							</c:when>
							<c:otherwise>
								<option value="달콤">달콤</option>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${category eq '쌉쌀' }">
								<option value="쌉쌀" selected="selected">쌉쌀</option>
							</c:when>
							<c:otherwise>
								<option value="쌉쌀">쌉쌀</option>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${category eq '고소' }">
								<option value="고소" selected="selected">고소</option>
							</c:when>
							<c:otherwise>
								<option value="고소">고소</option>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${category eq '은은한' }">
								<option value="은은한" selected="selected">은은한</option>
							</c:when>
							<c:otherwise>
								<option value="은은한">은은한</option>
							</c:otherwise>
						</c:choose>

					</select>
				</div>
				<!-- category-list -->
			</div>

			<div id="search" class="col-6">

				<form class="search-box d-flex" action="./list" method="get">

					<input class="form-control me-2" type="text" name="search">
					<button class="btn btn-outline-primary" type="submit">
						<i class="bi bi-search"></i>
					</button>

				</form>

			</div>
			<!-- search -->

		</div>
		<!-- container -->
	</div>
	<!-- top -->
</div>

<br>

<div class="container" id="center">

<table class="table text-center">
	<tr>
		<th class="col-1" scope="col">글번호</th>
		<th class="col-1" scope="col">맛과 향</th>
		<th class="col-1" scope="col"></th>
		<th class="col-4" scope="col">카페이름</th>
		<th class="col-2" scope="col">작성자</th>
		<th class="col-2" scope="col">작성일</th>
		<th class="col-1" scope="col">별점</th>
	</tr>

	<c:forEach var="list" items="${breviewList}">
		<tr>
			<td class="col-1">${list.revNo}</td>
			<td class="col-1">
				<c:forEach var="note" items="${list.cupNoteNames}" varStatus="status">
					${note}<c:if test="${!status.last}">, </c:if>
				</c:forEach>
			</td>
			<td class="col-1">
				<c:if test="${nowDate eq wDate}">
					<span style="color: #fff; background: #fedcba; border-radius: 5px; font-size: 14px; box-shadow: 1px 1px 3px #ddd">
						&nbsp;New&nbsp;
					</span>
				</c:if>
			</td>
			<td class="col-4">
				<a href="./view?revNo=${list.revNo}">${list.beanName}</a>
				<c:if test="${list.beanRevCommCount >= 1}">
					&nbsp;[${list.beanRevCommCount}]
				</c:if>
			</td>
			<td class="col-2">${list.userNick}</td>
			<td class="col-2"><fmt:formatDate value="${list.revDate}" pattern="yyyy-MM-dd" /></td>
			<td class="col-1">${list.revStarPoint}</td>
		</tr>
	</c:forEach>
</table>



	<div class="col-1">
		<a href="./write"><input type="button" class="btn btn-primary"
			value="글 작성"></a><br> <small>(삭제해!!!)</small>
	</div>

</div>
<!-- content -->



<c:import url="../../layout/page_irooni.jsp" />

<c:import url="../../layout/footer.jsp" />





















