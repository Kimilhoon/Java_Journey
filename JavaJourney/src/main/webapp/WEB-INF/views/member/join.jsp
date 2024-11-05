<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
var idCheck = false; //중복 아이디 체크
var idDuplicate = false; 
// var userPw = $("#userPw").val();
// var pwcheck = $("#pwcheck").val();
var nickCheck = false; //중복 닉네임 체크
var nickDuplicate = false; 


$(function() {
	$("#btnJoin").click(function() {	
		$(this).parents("form").submit();
	});	
	
 	$("#joinForm form").submit(function() {
		
		if( !userId.value ) {
			alert("아이디를 입력하세요");
			return false;
		}
		
// 		var idRegex = /^[a-z0-9]{5,15}$/;
// 		if( !idRegex.test(userId.value)){
// 			alert("아이디는 5~15자의 영문 소문자와 숫자만 가능합니다")
// 		}
		
		if( !idCheck ) {
			alert("아이디를 중복체크하세요");
			return false;
		}
		if( idDuplicate ) {
			alert("이미 존재하는 아이디입니다");
			return false;
		}
		
		if( !userPw.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
// 		if( userPw != pwcheck ){
// 			alert("비밀번호가 일치하지 않습니다");
// 			return false;
// 		}
		
		if( !userNick.value ) {
			alert("닉네임을 입력하세요");
			return false;
		}
		if( !nickCheck ) {
			alert("닉네임을 중복체크하세요");
			return false;
		}
		if( nickDuplicate ) {
			alert("이미 존재하는 닉네임입니다");
			return false;
		}		
		
	}) //$("#joinForm form") end
	
	
	$("#userIdCheck").click(function() {
		
		if( !userId.value ) {
			$("#userIdCheckMsg")
			.css("color", "red")
			.html("아이디를 입력하세요");
			
			return false;
		}
		
		$.ajax({
			type: "get"
			, url: "./checkId"
			, data: {
				userId: userId.value
			}
			, dataType: "json"
			, success: function( res ) {
				console.log("AJAX 성공");
				
				//아이디 중복체크 수행 상태 설정
				idCheck = true;
				
				//중복 확인 결과 설정
				idDuplicate = res.duplicate;
				
				console.log("--- 중복체크 응답 ---");
				console.log( res.duplicate );
			
				if( res.duplicate ) { //중복있음
					$("#userIdCheckMsg")
					.css("color", "red")
					.html("이미 사용중인 아이디입니다");
				
				} else { //중복없음
					$("#userIdCheckMsg")
					.css("color", "blue")
					.html("사용가능한 아이디 입니다");
				
				}
				
			}
			, error: function() {
				console.log("AJAX 실패");
				
				//아이디 중복체크 수행 상태 설정
				idCheck = false;
			}
		})
		
	}) //$("#userIdCheck") end
	
	
	$("#userId").on("change input cut copy paste focus", function() {
		$("#userIdCheckMsg")
		.html("");
		
		//아이디 중복체크 수행 상태 설정
		idCheck = false;
	})	//$("#userId") end

	
	$("#userNickCheck").click(function() {
		
		if( !userNick.value ) {
			$("#userNickCheckMsg")
			.css("color", "red")
			.html("닉네임을 입력하세요");
			
			return false;
		}
		
		$.ajax({
			type: "get"
			, url: "./checkNick"
			, data: {
				userNick: userNick.value
			}
			, dataType: "json"
			, success: function( res ) {
				console.log("AJAX 성공");
				
				//아이디 중복체크 수행 상태 설정
				nickCheck = true;
				
				//중복 확인 결과 설정
				NickDuplicate = res.duplicateNick;
				
				console.log("--- 중복체크 응답 ---");
				console.log( res.duplicateNick );
			
				if( res.duplicateNick ) { //중복있음
					$("#userNickCheckMsg")
					.css("color", "red")
					.html("이미 사용중인 닉네임입니다");
				
				} else { //중복없음
					$("#userNickCheckMsg")
					.css("color", "blue")
					.html("사용가능한 닉네임 입니다");
				
				}
				
			}
			, error: function() {
				console.log("AJAX 실패");
				
				NickCheck = false;
			}
		})
		
	}) //$("#userNickCheck") end
	
	
	$("#userNick").on("change input cut copy paste focus", function() {
		$("#userNickCheckMsg")
		.html("");
		
		//닉네임 중복체크 수행 상태 설정
		NickCheck = false;
	}) //$("#userNick") end		
	
	
}) //$(function() end
</script>

</head>
<body>

회원가입창
<hr>

<div id="joinForm">
<form action="./join" method="post">

<div class="idSection">
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId" required="required"
	 placeholder="영문, 숫자 조합으로 5~15자">
	<button id="userIdCheck" type="button">중복확인</button>
	<span id="userIdCheckMsg"></span>
</div>

<div>
	<label for="userPw">비밀번호
		<input type="text" name="userPw" id="userPw" required="required">
	</label>
</div>
<p style="color:red; font-size:0.6rem;">
	비밀번호는 5~20자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.
</p>

<!-- <div> -->
<!-- 	<label for="pwcheck">비밀번호 확인 -->
<!-- 		<input type="text" name="pwcheck" id="pwcheck" required="required"> -->
<!-- 	</label> -->
<!-- </div> -->

<div>
	<label for="userNick">닉네임</label>
	<input type="text" name="userNick" id="userNick" required="required">
	<button id="userNickCheck" type="button">중복확인</button>
	<span id="userNickCheckMsg"></span>
</div>

<div>
	<label for="userEmail">이메일
		<input type="text" name="userEmail" id="userEmail" required="required">
	</label>
</div>

<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required">
	</label>
</div>

<div>
	<label for="userPhone">휴대폰 전화번호
		<input type="text" name="userPhone" id="userPhone" required="required">
	</label>
</div>

<div>
	<label for="userPostcode">우편번호
		<input type="text" name="userPostcode" id="userPostcode" required="required">
	</label>
</div>

<div>
	<label for="userAdd1">주소
		<input type="text" name="userAdd1" id="userAdd1" required="required">
	</label>
</div>

<div>
	<label for="userAdd2">상세주소
		<input type="text" name="userAdd2" id="userAdd2" required="required">
	</label>
</div>

[사업자 등록 시]
<div>
	<label for="businessNo">사업자 등록번호
		<input type="text" name="businessNo" id="businessNo">
	</label>
</div>


<div>
	<button id="btnJoin" class="btn btn-primary">회원 가입</button>
</div>


</form>
</div> <!-- id="joinForm" -->

</body>
</html>