<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="List">
<table class="table table-info">
	<thead>
		<tr>
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
		<td>${Member.userNo}</td>
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