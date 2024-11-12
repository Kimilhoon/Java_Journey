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

회원 정보 수정 페이지
<hr>

<div>
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId" readonly="readonly" value="${userId }">
</div>

<div>
	<label for="userPw">비밀번호</label>
	<input type="password" name="userPw" id="userPw">
</div>

<button id="btnInfoUpdate">정보 수정하기</button>



<c:import url="../layout/footer.jsp" />