<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header --->
<c:import url="../layout/header.jsp"/>

<!-- 관리자 메뉴 모음 -->
<div class="container">
<!-- 카페 -->
<a href="/cafe/all">전체카페</a>
<a href="/comm/creview/list">카페리뷰</a>
<!-- 원두 -->
<a href="/create/bean">원두등록</a>
<a href="/create/all">전체원두</a>
<a href="/comm/breview/list">원두리뷰</a>
<!-- 자게 -->
<a href="/comm/freeboard/list">자유게시판</a>
<!-- 나만의레시피 -->
<a href="/comm/freeboard/list">나만의레시피</a>
<!-- 공지 -->
<a href="/comm/notice">공지사항</a>
<a href="/comm/event">이벤트</a>
<a href="/comm/faq">자주묻는질문</a>
<!-- 유저관리  -->
<a href="/manager/user">유저관리</a>
<a href="/manager/subuser">구독관리</a>
</div>


<!-- footer -->
<c:import url="../layout/footer.jsp"/>