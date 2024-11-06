<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 찾기
<hr>

<form action="./idfind" method="post" id="idfindForm">

<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required">
	</label>
</div>

<div>
	<label for="userEmail">이메일</label>
	<input type="text" name="userEmail" id="userEmail" required="required">
</div>

<div>
	<button id="btnIdFind" type="submit">전송</button>
</div>

<a href="./pwfind">|비밀번호 찾기|</a>

<div>
	<a href="./login">
	<button>로그인 하기</button>
	</a>
</div>
</form>

<div class="result-box">
	<c:choose>
		<c:when test="${not empty msg}">
		<p>${msg }</p>
		</c:when>
		<c:when test="${not empty idfind}">
		<p>${idfind.userId }</p>
		</c:when>
		
        <c:otherwise>
            <p>조회결과 없음</p>
        </c:otherwise>
	</c:choose>
</div>


</body>
</html>