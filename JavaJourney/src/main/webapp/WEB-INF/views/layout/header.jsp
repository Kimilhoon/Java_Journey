<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!-- header내용 --->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaJourney</title>
<!-- bootstrap 링크 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/png" href="/resources/favicon/JavaJourneyIcon.png">
<!-- bootstrap 링크 End -->
<!-- jquery 링크 -->
<!-- jquery 링크 END -->
<!-- summernote 링크 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<!-- summernote 링크 End-->

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="/member/logout;"
	}) 
})
</script>

<style>
/* 로고 크기 조정 */
#logo {
	position: flex;
    height: 100px;
    width: 100px;
    margin-top: 20px;
    margin-bottom: 20px;
}

/* 우측 상단에 회원가입, 로그인, 로그아웃 버튼 배치 */
.loginLoc {
    position: absolute;
    top: 10px;
    right: 10px;
}

/* 메뉴바 크기 및 텍스트 스타일 조정 */
.navbar-nav .nav-link {
    color: #f3e9dc !important;
    font-size: 1.1rem;
    font-weight: 500;
    padding: 0.75rem 1.25rem;
    display: flex;
    align-items: center; /* 텍스트와 아이콘 가운데 정렬 */
    transition: color 0.3s ease, background-color 0.3s ease;
}

/* 메뉴바 크기 조정 */
.navbar-nav .nav-link {
    font-size: 1.2rem; /* 크기를 조절 */
    padding: 0.5rem 1rem;
}

/* 드롭다운 메뉴 스타일 */
.dropdown-menu {
    background-color: #f3e9dc; /* 배경색 베이지 */
    border: none;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 드롭다운에 그림자 추가 */
    text-align: center;
    border-radius: 0.375rem; /* 모서리 둥글게 */
    position: absolute;
    z-index: 1000;
    top: 100%; /* 메뉴가 아이템 아래로 떨어지게 */
    left: 50%;
    transform: translateX(-50%); /* 메뉴가 정확히 가운데로 위치하게 */
    padding: 0.5rem 0; /* 위아래 여백 추가 */
}

/* 드롭다운 아이템 스타일 */
.dropdown-menu .dropdown-item {
    color: #4B3621;
    font-size: 0.95rem;
    padding: 0.5rem 1.5rem;
    display: flex;
    align-items: center; /* 드롭다운 아이템 텍스트 가운데 정렬 */
    transition: background-color 0.3s ease;
}

.dropdown-menu .dropdown-item:hover {
    background-color: #d9c3a5; /* 살짝 어두운 베이지색 */
}

/* 메뉴바를 중앙 정렬 및 폭 조정 */
.navbar {
    background-color: #6f4e37; /* 갈색 배경색 */
    width: 100%;
    padding: 0.5rem 0; /* 위아래 여백 조정 */
}

.navbar-nav {
    gap: 1rem; /* 메뉴 간격 */
}

/* 드롭다운 메뉴가 hover 시 나타나도록 */
.navbar-nav .nav-item:hover .dropdown-menu {
    display: block;
}

/* 메뉴바 전체 배경이 꽉 차도록 조정 */
.d-flex.justify-content-center {
    background-color: #6f4e37; /* 갈색 배경색 */
    width: 100%;
}

/* 드롭다운 메뉴 항목 클릭 방지 */
.navbar-nav .nav-item > a {
    pointer-events: none; /* 클릭이 안되도록 설정 */
}
</style>

</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>

<div class="d-flex justify-content-center">
<a href="/main" style="text-decoration: none;">
<img src="<c:url value='/resources/img/coffeeLogo.png' />" alt="로고" width="200" height="200" id="logo" />
</a>

<!-- 로그인 및 기타 링크 -->
 	 <div class="flex-shrink-0">
  		<c:if test="${isLogin }">
  			<div class="loginLoc">
			<span id="btnLogout" style="color: #f3e9dc; cursor: pointer;"><small>로그아웃</small></span>
  			</div>
		</c:if>
		<c:if test="${empty isLogin }">
			<div class="loginLoc">
			<a href="/member/join" style="text-decoration: none; color: #f3e9dc;"><small>회원가입</small></a>
			<span style="color:#f3e9dc"> | </span>
      		<a href="/member/login" style="text-decoration: none; color: #f3e9dc;"><small>로그인</small></a>
			</div>
		</c:if>
  	</div>
  	
  	<c:if test="${userNick eq 'admin' }">
	    <div class="flex-shrink-0 loginLoc">
	      <ul style="list-style:none">
	      	<li><a href="/manager/menu2" style="text-decoration: none; color: yellow;"><br>관리자전용메뉴</a></li>
	      </ul>
	    </div>
  	</c:if>
  </div>

<div class="d-flex justify-content-center align-items-center mb-5" style="width: 100%; background-color: #6f4e37;">
  <nav class="navbar navbar-expand-lg container py-2" style="width: 100%; max-width: 1200px;">
    <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
      <ul class="navbar-nav mb-0 d-flex justify-content-center">
        <!-- 브랜드 메뉴 -->
        <li class="nav-item dropdown mx-2">
          <a class="nav-link dropdown fs-5 text-light" href="/brand" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            브랜드
          </a>
          <ul class="dropdown-menu bg-light">
            <li><a class="dropdown-item" href="/brand/info">브랜드소개</a></li>
          </ul>
        </li>
        
        <!-- 카페 메뉴 -->
        <li class="nav-item dropdown mx-2">
          <a class="nav-link dropdown fs-5 text-light" href="/cafe/best" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            카페
          </a>
          <ul class="dropdown-menu bg-light">
            <li><a class="dropdown-item" href="/cafe/best">이달의 카페</a></li>
            <li><a class="dropdown-item" href="/cafe/all">전체 카페</a></li>
          </ul>
        </li>
        
        <!-- 원두 메뉴 -->
        <li class="nav-item dropdown mx-2">
          <a class="nav-link dropdown fs-5 text-light" href="/bean/best" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            원두
          </a>
          <ul class="dropdown-menu bg-light">
            <li><a class="dropdown-item" href="/bean/best">이달의 원두</a></li>
            <li><a class="dropdown-item" href="/bean/all">전체 원두</a></li>
          </ul>
        </li>
        
        <!-- 취향조사 메뉴 -->
        <li class="nav-item dropdown mx-2">
          <a class="nav-link dropdown fs-5 text-light" href="/quiz/quiz" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            취향조사
          </a>
          <ul class="dropdown-menu bg-light">
            <li><a class="dropdown-item" href="/quiz/quiz1">취향 원두 찾기</a></li>
          </ul>
        </li>
        
        <!-- 커뮤니티 메뉴 -->
        <li class="nav-item dropdown mx-2">
          <a class="nav-link dropdown fs-5 text-light" href="/cafereview/list" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            커뮤니티
          </a>
          <ul class="dropdown-menu bg-light">
            <li><a class="dropdown-item" href="/comm/creview/list">카페리뷰</a></li>
            <li><a class="dropdown-item" href="/comm/breview/list">원두리뷰</a></li>
            <li><a class="dropdown-item" href="/comm/freeboard/list">자유게시판</a></li>
            <li><a class="dropdown-item" href="/comm/myrecipe/list">나만의 레시피</a></li>
            <li><a class="dropdown-item" href="/comm/event/event">이벤트</a></li>
            <li><a class="dropdown-item" href="/comm/notice/list">공지사항</a></li>
            <li><a class="dropdown-item" href="/comm/faq/list">자주묻는 질문</a></li>
          </ul>
        </li>
        
        <!-- 마이페이지 메뉴 -->
        <li class="nav-item dropdown mx-2">
          <a class="nav-link dropdown fs-5 text-light" href="/mypage/myinfo" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            마이페이지
          </a>
          <ul class="dropdown-menu bg-light">
            <li><a class="dropdown-item" href="/mypage/myinfo">회원 정보 수정</a></li>
            <li><a class="dropdown-item" href="/mypage/quizres?userNo=${sessionScope.userNo}">내 취향 결과</a></li>
            <li><a class="dropdown-item" href="/mypage/subscribe?userNo=${sessionScope.userNo}">구독 정보</a></li>
            <li><a class="dropdown-item" href="/mypage/like?userNo=${sessionScope.userNo}">찜 목록</a></li>
            <li><a class="dropdown-item" href="/mypage/myview?userNo=${sessionScope.userNo}">작성글 확인</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</div>

