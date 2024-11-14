<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#btnPwFind").click(function(){
		var userId = $("#userId").val();
        var userName = $("#userName").val();
        var userPhone = $("#userPhone").val();
        
        $.ajax({
        	type: "post"
        	, url: "./pwfind"
        	, data: {
        		userId: userId,
        		userName: userName,
	            userPhone: userPhone
        	}
        	, dataType: "json"
        	, success: function(obj){
        		
        		$("#resultPwDiv").show();
        		
        		if(obj.msg == "succ"){
                    $("#searchPwResult").text("비밀번호는 " + obj.searchPw +" 입니다.");
                } else{
                    $("#searchPwResult").text("존재하지 않는 사용자입니다.");
                }       	
        		
        	}
        	,  error: function(e) {
				console.log(e);
				
			}
        	
        }) // $.ajax end
	})
});	//$(function) end

</script>

</head>
<body>
비밀번호 찾기
<hr>

<form action="./pwfind" method="post" id="pwfindForm">

<div>
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId" required="required">
</div>

<div>
	<label for="userName">이름</label>
	<input type="text" name="userName" id="userName" required="required">
</div>

<div>
	<label for="userPhone">전화번호</label>
	<input type="text" name="userPhone" id="userPhone" required="required">
</div>

<div>
	<button id="btnPwFind" type="button">비밀번호 찾기</button>
</div>

<div id="resultPwDiv" style="display: none;">
	<p id="searchPwResult"></p>
</div>


<a href="./idfind">|아이디 찾기|</a>

</form>

<div>
	<a href="./login">
	<button>로그인 하러 가기</button>
	</a>
</div>

</body>
</html>