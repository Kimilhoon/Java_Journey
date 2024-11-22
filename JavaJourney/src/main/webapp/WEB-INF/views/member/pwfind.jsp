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



<!-- 임시비밀번호 -->
<script>
let code = "";  // 서버에서 보내준 인증번호를 저장할 변수
$(document).ready(function() {
	$('#mailCheckBtn').click(function() {
		const userEmail = $('#userEmail').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + userEmail); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

	    if (!userEmail) {
	        alert("이메일을 입력해주세요");
	        return false;
	    }
	    // 이메일 형식 검사
	    const regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	    if (!regexEmail.test(userEmail)) {
	        alert("이메일 형식을 확인해주세요");
	        return;
	    }
// 	    console.log("이메일 형식이 올바릅니다:", userEmail);
		
		$.ajax({
			type : "get",
			url : "/member/tempPw", 
		    data: { userEmail: userEmail },
			success : function (data) { 
				
	            emailCheck = true;
				console.log("data : " +  data);
				checkInput.attr('disabled',false); //인증번호입력하는곳 활성화
				code = data;  // 서버에서 받은 인증번호를 code 변수에 저장
				alert('임시 비밀번호가 전송되었습니다.')
			},
	        error: function () {
	            alert("이메일 인증 요청에 실패했습니다");
	            emailCheck = false;
	        }
		}); // end ajax
	}); // $('#mailCheckBtn') end
	
	$('#numCheckBtn').click(function(){
        const inputCode = $('.mail-check-input').val(); // 사용자가 입력한 인증번호
        const $resultMsg = $('#mail-check-warn'); // 결과 메시지를 출력할 엘리먼트
        const $inputBox = $('.mail-check-input'); // 입력 필드
        
        console.log("서버에서 받은 code: " + code);
        console.log("사용자가 입력한 비밀번호: " + inputCode);
        console.log("결과 메시지 요소:", $resultMsg);
        
		if(inputCode === code.toString()){
// 		    console.log("인증번호 일치!");
			$("#resultMsg")
			.css("color", "green")
			.html("임시 비밀번호가 일치합니다");
	        $inputBox.css("border-color", "green");
	        emailCheck = true;
		} else {
// 			console.log("인증번호 불일치!");
			$("#resultMsg")
			.css("color", "red")
			.html("임시 비밀번호가 일치하지않습니다.");
	        $inputBox.css("border-color", "red");
	        emailCheck = false;
	        return false;
		}
	}) //$('numCheckBtn') end


});
</script>


<style>
    .pwFindForm {
        width: 100%;
        max-width: 700px;  /* 폼의 최대 너비 설정 */
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

<!-- <div> -->
<!-- 	<label for="userPhone">전화번호</label> -->
<!-- 	<input type="text" name="userPhone" id="userPhone" required="required"> -->
<!-- </div> -->

<div>
	<label for="userEmail">이메일</label>
	<input type="text" name="userEmail" id="userEmail" required="required" placeholder="가입시 인증했던 이메일을 입력하여주세요">
	<button type="button" id="mailCheckBtn">본인인증</button>
</div>
<div class="mail-check-box">
	<input class="mail-check-input"  id="mailNumCheck" placeholder="임시비밀번호를 입력하세요" disabled="disabled" maxlength="6">
	<button type="button" id="numCheckBtn" name="numCheckBtn">확인</button>
</div>
	<p id="resultMsg" style="font-size:0.8rem;"></p>

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