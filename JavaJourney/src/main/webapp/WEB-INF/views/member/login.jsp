<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
$(function() {
	
    <c:if test="${not empty sessionScope.loginError}">
   	 alert("${sessionScope.loginError}");
    // 로그인 실패 후, 세션에서 'loginError' 삭제 (한번만 보여주기 위해)
    <c:remove var="loginError" scope="session"/>
	</c:if>	
	
	$("#goJoin").click(function() {	
		location.href = "./join";
	});
	$("#goIdFind").click(function() {	
		location.href = "./idfind";
	});
	$("#goPwFind").click(function() {	
		location.href = "./pwfind";
	});
});
</script>

<style>
    #goJoin {
    	cursor: pointer; /* 클릭 가능한 모양으로 커서 변경 */
   	 	text-decoration: none; /* 밑줄 제거 */
/*    	 	color: #6f4e37; */
    }
    #goJoin:hover {
    	text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
    }
    a {
    	text-decoration: none;
    	color: black;
    }
    a:hover {
    	text-decoration: underline;
    }
    
    .loginForm {
        width: 100%;
        max-width: 400px;  /* 폼의 최대 너비 설정 */
        margin: 0 auto;    /* 수평 중앙 정렬 */
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    
    /* 각 요소의 간격을 설정 */
    .loginForm div {
        margin-bottom: 15px;
    }

    /* 레이블 스타일 */
    .loginForm label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    /* 입력 필드 스타일 */
    .loginForm input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box; /* padding과 border를 포함한 너비 */
    }

    /* 버튼 스타일 */
    .loginForm button {
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
    .loginForm button:hover {
        background-color: #5a3e2f;
    }    
</style>



<h2 style="text-align: center; font-weight: bold;" >로그인</h2>
<hr>

<form action="./login" method="post" class="loginForm">

<div>
	<label for="userId"></label>
	<input type="text" name="userId" id="userId" placeholder="로그인">
</div>

<div>
	<label for="userPw"></label>
	<input type="password" name="userPw" id="userPw" placeholder="비밀번호">
</div>

<div>
	<button id="btnLogin" class="btn btn-primary">로그인</button>
</div>

<div>
	<a href="./idfind">아이디찾기</a>
	|
	<a href="./pwfind">비밀번호찾기</a>
</div>

<div id="goJoin">회원가입</div>



</form>



<c:import url="../layout/footer.jsp" />