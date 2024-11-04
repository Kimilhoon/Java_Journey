<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

로그인 페이지
<hr>

<form action="./login" method="post">

<div>
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId">
</div>

<div>
	<label for="userPw">비밀번호</label>
	<input type="text" name="userPw" id="userPw">
</div>

<div>
	<a href="./idfind">아이디찾기</a>
	|
	<a href="./pwfind">비밀번호찾기</a>
</div>

<div>
	<a href="./join">회원가입</a>
</div>


<div>
	<button id="btnLogin" class="btn btn-primary">로그인</button>
</div>


</form>

</body>
</html>