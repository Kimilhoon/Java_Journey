<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="icon" type="image/png" href="/resources/favicon/JavaJourneyIcon.png">
<style type="text/css">
body{
	font-family: '나눔고딕', Arial, sans-serif; /* 폰트 설정 */
}
table {
	margin: 0 auto;
	border: 1px solid #ccc;
	border-collapse: collapse;
	background-color: #f5f5f5;
}
th{
	padding : 13.5px 5px;
	font-size: 24px;
	text-align: center;
}
td {
	text-align: center;
	padding : 13.5px 5px;
	font-size: 20px;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
$(function () {
	
	$("#btnUserCancel").click(function () {
		console.log("테스트");
		var userNoValue = $('input[name="userNo"]:checked')
		.map(function () {
			return this.value;
		}).get()
		console.log(userNoValue);
		
		$.ajax({
			type: "get"
			, url: "/manager/usercancel?userNo=" + userNoValue
// 			,data: {userNo : userNoValue} // url 쿼리스트링의 데이터로 주니 data 딱히 필요없음
			, success: function (res) {
				console.log("ajax 성공");
				
				if(res.status === "success") {
					alert(res.message);
					location.reload();//새로고침
				} else if(res.status === "fail") {
					alert(res.message);
				}
				
			}
			, error: function () {
				console.log("ajax 실패");
			}
			 			
			});
		});
})
</script>
</head>
<body>
<h1 style="text-align: center;">유저 관리</h1>
<div id="List">
<table class="table">
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

<div class="position-absolute top-20 end-0 translate-middle-y">
	<button class="btn btn-primary" id="btnUserCancel">탈퇴시키기</button>
</div>

<c:import url="/WEB-INF/views/manager/userpage.jsp"/>

</div>



</body>
</html>