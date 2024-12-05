<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 카카오지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 본인인증 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script type="text/javascript">

var idValidation = false; //형식 체크
var pwValidation = false; 
var nickValidation = false; 
var emailValidation = false;

var idCheck = false; //중복체크
var idDuplicate = false; 
var userPw = false;
var pwCheck = false;
var nickCheck = false; 
var nickDuplicate = false;
var emailCheck = false; 
var numCheck = false; 
var businessCheck = false;

$(function() {
	$("#btnJoin").click(function() {	
		$(this).parents("form").submit();
	});	
	
/* -------------------------------------------------------------- */	
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
            return false;
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
            return false;
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
    
    //사업자번호 입력값 변경 시 다시 확인
    $("#businessNo").on("input", function () {
        businessCheck = false; // 입력값 변경 시 다시 확인해야 함
    });
    
    //인증번호 입력값 변경 시 다시 확인
    $("#mailNumCheck").on("input", function () {
    	numCheck = false; // 입력값 변경 시 다시 확인해야 함
    });
	
    

/* $("#joinForm form") */
//----------------------------------------------------------------

 	$("#joinForm form").submit(function() {
		
		if( !userId.value ) {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		if( !idCheck ) {
			alert("아이디를 중복체크하세요");
			$("#userId").focus();
			return false;
		}
		if( idDuplicate ) {
			alert("이미 존재하는 아이디입니다");
			$("#userId").focus();
			return false;
		}
		
// 		if( !userPw.value ) {
// 			alert("비밀번호를 입력하세요");
// 			return false;
// 		}
		if( !userPwCheck.value) {
			alert("비밀번호 확인을 입력하세요");
			$("#userPwCheck").focus();
			return false;
		}
		
        if( !pwCheck ){
			alert("비밀번호를 확인하세요");
	        $("#userPwCheck").focus();
			return false;
        }
		
		if( !userNick.value ) {
			alert("닉네임을 입력하세요");
	        $("#userNick").focus();
			return false;
		}

		if( !nickCheck ) {
			alert("닉네임을 중복체크하세요");
			$("#userNick").focus();
			return false;
		}
		if( nickDuplicate ) {
			alert("이미 존재하는 닉네임입니다");
			$("#userNick").focus();
			return false;
		}
		if( !userEmail.value ) {
			alert("이메일을 입력하세요");
			$("#userEmail").focus();
			return false;
		}
        if (!emailValidation) {
            alert("이메일 형식이 올바르지 않습니다");
            $("#userEmail").focus();
            return false;
        }
		if( !emailCheck ) {
			alert("이메일 본인인증을 진행하세요");
			$("#userEmail").focus();
			return false;
		}
		if( !numCheck ) {
			alert("인증번호를 확인하세요");
			$("#userEmail").focus();
			return false;
		}
		if( !userName.value ) {
			alert("이름을 입력하세요");
			$("#userName").focus();
			return false;
		}
		if( !userPhone.value ) {
			alert("전화번호를 입력하세요");
			$("#userPhone").focus();
			return false;
		}
		if( !userPostcode.value ) {
			alert("우편번호를 입력하세요");
			$("#userPostcode").focus();
			return false;
		}
		if( !userAdd1.value ) {
			alert("주소를 입력하세요");
			return false;
		}
		if( !userAdd2.value ) {
			alert("상세주소를 입력하세요");
			$("#userAdd2").focus();
			return false;
		}

		const businessNo = $("#businessNo").val().trim(); // input의 값을 가져오기
		if( businessNo !== "" && !businessCheck ) {
			alert("사업자번호를 확인하세요");
			$("#businessNo").focus();
			return false;
		}
		
	    if (document.querySelectorAll('.terms-checkbox:checked').length < 2) {  // 필수 항목이 모두 체크되지 않으면
	        alert("모든 필수 약관에 동의하셔야 합니다");
	        return false;
	    }
	    
	    
		
	}) //$("#joinForm form") end
	
	
/* ------------------------------------------------------------------- */	
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
	
	
/* 주소 */	
/* -------------------------------------------------------------- */	
	
	$("#postcodeWrap").css({
	    left: (innerWidth / 2) - (500 / 2),
	    top: (innerHeight / 2) - (500 / 2) + 800
		
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

<!-- 이용약관 모달 -->
<!-- -------------------------------------------------- -->
<script type="text/javascript">
	function showModal(modalId) {
	    document.getElementById(modalId).style.display = 'block';
	}
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>

<!-- 사업자번호 -->
<!-- -------------------------------------------------- -->
<script type="text/javascript">
function businessNoChk() {
    const businessNoField = $("#businessNo");
    let bNoNum = businessNoField.val().replace(/[^0-9]/g, ""); // 숫자만 남기기
    businessNoField.val(bNoNum);

    if (bNoNum === "") {
        businessCheck = true; // 입력 없으면 true로 설정
        alert("사업자등록번호는 선택 항목입니다.");
        return;
    }

    var data = {
        "b_no": [bNoNum]
    };
    
    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=C%2FBDbwNCr9N8%2FKH2vaukgMkr6Aoal1%2FVkwJsw8hhZDiZLkbgKK0Vd6KtRfd4abTry1YbcHWo86KwnyEC2J%2BiBQ%3D%3D",  // serviceKey 값을 xxxxxx에 입력
        type: "POST",
        data: JSON.stringify(data), // json 을 string으로 변환하여 전송
        dataType: "JSON",
        traditional: true,
        contentType: "application/json; charset:UTF-8",
        accept: "application/json",
        success: function(result) {
            console.log(result);
            if(result.match_cnt == "1") {
                //성공
                console.log("success");
                alert("사업자등록번호가 확인되었습니다.");
                businessCheck = true;
            } else {
                //실패
                console.log("fail");
                alert(result.data[0]["tax_type"]);
                businessCheck = false;
                return false;
            }
        },
        error: function(result) {
            console.log("error");
            console.log(result.responseText); //responseText의 에러메세지 확인
            businessCheck = false;
        }
    });
}
</script>


<!-- 이메일 인증 -->
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
			url : "/member/mailCheck", 
		    data: { userEmail: userEmail },
			success : function (data) { 
				
	            emailCheck = true;
				console.log("data : " +  data);
				checkInput.attr('disabled',false); //인증번호입력하는곳 활성화
				code = data;  // 서버에서 받은 인증번호를 code 변수에 저장
				alert('인증번호가 전송되었습니다.')
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
        console.log("사용자가 입력한 인증번호: " + inputCode);
        console.log("결과 메시지 요소:", $resultMsg);
        
		if(inputCode === code.toString()){
// 		    console.log("인증번호 일치!");
			$("#resultMsg")
			.css("color", "green")
			.html("인증번호가 일치합니다");
	        $inputBox.css("border-color", "green");
	        emailCheck = true;
	        numCheck = true;
		} else {
// 			console.log("인증번호 불일치!");
			$("#resultMsg")
			.css("color", "red")
			.html("인증번호가 일치하지않습니다.");
	        $inputBox.css("border-color", "red");
	        emailCheck = false;
	        return false;
		}
	}) //$('numCheckBtn') end



});
</script>



<!-- 이용약관 모달 -->
<!-- -------------------------------------------------- -->
<style type="text/css">
	.modal {
		display: none;
		position: fixed;
		background-color: white;
		top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
        justify-content: center;
        align-items: center;
    }
	.modal-content {
		background-color: white;
		margin: 15% auto;
		padding: 20px;
		width: 80%;
		max-width: 500px;
		position: relative;
		max-height: 300px; /* 최대 높이를 10줄 정도로 설정 */
        overflow-y: auto; /* 내용이 넘치면 세로 스크롤 */
	}

	.close {
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 20px;
		cursor: pointer;
	}	
	
</style>


<!-- 주소 -->
<!-- -------------------------------------------------- -->
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
	
	padding: 3px;
	
	cursor: pointer;
}

</style>


<!-- 회원가입폼 css -->
<!-- ------------------------------------------------------ -->
<style type="text/css">

#joinForm {
    width: 100%;
    max-width: 700px;  /* 폼의 최대 너비 설정 */
    margin: 0 auto;    /* 수평 중앙 정렬 */
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

#joinForm div {
    margin-bottom: 30px; /* div끼리의 간격 */
}

#joinForm label {
    display: block; /* 라벨과 입력 필드를 세로로 정렬 */
    margin-bottom: 5px;  /* 라벨과 입력 필드 간 간격 */
    font-weight: bold;
}

#joinForm input {
    width: 100%; /* 입력 필드와 버튼의 너비를 통일 */
    padding: 10px; /* 내부 여백 추가 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 4px; /* 모서리를 둥글게 */
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
    margin-top: 3px;
}
    
#joinForm input::placeholder {
    font-size: 15px; /* 텍스트 크기 줄이기 */
    color: gray;     /* 텍스트 색상 변경 */
}


/* 이용약관 */
/* ------------------------------------------------------------- */
#joinForm .agreeSection input[type="checkbox"] {
    width: auto; /* 체크박스의 기본 크기를 유지 */
    margin-right: 8px; /* 체크박스와 텍스트 간의 간격 */
    padding: 0; /* 체크박스의 기본 여백 제거 */
    box-sizing: content-box; /* 체크박스 크기 계산 방식 변경 */
}
.agreeSection {
    margin-top: 20px; /* 섹션 간 간격 */
    font-size: 16px; /* 폰트 크기 */
}

.agreeSection .agree {
    display: inline-block; /* 한 줄에 표시 */
    margin-right: 15px; /* 체크박스와 버튼 간의 간격 */
}

.agreeSection button {
    font-size: 14px; /* 버튼 폰트 크기 */
    margin-left: 5px; /* 버튼과 텍스트 간의 간격 */
    cursor: pointer; /* 버튼 클릭 시 커서 모양 */
}

.agreeSection button:hover {
    background-color: #ddd; /* 버튼 hover 효과 */
}



/* 회원가입버튼 */
/* ------------------------------------------------------------- */
#joinForm .btnJoin button{
    width: 100%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}
#joinForm button:hover {
    background-color: #5a3e2f;
}

/* 버튼 텍스트박스 옆으로 옮기기 */
/* ------------------------------------------------------------- */
#joinForm .idSection,
#joinForm .nickSection,
#joinForm .businessSection,
#joinForm .mail-check-box {
    margin-bottom: 30px; /* 섹션 간 간격 설정 */
}
#joinForm .addressSection {
    margin-bottom: 5px; /* 섹션 간 간격 설정 */
}
#joinForm .emailSection .inputGroup {
	margin-bottom: 30px;
    display: flex;       /* 입력 필드와 버튼 가로 정렬 */
    gap : 5px;
}


#joinForm .idSection input,
#joinForm .nickSection input,
#joinForm .businessSection input,
#joinForm .emailSection input,
#joinForm .mail-check-box input{
    width: 83%; /* 텍스트 필드의 너비를 줄여서 버튼이 들어갈 공간 확보 */
}
#joinForm .addressSection input{
    width: 77%;
}


#joinForm .idSection button,
#joinForm .nickSection button,
#joinForm .businessSection button,
#joinForm .emailSection .inputGroup button,
#joinForm .mail-check-box button{
    width: 16%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}
#joinForm .addressSection button{
    width: 22%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}
#userAdd1, #userAdd2 {
    margin-bottom: 5px; /* 두 입력 필드 사이에 10px 간격 추가 */
}


/* 이용약관 버튼 */
/* ------------------------------------------------------------- */
label.agree button {
    margin-left: 5px;
    width: auto;
    padding: 3px 8px; 
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 2px;
    cursor: pointer;
    font-size: 13px;
}

label.agree button:hover {
    background-color: #ddd; /* 마우스 오버 시 배경 색상 */
}

</style>





<!-- <h2 style="text-align: center; font-weight: bold;">회원가입</h2> -->
<!-- <hr> -->

<div id="joinForm">
<form action="./join" method="post" id="joinForm">

<div class="idSection">
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId" required="required" placeholder="5-15자의 영문, 숫자">
	<button id="userIdCheck" type="button">중복확인</button>
	<span id="userIdCheckMsg"></span>
<p id="idValidation" style="color:red; font-size:0.8rem;">
	아이디는 5~15자의 영문, 숫자만 가능합니다
</p>
</div>

<div>
	<label for="userPw">비밀번호
		<input type="text" name="userPw" id="userPw" required="required" placeholder="5-20자의 영문 대/소문자, 숫자, 특수문자">
	</label>
<p id="pwValidation" style="color:red; font-size:0.8rem;">
	비밀번호는 5~20자의 영문 대/소문자, 숫자, 특수문자만 가능합니다
</p>
</div>

<div>
	<label for="userPwCheck">비밀번호 확인
		<input type="password" name="userPwCheck" id="userPwCheck" required="required">
	</label>
<p id="pwCheckResult" style="font-size:0.8rem;">
</div>

<div class="nickSection">
	<label for="userNick">닉네임</label>
	<input type="text" name="userNick" id="userNick" required="required" placeholder="5-10자의 영문, 한글, 숫자">
	<button id="userNickCheck" type="button">중복확인</button>
	<span id="userNickCheckMsg"></span>
<p id="nickValidation" style="color:red; font-size:0.8rem;">
	닉네임은 5~10자의 영문, 한글, 숫자만 가능합니다
</p>
</div>

<div class="emailSection">
	<label for="userEmail">이메일</label>
	<div class="inputGroup">
	<input type="text" class="form-control" name="userEmail" id="userEmail" placeholder="ex) java@journey.com" >
	<button type="button" id="mailCheckBtn">본인인증</button>
	</div>
</div>
<div class="mail-check-box">
	<input class="mail-check-input"  id="mailNumCheck" placeholder="인증번호를 입력하세요" disabled="disabled" maxlength="6">
	<button type="button" id="numCheckBtn" name="numCheckBtn">확인</button>
	<p id="resultMsg" style="font-size:0.8rem;"></p>
</div>


<div>
	<label for="userName">이름
		<input type="text" name="userName" id="userName" required="required">
	</label>
</div>

<div>
	<label for="userPhone">전화번호
		<input type="text" name="userPhone" id="userPhone" placeholder="ex) 010-0000-0000" 
		pattern="\d{3}-\d{4}-\d{4}" oninput="this.value = this.value.replace(/[^0-9-]/g, '');"> 
	</label>
</div>

<div class="addressSection">
	<label>주소</label>
	<div id="postcodeWrap">
		<img alt="x" src="../resources/img/close.png" class="closeIcon">
	</div>
	<button id="btnPostcode">우편번호 찾기</button>
	<input type="text" id="userPostcode" name="userPostcode" placeholder="우편번호" readonly="readonly"><br>
</div>
	<input type="text" id="userAdd1" name="userAdd1" placeholder="주소" readonly="readonly"><br>
	<input type="text" id="userAdd2" name="userAdd2" placeholder="상세주소"><br>

<br>


<div class="businessSection">
	<label for="businessNo">사업자 등록번호
		<input type="text" name="businessNo" id="businessNo" placeholder="(선택) 사업자 등록 시">
		<button type="button"  name="businessNoCheck" id="businessNoCheck" onclick="businessNoChk();">확인</button>
	</label>
</div>
<br>

<div class="agreeSection">
	<label id="agree" style="font-size: 17px"> 이용 약관 </label>
	<br>
	<label class="agree">
	    <input type="checkbox" id="checkAll"> 모든 약관에 동의
	</label>
	<br>
	<label class="agree">
	    <input type="checkbox" class="terms-checkbox"> 이용 약관 (필수)
	    <button type="button" onclick="showModal('modal1')">자세히</button>
	</label>
	<br>
	<label class="agree">
		<input type="checkbox" class="terms-checkbox"> 개인정보 수집 및 이용 (필수)
		<button type="button" onclick="showModal('modal2')">자세히</button>
	</label>
</div>

<br>
<div class="btnJoin">
	<button id="btnJoin" class="btn btn-primary" type="button">회원 가입</button>
</div>

</form>
</div> <!-- id="joinForm" -->



<!-- 이용약관 모달 -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal1')">&times;</span> <!-- 모달닫기기능 -->
        <h3>이용 약관</h3>
        <hr>
        <p style="white-space: pre-wrap;">제1조(목적) 이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
 
  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
 
제2조(정의)
 
  ① “몰”이란 업체 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
 
  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
 
  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
 
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
 </p>
    </div>
</div>
<div id="modal2" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal2')">&times;</span>
        <h3>개인정보 수집 및 이용</h3>
        <hr>
        <p style="white-space: pre-wrap;">개인정보처리방침

[차례]
1. 총칙
2. 개인정보 수집에 대한 동의
3. 개인정보의 수집 및 이용목적
4. 수집하는 개인정보 항목
5. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
6. 목적 외 사용 및 제3자에 대한 제공
7. 개인정보의 열람 및 정정
8. 개인정보 수집, 이용, 제공에 대한 동의철회
9. 개인정보의 보유 및 이용기간
10. 개인정보의 파기절차 및 방법
11. 아동의 개인정보 보호
12. 개인정보 보호를 위한 기술적 대책
13. 개인정보의 위탁처리
14. 의겸수렴 및 불만처리
15. 부 칙(시행일) 

1. 총칙

본 업체 사이트는 회원의 개인정보보호를 소중하게 생각하고, 회원의 개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다. 
1) 회사는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며, 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.
2) 회사는 「개인정보처리방침」을 제정하여 이를 준수하고 있으며, 이를 인터넷사이트 및 모바일 어플리케이션에 공개하여 이용자가 언제나 용이하게 열람할 수 있도록 하고 있습니다.
3) 회사는 「개인정보처리방침」을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
4) 회사는 「개인정보처리방침」을 홈페이지 첫 화면 하단에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.
5) 회사는  「개인정보처리방침」을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
</p>
    </div>
</div>

<script>
    // "모두 동의" 체크박스 클릭 시 전체 체크박스 상태 변경
    document.getElementById('checkAll').addEventListener('change', function() {
        const isChecked = this.checked;
        document.querySelectorAll('.terms-checkbox').forEach(checkbox => checkbox.checked = isChecked);
    });

    // 개별 체크박스 클릭 시 "모두 동의" 체크박스 상태 업데이트
    document.querySelectorAll('.terms-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const allChecked = document.querySelectorAll('.terms-checkbox:checked').length === document.querySelectorAll('.terms-checkbox').length;
            document.getElementById('checkAll').checked = allChecked;
        });
    });
    
    // 모달 표시 함수
    function showModal(modalId) {
        document.getElementById(modalId).style.display = 'block';
    }

    // 모달 닫기 함수
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>



<c:import url="../layout/footer.jsp" />