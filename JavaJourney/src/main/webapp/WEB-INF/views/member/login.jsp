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
</style>



로그인 페이지
<hr>

<form action="./login" method="post">

<div>
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId">
</div>

<div>
	<label for="userPw">비밀번호</label>
	<input type="password" name="userPw" id="userPw">
</div>

<div>
	<a href="./idfind">아이디찾기</a>
	|
	<a href="./pwfind">비밀번호찾기</a>
</div>

<div id="goJoin">회원가입</div>


<div>
	<button id="btnLogin" class="btn btn-primary">로그인</button>
</div>

</form>



<c:import url="../layout/footer.jsp" />