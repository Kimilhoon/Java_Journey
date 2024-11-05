<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 찾기
<hr>

<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required">
	</label>
</div>

<div>
	<label for="userPhone">전화번호</label>
	<input type="text" name="userPhone" id="userPhone" required="required">
	<button id="btnIdFind" type="button">전송</button>
</div>

<a href="./pwfind">|비밀번호 찾기|</a>

<div>
	<a href="./login">
	<button>로그인 하기</button>
	</a>
</div>

</body>
</html>