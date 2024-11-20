<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

let code = "";  // 서버에서 보내준 인증번호를 저장할 변수
$(document).ready(function() {
	$('#mailCheckBtn').click(function() {
		const email = $('#userEmail1').val()+$('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : "get",
			url : "/member/mailCheck", // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		    data: { email: email },
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code = data;  // 서버에서 받은 인증번호를 code 변수에 저장
				alert('인증번호가 전송되었습니다.')
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
		    console.log("인증번호 일치!");
			$("#resultMsg")
			.css("color", "green")
			.html("맞음");
	        $inputBox.css("border-color", "green");
		} else {
			console.log("인증번호 불일치!");
			$("#resultMsg")
			.css("color", "red")
			.html("틀림");
	        $inputBox.css("border-color", "red");
		}
	}) //$('numCheckBtn') end



});

// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
// $('#numCheckBtn').click(function() {
// 	const inputCode = $('.mail-check-input').val();  // 사용자가 입력한 인증번호
// 	const $resultMsg = $('#mail-check-warn'); // 인증번호 일치 여부 메시지를 출력할 엘리먼트

//     console.log("사용자가 입력한 인증번호: " + inputCode); // 입력된 인증번호 확인
//     console.log("발송된 인증번호: " + code); // 발송된 인증번호 확인
    
// 	if(inputCode === code){ // inputCode와 code를 문자열로 비교
// 		$resultMsg.html('인증번호가 일치합니다.');
// 		$resultMsg.css('color','green');
// 		$('#mailCheckBtn').attr('disabled',true);
// 		$('#userEmail1').attr('readonly',true);
// 		console.log("사용자가 입력한 인증번호: " + inputCode);
// 		console.log($('#resultMsg').text());
// // 		$('#userEmail2').attr('readonly',true);
// // 		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
// //          $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
// 	}else{
// 		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
// 		$resultMsg.css('color','red');
// 	}
// });


</script>




<div class="form-group email-form">
	<label for="email">이메일</label>
	<div class="input-group">
	<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
	<select class="form-control" name="userEmail2" id="userEmail2" >
		<option>@naver.com</option>
		<option>@gmail.com</option>
		<option>@daum.net</option>
		<option>@hanmail.com</option>
	</select>
	</div>   
<div class="input-group-addon">
	<button type="button" id="mailCheckBtn" name="mailCheckBtn">본인인증</button>
</div>
<div class="mail-check-box">
	<input class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
	<button type="button" id="numCheckBtn" name="numCheckBtn">확인</button>
</div>
	<p id="resultMsg" style="font-size:0.6rem;"></p>
</div>


