<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 로고를 동그랗게 하고 가운데 겹치게 배치 */
.logo-image {
    position: absolute;
    top: 50%;           /* 부모 요소의 세로 중앙 */
    left: 50%;          /* 부모 요소의 가로 중앙 */
    transform: translate(-50%, -50%); /* 정확히 중앙 정렬 */
    z-index: 1;         /* 로고가 앞에 보이도록 z-index 조절 */
}

.logo-image img {
    border-radius: 50%; /* 동그란 형태 */
/*     border: 5px solid #fff; /* 흰색 테두리 추가 (옵션) */ */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 약간의 그림자 효과 (옵션) */
}
</style>
<!-- bootstrap 링크 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- bootstrap 링크 End -->
</head>
<body>

<!-- <h1 class="text-center">웰컴페이지</h1> -->
<!-- <div class="container d-flex justify-content-center"> -->
<%-- <a href="/cafe/best"><img src="<c:url value='/resources/img/welcome/bestcafe.JPG'/>" --%>
<!-- alt="베스트카페이미지" width="840" height="1080"/></a> -->
<%-- <a href="/main"><img src="<c:url value='/resources/img/coffeeLogo.jpg' />" --%>
<!-- alt="로고" width="240" height="200" /></a> -->
<%-- <a href="/bean/best"><img src="<c:url value='/resources/img/welcome/bestbean.JPG'/>" --%>
<!-- alt="베스트원두이미지" width="840" height="1080"/></a> -->
<!-- </div> -->

<h1 class="text-center"><!-- 웰컴페이지 --></h1>
<div class="container d-flex justify-content-center position-relative">
    <a href="/cafe/best">
        <img src="<c:url value='/resources/img/welcome/bestcafe.JPG'/>"
             alt="베스트카페이미지" width="840" height="1080" />
    </a>
    
    <!-- Logo 이미지: 절대 위치와 동그라미 적용 -->
    <a href="/main" class="logo-image">
        <img src="<c:url value='/resources/img/coffeeLogo.jpg' />"
             alt="로고" width="240" height="200" />
    </a>
    
    <a href="/bean/best">
        <img src="<c:url value='/resources/img/welcome/bestbean.JPG'/>"
             alt="베스트원두이미지" width="840" height="1080" />
    </a>
</div>




</body>
</html>