<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(function() {
	
	$(".custom-image img").css({
		width: "400px",
		height: "560px",
        objectFit: "container",		// 이미지가 썸네일 크기에 맞도록 설정
        borderRadius: "8px"		// 모서리를 둥글게 (선택 사항)
		 
	});
	
	$("#allBean").click(function() {
		location.href = "./all";
	})
	
})
</script>

<style type="text/css">

.custom-container{
	width: 1250px;
	max-width: 100%;
}

img{
	max-width: 100%;
	transition: all 0.3s linear; /* 애니메이션 효과를 부여해줌 */
}

.custom-image{
	width: 400px;
	height: 560px;	
	margin: 0px auto;
	overflow: hidden;
	border-radius: 8px;
}

.custom-image:hover img{
	transform: scale(1.2);
}

</style>

<div class="container custom-container">

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">best</li>
	</ol>
</nav>

<div class="text-center m-5">
<h1> <BEST 원두> </h1>
</div>



<div id="List" class="mx-auto">

<table>
<tbody>

<c:forEach var="bean" items="${ list }" varStatus="status">
	<c:if test="${status.index % 4 == 0}">
		<tr>
	</c:if>
	
	<td class="text-center" style="flex-shrink: 0;">
	<a href="./info?beanNo=${ bean.beanNo }">
			<div class="custom-image">${bean.beanOriginName}</div>
	</a>
		<p class="fw-bold fs-4">${bean.beanName}(${ bean.gram }g)</p>
		<p>${bean.origin}</p>
		<p>리뷰 : ${ bean.reviewCount } | ★( ${ bean.avgRevStarPoint } )</p>
	</td>
   
		<c:if test="${status.index % 4 == 3 || status.last}">
		</tr> <!-- 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
		</c:if>	
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(list) % 4 != 0}">
	<c:forEach begin="1" end="${4 - (fn:length(list) % 4)}"> 
		<td></td>
	</c:forEach>
</tr>
</c:if>


<%-- <c:forEach var="bean" items="${ list }"> --%>
<!-- <tr class="d-inline"> -->
<!--    <td style="width: 200px;"> -->
<!--    <img src="../resources/img/y.jpg" alt="윤하" style="width: 20%; height: 20%;"> -->
<%--    <p>${ bean.beanNo }</p> --%>
<%--    <p>${ bean.beanName }</p> --%>
<%--    <p>${ bean.origin }</p> --%>
<!--    </td> -->
<!-- </tr> -->
<%-- </c:forEach> --%>

</tbody>
</table>

</div> <!-- <div id="List"> -->

<div class="d-flex justify-content-center">
<button id="allBean" type="button" class="btn btn-outline-secondary btn-lg w-75">전체 원두 보러가기 >> ${ count.beanCount }</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>