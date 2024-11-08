<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<style type="text/css">

.container {
    max-width: 960px;
    margin: 0 auto;
}

.img-fluid {
    max-width: 50%;
    height: auto;
}

</style>

<div class="container">
<!--     <div class="image-placeholder"> -->
<!--         여기에 이미지 표시 -->
<%--         <img alt="${cafe.cafeName }" src="/resources/img/cafe/c01.jpg" style="width: 30%;"> --%>
<!--     </div> -->
    <div class="row">
        <div class="col-md-6">
            <img src="/resources/img/cafe/c01.jpg" class="img-fluid" alt="${cafe.cafeName }">
        </div>
        <div class="col-md-6">
        </div>
    </div>

    <div class="details">
        <h2>${cafe.cafeName}</h2>
        <p><strong>위치:</strong> ${cafe.cafeLoc}</p>
        <p>${cafe.cafeComm}</p>
        
        <div class="rating">
	        <h3>커피 평가</h3>
	        <div class="star-rating">
	            <!-- 각 별에 대해 라디오 버튼을 사용하여 클릭 이벤트 구현 -->
	            <input type="radio" name="rating" value="5" id="star5">
  				<label for="star5"><i class="fas fa-star"></i></label>
	        </div>
	    </div>
	    
        <div class="buttons">
            <button class="button">💖 찜</button>
            <button class="button">리뷰쓰기</button>
        </div>
    </div>



    <div class="tabs">
        <div class="tab tab-active">제품 상세 정보</div>
        <div class="tab">제품 구매 안내</div>
        <div class="tab">제품 리뷰</div>
    </div>

    <!-- 탭에 따라 보여질 내용 영역 -->
    <div class="tab-content">
        <h3>제품 상세 정보</h3>
        <p>여기에 제품 상세 정보를 입력합니다...</p>
    </div>
</div>



<c:import url="../layout/footer.jsp"/>