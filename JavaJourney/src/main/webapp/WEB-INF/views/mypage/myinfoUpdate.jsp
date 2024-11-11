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
var emailValidation = false;

var userPw = false; //중복체크
var pwCheck = false;
var nickCheck = false; 
var nickDuplicate = false;

$(function() {
	
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
   
    
/* $("#joinForm form") */
//----------------------------------------------------------------

   	$("#joinForm form").submit(function() {
  		
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
  		if( !userEmail.value ) {
  			alert("이메일을 입력하세요");
  			return false;
  		}
          if (!emailValidation) {
              alert("이메일 형식이 올바르지 않습니다");
              return false;
          }
  		if( !userPhone.value ) {
  			alert("전화번호를 입력하세요");
  			return false;
  		}
  		if( !userPostcode.value ) {
  			alert("우편번호를 입력하세요");
  			return false;
  		}
  		if( !userAdd1.value ) {
  			alert("주소를 입력하세요");
  			return false;
  		}
  		if( !userAdd2.value ) {
  			alert("상세주소를 입력하세요");
  			return false;
  		}
  		
  	}) //$("#joinForm form") end    
	
  	
/* ------------------------------------------------------------------- */	
    $("#nickValidation").hide();

	$("#userNickCheck").click(function() {
		
        if (!nickValidation) {
            $("#nickValidation").show();
            return false; 
        }
		
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
				
				nickCheck = true;
				nickDuplicate = res.duplicateNick;
				
				if( res.duplicateNick ) { 
					$("#userNickCheckMsg")
					.css("color", "red")
					.html("이미 사용중인 닉네임입니다");
				
				} else { 
					$("#userNickCheckMsg")
					.css("color", "green")
					.html("사용가능한 닉네임 입니다");
				
				}
				
			}
			, error: function() {
				
				nickCheck = false;
			}
		})
		
	}) //$("#userNickCheck") end
	
	
	$("#userNick").on("change input cut copy paste focus", function() {
		$("#userNickCheckMsg")
		.html("");
		
		//닉네임 중복체크 수행 상태 설정
		nickCheck = false;
	}) //$("#userNick") end    

	
/* 주소 */	
/* -------------------------------------------------------------- */	
		
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

<form action="./myinfoUpdate" method="post">

<input type="hidden" name="userNo" value="${member.userNo }" readonly="readonly">

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
	<input type="text" name="userNick" id="userNick" required="required" value="${member.userNick }">
	<button id="userNickCheck" type="button">중복확인</button>
	<span id="userNickCheckMsg"></span>
</div>
<p id="nickValidation" style="color:red; font-size:0.6rem;">
	닉네임은 5~10자의 영문, 한글, 숫자만 가능합니다
</p>


<div>
	<label for="userEmail">이메일
		<input type="email" name="userEmail" id="userEmail" required="required" value="${member.userEmail }">
	</label>
</div>

<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required" readonly="readonly" value="${member.userName }">
	</label>
</div>

<div>
	<label for="userPhone">전화번호
		<input type="text" name="userPhone" id="userPhone" required="required" value="${member.userPhone }">
	</label>
</div>


주소
<button id="btnPostcode">우편번호 찾기</button>
<div id="postcodeWrap">
	<img alt="x" src="../resources/img/close.png" class="closeIcon">
</div>
<input type="text" id="userPostcode" name="userPostcode" placeholder="우편번호" readonly="readonly" value="${member.userPostcode }"><br>
<input type="text" id="userAdd1" name="userAdd1" placeholder="주소" readonly="readonly" value="${member.userAdd1 }"><br>
<input type="text" id="userAdd2" name="userAdd2" placeholder="상세주소" value="${member.userAdd2 }"><br>

<br>
<button id="btnUpdate">수정 하기</button>


</form>

<c:import url="../layout/footer.jsp" />