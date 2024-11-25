<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<!-- 포트원 SDK -->
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<!-- UUID 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuid.min.js"></script>

<script type="text/javascript">
$(async function() {
	
// 	// 요소 선택
// 	const legend = document.getElementById("legend");
// 	const description = document.getElementById("description");

// 	// 기본적으로 설명 숨기기
// 	description.style.display = "none";

// 	// legend에 마우스를 올렸을 때 설명 보이기
// 	legend.addEventListener("mouseover", function() {
// 	    description.style.display = "block";
// 	});

// 	// legend에서 마우스를 뗐을 때 설명 숨기기
// 	legend.addEventListener("mouseout", function() {
// 	    description.style.display = "none";
// 	});

$(document).ready( async function() {
	// 각 라디오 그룹에 대한 요소 선택
	const gramRadios = $("input[name='gram']");
	const periodRadios = $("input[name='subTime']");
	const grindRadios = $("input[name=grind]");
	
	// 선택된 값을 표시할 요소 선택
	const selectedGram = $("#selectedGram");
	const selectedPeriod = $("#selectedPeriod");
	const selectedGrind = $("#selectedGrind");
	
	// 선택된 gram 값 표시 함수
	gramRadios.change(function() {
		selectedGram.text( $(this).val()+"g" );
	});
	// 선택된 period 값 표시 함수
	periodRadios.change(function() {
		selectedPeriod.text( $(this).val() );
	});
	// 선택된 gring 값 표시 함수
	grindRadios.change(function() {
		selectedGrind.text( $(this).val() );
	});
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

}); // $(document).ready(function() end

		
//버튼 클릭 시 총 가격 계산 후 결제 요청 함수 호출
$("#subBtn").on("click", async function () {

	 $(this).prop("disabled", true);
	
	calculateTotal(); // 총 가격 계산 및 표시
	requestPayment(); // 결제 요청
	
});


async function calculateTotal() {
	// 가격과 gram 가져오기
	const price = parseInt($("#beanPrice").val());
	const gram = parseInt($("input[name='gram']:checked").val());
	
	// 총 가격 계산
	const totalPrice = price * gram / 100;
	
	// 결과를 totalPrice 요소에 설정
	$("#totalPrice").text(totalPrice);
	
	// totalAmount 변수에 총합을 숫자 형식으로 저장
// 	const totalAmount = totalPrice;  // totalPrice는 이미 숫자이므로 따로 parseInt 할 필요 없음
    
	// 결제 요청 함수에서 사용
// 	requestPayment(totalAmount);
	
}; // function calculateTotal() end

$("#beanGram").change(function() {
	calculateTotal();
});

$("#CancelBtn").click(function() {
	location.href="./info?beanNo=${ bean.beanNo }";
});

/* SDK 초기화 */ 
// IMP.init("imp72523611");


async function requestPayment() {

	const totalAmount = parseInt($("#totalPrice").text());
	const paymentId = `payment-${randomUUID}`;
	const orderName = `${bean.beanName}`;
	const customerId = `${member.userNo}`;
	const fullname = `${member.userName}`;
	const phoneNumber = `${member.userPhone}`;
	const email = `${member.userEmail}`;
	const addressLine1 = `${member.userAdd1}`;
	const addressLine2 = `${member.userAdd2}`;
	const zipcode = `${member.userPostcode}`;
	const beanNo = `${bean.beanNo}`;
	const gram = parseInt($("input[name='gram']:checked").val());
	const grind = $("input[name='grind']:checked").val();
	const subTime = $("input[name='subTime']:checked").val();
	
	console.log(totalAmount);
	console.log(paymentId);
	console.log(orderName);
	console.log(customerId);
	console.log(fullname);
	console.log(phoneNumber);
	console.log(email);
	console.log(addressLine1);
	console.log(addressLine2);
	console.log(zipcode);
	console.log(beanNo);
	console.log(gram);
	console.log(grind);
	console.log(subTime);
	
	const response = await PortOne.requestPayment({
		// Store ID 설정
		storeId: "store-be1fa1df-6baa-44e7-ba56-8e23cd18366d",
		// 채널 키 설정
		channelKey: "channel-key-67189232-0ce2-4acf-ab99-4a03ee845cb5",
		paymentId: paymentId,
		orderName: orderName,
		totalAmount: 1000,
		currency: "KRW",
		payMethod: "CARD",
		customer: {
			customerId: customerId,
			fullName: fullname,
			phoneNumber: phoneNumber,
			email: email,
			address: {
				addressLine1: addressLine1,
				addressLine2: addressLine2
			},
			zipcode: zipcode
		}
	}); // const response = PortOne.requestPayment({ end
// 		console.log("리스폰슴ㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ");
// 		console.log(response);
	if (response.code != undefined) {
		// 오류 발생
		location.href = '/bean/sub/fail?beanNo=' + beanNo;
	    return;
		
	}
 
// 	const URL = 'http://localhost:8088/bean/sub?beanNo=' + `${ bean.beanNo }` + '/payment/complete'
// 	const URL = 'http://localhost:8088/bean/sub/payment/complete'
	
	// /payment/complete 엔드포인트를 구현해야 합니다. 다음 목차에서 설명합니다.
	
	const notified = await fetch('http://localhost:8088/bean/sub/payment/complete', {
	method: "POST",
	headers: { "Content-Type": "application/json" },
		// paymentId와 주문 정보를 서버에 전달합니다
		body: JSON.stringify({
			paymentId: paymentId,
			beanNo: beanNo,
			orderName: orderName,
			totalAmount: 10000,
			customerId: customerId,
			fullName: fullname,
			phoneNumber: phoneNumber,
			email: email,
			addressLine1: addressLine1,
			addressLine2: addressLine2,
			zipcode: zipcode,
			gram: gram,
			grind: grind,
			subTime: subTime,
	    }),
	});
// 	console.log(notified);
	if(notified.ok){
		console.log("결제 완ㄹ효");
		location.href = '/bean/sub/succ?beanNo=' + beanNo + "&&beanName=" + orderName + "&&userName=" + fullname;
	}
// 	}else{
// 		console.log("결제ㅌㅌㅌㅌㅌㅌㅌ");
// 		location.href = "./sub/fail";
		
// 	}
	        
	
}; // function requestPayment() end


}); // $(function() end

// document.addEventListener("DOMContentLoaded", function() {
// 	// 각 라디오 그룹에 대한 요소 선택
// 	const gramRadios = document.querySelectorAll("input[name='gram']");
// 	const periodRadios = document.querySelectorAll("input[name='subTime']");
// 	const grindRadios = document.querySelectorAll("input[name='grind']");
    
// 	// 선택된 값을 표시할 요소 선택
// 	const selectedGram = document.getElementById("selectedGram");
// 	const selectedPeriod = document.getElementById("selectedPeriod");
// 	const selectedGrind = document.getElementById("selectedGrind");

// 	// 선택된 gram 값 표시 함수
// 	gramRadios.forEach(radio => {
// 		radio.addEventListener("change", function() {
// 			console.log("Selected gram changed:", event.target.value);
// 			selectedGram.textContent = event.target.value + "g";
// 			console.log(selectedGram.textContent);
// 		});
// 	});

// 	// 선택된 period 값 표시 함수
// 	periodRadios.forEach(radio => {
// 		radio.addEventListener("change", function() {
// 			console.log("Selected gram changed:", event.target.value);
// 			selectedPeriod.textContent = event.target.value;
// 			console.log(selectedPeriod.textContent);
// 		});
// 	});

// 	// 선택된 grind 값 표시 함수
// 	grindRadios.forEach(radio => {
// 		radio.addEventListener("change", function() {
// 			console.log("Selected gram changed:", event.target.value);
// 			selectedGrind.textContent = event.target.value;
// 			console.log(selectedGrind.textContent);
// 		});
// 	});
// });


// function calculateTotal() {
// 	var price = parseInt( document.getElementById("beanPrice").value );
// 	var gram = parseInt( document.getElementByName("gram").value );
	
// 	var totalPrice = price * gram;
	
// 	document.getElementById("totalPrice").textContent = totalPrice;
// }


</script>

<style type="text/css">

#beanSubInfo{
	font-size: 27px;
}

#beanSubInfo p {
	font-size: 32px;
	font-weight: bold;
	color: #6f4e37;
}

#buyGuide{
	font-size: small;
}

#beanGuide{
	border-top: solid 2px #6F4E37;
	border-bottom: solid 2px #6F4E37;
	
	margin-bottom: 20px;
}

.custom-tooltip .tooltip-inner {
    background-color: #6F4E37; /* 원하는 배경색 */
    color: #fff; /* Tooltip 텍스트 색상 (선택 사항) */
}

.custom-tooltip .tooltip-arrow {
	/* 화살표와 이너의 색상은 따로 이기 때문에 따로 설정을 해줘야한다 */
    border-left-color: #6F4E37; /* 화살표 색상 (배경색과 동일하게 설정) */
}

</style>

<div class="container">

<div class="text-center m-5">
<h1> <${ bean.beanName } 원두 구독 페이지> </h1>
</div>

<nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item"><a href="./all">bean</a></li>
		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li>
		<li class="breadcrumb-item active" aria-current="page">sub</li>
	</ol>
</nav>

<form action="./sub" method="get">
<div id="beanSubscribe" class="d-flex justify-content-center mb-5">

<div id="beanGram" class="mx-auto">
<fieldset class="row mb-3">
<legend class="col-form-label col-sm-8 pt-0">◆원두 용량◆</legend>
<div class="col-sm-10">
	<div class="form-check">
		<input class="form-check-input" type="radio" name="gram" id="beanGram1" value="200">
		<label class="form-check-label" for="beanGram1">200g</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="gram" id="beanGram2" value="600">
		<label class="form-check-label" for="beanGram2">600g</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="gram" id="beanGram3" value="1000">
		<label class="form-check-label" for="beanGram3">1000g</label>
	</div>
</div>
</fieldset>
</div> <!-- <div id="beanGram"> -->

<div id="beanPeriod" class="mx-auto">
<fieldset class="row mb-3">
<legend class="col-form-label col-sm-10 pt-0">►배송 기간◄</legend>
<div class="col-sm-10">
	<div class="form-check">
		<input class="form-check-input" type="radio" name="subTime" id="subTime1" value="1주" checked>
		<label class="form-check-label" for="subTime1">1주</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="subTime" id="subTime2" value="2주">
		<label class="form-check-label" for="subTime2">2주</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="subTime" id="subTime3" value="1개월">
		<label class="form-check-label" for="subTime3">한달</label>
	</div>
</div>
</fieldset>
</div> <!-- <div id="beanPeriod"> -->

<div id="beanGrind" class="mx-auto">
<fieldset class="row mb-3">
<legend class="col-form-label col-sm-10 pt-0 " data-bs-toggle="tooltip" data-bs-placement="right"
        data-bs-custom-class="custom-tooltip"
        data-bs-title="홀빈: 두꺼운 굵기입니다<br>에스프레소: 중간 굵기입니다<br>핸드드립: 얇은 굵기입니다" 
        data-bs-html="true">★분쇄 타입★</legend>
<!-- <p id="description" class="description">This is the form description.</p> -->
<div class="col-sm-10">
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grind" id="grind1" value="홀빈" checked>
		<label class="form-check-label" for="grind1">홀빈</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grind" id="grind2" value="에스프레소">
		<label class="form-check-label" for="grind2">에스프레소</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grind" id="grind3" value="핸드드립">
		<label class="form-check-label" for="grind3">핸드드립</label>
	</div>
</div>
</fieldset>
</div> <!-- <div id="beanGrid"> -->

</div> <!-- <div id="beanSubscribe"> -->
</form>

<div id="beanGuide">

<div id="beanSubInfo" class="d-flex justify-content-center align-items-center">
<input type="hidden" id="beanPrice" value="${ bean.beanPrice }">
<p class="m-0 d-inline">${ bean.beanName }</p>
가&nbsp;
<p id="selectedGram" class="m-0 d-inline">200g</p>씩&nbsp;
<p id="selectedGrind" class="m-0 d-inline">홀빈</p>&nbsp;분쇄타입으로&nbsp;
<p id="selectedPeriod" class="m-0 d-inline">1주</p>&nbsp;마다&nbsp;
<p id="totalPrice" class="m-0 d-inline">0</p>
원 정기 결제됩니다.
</div> <!-- <div id="beanSubInfo" class="d-flex justify-content-center"> -->

<div id="buyGuide" class="d-flex justify-content-center">
<p>
*배송지는 회원가입시 등록한 주소로 배송됩니다.
변경을 원하시면 <a href="../mypage/myinfo">마이페이지</a>에서 변경해주세요*
</p>
</div> <!-- <div id="buyGuide" class="d-flex justify-content-center"> -->

</div> <!-- <div id="beanGuide"> -->

<div id="Subscribe" class="d-grid gap-2 col-4 mx-auto">
<button id="subBtn" type="button" class="btn btn-lg btn-secondary">구 독</button>
<button id="CancelBtn" type="button" class="btn btn-lg btn-warning">취 소</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

