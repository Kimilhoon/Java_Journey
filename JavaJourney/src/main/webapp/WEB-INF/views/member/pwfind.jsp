<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

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

<style>
    .pwFindForm {
        width: 100%;
        max-width: 400px;  /* 폼의 최대 너비 설정 */
        margin: 0 auto;    /* 수평 중앙 정렬 */
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    
    /* 각 요소의 간격을 설정 */
    .pwFindForm div {
        margin-bottom: 15px;
    }

    /* 레이블 스타일 */
    .pwFindForm label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    /* 입력 필드 스타일 */
    .pwFindForm input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box; /* padding과 border를 포함한 너비 */
    }

    /* 버튼 스타일 */
    .pwFindForm button {
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
    .pwFindForm button:hover {
        background-color: #5a3e2f;
    }    
</style>


<h2 style="text-align: center; font-weight: bold;">비밀번호 찾기</h2>
<hr>

<form action="./pwfind" method="post" class="pwFindForm">

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

<div>
	<a href="./idfind">| 아이디 찾기 |</a>
</div>

<!-- <div> -->
<!-- 	<a href="./login">| 로그인 |</a> -->
<!-- </div> -->



</form>


<c:import url="../layout/footer.jsp" />