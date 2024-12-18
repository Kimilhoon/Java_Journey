<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(function() {
	
	
	// 원두 향 카테고리 선택 코드
	
// 	$("#cupnote").on("change", function() {
	$("#cupnote").change(function() {
		
		var cupnoteValue = $(this).val();
// 		console.log($("#search").val());
// 		console.log($("#category").val());
		$.ajax({
			url: "./all",
			type: "get",
			data:{
				"cupnote":cupnoteValue // 선택된 원두 향 value 데이터
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
		
	}); // $("#cupnote").on("change", function() end
	
			
	// 검색어 입력시 키워드에 따른 검색 코드		
	$("#searchIcon").click(function() {
// 		console.log($("#search").val());
// 		console.log($("#category").val());
	
		var keywordValue = $("#keyword").val(); // 입력된 키워드 value 데이터
	
		$.ajax({
			url: "./all",
			type: "get",
			data:{
				"keyword":keywordValue // 입력된 키워드 value 데이터
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
		width: "400px",
		height: "250px",
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

.custom-image{
	width: 400px;
	height: 250px;
	margin: 0px auto;
	overflow: hidden;
	border-radius: 8px;
}

.custom-image:hover img{
	transform: scale(1.2);
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

<div class="container custom-container" >

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' 
	height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb"> 
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item active" aria-current="page">bean</li>
	</ol>
</nav>


<div id="up" class="mb-4 d-flex flex-row align-items-center">

<div class="me-auto d-flex justify-content-start">
<label for="cupnote" class="col-sm-4 col-form-label">맛과향</label>
<div class="col-sm-10">
<select id="cupnote" name="cupnote" class="form-select" >
	<option value="" selected disabled>-- 전체 --</option>
	<option value="1">새콤</option>
	<option value="2">달콤</option>
	<option value="3">쌉쌀</option>
	<option value="4">고소</option>
	<option value="5">은은한</option>
	<option value="6">향긋한</option>
	<option value="7">진한</option>
	<option value="8">부드러운</option>
</select>
</div>
</div>
 
<div id="search" class="p-2 d-flex justify-content-between">
<input type="text" id="keyword" name="keyword" class="form-control me-2" placeholder="검색어를 입력하세요">
<!-- 돋보기 아이콘 -->
    <button id="searchIcon" class="btn " style="float: right;  display: inline-block; "><i class="bi bi-search"></i></button>
</div>

</div>


<div id="List" class="container-fluid">

<table>
<tbody>

<c:forEach var="bean" items="${ list }" varStatus="status">
	<c:if test="${status.index % 4 == 0}">
		<tr>
	</c:if>
   
	<td class="text-center " style="flex-shrink: 0;">
		<a href="./info?beanNo=${ bean.beanNo }">
			<div class="custom-image">
				${bean.beanOriginName}
			</div>
		</a>
		<c:choose>
			<c:when test="${ bean.status == 'Y' }">
			<p>${ bean.beanName }</p>
			<p>맛: ${ bean.cupNoteNames }</p>
			<p>리뷰 : ${ bean.reviewCount }</p>
			</c:when>
			<c:when test="${ bean.status == 'N' }">
			<p>판매 종료</p>
     		<p>&nbsp;</p>
     		<p>&nbsp;</p>
			</c:when>
		</c:choose>	
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

</div>

<c:import url="./paging.jsp"/>

</div>

<c:import url="../layout/footer.jsp" />

</body>
</html>