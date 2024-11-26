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
	font-size: 20px;
	text-align: center;
}
td {
	text-align: center;
	padding : 13.5px 5px;
	font-size: 16px;
	margin-bottom: 10px;
}
#btnUserCancel,
#btnUserRevive { 
    width: 100px;
    padding: 10px;
    background-color: #adb5bd;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
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
	$("#btnUserRevive").click(function () {
		console.log("테스트");
		var userNoValue = $('input[name="userNo"]:checked')
		.map(function () {
			return this.value;
		}).get()
		console.log(userNoValue);
		
		$.ajax({
			type: "get"
			, url: "/manager/userrevive?userNo=" + userNoValue
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
		
	// 검색 버튼 클릭 이벤트
	$("#btn_search").click(function() {
	    sendSearchRequest(); // 검색 요청 함수 호출
	});

	// 검색 입력 필드에서 Enter 키 이벤트 처리
	$("#search").keydown(function(e) {
	    if (e.key === "Enter") { // Enter 키 감지
	        sendSearchRequest(); // 검색 요청 함수 호출
	    }
	});
	
		function sendSearchRequest() {
			$.ajax({
				url: "./user",
				type: "get",
				data:{
					"search":$("#search").val(), //search:검색입력값을 서버에 전달
				},
				dataType: "html",
				success: function(res) {
				console.log(res);
					$("body").children().remove(); //화면을 갱신하기 전에 기존 내용을 초기화
					$("body").html(res); //현재 페이지의 내용이 검색 결과로 완전히 대체
				},
				error: function() {
				}
			});
		}
// 		$("#btn_search").click(function() {
// 	 		console.log($("#search").val()); 
// 			$.ajax({
// 				url: "./user",
// 				type: "get",
// 				data:{
// 					"search":$("#search").val(), //search:검색입력값을 서버에 전달
// 				},
// 				dataType: "html",
// 				success: function(res) {
//	 				console.log(res);
// 					$("body").children().remove(); //화면을 갱신하기 전에 기존 내용을 초기화
// 					$("body").html(res); //현재 페이지의 내용이 검색 결과로 완전히 대체
// 				},
// 				error: function() {
// 				}
// 			});
// 		});		
})
</script>
</head>
<body>
<div id="List">

<div id="search_div" class="container" style="position: relative; height: 100px;">
    <div style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%);">
        <button id="btn_search" class="btn " style="float: right;  display: inline-block; "><i class="bi bi-search"></i></button>
		<input type="text" id="search" class="form-control me-2 " placeholder="회원닉네임 검색" style="float: right;
		  display: inline-block; width: 600px; margin-left: 10px;">
    </div>
</div>

<!-- <div id="search_div" class="">
	<button id="btn_search" class="btn " style="float: right;  display: inline-block; "><i class="bi bi-search"></i></button>
	<input type="text" id="search" class="form-control me-2 " placeholder="검색어를 입력하세요." style="float: right;
	  display: inline-block; width: 200px; margin-left: 10px;">
</div> -->
	

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
			<th>상태표시</th>
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
		<td>${Member.status}</td>
	</tr>
</c:forEach>
</tbody>
</table>

<div class="position-absolute top-20 end-0 translate-middle-y mt-3 mx-1">
	<button class="btn btn-primary" id="btnUserCancel">비활성화</button>
	<span style="margin-left: 5px;"></span>
	<button class="btn btn-primary" id="btnUserRevive">활성화</button>
</div>



<c:import url="/WEB-INF/views/manager/userpage.jsp"/>

</div>



</body>
</html>