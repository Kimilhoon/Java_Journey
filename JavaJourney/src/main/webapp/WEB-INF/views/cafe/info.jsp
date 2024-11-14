<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
// 	$("#").click(function() {
// 		location.href="./cafe/";
// 	})
	
	$(document).ready(function() {
		$("#wish").click(function() {
			
			//현재 버튼의 텍스트 가져오기
			const currentText = $(this).text();
			
			//데이터 객체 생성
			var cafeNo = cafeNo : ${cafeInfo.cafeNo },
			var cafeNo = userNo : ${userNo }
			
			//버트 클릭 시 텍스트 변경(찜 상태 토글)
			if (currentText === "찜 ♡") {
	            $(this).text("찜 ♥"); //찜 추가
	            sendWishData(cafeNo, userNo, 'add'); //데이터 추가 요청
	            
	        } else {
	            $(this).text("찜 ♡"); //찜 취소
	            sendWishData(cafeNo, userNo, 'remove'); //데이터 삭제 요청
	        }
			
		};
		
		function sendWishData(cafeNo, userNo, action) {
	    	
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

		$("#cafeInfoBtn").click(function() {
			location.href="#cafeInfomation"
		})
		
		$("#cafeLocBtn").click(function() {
			location.href="#cafeLoc"
		})
		
		$("#cafeRevBtn").click(function() {
			location.href="#cafeReview"
		})
		
	/* 버튼 경로 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */
		
		$("#btnAll").click(function() {
			location.href="./all";
		});
		
		$("#btnBest").click(function() {
			location.href="./best";
		});
	
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
<%--   <img src="/resources/img/cafe/c01.jpg" class="col-md-6 float-md-start mb-3 ms-md-3" alt="${cafe.cafeNo }"> --%>
<!--   <p>대충 카페 분위기에 대한 설명임...</p> -->
<div id="image" style="flex-shrink: 0; width: 400px; height: 550px; object-fit: container;" class="img-thumbnail" >
${ cafeInfo.cafeOriginName }


	<div id="explain p-2">
	<div>
	<p class="fw-bold fs-1">${ cafeInfo.cafeName }</p>
	</div>
	
	<div class="mb-2">
	<p>${ cafeInfo.cafeLoc }</p>
	</div>
	
	<div class="mb-2">
	<p>${ cafeInfo.busyTime }</p>
	</div>
	
	<div class="mb-2">
	<p style="height: 300px;">${ cafeInfo.cafeComm }</p>
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
	
</div> <!-- commCafe End -->

	<div id="btn" class="d-flex justify-content-center align-self-end">
		<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
		<button type="button" id="sub" class="btn btn-secondary btn-lg m-2">리뷰쓰기</button>
	</div>

<div id="cafeMenu" class="btn-group w-100 nav" role="group" aria-label="Basic radio toggle button group">
	<input type="radio" class="btn-check" name="btnradio" id="cafeInfoBtn" autocomplete="off" checked>
	<label class="btn btn-outline-secondary" for="cafeBtn">카페 상세 안내</label>
	        
	<input type="radio" class="btn-check" name="btnradio" id="cafeLocBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeLocBtn">카페 위치 정보</label>
		
	<input type="radio" class="btn-check" name="btnradio" id="cafeRevBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeReviewBtn">카페 리뷰</label>
</div>

<div id="cafeInfo" class="text-center shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 상세 정보</p>
	</div>
	<div class="text-center">
		${ cafeInfo.cafeInfo }
		<p>카페 안내문구 및 사진 출력</p>
	</div>
</div>

<div id="cafeLoc" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 위치 정보</p>
	</div>

	<div class="text-center">
		${cafeInfo.cafeLoc }
		<p>지도 API로 표시해줄 예정임.</p>
	</div>
</div>

<div id="cafeRev" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 리뷰</p>
	</div>
	
	<table class="table" style="width: 100%">
	<c:forEach var="cafeRev" items="${ AllCafeList }">
	<tr>
		<td class="text-center" style="width: 10%">${ cafeRev.userNick }</td>
		<td style="width: 60%">${ cafeRev.revCont }</td>
		<td class="text-center"  style="width: 15%">
		<fmt:formatDate value="${ cafeRev.revDate }" pattern="yyyy년 MM월 dd일" />
		</td>
		<td class="text-center"  style="width: 15%">
		    <c:forEach var="star" begin="1" end="${ cafeRev.revStarPoint != null ? cafeRev.revStarPoint : 0 }">
		        ★
		    </c:forEach>
		    <c:if test="${ cafeRev.revStarPoint != null }">
		        (<c:out value="${ cafeRev.revStarPoint }" />)
		    </c:if>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>

</div><!-- id="commCafe" class="clearfix" End -->

</div><!-- container End -->

<div id="btnGroup" class="text-center">
<!-- <button type="button" id="btnAll" class="btn btn-secondary">전체 카페</button> -->
<!-- <button type="button" id="btnBest" class="btn btn-secondary">베스트 카페</button> -->
<!-- 		<a class="btn btn-secondary" href="./all" role="button">전체 카페</a> -->
<!-- 		<a class="btn btn-secondary" href="./best" role="button">베스트 카페</a> -->
	<a href="./all"><button id="btnAll" class="btn btn-secondary" type="button">전체 카페</button></a>
	<a href="./best"><button id="btnBest" class="btn btn-secondary" type="button">베스트 카페</button></a>
</div>



<c:import url="../layout/footer.jsp"/>


