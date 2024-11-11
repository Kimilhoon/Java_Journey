<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header --->
<c:import url="../layout/header.jsp"/>
<!-- 관리자 메뉴 모음 -->
<div class="container d-flex justify-content-center">
<!-- 카페 -->
<div class="d-flex align-items-center" style="width: 900px; height: 300px;">
<ul class="fs-3 px-3" style="list-style:none; border:1px solid #ccc;">
	<li><a href="/create/cafe" style="text-decoration: none; color: black;">카페등록</a></li>
	<li><a href="/cafe/all" style="text-decoration: none; color: black;">전체카페</a></li>
	<li><a href="/comm/creview/list" style="text-decoration: none; color: black;">카페리뷰</a></li>
</ul>
<ul class="fs-3 px-3" style="list-style:none; border:1px solid #ccc;">
<!-- 원두 -->
	<li><a href="/create/bean" style="text-decoration: none; color: black;">원두등록</a></li>
	<li><a href="/bean/all" style="text-decoration: none; color: black;">전체원두</a></li>
	<li><a href="/comm/breview/list" style="text-decoration: none; color: black;">원두리뷰</a></li>
</ul>
<ul class="fs-3 px-3" style="list-style:none; border:1px solid #ccc;">
<!-- 자게, 나만의레시피, 공지 -->
	<li><a href="/comm/freeboard/list" style="text-decoration: none; color: black;">자유게시판</a></li>
	<li><a href="/comm/recipe/list" style="text-decoration: none; color: black;">나만의레시피</a></li>
	<li><a href="/comm/notice/list" style="text-decoration: none; color: black;">공지사항</a></li>
	<li><a href="/comm/event/list" style="text-decoration: none; color: black;">이벤트</a></li>
	<li><a href="/comm/faq/list" style="text-decoration: none; color: black;">자주묻는질문</a></li>
</ul>
<ul class="fs-3 px-3" style="list-style:none; border:1px solid #ccc;">
<!-- 유저관리  -->
	<li><a href="/manager/user" style="text-decoration: none; color: black;">유저관리</a></li>
	<li><a href="/manager/subuser" style="text-decoration: none; color: black;">구독관리</a></li>
</ul>
</div>
</div>
<!-- footer -->
<c:import url="../layout/footer.jsp"/>