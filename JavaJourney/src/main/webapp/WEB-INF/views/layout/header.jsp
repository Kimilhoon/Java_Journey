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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/png" href="/resources/favicon/JavaJourneyIcon.png">
<!-- bootstrap 링크 End -->
<!-- jquery 링크 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<div class="d-flex justify-content-center">
<a href="/main" style="text-decoration: none;">
<img src="<c:url value='/resources/img/coffeeLogo.jpg' />"
alt="로고" width="200" height="200" />
</a>
<!-- 로그인 및 기타 링크 -->
  <div class="d-flex align-items-center" style="width: 10%" id="loginLoc">
 	 <div class="flex-shrink-0 mx-3">
  		<ul style="list-style:none">
  		<c:if test="${isLogin }">
  			<li hidden="hidden"></li>
  			<li>아이디 : ${userId}</li>
  			<li>닉네임 : ${userNick}</li>
  			<li><button id="btnLogout">로그아웃</button></li>
		</c:if>
		<c:if test="${empty isLogin }">
			<li><a href="/member/join" style="text-decoration: none; color: red;">회원가입</a></li>
      		<li><a href="/member/login" style="text-decoration: none; color: red;">로그인</a></li>
		</c:if>
  		</ul>
  	</div>
    <div class="flex-shrink-0 mx-5">
      <ul style="list-style:none">
      	<c:if test="${userNick eq 'admin' }">
      	<li><a href="/manager/menu" style="text-decoration: none; color: red;">관리자전용메뉴</a></li>
      	</c:if>
      </ul>
    </div>
  </div>
</div>
<div class="d-flex justify-content-center align-items-center mb-5" style="width: 100%; background-color: #6f4e37;">
  <div class="container d-flex justify-content-center align-items-center" style="max-width: 100%;">
    <!-- 네비게이션 메뉴 -->
    <nav class="navbar navbar-expand-lg">
      <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
        <ul class="navbar-nav mb-2 mb-lg-0 d-flex justify-content-center">
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="/brand" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              브랜드
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="/brand">브랜드소개</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="/cafe/best" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              카페
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="/cafe/best">이달의 카페</a></li>
              <li><a class="dropdown-item" href="/cafe/all">전체 카페</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="/bean/best" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              원두
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="/bean/best">이달의 원두</a></li>
              <li><a class="dropdown-item" href="/bean/all">전체 원두</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="/quiz/quiz" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              취향조사
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="/quiz/quiz">취향 원두 찾기</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="/cafereview/list" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="/mypage/myinfo" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              마이페이지
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="/mypage/myinfo">회원 정보 수정</a></li>
              <li><a class="dropdown-item" href="/mypage/quizres">내 취향 결과</a></li>
              <li><a class="dropdown-item" href="/mypage/subscribe">구독 정보</a></li>
              <li><a class="dropdown-item" href="/mypage/like">찜 목록</a></li>
              <li><a class="dropdown-item" href="/mypage/likeview">작성글 확인</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
</div>
</div>
