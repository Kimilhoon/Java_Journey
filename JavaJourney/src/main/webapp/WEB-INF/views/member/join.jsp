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

// IMP.init("{imp77683350}"); //고객사 식별코드
// //IMP.certification(param, callback) 호출
// IMP.certification(
//   {
//     // param
//     channelKey: "channel-key-9937917d-f104-4bb7-822d-9681d7bb33c5",
//     // 주문 번호
//     merchant_uid: "ORD20180131-0000011",
//     // 모바일환경에서 popup:false(기본값) 인 경우 필수
//     m_redirect_url: "http://localhost:8088/member/join",
//     // PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
//     popup: false,
//   },
//   function (rsp) {
//     // callback
//     if (rsp.success) {
//         // 인증 성공 시 jQuery로 HTTP 요청
//         jQuery.ajax({
//           url: "./join",
//           method: "POST",
//           headers: { "Content-Type": "application/json" },
//           data: { imp_uid: rsp.imp_uid },
//         });
//       } else {
//         alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
//       }
//     },
//   );

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
        if (!emailValidation) {
            alert("이메일 형식이 올바르지 않습니다");
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
		if( !userAdd2.value ) {
			alert("상세주소를 입력하세요");
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

<script type="text/javascript">
	function showModal(modalId) {
	    document.getElementById(modalId).style.display = 'block';
	}
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>

<!-- 이용약관 모달 -->
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


주소
<button id="btnPostcode">우편번호 찾기</button>
<div id="postcodeWrap">
	<img alt="x" src="../resources/img/close.png" class="closeIcon">
</div>
<input type="text" id="userPostcode" name="userPostcode" placeholder="우편번호" readonly="readonly"><br>
<input type="text" id="userAdd1" name="userAdd1" placeholder="주소" readonly="readonly"><br>
<input type="text" id="userAdd2" name="userAdd2" placeholder="상세주소"><br>


<!-- <div> -->
<!-- 	<label for="userPostcode">우편번호 -->
<!-- 		<input type="text" name="userPostcode" id="userPostcode" required="required"> -->
<!-- 	</label> -->
<!-- </div> -->

<!-- <div> -->
<!-- 	<label for="userAdd1">주소 -->
<!-- 		<input type="text" name="userAdd1" id="userAdd1" required="required"> -->
<!-- 	</label> -->
<!-- </div> -->

<!-- <div> -->
<!-- 	<label for="userAdd2">상세주소 -->
<!-- 		<input type="text" name="userAdd2" id="userAdd2" required="required"> -->
<!-- 	</label> -->
<!-- </div> -->
<br>

[ 사업자 등록 시 ]
<div>
	<label for="businessNo">사업자 등록번호
		<input type="text" name="businessNo" id="businessNo">
	</label>
</div>
<br>

[ 이용 약관 ]
<br>
<label>
    <input type="checkbox" id="checkAll"> 모든 약관에 동의
</label>
<br>
<label>
    <input type="checkbox" class="terms-checkbox"> 이용 약관 (필수)
    <button type="button" onclick="showModal('modal1')">보기</button>
</label>
<br>
<label>
	<input type="checkbox" class="terms-checkbox"> 개인정보 수집 및 이용 (필수)
	<button type="button" onclick="showModal('modal2')">보기</button>
</label>

<div>
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