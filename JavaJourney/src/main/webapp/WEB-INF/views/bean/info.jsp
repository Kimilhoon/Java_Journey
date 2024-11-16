<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />  

<script type="text/javascript">
$(function() {

/* 버튼 설정 */
/* -------------------------------------------------------------------------------------------------------------- */
	
	$("#sub").click(function() {
		location.href="./sub?beanNo=${beanInfo.beanNo}";
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
	            url: '/bean/info',  // 요청 URL
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
	
	$(".custom-image img").css({
		width: "400px",
		height: "560px",
        objectFit: "container",		// 이미지가 썸네일 크기에 맞도록 설정
        borderRadius: "8px"		// 모서리를 둥글게 (선택 사항)
		 
	});
	
}) // $(function() end 
</script>

<style type="text/css">
#wish, #sub{
	width: 150px;
}

#imageDiv{
	 width: 399px; 
	 height: 559px;
}

#beanMenu.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background: white;
	
}

#beanComm p{
	width: 840px;
	height: 300px;
	
	word-break: keep-all;
}

.custom-imgae{
	margin-right: 5px;
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

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item"><a href="./all">bean</a></li>
		<li class="breadcrumb-item active" aria-current="page">info</li>
	</ol>
</nav>

<div class="text-center m-5">
<h1>원두 상세보기</h1>
</div>

<div id="commbean" class="d-flex mb-3 grid gap-0 column-gap-5">
<div id="imageDiv" style="flex-shrink: 0;">
<div class="custom-image">${ beanInfo.beanOriginName }</div>
</div>

<div id="explain" class="p-2">
<div id="beanName">
<p class="fw-bold fs-1">${ beanInfo.beanName }</p>
</div>

<div id="origin" class="mb-2">
<p class="fw-bold fs-4">${ beanInfo.origin }</p>
</div>

<div id="beanComm">
<p id="beanCommTag">${ beanInfo.beanComm }</p>
<!-- <p>다아한 탱산뎌언인은 헐즛구에해의 로렘입숨 테스트 데이터 잘 보고 갑니다 ㅎㅎ 넘 ㅜ좋으네여 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를. </p> -->
</div>

<div id="starPoint">
<table class="table table-borderless p-2 text-center">
<tr>
	<th>별점</th>
	<td>
    <c:forEach var="star" begin="1" end="${starPoint.avgRevStarPoint != null ? starPoint.avgRevStarPoint : 0}">
        ★
    </c:forEach>
    <c:if test="${starPoint.avgRevStarPoint != null}">
        ( <c:out value="${starPoint.avgRevStarPoint}" /> )
    </c:if>
</td>
</tr>
</table>
<!-- <dl class="d-flex text-center"> -->
<!-- <dt>별점 : </dt> -->
<!-- <dd> ★★★★★(5.0)</dd> -->
<!-- </dl> -->
</div> <!-- <div id="starPoint"> -->

<div id="btn" class="d-flex justify-content-center mt-auto">
<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
<button type="button" id="sub" class="btn btn-secondary btn-lg m-2">구독</button>
</div>

</div> <!-- <div id="explain" class="p-2"> -->
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
<p class="text-bg-secondary p-3 text-center mb-3 w-100">제품 상세 정보</p>
</div>
${ beanInfo.beanInfo }
</div>
 
<div id="beanReview" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
<div>
<p class="text-bg-secondary p-3 text-center mb-3 w-100">제품 리뷰</p>
</div>
<table class="table" style="width: 100%">
<c:forEach var="beanRev" items="${ list }">
<tr>
	<td class="text-center" style="width: 10%">${ beanRev.userNick }</td>
	<td style="width: 60%">
		<a href="../comm/breview/view?revNo=${ beanRev.revNo }" class="link-dark link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">
		${ beanRev.revCont }
		</a>
	</td>
	<td class="text-center"  style="width: 15%">
	<fmt:formatDate value="${ beanRev.revDate }" pattern="yyyy년 MM월 dd일" />
	</td>
	<td class="text-center"  style="width: 15%">
	    <c:forEach var="star" begin="1" end="${ beanRev.revStarPoint != null ? beanRev.revStarPoint : 0 }">
	        ★
	    </c:forEach>
	    <c:if test="${ beanRev.revStarPoint != null }">
	        (<c:out value="${ beanRev.revStarPoint }" />)
	    </c:if>
	</td>
</tr>
</c:forEach>
</table>
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