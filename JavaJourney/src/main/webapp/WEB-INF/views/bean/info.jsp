<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(function() {

/* 버튼 설정 */
/* -------------------------------------------------------------------------------------------------------------- */
	$("#wish").click(function() {
		const currentText = $(this).text();
        
        if (currentText === "찜 ♡") {
            $(this).text("찜 ♥");
        } else {
            $(this).text("찜 ♡");
        }
	});
	
	$("#sub").click(function() {
		location.href="./bean/sub";
	})

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
	
	$("#btnList").click(function() {
		location.href="./all";
	})
	
	$("#btnUpdate").click(function() {
		location.href="/create/update?beanNo=${ beanInfo.beanNo }&&beanImgNo=${beanInfo.beanImgNo}";
	})
	
	$("#btnDelete").click(function() {
		location.href="/create/delete?beanNo=${ beanInfo.beanNo }";
	})
	
/* -------------------------------------------------------------------------------------------------------------- */
	
	// JavaScript 코드
	window.addEventListener("scroll", function() {
	    const menuTab = document.getElementById("#beanMenu");
	    const stickyPoint = menuTab.offsetTop;  // 메뉴가 원래 위치한 지점

	    if (window.pageYOffset > stickyPoint) {
	        menuTab.classList.add("sticky");  // 스크롤 위치가 메뉴 지점을 지나면 sticky 클래스를 추가
	    } else {
	        menuTab.classList.remove("sticky");  // 스크롤 위치가 메뉴 지점 위로 올라가면 sticky 클래스를 제거
	    }
	});
	
	
})
</script>

<style type="text/css">
#wish, #sub{
	width: 150px;
}

/* 기본 스타일 */
/* #beanMenu { */
/*     width: 100%; */
/*     background-color: #333; */
/*     color: white; */
/*     padding: 10px; */
/*     text-align: center; */
/* } */

/* 상단에 고정될 때의 스타일 */
.sticky { 
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
}

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
<h3>${ beanInfo.beanName }</h3>
</div>

<div class="mb-2">
<span>${ beanInfo.origin }</span>
</div>

<div>
<span>${ beanInfo.beanComm }</span>
<!-- <p>다아한 탱산뎌언인은 헐즛구에해의 로렘입숨 테스트 데이터 잘 보고 갑니다 ㅎㅎ 넘 ㅜ좋으네여 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를.다아한 탱산뎌언인은 헐즛구에해의 즐승간바가뭉은 강게노며 시승 뎀옸에 어살이껀 쉬젭힙잉의 드다는 라마시를. </p> -->
</div>

<div>
<dl class="d-flex text-center">
<dt>별점 : </dt>
<dd> ★★★★★(5.0)</dd>
</dl>
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


<div id="beanSale">
제품 구매 안내
</div>

<div id="beanInformation">
${ beanInfo.beanInfo }
</div>

<div id="beanReview">
제품 리뷰
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