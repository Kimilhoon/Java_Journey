<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {
// 	$("#location").on("change", function() {
	$("#location").change(function() {
		
		var locationValue = $(this).val();
// 		console.log($("#search").val());
// 		console.log($("#category").val());
		$.ajax({
			url: "./all",
			type: "get",
			data:{
				"location":locationValue
			},
			dataType: "html",
			success: function(res) {
// 				console.log(res);
				$("body").children().remove();
				$("body").html(res); 
			},
			error: function() {
				console.error("AJAX 요청에 실패했습니다.");
			}
			
		});
		
	}); // $("#location").on("change", function() end
	
	$("#searchIcon").click(function() {
// 		console.log($("#search").val());
// 		console.log($("#category").val());
	
		var keywordValue = $("#keyword").val();
	
		$.ajax({
			url: "./all",
			type: "get",
			data:{
				"keyword":keywordValue
			},
			dataType: "html",
			success: function(res) {
// 				console.log(res);
				$("body").children().remove();
				$("body").html(res); 
			},
			error: function() {
				console.error("AJAX 요청에 실패했습니다.");
			}
			
		});
		
	}); // $("#searchIcon").click(function() end
	
		
	$("#keyword").keydown(function(event) {
		
		// 엔터 키 감지하기
		if( event.keyCode == 13 ) {
			event.preventDefault();
			
			var keyword = $("#keyword").val();
			
			$.ajax({
		        url: './all',
		        type: 'GET',
		        data: { 
		        	keyword: keyword 
		        },
		        dataType: "html",
		        success: function(res) {
					$("body").children().remove();
					$("body").html(res); 
				},
				error: function() {
					console.error("AJAX 요청에 실패했습니다.");
				}
					
			});
		}
	}); // $("#keyword").keydown(function() end
			
	
// 	function play() {
// 		 $.ajax({
// 	        url: './all',
// 	        type: 'GET',
// 	        data: { keyword: keyword },
// 	        success: function(response) {
// 	            console.log(response);
// 	        }
// 	    });
// 	}		
	
	$(".custom-image img").css({
		width: "320px",
		height: "200px",
        objectFit: "cover",		// 이미지가 썸네일 크기에 맞도록 설정
        borderRadius: "8px"		// 모서리를 둥글게 (선택 사항)
    });
	
})
</script>

<style type="text/css">
.custom-container {
    width: 1600px;
    max-width: 100%; /* 뷰포트보다 크지 않도록 제한 */
}

img{
	max-width: 100%;
	transition: all 0.3s linear; /* 애니메이션 효과를 부여해줌 */
}

.custom-image {
	width: 320px;
	height: 200px;
  	margin: 0px auto;
  	overflow: hidden;
	border-radius: 8px;
}

.custom-image:hover img{
	transform: scale(1.2);
}

</style>

<div class="container-lg position-relative">
	
	<div class="text-center m-5">
		<h1>
		<a href="./all" class="link-offset-2 link-offset-3-hover link-underline-secondary link-underline-opacity-0 link-underline-opacity-75-hover">
			<전체 카페>
		</a> 
		</h1>
	</div><!-- <h1> End -->
	
<nav style="--breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item active" aria-current="page">cafe</li>
	</ol>
</nav>

<div id="up" class="mb-4 d-flex flex-row align-items-center">

	<div class="me-auto d-flex justify-content-start">
	<label for="location" class="col-sm-4 col-form-label">지역 : </label>
		<div class="col-sm-10">
		<select id="location" name="location" class="form-select">
			<option value="" selected disabled>-- 전 체 --</option>
			<option value="1">강남구</option>
			<option value="2">서초구</option>
			<option value="3">송파구</option>
			<option value="4">종로구</option>
			<option value="5">서대문구</option>
			<option value="6">마포구</option>
		</select>
		</div>
	</div>
	
	<div id="search" class="p-2 d-flex justify-content-between">
		<input type="text" id="keyword" name="keyword" class="form-control">
		<span id="searchIcon">
			<i class="bi bi-search"></i>
		</span>
	</div>

</div> <!-- id="up" End -->

<div id="AllcafeList" class="mx-auto">

<table>
<tbody>

<c:forEach var="cafe" items="${AllCafeList }" varStatus="status">
	<c:if test="${status.index % 4 == 0 }">
		<tr>
	</c:if>
	
	<td class="text-center" style="flex-shrink: 0;">
		<a href="./info?cafeNo=${cafe.cafeNo }">
			<div class="custom-image">${cafe.cafeImgOriName }</div>
		</a>
			<p class="fw-bolder fs-4">${cafe.cafeName }</p>
			<p class="fw-semibold fs-5">${cafe.cafeLoc }</p>
			<p class="fw-semibold fs-5">${cafe.cafePhone }</p>
			<p>리뷰 : ${cafe.reviewCount }</p>
	</td>
		<c:if test="${status.index % 4 == 3 || status.last }">
		</tr> <!-- 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
		</c:if>
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(AllCafeList) % 4 != 0 }">
<tr>
	<c:forEach begin="1" end="${4 - (fn:length(AllCafeList) % 4) }">
		<td></td>
	</c:forEach>
</tr>
</c:if>

</tbody>
</table>

</div> <!-- id="AllcafeList" End -->
	
<c:import url="../layout/page.jsp"/>

</div><!-- container End -->

<c:import url="../layout/footer.jsp"/>
