<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!-- header내용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaJourney</title>
<!-- bootstrap 링크 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<!-- bootstrap 링크 End -->
<!-- jquery 링크 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- jquery 링크 END -->
<!-- summernote 링크 -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<!-- summernote 링크 End-->
</head>
<body>
<h1 class="h1 text-center text-brown bg-light p-3 rounded">
<a href="/main">커피커피바라바라</a> 
</h1>

<div class="d-flex justify-content-center align-items-center" style="width: 100%; background-color: #6f4e37;">
  <div class="container d-flex justify-content-center align-items-center" style="max-width: 100%;">

    <!-- 네비게이션 메뉴 -->
    <nav class="navbar navbar-expand-lg">
      <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
        <ul class="navbar-nav mb-2 mb-lg-0 d-flex justify-content-center">
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              브랜드
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="#">브랜드소개</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              카페
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="#">이달의 카페</a></li>
              <li><a class="dropdown-item" href="#">전체 카페</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              원두
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="#">이달의 원두</a></li>
              <li><a class="dropdown-item" href="#">전체 원두</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              취향조사
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="#">취향 원두 찾기</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              커뮤니티
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="#">카페리뷰</a></li>
              <li><a class="dropdown-item" href="#">원두리뷰</a></li>
              <li><a class="dropdown-item" href="#">자유게시판</a></li>
              <li><a class="dropdown-item" href="#">나만의 레시피</a></li>
              <li><a class="dropdown-item" href="#">이벤트</a></li>
              <li><a class="dropdown-item" href="#">공지사항</a></li>
              <li><a class="dropdown-item" href="#">자주묻는 질문</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown mx-2 px-1">
            <a class="nav-link dropdown fs-1 text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              마이페이지
            </a>
            <ul class="dropdown-menu bg-light">
              <li><a class="dropdown-item" href="#">내 취향 결과</a></li>
              <li><a class="dropdown-item" href="#">구독 정보</a></li>
              <li><a class="dropdown-item" href="#">찜 목록</a></li>
              <li><a class="dropdown-item" href="#">작성글 확인</a></li>
              <li><a class="dropdown-item" href="#">회원 정보 수정</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>

    <!-- 로그인 및 기타 링크 -->
    <div class="d-flex flex-column align-items-center text-light ms-5" id="loginLoc">
      <ul class="list-unstyled mb-0 text-center">
        <li><a href="#" class="text-light">회원가입</a></li>
        <li><a href="#" class="text-light">로그인</a></li>
        <li><a href="#" class="text-light">카페등록</a></li>
        <li><a href="./comm/bean/write" class="text-light">원두등록</a></li>
        <li><a href="../../main" class="text-light">메인</a></li>
      </ul>
    </div>

  </div>
</div>


