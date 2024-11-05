<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
비밀번호 찾기
<hr>

<div>
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId" required="required">
</div>

<div>
	<label for="userName">이름</label>
	<input type="text" name="userName" id="userName" required="required">
</div>

<div>
	<label for="userPhone">전화번호</label>
	<input type="text" name="userPhone" id="userPhone" required="required">
	<button id="btnPwFind" type="button">전송</button>
</div>

<a href="./idfind">|아이디 찾기|</a>

<div>
	<a href="./login">
	<button>로그인 하기</button>
	</a>
</div>
</body>
</html>