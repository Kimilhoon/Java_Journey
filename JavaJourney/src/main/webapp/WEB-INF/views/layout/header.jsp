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

<div class="header">
<h1 class="text-center" style="color: red;"></h1>
</div>

<div class="d-flex justify-content-between align-items-center" style="width: 100%;">
<div class="nav justify-content-center">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container" style="max-width: 1080px;">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        </li>
        <li class="nav-item dropdown mx-2 px-1">
          <a class="nav-link dropdown fs-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            브랜드
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">브랜드소개</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown mx-2 px-1" >
          <a class="nav-link dropdown  fs-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            카페
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">이달의 카페</a></li>
            <li><a class="dropdown-item" href="#">전체 카페</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown mx-2 px-1">
          <a class="nav-link dropdown fs-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            원두
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">이달의 원두</a></li>
            <li><a class="dropdown-item" href="#">전체 원두</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown mx-2 px-1">
          <a class="nav-link dropdown fs-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            취향조사
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">취향 원두 찾기</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown mx-2 px-1">
          <a class="nav-link dropdown fs-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            커뮤니티
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">카페리뷰</a></li>
            <li><a class="dropdown-item" href="#">원두리뷰</a></li>
            <li><a class="dropdown-item" href="/comm/freeboard/list">자유게시판</a></li>
            <li><a class="dropdown-item" href="#">나만의 레시피</a></li>
            <li><a class="dropdown-item" href="#">이벤트</a></li>
            <li><a class="dropdown-item" href="#">공지사항</a></li>
            <li><a class="dropdown-item" href="#">자주묻는 질문</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown mx-2 px-1">
          <a class="nav-link dropdown fs-1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            마이페이지
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">내 취향 결과</a></li>
            <li><a class="dropdown-item" href="#">구독 정보</a></li>
            <li><a class="dropdown-item" href="#">찜 목록</a></li>
            <li><a class="dropdown-item" href="#">작성글 확인</a></li>
            <li><a class="dropdown-item" href="#">회원 정보 수정</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
 </nav>
</div>

  <div class="d-flex align-items-center" style="width: 10%" id="loginLoc">
    <div class="flex-shrink-0">
      <ul>
      	<li><a href="/member/join">회원가입</a></li>
      	<li><a href="/member/login">로그인</a></li>
      	<li><a href="#">카페등록</a></li>
      	<li><a href="./comm/bean/write">원두등록</a></li>
      	<li><a href="/main"><button>메인</button></a></li>
      </ul>
    </div>
  </div>
</div>