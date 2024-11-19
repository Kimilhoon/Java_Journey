<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
var userNo = "${cafeWishNoList[0].userNo}";
$(function () {
	
	$("#all").click(function () {
		$(".cafetb").show();
		$(".beantb").show();
	})
	
	$("#cafe").click(function () {
		$(".cafetb").show();
		$(".beantb").hide();
	})

	$("#bean").click(function () {
		$(".cafetb").hide();
		$(".beantb").show();
	})
	
	$(".custom-image img").css({
        width: "200px",
        height: "200px"
    });
	
	$(document).ready(function () {
	$("#btnSearch").click(function () {
		var searchText = $("#searchText").val().toLowerCase();
		$("#contentall .cafetb, #contentall .beantb").each(function () {
			var rowText = $(this).text().toLowerCase();
			if(rowText.includes(searchText)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		})
	});
		
  });
	
});
</script>
<style type="text/css">
/* a{
	cursor: pointer;
	text-decoration: none; /* 기본밑줄제거 */
	color: #333;	/* 기본 텍스트 색상 */
	transition: color 0.3s ease, background-color 0.3 ease; /* 부드러운 전환 효과 */
}
a:hover{
	color: #007bff; /* 마우스 오버시 텍스트 색상 변화 */
	text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
	background-color: #f0f0f0; /* 배경 색상 변경으로 클릭 효과 */
}
a:active{
	color: #0056b3; /* 클릭할 떄 텍스트 색상 */
	background-color: #e0e0e0; /* 클릭할 떄 배경색 변화 */
	font-weight: bold; /* 클릭할 때 텍스트를 진하게 */
} */
</style>
<h1>찜목록</h1> 

<div class="col-6 d-flext flex-column">
<div id="order-list" class="mb-2">
<a id="all">전체보기</a>
&nbsp;|&nbsp;
<a id="cafe">카페</a>
&nbsp;|&nbsp;
<a id="bean">원두</a>
</div> <!-- order-list -->
</div>

<div class="container mt-5">
<div class="d-flex justify-content-end">
	<div class="col-2">
	<input id="searchText"class="form-control me-2" type="search" placeholder="검색어 입력" aria-label="Search">
	</div>
	<span style="margin-right: 5px;"></span>
	<button id="btnSearch" class="btn btn-primary">검색</button>
</div>
</div>

<div class="container">
    <table id="contentall">
        <!-- Cafe 리스트 출력 -->
        <c:forEach var="cafe" items="${cafeWishNoList}" varStatus="cafeStatus">
            <c:if test="${cafeStatus.index % 8 == 0}">
                <tr>
            </c:if>

            <td class="cafetb">
                <div class="custom-image">
                    <p><a href="/cafe/info?cafeNo=${cafe.cafeNo}">${cafe.cafeImgOriName}</a></p>
                    <p>${cafe.cafeName}</p>
                </div>
            </td>

            <c:if test="${cafeStatus.index % 8 == 7 || cafeStatus.last}">
                </tr>
            </c:if>
        </c:forEach>

        <!-- Bean 리스트 출력 -->
        <c:forEach var="bean" items="${beanWishList}" varStatus="beanStatus">
            <c:if test="${beanStatus.index % 8 == 0}">
                <tr>
            </c:if>

            <td class="beantb">
                <div class="custom-image">
                    <p><a href="/bean/info?beanNo=${bean.beanNo}">${bean.beanOriginName}</a></p>
                    <p>${bean.beanName}</p>
                </div>
            </td>

            <c:if test="${beanStatus.index % 8 == 7 || beanStatus.last}">
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>

<div>
<c:import url="../layout/footer.jsp"/>
</div>