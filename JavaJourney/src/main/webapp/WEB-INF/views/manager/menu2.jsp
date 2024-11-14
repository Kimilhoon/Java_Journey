<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header --->
<c:import url="../layout/magheader.jsp"/>
<!-- 관리자 메뉴 모음( sidebar ) -->
<style type="text/css">
body {
	font-family: 'Gothic A1', sans-serif;
	background-color: #f8f9fa;
}

/* .navbar {
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #343a40;
	color: white;
	font-size: 1.2rem;
	font-weight: bold;
	font-family: 'Gothic A1', sans-serif;
} */

.d-flex {
	display: flex;
}

.sidebar {
	background-color: #e9ecef;
/* 	padding: 30px; */
	min-height: 100vh;
	width: 250px;
 	font-family: 'Gothic A1', sans-serif; 
}

.sidebar a {
	display: block;
	padding: 10px;
 	margin-bottom: 10px; 
	color: #495057;
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	text-align: center;
	border-radius: 1px;
	text-decoration: none;
	font-family: 'Gothic A1', sans-serif;
}

.sidebar a:hover, .sidebar a.active {
	background-color: #ced4da;
	color: #343a40;
}
.dropdown:hover .dropdown-menu {
      display: flex;
       flex-direction: column; 
/*       flex-direction: row; */
      position: absolute;
      top: 0;
      left: 100%;
    }
.main-content {
	flex: 1;
	padding: 20px;
	font-family: 'Gothic A1', sans-serif;
}
</style>
<div class="sidebar" style="position: absolute; width: 230px;">
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="#" role="button" aria-expanded="false">
	카페
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" href="/create/cafe" style="text-decoration: none; color: black;">카페등록</a></li>
		<li><a class="dropdown-item" href="/cafe/all" style="text-decoration: none; color: black;">전체카페</a></li>
		<li><a class="dropdown-item" href="/comm/creview/list" style="text-decoration: none; color: black;">카페리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
	<li class="nav-item dropdown" style="position: relative;">
	<a class="nav-link dropdown text-black" href="#" role="button" aria-expanded="false">
	원두
	</a>
	<ul class="dropdown-menu bg-light">
		<li><a class="dropdown-item" href="/create/bean" style="text-decoration: none; color: black;">원두등록</a>
		<li><a class="dropdown-item" href="/bean/all" style="text-decoration: none; color: black;">전체원두</a></li>
		<li><a class="dropdown-item" href="/comm/breview/list" style="text-decoration: none; color: black;">원두리뷰</a></li>
	</ul>
	</li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 자게, 나만의레시피, 공지 -->
	<li><a href="/comm/freeboard/list" style="text-decoration: none; color: black;">자유게시판</a></li>
	<li><a href="/comm/myrecipe/list" style="text-decoration: none; color: black;">나만의레시피</a></li>
	<li><a href="/comm/notice/list" style="text-decoration: none; color: black;">공지사항</a></li>
	<li><a href="/comm/event/list" style="text-decoration: none; color: black;">이벤트</a></li>
	<li><a href="/comm/faq/list" style="text-decoration: none; color: black;">자주묻는질문</a></li>
</ul>
<ul class="fs-3 px-3" style="list-style:none;">
<!-- 유저관리  -->
	<li><a href="/manager/user" style="text-decoration: none; color: black;">유저관리</a></li>
	<li><a href="/manager/subuser" style="text-decoration: none; color: black;">구독관리</a></li>
</ul>
</div>

</body>
</html>