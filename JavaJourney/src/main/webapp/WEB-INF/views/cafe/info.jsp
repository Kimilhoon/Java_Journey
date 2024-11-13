<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
	$("#sub").click(function() {
		location.href="./cafe/sub";
	})
	
	$(document).ready(function() {
		$("#wish").click(function() {
			const currentText = $(this).text();
			
			var cafeNo = cafeNo : ${cafe.cafeNo },
			var cafeNo = userNo : ${userNo }
			
			if (currentText === "찜 ♡") {
	            $(this).text("찜 ♥"); //찜 추가
	            sendWishData(cafeNo, userNo, 'add');
	            
	        } else {
	            $(this).text("찜 ♡"); //찜 취소
	            sendWishData(cafeNo, userNo, 'remove');
	        }
			
		};
		
		function sendWishData(beanNo, userNo, action) {
	    	
	        $.ajax({
	            url: './info',  // 요청 URL
	            type: 'POST',
	            contentType: 'application/json',  // JSON 형식
	            data: JSON.stringify({ 
	                cafeNo: cafeNo,
	                userNo: userNo,
	                action: action  // 'add' 또는 'remove'
	            }),
	            dataType: "json",  // 서버에서 JSON 응답을 받을 때
	            success: function(response) {
	                if (action === 'add') {
	                    console.log('찜 상태가 추가되었습니다.');
	                    
	                } else if (action === 'remove') {
	                    console.log('찜 상태가 취소되었습니다.');
	                    
	                }
	            },
	            error: function() {
	                console.error("AJAX 요청에 실패했습니다.");
	            }
	        })
	    };
	});
	/* 메뉴바 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */
		
// 		$("#cafeBtn").click(function() {
// 			location.href="#cafe"
// 		})
		
// 		$("#cafeBtn").click(function() {
// 			location.href="#cafermation"
// 		})
		
// 		$("#cafeReviewBtn").click(function() {
// 			location.href="#cafeReview"
// 		})
		
	/* 버튼들 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */
		
		$("#btnList").click(function() {
			location.href="./all";
		});
		
// 		$("#btnUpdate").click(function() {
// 			location.href="/create/cafeupdate?cafeNo=${cafe.cafeNo}";
// 		});
		
// 		$("#btnDelete").click(function() {
// 			location.href="/create/cafedelete?cafeNo=${cafe.cafeNo}";
// 		});
		
	/* -------------------------------------------------------------------------------------------------------------- */
		
		// JavaScript 코드
//	 	window.addEventListener("scroll", function() {
//	 	    const menuTab = document.getElementById("#cafeMenu");
//	 	    const stickyPoint = menuTab.offsetTop;  // 메뉴가 원래 위치한 지점

//	 	    if (window.pageYOffset > stickyPoint) {
//	 	        menuTab.classList.add("sticky");  // 스크롤 위치가 메뉴 지점을 지나면 sticky 클래스를 추가
//	 	    } else {
//	 	        menuTab.classList.remove("sticky");  // 스크롤 위치가 메뉴 지점 위로 올라가면 sticky 클래스를 제거
//	 	    }
//	 	});
		
		$(document).ready(function() {
			
			var tapsTop = $("#cafeMenu").offset().top; 
			console.log(tapsTop)
			
			$(window).scroll(function() {
			   
				var window = $(this).scrollTop();
			    
				if(tapsTop <= window) {
					$("#cafeMenu").addClass("fixed");
				}else{
					$("#cafeMenu").removeClass("fixed");
				} // if(tapsTop <= window) end
				
			}); // $(window).scroll(function() end
					
		}); // $(document).ready(function() end
		
		
	}) // $(function() end 
</script>

<style type="text/css">
#wish, #sub{
	width: 150px;
}
</style>

<div class="container">

<div class="text-center m-5">
<h1>카페 상세보기</h1>
</div>

<!-- <div id="commCafe" class="d-flex mb-3"> -->
<!-- 	<div id="img" style="flex-shrink: 0;" class="img-thumbnail"> -->
<%-- 		<img src="/resources/img/cafe/c01.jpg" class="img-fluid" alt="${cafe.cafeNo }"> --%>
<!-- 	</div> -->

<div id="commCafe" class="clearfix">
  <img src="/resources/img/cafe/c01.jpg" class="col-md-6 float-md-start mb-3 ms-md-3" alt="${cafe.cafeNo }">
  <p>대충 카페 분위기에 대한 설명임...</p>


	<div id="explain p-2">
	<div>
	<h2>${ cafe.cafeName }</h2>
	</div>
	
	<div class="mb-2">
	<h2>${ cafe.cafeLoc }</h2>
	</div>
	
	<div class="mb-2">
	<h3>${ cafe.busyTime }</h3>
	</div>
	
	<div class="mb-2">
	<span>${ cafe.cafeComm }</span>
	</div>
 </div>

<!-- <div> -->
<%-- <span>${ cafe.cafeComm }</span> --%>
<!-- <p> 대충 카페 분위기에 대한 설명임...</p> -->
<!-- </div> -->

<!-- <div> -->
<!-- <dl class="d-flex text-center"> -->
<!-- <dt>별점</dt> -->
<!-- <dd>★★★★★(5.0)</dd> -->
<!-- </dl> -->
<!-- </div> -->
<!-- <div> -->
<!-- <table class="table p-2"> -->
<!-- <tr> -->
<!-- 	<th>별점</th> -->
<%-- 	<c:if test="${ cafe.revStarPoint == 1 }"> --%>
<%-- 	<td>★(<c:out value="${cafe.revStarPoint}" />)</td> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${ cafe.revStarPoint == 2 }"> --%>
<%-- 	<td>★★(<c:out value="${cafe.revStarPoint}" />)</td> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${ cafe.revStarPoint == 3 }"> --%>
<%-- 	<td>★★★(<c:out value="${cafe.revStarPoint}" />)</td> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${ cafe.revStarPoint == 4 }"> --%>
<%-- 	<td>★★★★(<c:out value="${cafe.revStarPoint}" />)</td> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${ cafe.revStarPoint == 5 }"> --%>
<%-- 	<td>★★★★★(<c:out value="${cafe.revStarPoint}" />)</td> --%>
<%-- 	</c:if> --%>
<!-- </tr> -->
<!-- </table> -->
<!-- </div> -->
	
	<div id="btn" class="d-flex justify-content-center align-self-end">
		<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
		<button type="button" id="sub" class="btn btn-secondary btn-lg m-2">리뷰쓰기</button>
	</div>
</div> <!-- commCafe End -->

<div class="btn-group w-100 nav" role="group" aria-label="Basic radio toggle button group">
	<input type="radio" class="btn-check" name="btnradio" id="cafeBtn" autocomplete="off" checked>
	<label class="btn btn-outline-secondary" for="cafeBtn">상세정보</label>
	        
	<input type="radio" class="btn-check" name="btnradio" id="cafeLocBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeLocBtn">위치정보</label>
		
	<input type="radio" class="btn-check" name="btnradio" id="cafeReviewBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeReviewBtn">카페리뷰</label>
</div>

<div id="cafemation" class="text-center shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">상세정보</p>
	</div>
	<div>
		${ cafe.cafeInfo }
		<p>카페 안내문구 및 사진 출력</p>
	</div>
</div>

<div id="cafeLocation" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">위치정보</p>
	</div>

	<div>
		${cafe.cafeLoc }
		<p>지도 API로 표시해줄 예정임.</p>
	</div>
</div>

<div id="cafeReview" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페리뷰</p>
	</div>
	<div>
		<p>리뷰 내용 끌어와서 보여주기</p>
	</div>
</div>






</div><!-- container End -->

	<div class="text-center">
		<a class="btn btn-secondary" href="./all" role="button">전체 카페</a>
		<a class="btn btn-secondary" href="./best" role="button">베스트 카페</a>
<!-- 		<a href="./all"><button class="btn btn-secondary" type="button">전체카페 보러가기</button></a> -->
<!-- 		<a href="./best"><button class="btn btn-secondary" type="button">베스트카페 보러가기</button></a> -->
	</div>



<c:import url="../layout/footer.jsp"/>


