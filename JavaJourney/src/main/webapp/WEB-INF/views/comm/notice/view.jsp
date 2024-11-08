<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<h1>뷰</h1>
<a href="./list"><button>목록</button></a>
<br>
<span>제목 : ${notice.title}</span>
<span>작성일 : <fmt:formatDate value="${notice.wirteDate }" pattern="yyyy년 MM월 dd일"/></span>
<br>
<p>본문</p>
<div>${notice.content }</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
