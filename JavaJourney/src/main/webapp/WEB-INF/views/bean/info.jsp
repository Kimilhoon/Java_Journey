<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />  

<script type="text/javascript">
$(function() {

/* 버튼 설정 */
/* -------------------------------------------------------------------------------------------------------------- */
	
	$("#sub").click(function() {
		location.href="./bean/sub";
	})

	$(document).ready(function() {
	
		$("#wish").click(function() {
			
			// 현재 버튼의 텍스트 가져오기
			const currentText = $(this).text();
	        
	     	// 데이터 객체 생성
			var beanNo = ${ beanInfo.beanNo }
			var userNo = ${ userNo }

			// 버튼 클릭 시 텍스트 변경 (찜 상태 토글)
	        if (currentText === "찜 ♡") {
	            $(this).text("찜 ♥");  // 찜을 추가
	            sendWishData(beanNo, userNo, 'add');  // 데이터 추가 요청
	            
	        } else {
	            $(this).text("찜 ♡");  // 찜을 취소
	            sendWishData(beanNo, userNo, 'remove');  // 데이터 삭제 요청
	            
	        }
			
	    }); // $("#wish").click(function() end
			
	    function sendWishData(beanNo, userNo, action) {
	    	
	        $.ajax({
	            url: './info',  // 요청 URL
	            type: 'POST',
	            contentType: 'application/json',  // JSON 형식
	            data: JSON.stringify({ 
	                beanNo: beanNo,
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

	}); // $(document).ready() end
			
/* 메뉴바 설정 */
/* -------------------------------------------------------------------------------------------------------------- */
	
	$("#beanSaleBtn").click(function() {
		location.href="#beanSale"
	})
	
	$("#beanInformationBtn").click(function() {
		location.href="#beanInformation"
	})
	
	$("#beanReviewBtn").click(function() {
		location.href="#beanReview"
	})
	
/* 버튼들 설정 */
/* -------------------------------------------------------------------------------------------------------------- */
	
	$("#btnList").click(function() {
		location.href="./all";
	});
	
	$("#btnUpdate").click(function() {
		location.href="/create/beanupdate?beanNo=${beanInfo.beanNo}";
	});
	
	$("#btnDelete").click(function() {
		location.href="/create/beandelete?beanNo=${beanInfo.beanNo}";
	});
	
/* -------------------------------------------------------------------------------------------------------------- */
	
	// JavaScript 코드
// 	window.addEventListener("scroll", function() {
// 	    const menuTab = document.getElementById("#beanMenu");
// 	    const stickyPoint = menuTab.offsetTop;  // 메뉴가 원래 위치한 지점

// 	    if (window.pageYOffset > stickyPoint) {
// 	        menuTab.classList.add("sticky");  // 스크롤 위치가 메뉴 지점을 지나면 sticky 클래스를 추가
// 	    } else {
// 	        menuTab.classList.remove("sticky");  // 스크롤 위치가 메뉴 지점 위로 올라가면 sticky 클래스를 제거
// 	    }
// 	});
	
	$(document).ready(function() {
		
		var tapsTop = $("#beanMenu").offset().top; 
		console.log(tapsTop)
		
		$(window).scroll(function() {
		   
			var window = $(this).scrollTop();
		    
			if(tapsTop <= window) {
				$("#beanMenu").addClass("fixed");
			}else{
				$("#beanMenu").removeClass("fixed");
			} // if(tapsTop <= window) end
			
		}); // $(window).scroll(function() end
				
	}); // $(document).ready(function() end
	
	
}) // $(function() end 
</script>

<style type="text/css">
#wish, #sub{
	width: 150px;
}

#beanMenu.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background: white;
}

/* 기본 스타일 */
/*  #beanMenu {  */
/*    width: 100%;  */
/*     color: white;  */
/*    padding: 10px;  */
/*      text-align: center;  */
/* }  */

/* 상단에 고정될 때의 스타일 */
/* .sticky {  */
/* 	position: fixed; */
/* 	top: 0; */
/* 	left: 0; */
/* 	width: 100%; */
/* 	z-index: 1000; */
/* } */

</style>

<div class="container">

<div class="text-center m-5">
<h1>원두 상세보기</h1>
</div>

<div id="commbean" class="d-flex mb-3">
<div id="image" style="flex-shrink: 0;" class="img-thumbnail">
${ beanInfo.beanOriginName }
<%-- <img src="<c:url value='${ beanInfo.beanOriginName }'/>" alt="${beanInfo.beanName}" class="img-thumbnail" style="width: 400px; height: 400px; object-fit: contain;"/> --%>
</div>

<div id="explain" class="p-2">
<div>
<h2>${ beanInfo.beanName }</h2>
</div>

<div class="mb-2">
<span>${ beanInfo.origin }</span>
</div>

<div>
<span>${ beanInfo.beanComm }</span>
<!-- <p>다아한 탱산뎌언인은 헐즛구에해의 로렘입숨 테스트 데이터 잘 보고 갑니다 ㅎㅎ 넘 ㅜ좋으네여 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를. </p> -->
</div>

<div>
<table class="table p-2">
<tr>
	<th>별점</th>
	<c:if test="${ beanInfo.revStarPoint == 1 }">
	<td>★(<c:out value="${beanInfo.revStarPoint}" />)</td>
	</c:if>
	<c:if test="${ beanInfo.revStarPoint == 2 }">
	<td>★★(<c:out value="${beanInfo.revStarPoint}" />)</td>
	</c:if>
	<c:if test="${ beanInfo.revStarPoint == 3 }">
	<td>★★★(<c:out value="${beanInfo.revStarPoint}" />)</td>
	</c:if>
	<c:if test="${ beanInfo.revStarPoint == 4 }">
	<td>★★★★(<c:out value="${beanInfo.revStarPoint}" />)</td>
	</c:if>
	<c:if test="${ beanInfo.revStarPoint == 5 }">
	<td>★★★★★(<c:out value="${beanInfo.revStarPoint}" />)</td>
	</c:if>
</tr>
</table>
<!-- <dl class="d-flex text-center"> -->
<!-- <dt>별점 : </dt> -->
<!-- <dd> ★★★★★(5.0)</dd> -->
<!-- </dl> -->
</div>

<div id="btn" class="d-flex justify-content-center mt-auto">
<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
<button type="button" id="sub" class="btn btn-secondary btn-lg m-2">구독</button>
</div>

</div>
</div> <!-- <div id="commbean" class="d-flex"> -->

<!-- <div id="buttons" class="d-flex "> -->
<!-- <button class="p-2 flex-fill">제품 상세 정보</button> -->
<!-- <button class="p-2 flex-fill">제품 구매 안내</button> -->
<!-- <button class="p-2 flex-fill">제품 리뷰</button> -->
<!-- </div> -->

<div id="beanMenu" class="btn-group w-100 nav" role="group" aria-label="Basic radio toggle button group" >
	<input type="radio" class="btn-check" name="btnradio" id="beanSaleBtn" autocomplete="off" checked>
	<label class="btn btn-outline-secondary" for="beanSaleBtn">제품 구매 안내</label>
	
	<input type="radio" class="btn-check" name="btnradio" id="beanInformationBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="beanInformationBtn">제품 상세 정보</label>

	<input type="radio" class="btn-check btn-secondary" name="btnradio" id="beanReviewBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="beanReviewBtn">제품 리뷰</label>
</div>


<div id="beanSale" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
<div>
<p class="text-bg-secondary p-3 text-center mb-3 w-100">제품 구매 안내</p>
</div>

<div> 

<table class="table table-borderless">
<tr>
	<th>식품의 유형</th>
	<td>원두</td>
</tr>
<tr>
	<th>유통원 및 소재지</th>
	<td>(주)JavaJourney / 서울시 강남구 테헤란로 130 5층</td>
</tr>
<tr>
	<th>유통기한</th>
	<td>상품 상세설명 참조</td>
</tr>
<tr>
	<th>제조연월일</th>
	<td>주문 익일 오전 당일로스팅</td>
</tr>
<tr>
	<th>용량</th>
	<td>200g / 1Kg</td>
</tr>
<tr>
	<th>영양성분</th>
	<td>상품 상세설명 참조</td>
</tr>
<tr>
	<th>보관방법</th>
	<td>
	직사광선을 피해 서늘한 곳에 보관해주세요
	장시간 보관시 냉동상태로 보관 해주는 것이 좋습니다
	</td>
</tr>
<tr>
	<th>소비자안전을 위한 주의사항</th>
	<td>카페인에 민감하신 분이나 15세 미만의 어린이는 음용을 삼가하시기 바랍니다.</td>
</tr>
<tr>
	<th>제품문의 관련 전화번호</th>
	<td>JavaJourney 고객센터 : 010-3227-5095</td>
</tr>
</table>

</div>
</div>

<div id="beanInformation" class="text-center shadow-sm p-3 mb-5 bg-body-tertiary rounded">
<div>
<p class="text-bg-secondary p-3 text-center mb-3 w-100">제품 상제 정보</p>
</div>
${ beanInfo.beanInfo }
</div>

<div id="beanReview" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
<div>
<p class="text-bg-secondary p-3 text-center mb-3 w-100">제품 리뷰</p>
</div>
</div>

<div id="btnGroup" class="text-center">
<button type="button" id="btnList" class="btn btn-secondary">목록</button>

<c:if test="${ userNick eq 'admin' }">
<button type="button" id="btnUpdate" class="btn btn-warning">수정</button>
<button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
</c:if>
</div>


</div> <!-- <div class="container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>