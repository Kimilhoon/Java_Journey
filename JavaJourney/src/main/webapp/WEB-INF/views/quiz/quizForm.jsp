<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />


<script type="text/javascript">
$(function() {

	// 현재 표시 중인 단계 (0: beanGram, 1: beanGrind, 2: beanExtraction)
	let currentStep = 0;
		
	// 단계별 DOM 요소 가져오기
	const steps = ["#beanGram", "#beanGrind", "#beanExtraction"];
	
	// 초기 상태: 첫 번째 단계만 표시
	$(steps).hide(); // 모든 단계 숨김
	$(steps[currentStep]).fadeIn(500); // 첫 번째 단계 애니메이션으로 표시


	// 체크박스 최대 선택 개수 제한
	const maxSelection = 2;

	$("input[name='cupNoteNoQuiz']").on('change', function() {
		const checkedCount = $("input[name='cupNoteNoQuiz']:checked").length;

		// 체크된 수가 최대 개수를 초과할 경우
		if (checkedCount > maxSelection) { 
			$(this).prop('checked', false); // 체크를 해제
			alert("최대 " + maxSelection + "개까지만 선택할 수 있습니다.");
		} 
	}); // $("input[name='cupNoteName']") end
	
	
$("#QuizNextBtn").click(function() {
	
	// 체크박스 최대 선택 개수 제한
	const maxSelection = 2;
	const checkedCount = $("input[name='cupNoteNoQuiz']:checked").length;
	
	if( checkedCount < maxSelection ) {
		alert(maxSelection + "개를 선택해 주셔야합니다.");
		return;
	}
	
    // Bean Grind 단계: 라디오 버튼 체크 여부 확인
	if (currentStep === 1) {
		const isGrindChecked = $("input[name='grind']:checked").length > 0;
 		if (!isGrindChecked) {
			alert("원하시는 원두의 굵기를 선택해 주세요.");
			return;
		}
	} // if (currentStep === 1) end

	// Bean Extraction 단계: 라디오 버튼 체크 여부 확인
	if (currentStep === 2) {
		const isExtractionChecked = $("input[name='extraction']:checked").length > 0;
		if (!isExtractionChecked) {
			alert("원하시는 추출 방법을 선택해 주세요.");
			return;
		}
	} // if (currentStep === 2) end
	
	if ( currentStep < steps.length -1 ) {
		// 현재 단계를 숨기고 다음 단계를 표시
		$("#QuizNextBtn").prop("disabled", true); // 버튼 비활성화
		
		$(steps[currentStep]).fadeOut(250, function () {
			
				currentStep++;
				
			$(steps[currentStep]).fadeIn(250, function () {
				
				$("#QuizNextBtn").prop("disabled", false); // 애니메이션 종료 후 활성화
			
			});
		});
		
	} else {
		
		// 마지막 단계: form 데이터 전송
		submitForm();
	
	} // if ( currentStep < step.length -1 ) end
		

}); // $("#QuizBtn").click(function() end
	
// formData.reduce((result, item), function() {
// 	result[item.name]=item.value; 
// 	return result;
// }, {})
		
function submitForm() {
	
	const form = $("form");
	const formData = form.serializeArray(); // 폼데이터를 배열 형태로 직렬화
	
	
	// concat 함수 : 두 개 이상의 배열을 순서대로 하나씩 연결(concatenate, 연결시키다)하여 새로운 배열을 반환하는 함수입니다.
	
	// formData를 객체로 변환하면서 같은 name 값을 배열로 처리
    const jsonData = formData.reduce((result, item) => {
        if (result[item.name]) {
            // 이미 값이 있으면 배열에 추가
            result[item.name] = [].concat(result[item.name], item.value);
        } else {
            // 값이 없으면 새로운 키로 추가
            result[item.name] = item.value;
        }
        return result;
    }, {});

	$.ajax({
		url: form.attr("action"), // form의 action 속성에서 URL 가져옴
		type: form.attr("method"), // form의 method 속성에서 전송 방식 가져옴
		data: JSON.stringify( jsonData ),
		dataType: "json",
		contentType : 'application/json',
		success: function(res) {
			
			$("#quizMain").hide();
			$("#quizResultForm").fadeIn(250);
			
			// 응답에서 quizResultNo 추출
			const quizResultNo = res.quizResultNo; 
			console.log("submit quizResultNo: ", quizResultNo);
			

	        let listHTML = '';
	        let index = 0;

	        // 데이터를 4개씩 묶어서 테이블 행을 생성
	        res.list.forEach(function(bean) {
	            // 4개마다 tr 태그 시작
	            if (index % 4 === 0) {
	                listHTML += "<tr>";
	            }

	            listHTML += 
	                "<td class='customImage' data-beanno='" + bean.beanNo + "' data-quizResultNo='" + quizResultNo + "' >" + 
	                bean.beanOriginName + 
	                "</th>" +
	                "<p>" + bean.beanName + "</p>" +
	                "<p>" + bean.origin + "</p>" +
	                ""
	                ;

	            // 4개마다 tr 태그 종료
	            if (index % 4 === 3 || index === res.list.length - 1) {
	                listHTML += "</tr>";
	            }

	            index++;
	        });

	        // 마지막 행에 남은 빈 셀이 있을 경우 채우기
	        if (res.list.length % 4 !== 0) {
	            const emptyCells = 4 - (res.list.length % 4);
	            for (let i = 0; i < emptyCells; i++) {
	                listHTML += "<td></td>";
	            }
	            listHTML += "</tr>";
	        }

	        $("tbody").html(listHTML);
// 	        console.log($("tbody").html());
		},
		error: function() {
			console.error("AJAX 요청에 실패했습니다.");
		}
	});
	
}; // function submitForm() end


// 	// 쿼리 스트링 만들기
// 	let queryString = "";
// 	if (selectedValues.length > 0) {
// 		queryString = "?item=" + selectedValues.join("&item=");
// 	}

// 	// 새로운 페이지로 리디렉션 (쿼리 스트링 포함)
// 	location.href = "./quiz2" + queryString;
	

	//동적으로 생성된 .customImage에 클릭 이벤트를 바인딩
	// 결과 창의 이미지 클릭시 선택된 원두 DB에 저장
	$(document).on("click", ".customImage img", function() {
		
	    const beanNo = $(this).closest(".customImage").data("beanno");  // data-beanno 속성에서 beanNo 값 추출
	    const quizResultNo = parseInt($(this).closest(".customImage").attr("data-quizResultNo"), 10); // data-beanno 속성에서 beanNo 값 추출
	    
		
		$.ajax({
			type: "post"
			, url: "/quiz/resultbean"
			, data: {
				
				beanNo: beanNo,
				quizResultNo: quizResultNo
				
			}
			, success: function() {
				
				console.log("완료");
				location.href = "/bean/info?beanNo=" + beanNo;
			
			}
			, error: function() {
				
				console.log("실패");
				
			}
			
		});
		
	}); // $(document).on("click", ".customImage img", function() end
	
	$("#ReQuizBtn").click(function() {

		// 새로운 페이지로 리디렉션 (쿼리 스트링 포함)
		location.href = "./quizForm"; 
		
	});

});// $(function() end
	
</script>

<style type="text/css">

form {
	display: flex;
	justify-content: center;
}

fieldset {
	display: flex; /* 수평 정렬 */
	flex-direction: row; /* 자식들을 세로 정렬 기본값 */
	align-items: center;
	
	margin-bottom: 20px;
}

form div p {
	font-size: 30px;
	text-align: center;
}

#tasteField {
    display: flex;
    justify-content: center;
    align-items: center;
}

#tasteField .table tr {
    display: flex;
    flex-wrap: wrap;
}

#tasteField .table td {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

#tasteField .table label {
	width: 200px; 
	height: 150px;
	
	display: flex; /* Flexbox를 사용하여 텍스트 정렬 */
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: flex-end; /* 수직 하단 정렬 */
	
	cursor: pointer;
	text-align: center;
	
	border: solid 3px;
	border-color: #8B4513;
	transition: border 0.3s ease;
	padding-bottom: 25px; /* 텍스트와 하단 경계선 사이에 여백 추가 */
	box-sizing: border-box; /* padding 포함하여 height 계산 */
	
	font-weight: bold;
}


/* 체크 상태 변경 */
#tasteField .table input:checked + label {
	color: white;
	background-color: #6F4C37 !important;
	border-color: #6F4C37 !important;
 	
}

#tasteField input{
	display: none;
}

#grindField input{
	display: none;
}

#extractionField input{
	display: none;
}

/* 라디오 버튼 선택 시 이미지에 테두리 추가 */
#grindField .form-check-input:checked + label img {
    border: 3px solid #6F4C37; /* 선택된 이미지 테두리 색상 */
    border-radius: 8px; /* 이미지 둥근 모서리 */
}

/* 라디오 버튼 선택 시 이미지에 테두리 추가 */
#extractionField .form-check-input:checked + label img {
    border: 3px solid #6F4C37; /* 선택된 이미지 테두리 색상 */
    border-radius: 8px; /* 이미지 둥근 모서리 */
}

#grindField .form-check,
#extractionField .form-check {
  display: flex; /* 라디오 버튼을 수평으로 정렬 */
  flex-direction: column; /* 세로 정렬 */
  align-items: center; /* 텍스트와 버튼 세로 맞춤 */
  margin-right: 20px; /* 버튼 간격 */
}

#grindField {
  justify-content: center; /* 전체 컨테이너 중앙 배치 */
}

#quizMain {
	display: flex;
	justify-content: center;
	align-items: center;
}

#quizMain #grindField img {
	width: 350px;
	height: 350px;
	
	margin-bottom: 10px;
	border-radius: 8px;
	
	cursor: pointer;
}

#quizMain #extractionField img {
	width: 250px;
	height: 250px;
	
	margin-bottom: 10px;
	border-radius: 8px;
	
	cursor: pointer;
}

/* 기본 이미지 스타일 */
.form-check label img {
    border: 2px solid transparent;  /* 기본 상태에서는 테두리를 투명하게 설정 */
    transition: border 0.3s ease;   /* 부드러운 전환 효과 */
}

.radio-group{
	display: flex; /* 가로 정렬 */
	justify-content: center;
	text-align: center;
	margin-top: 5px; /* 이미지와 라디오 그룹 간격 */
	cursor: pointer;
}

.form-check-input{
	margin-right: 5px; /* 라디오 버튼과 텍스트 간격 */
}

/* 버튼 하단 정렬 */

#quizMain, #quizResultForm {
	position: relative;
	height: 730px;
}

#beanQuizBtn, #beanReQuiz {
	position: absolute; /* 절대 위치 지정 */
	bottom: 20px; /* 하단에 20px 간격으로 배치 */
	left: 50%;
	transform: translateX(-50%); /* 중앙 정렬 */
}

/* 결과창 css */

.customImage img {
	cursor: pointer;
	width: 300px !important;
	height: 460px;	
	margin: 0px auto;
	overflow: hidden;
	border-radius: 8px;
	flex-shrink: 0;
	
	margin-left: 20px;
	margin-right: 20px;
}

#quizResultForm {
	margin-top: 30px;
}

#resultTable {
	display: flex;
	justify-content: center;	

	width: 100%;
	table-layout: fixed;  /* 테이블 셀 너비 고정 */
	
	text-align: center;
	
}

.progress {
	position: fixed;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
}

</style>

<!-- label[for="cupNoteNoQuiz1"] { -->
<!--     border-color: #f5b48e !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz2"] { -->
<!--     border-color: #f0d58e !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz3"] { -->
<!--     border-color: #8ebbf5 !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz4"] { -->
<!--     border-color: #a7f58e !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz5"] { -->
<!-- 	border-color: #f9f6dc !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz6"] { -->
<!-- 	border-color: #f7e4e3 !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz7"] { -->
<!-- 	border-color: #a08877 !important; -->
<!-- } -->

<!-- label[for="cupNoteNoQuiz8"] { -->
<!-- 	border-color: #fbf1d5 !important; -->
<!-- } -->

<div id="quizMain" class="container">

<!-- <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb"> -->
<!-- 	<ol class="breadcrumb"> -->
<!-- 		<li class="breadcrumb-item"><a href="./best">best</a></li> -->
<!-- 		<li class="breadcrumb-item"><a href="./all">bean</a></li> -->
<%-- 		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li> --%>
<!-- 		<li class="breadcrumb-item active" aria-current="page">sub</li> -->
<!-- 	</ol> -->
<!-- </nav> -->

<form action="./quizForm" method="Post" >

<div id="beanGram" style="display: none;">

<div>
<p>원하시는 향 또는 맛을 선택해주세요</p>
</div>
<%-- ddf : ${ list[0].beanName } --%>
<%-- ${ userNo }, --%>
<%-- ${ userId }, --%>
<%-- ${ userNick } --%>
<fieldset id="tasteField">

<table class="table table-borderless">
<tr>
	<td>
		<input type="checkbox" id="cupNoteNoQuiz1" name="cupNoteNoQuiz" value="1">
		<label for="cupNoteNoQuiz1">상큼하게<br> 새콤한 맛</label>
		
		<input type="checkbox" id="cupNoteNoQuiz2" name="cupNoteNoQuiz" value="2">
		<label for="cupNoteNoQuiz2">달달한 초콜릿을<br> 달콤한 맛</label>

		<input type="checkbox" id="cupNoteNoQuiz3" name="cupNoteNoQuiz" value="3">
		<label for="cupNoteNoQuiz3">인생의 쓴맛처럼<br> 쌉쌀한 맛</label>
		
		<input type="checkbox" id="cupNoteNoQuiz4" name="cupNoteNoQuiz" value="4">
		<label for="cupNoteNoQuiz4">땅콩 같은<br> 고소한 맛</label>
	</td>
</tr>

<tr>
	<td>
		<input type="checkbox" id="cupNoteNoQuiz5" name="cupNoteNoQuiz" value="5">
		<label for="cupNoteNoQuiz5">오이비누처럼<br>은은한 향</label>
		
		<input type="checkbox" id="cupNoteNoQuiz6" name="cupNoteNoQuiz" value="6">
		<label for="cupNoteNoQuiz6">꽃 향기처럼<br>향긋한 향</label>
		
		<input type="checkbox" id="cupNoteNoQuiz7" name="cupNoteNoQuiz" value="7">
		<label for="cupNoteNoQuiz7">에스프레소처럼<br> 진한 향</label>
		
		<input type="checkbox" id="cupNoteNoQuiz8" name="cupNoteNoQuiz" value="8">
		<label for="cupNoteNoQuiz8">크림처럼<br> 부드러운 향</label>
	</td>
</tr>
</table>

</fieldset>

<div class="progress" role="progressbar" aria-label="Example 10px high" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px; width: 100%;">
  <div class="progress-bar" style="width: 25%"></div>
</div>

</div> <!-- <div id="beanGram"> -->


<div id="beanGrind" style="display: none;">

<div>
<p>원하시는 원두의 굵기를 선택해주세요</p>
</div>

<fieldset id="grindField">

	<div class="form-check container-sm">
		<input class="form-check-input" type="radio" name="grind" id="grind1" value="1">
		<label class="form-check-label" for="grind1">
			<img alt="wholeBean" src="/resources/img/quiz/wholeBean.jpg">
			<div class="radio-group"> 
				굵은 분쇄
			</div>
		</label>
	</div>
	
	<div class="form-check container-sm">
		<input class="form-check-input" type="radio" name="grind" id="grind2" value="2">
		<label class="form-check-label" for="grind2">
			<img alt="wholeBean" src="/resources/img/quiz/handdrip.jpg">
			<div class="radio-group">
				중간 분쇄
			</div>
		</label>
	</div>
	
	<div class="form-check container-sm">
		<input class="form-check-input" type="radio" name="grind" id="grind3" value="3">
		<label class="form-check-label" for="grind3">	
			<img alt="wholeBean" src="/resources/img/quiz/espresso.jpg">
			<div class="radio-group">
				가는 분쇄
			</div>
		</label>
	</div>
	
</fieldset>

<div class="progress" role="progressbar" aria-label="Example 10px high" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="height: 5px; width: 100%;">
  <div class="progress-bar" style="width: 50%"></div>
</div>

</div> <!-- <div id="beanGram"> -->


<div id="beanExtraction" style="display: none;">

<div>
<p>원하시는 추출방법을 선택해주세요</p>
</div>

<fieldset id="extractionField">

	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction1" value="1">
		<label class="form-check-label" for="extraction1">	
			<img alt="wholeBean" src="/resources/img/quiz/vaccumfiltration.jpg">
			<div class="radio-group">
				압력
			</div>
		</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction2" value="2">
		<label class="form-check-label" for="extraction2">	
			<img alt="wholeBean" src="/resources/img/quiz/handdrip.jpg">
			<div class="radio-group">
				드립
			</div>
		</label>
	</div>
	
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction3" value="3">
		<label class="form-check-label" for="extraction3">	
			<img alt="wholeBean" src="/resources/img/quiz/steeping.jpg">
			<div class="radio-group">
				침출
			</div>
		</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction4" value="4">
		<label class="form-check-label" for="extraction4">	
			<img alt="wholeBean" src="/resources/img/quiz/decoction.jpg">
			<div class="radio-group">
				달임
			</div>
		</label>
	</div>
	
</fieldset>

<div class="progress" role="progressbar" aria-label="Example 10px high" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="height: 5px; width: 100%;">
  <div class="progress-bar" style="width: 75%"></div>
</div>

</div> <!-- <div id="beanExtraction"> -->

</form>


<div id="beanQuizBtn" class="d-grid gap-2 col-4 mx-auto">
<button id="QuizNextBtn" type="button" class="btn btn-lg btn-secondary">다 음</button>
</div>

</div> <!-- <div class="container custom-container"> -->



<div id="quizResultForm" class="container"  style="display: none;">

<!-- <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb"> -->
<!-- 	<ol class="breadcrumb"> -->
<!-- 		<li class="breadcrumb-item"><a href="./best">best</a></li> -->
<!-- 		<li class="breadcrumb-item"><a href="./all">bean</a></li> -->
<%-- 		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li> --%>
<!-- 		<li class="breadcrumb-item active" aria-current="page">sub</li> -->
<!-- 	</ol> -->
<!-- </nav> -->

<div id="List">
<!-- asd -->
<%-- ${ hello[0].beanOriginName } --%>
<%-- ${ userNo } --%>

<table id="resultTable">
<thead>
<tr>
<th></th>
</tr>
</thead>

<tbody></tbody>
</table>

</div> <!-- <div id="List"> -->

<div class="progress" role="progressbar" aria-label="Example 10px high" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="height: 5px; width: 100%;">
  <div class="progress-bar" style="width: 100%"></div>
</div>

<div id="beanReQuiz" class="d-grid gap-2 col-4 mx-auto">
<button id="ReQuizBtn" type="button" class="btn btn-lg btn-secondary">퀴즈 다시하기</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

