<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: '나눔고딕', Arial, sans-serif; /* 폰트 설정 */
}
table {
	margin: 0 auto;
	border: 1px solid #ccc;
	border-collapse: collapse;
	background-color: #e9e9e9;
}
th{
	padding : 5px 6px;
	font-size: 26px;
}
td {
	text-align: center;
	padding : 13.5px 5px;
	font-size: 24px;
}
</style>
</head>
<body>
<h1 style="text-align: center;">유저 관리</h1>
<div id="List">
<table class="table table-info">
	<thead>
		<tr>
			<th></th>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>회원닉네임</th>
			<th>회원이메일</th>
			<th>회원이름</th>
			<th>회원전화번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>사업자번호</th>
		</tr>
	</thead>
<tbody>
<c:forEach var="Member" items="${memberList}">
	<tr>
		<td>
		<input type="checkbox" id="${Member.userNo}" name="userNo" value="${Member.userNo}"> 
		</td>
		<td>
		${Member.userNo}
		</td>
		<td>${Member.userId}</td>
		<td>${Member.userNick}</td>
		<td>${Member.userEmail}</td>
		<td>${Member.userName}</td>
		<td>${Member.userPhone}</td>
		<td>${Member.userPostcode}</td>
		<td>${Member.userAdd1}</td>
		<td>${Member.userAdd2}</td>
		<td>${Member.businessNo}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>