<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script type="text/javascript">

IMP.init("{imp77683350}");

//IMP.certification(param, callback) 호출
IMP.certification(
  {
    // param
    channelKey: "{channel-key-9937917d-f104-4bb7-822d-9681d7bb33c5}",
    // 주문 번호
    merchant_uid: "ORD20180131-0000011",
    // 모바일환경에서 popup:false(기본값) 인 경우 필수
    m_redirect_url: "{http://localhost:8088/member/join}",
    // PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
    popup: false,
  },
  function (rsp) {
    // callback
    if (rsp.success) {
        // 인증 성공 시 jQuery로 HTTP 요청
        jQuery.ajax({
          url: "{서버의 인증 정보를 받는 endpoint}",
          method: "POST",
          headers: { "Content-Type": "application/json" },
          data: { imp_uid: rsp.imp_uid },
        });
      } else {
        alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
      }
    },
  );

var idValidation = false; //형식 체크
var pwValidation = false; 
var nickValidation = false; 

var idCheck = false; //중복체크
var idDuplicate = false; 
var userPw = false;
var pwCheck = false;
var nickCheck = false; 
var nickDuplicate = false;

$(function() {
	$("#btnJoin").click(function() {	
		$(this).parents("form").submit();
	});	
	//-------------------------------------------------------	
	$("#userId").on("change",function(){
		var regexId = /^[a-z0-9]{5,15}$/;
        var resultId = regexId.exec($("#userId").val()); 
        
        if(resultId != null){
            $("#idValidation").hide(); 
            idValidation = true;
         }else{
             $("#idValidation").show();
             $("#userId").focus();
             idValidation = false;
         }
	}) //$("#userId") end
	
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
	
	
	//------------------------------------------------------
 	$("#joinForm form").submit(function() {
		
		if( !userId.value ) {
			alert("아이디를 입력하세요");
			return false;
		}
		
		if( !idCheck ) {
			alert("아이디를 중복체크하세요");
			return false;
		}
		if( idDuplicate ) {
			alert("이미 존재하는 아이디입니다");
			return false;
		}
		
// 		if( !userPw.value) {
// 			alert("비밀번호를 입력하세요");
// 			return false;
// 		}
// 		if( !userPwCheck.value) {
// 			alert("비밀번호 확인을 입력하세요");
// 			return false;
// 		}
		
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
		if( !userName.value ) {
			alert("이름을 입력하세요");
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
		if( !userAdd1.value ) {
			alert("주소를 입력하세요");
			return false;
		}
		if( !userAdd2.value ) {
			alert("상세주소를 입력하세요");
			return false;
		}
		
// 		return true;
		
	}) //$("#joinForm form") end
	
    $("#idValidation").hide();
    $("#nickValidation").hide();
    
	$("#userIdCheck").click(function() {
		
		//아이디 형식이 맞지 않으면 중복체크 진행하지 않음
        if (!idValidation) {
            $("#idValidation").show();
            return false; 
        }
		
		if( !userId.value ) {
			$("#userIdCheckMsg")
			.css("color", "red")
			.html("아이디를 입력하세요");
			
			return false;
		}
		
		$.ajax({
			type: "get"
			, url: "./checkId"
			, data: {
				userId: userId.value
			}
			, dataType: "json"
			, success: function( res ) {
				
				idCheck = true;
				idDuplicate = res.duplicate;
				
				if( res.duplicate ) {
					$("#userIdCheckMsg")
					.css("color", "red")
					.html("이미 사용중인 아이디입니다");
				
				} else {
					$("#userIdCheckMsg")
					.css("color", "green")
					.html("사용가능한 아이디 입니다");
				}
				
			}
			, error: function() {
				
				idCheck = false;
			}
		})
		
	}) //$("#userIdCheck") end
	
	
	$("#userId").on("change input cut copy paste focus", function() {
		$("#userIdCheckMsg")
		.html("");
		
		idCheck = false;
	})	//$("#userId") end

	
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
	
}) //$(function() end
</script>

</head>
<body>

회원가입창
<hr>

<div id="joinForm">
<form action="./join" method="post">

<div class="idSection">
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId" required="required">
	<button id="userIdCheck" type="button">중복확인</button>
	<span id="userIdCheckMsg"></span>
</div>
<p id="idValidation" style="color:red; font-size:0.6rem;">
	아이디는 5~15자의 영문, 숫자만 가능합니다
</p>

<div>
	<label for="userPw">비밀번호
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
	<input type="text" name="userNick" id="userNick" required="required">
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

<div>
	<label for="userPostcode">우편번호
		<input type="text" name="userPostcode" id="userPostcode" required="required">
	</label>
</div>

<div>
	<label for="userAdd1">주소
		<input type="text" name="userAdd1" id="userAdd1" required="required">
	</label>
</div>

<div>
	<label for="userAdd2">상세주소
		<input type="text" name="userAdd2" id="userAdd2" required="required">
	</label>
</div>

[사업자 등록 시]
<div>
	<label for="businessNo">사업자 등록번호
		<input type="text" name="businessNo" id="businessNo">
	</label>
</div>


<div>
	<input type="checkbox" name="check1" id="check1">
</div>


<div>
	<button id="btnJoin" class="btn btn-primary">회원 가입</button>
</div>



</form>
</div> <!-- id="joinForm" -->

</body>
</html>


<c:import url="../layout/footer.jsp" />