<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- <script type="text/javascript">
$(function() {
 	$("#btnInfoUpdate").click(function() {	
 		location.href = "/myinfoUpdate?userNo=${member.userNo}";
 	});

 }); 
</script> -->

<script type="text/javascript">
$(function() {
	
    $("#btnInfoUpdate").click(function() {
        var userPw = $("#userPw").val();
        $.ajax({
            type: "POST",
            url: "/mypage/checkPassword",
            data: { userPw: userPw },
            success: function(isValid) {
                if (isValid) {
                    location.href = "/mypage/myinfoUpdate?userNo=" + ${userNo}
                } else {
                    alert("비밀번호가 일치하지 않습니다");
                }
            },
            error: function(error) {
                console.error("AJAX 요청 실패:", error); // 오류 발생 시 콘솔에 로그 출력
            }
        });
    }); // $("#btnInfoUpdate") end
    
}); //$(function() end
</script>

<style>
    .info-form {
        width: 100%;
        max-width: 400px;  /* 폼의 최대 너비 설정 */
        margin: 0 auto;    /* 수평 중앙 정렬 */
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    
    /* 각 요소의 간격을 설정 */
    .info-form div {
        margin-bottom: 15px;
    }

    /* 레이블 스타일 */
    .info-form label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    /* 입력 필드 스타일 */
    .info-form input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box; /* padding과 border를 포함한 너비 */
    }

    /* 버튼 스타일 */
    .info-form button {
        width: 100%;
        padding: 12px;
        background-color: #6f4e37;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    /* 버튼 호버 스타일 */
    .info-form button:hover {
        background-color: #5a3e2f;
    }
</style>

<h2 style="text-align: center; font-weight: bold;">회원 정보 수정</h2>
<hr>

<div class="info-form">
	<div>
		<label for="userId"></label>
		<input type="text" name="userId" id="userId" readonly="readonly" value="${userId }" placeholder="로그인">
	</div>
	
	<div>
		<label for="userPw"></label>
		<input type="password" name="userPw" id="userPw" placeholder="비밀번호">
	</div>
	
	<button id="btnInfoUpdate">정보 수정하기</button>
</div>



<c:import url="../layout/footer.jsp" />