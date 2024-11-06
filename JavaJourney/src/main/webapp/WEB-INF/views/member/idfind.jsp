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
$(function() {
	$("#btnIdFind").click(function() {
        var userName = $("#userName").val();
        var userPhone = $("#userPhone").val();
        
		$.ajax({
			type: "post"
			, url: "./idfind"
			, data: {
	              userName: userName,
	              userPhone: userPhone
			}
			, dataType: "json"
			, success: function( obj ) {
				
                $("#resultIdDiv").show();
				
                if(obj.msg == "succ") {
                    $("#searchIdResult").text("아이디는 " + obj.searchId +" 입니다.");
                } else{
                    $("#searchIdResult").text("존재하지 않는 사용자입니다.");
                }
       
				
			}
			, error: function(e) {
				console.log(e);
				
			}
			
		}) // $.ajax end
		
	}) //$("#btnIdFind") end
	
});	//$(function) end

</script>
</head>
<body>
아이디 찾기
<hr>

<form action="./idfind" method="post" id="idfindForm">

<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required">
	</label>
</div>

<div>
	<label for="userPhone">전화번호</label>
	<input type="text" name="userPhone" id="userPhone" required="required">
</div>

<div>
	<button id="btnIdFind" type="button">아이디 찾기</button>
</div>

<div id="resultIdDiv" style="display: none;">
	<p id="searchIdResult"></p>
</div>

<a href="./pwfind">|비밀번호 찾기|</a>

</form>

<div>
	<a href="./login">
	<button>로그인 하러가기</button>
	</a>
</div>


</body>
</html>