<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 카카오지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">

var pwValidation = false; //형식 체크
var nickValidation = false; 

var userPw = false; //중복체크
var pwCheck = false;
var nickCheck = false; 
var nickDuplicate = false;

$(function() {
	
	$("#pwValidation").hide();
    $("#pwCheckResult").hide();
    
	function validatePassword(character){
		return /^[a-zA-Z0-9!@#$%^&*()_+]{5,20}$/.test(character);
	}
	$("#userPw").on("change",function(){
        if(!validatePassword($("#userPw").val())){
        	pwValidation = false;
            $("#pwValidation").show(); 
            $("#userPw").focus();
         }else{
        	pwValidation = true;
            $("#pwValidation").hide();
         }
       
        if($("#userPw").val() == $("#userPwCheck").val()){
            pwCheck = true;
            $("#pwCheckResult").css("color", "green");
            $("#pwCheckResult").text("비밀번호가 일치합니다.");
        } else {
            pwCheck = false;
            $("#pwCheckResult").css("color", "red");
            $("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
        }
    });  //$("#userPw") end

    $("#userPwCheck").on("change", function(){
        $("#pwCheckResult").show();

        if($("#userPw").val() == $("#userPwCheck").val()){
        	pwCheck = true;
            $("#pwCheckResult").css("color", "green");
            $("#pwCheckResult").text("비밀번호가 일치합니다.");
        } else {
        	pwCheck = false;
            $("#pwCheckResult").css("color", "red");
            $("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
        }
    }); //$("#userPwCheck") end	

    $("#nickValidation").hide();
    
	$("#userNick").on("change",function(){
		var regexNick = /^[a-zA-Z0-9가-힣]{5,10}$/;
        var resultNick = regexNick.exec($("#userNick").val()); 
        
        if(resultNick != null){
            $("#nickValidation").hide(); 
            nickValidation = true;
         }else{
             $("#nickValidation").show();
             $("#userNick").focus();
             nickValidation = false;
         }
	}) //$("#userNick") end
	
    // 이메일 형식 검사
    $("#userEmail").on("change", function() {
        var regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        var resultEmail = regexEmail.exec($("#userEmail").val());

        if (resultEmail != null) {
            $("#emailValidation").hide();
            emailValidation = true;
        } else {
            $("#emailValidation").show();
            $("#userEmail").focus();
            emailValidation = false;
        }
    }); // $("#userEmail") end
    
	$("#userNick").on("change input cut copy paste focus", function() {
		$("#userNickCheckMsg")
		.html("");
		
		//닉네임 중복체크 수행 상태 설정
		nickCheck = false;
	}) //$("#userNick") end
	
	
	$("#postcodeWrap").css({
	    left: (innerWidth / 2) - (500 / 2),
	    top: (innerHeight / 2) - (500 / 2)
		
	})
	
	$("#btnPostcode").click(function(e) {
// 		console.log("#btnPostcode click");
		e.preventDefault();
		
		//------------------------
		
		//입력창 초기화
		$("#userPostcode").val("");
		$("#userAdd1").val("");
		$("#userAdd2").val("");
		
		//--------------------------
		
	    new daum.Postcode({
	        oncomplete: function(data) {
				
	        	//우편번호
	        	console.log( data.zonecode );
	        	$("#userPostcode").val( data.zonecode );
	        	
	        	//-----------------------------------
	        	
	        	//주소
	        	console.log( data.roadAddress ); // 도로명
	        	console.log( data.jibunAddress ); // 지번	        	
	        	
	        	console.log( data.userSelectedType	 ); // 사용자 선택        	
	        	
	        	//사용자의 선택에 따른 주소 입력
	        	if( data.userSelectedType =='R') { // 도로명 선택
	        		$("#userAdd1").val(data.roadAddress)
	        	} else if( data.userSelectedType =='J') { // 지번 선택
	        		$("#userAdd1").val(data.jibunAddress)
	        		
	        	}
	        	
	        	//------------------------------------
	        	
	        	//상세 주소 입력 포커스
	        	$("#userAdd2").focus();
	        	
	        	$("#postcodeWrap").hide();
	        
	        }
	    
// 	    }).open({});
	    }).embed( postcodeWrap );
		//----------------------------------
		
// 		$("#postcodeWrap").css("display", "block");
		$("#postcodeWrap").toggle();
		
		$("#postcodeWrap .closeIcon").click(function() {
			$(this).parent().hide();
		})
	
	}) //$("#btnPostcode") end
	
	
}) //$(function() end
</script>

<style type="text/css">
#postcodeWrap {
/* 	position: relative; */
	position: absolute;
	
	
	width: 500px;
	height: 500px;
	
	border: 1px solid #ccc;
	
	display: none;
	
}
#postcodeWrap .closeIcon{

	position: absolute;
	
	width: 30px;
	z-index: 9999;
	
	top: 0.5px;
	right: -38px;
	
	border: 1px solid skyblue;
	padding: 3px;
	
	cursor: pointer;
}


</style>

회원 정보 수정
<hr>

<form action="./join" method="post">

<div>
	<label for="userPw">새 비밀번호
		<input type="text" name="userPw" id="userPw" required="required">
	</label>
</div>
<p id="pwValidation" style="color:red; font-size:0.6rem;">
	비밀번호는 5~20자의 영문 대/소문자, 숫자, 특수문자만 가능합니다
</p>

<div>
	<label for="userPwCheck">비밀번호 확인
		<input type="password" name="userPwCheck" id="userPwCheck" required="required">
	</label>
</div>
<p id="pwCheckResult" style="font-size:0.6rem;">


<div>
	<label for="userNick">닉네임</label>
	<input type="text" name="userNick" id="userNick" required="required" value="${userNick }">
	<button id="userNickCheck" type="button">중복확인</button>
	<span id="userNickCheckMsg"></span>
</div>
<p id="nickValidation" style="color:red; font-size:0.6rem;">
	닉네임은 5~10자의 영문, 한글, 숫자만 가능합니다
</p>


<div>
	<label for="userEmail">이메일
		<input type="email" name="userEmail" id="userEmail" required="required">
	</label>
</div>

<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required">
	</label>
</div>

<div>
	<label for="userPhone">전화번호
		<input type="text" name="userPhone" id="userPhone" required="required">
	</label>
</div>


주소
<button id="btnPostcode">우편번호 찾기</button>
<div id="postcodeWrap">
	<img alt="x" src="../resources/img/close.png" class="closeIcon">
</div>
<input type="text" id="userPostcode" name="userPostcode" placeholder="우편번호" readonly="readonly"><br>
<input type="text" id="userAdd1" name="userAdd1" placeholder="주소" readonly="readonly"><br>
<input type="text" id="userAdd2" name="userAdd2" placeholder="상세주소"><br>

<br>
<div>
	<button id="btnUpdate">수정 하기</button>
</div>

</form>

<c:import url="../layout/footer.jsp" />