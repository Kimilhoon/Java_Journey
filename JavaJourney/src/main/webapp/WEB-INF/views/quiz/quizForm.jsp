<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />


<script type="text/javascript">
$(function() {

$(document).ready(function() {

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
	
	
$("#QuizBtn").click(function() {
	
	// 체크박스 최대 선택 개수 제한
	const maxSelection = 2;
	const checkedCount = $("input[name='cupNoteNoQuiz']:checked").length;
	
	if( checkedCount < maxSelection ) {
		alert(maxSelection + "개를 선택해 주셔야합니다.");
		return;
	}
	
	if ( currentStep < steps.length -1 ) {
		// 현재 단계를 숨기고 다음 단계를 표시
		$("#QuizBtn").prop("disabled", true); // 버튼 비활성화
		
		$(steps[currentStep]).fadeOut(250, function () {
			
				currentStep++;
				
			$(steps[currentStep]).fadeIn(250, function () {
				
				$("#QuizBtn").prop("disabled", false); // 애니메이션 종료 후 활성화
			
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
			
			console.log(res);
			 
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
	

}); // $(document).ready(function() end

}) // $(function() end
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
}

#grindField .form-check,
#extractionField .form-check {
  display: flex; /* 라디오 버튼을 수평으로 정렬 */
  align-items: center; /* 텍스트와 버튼 세로 맞춤 */
  margin-right: 20px; /* 버튼 간격 */
}

#grindField,
#extractionField {
  justify-content: center; /* 전체 컨테이너 중앙 배치 */
}



</style>

<div class="container">

<div class="text-center m-5">
<h1> <퀴즈 시간> </h1>
</div>

<!-- <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb"> -->
<!-- 	<ol class="breadcrumb"> -->
<!-- 		<li class="breadcrumb-item"><a href="./best">best</a></li> -->
<!-- 		<li class="breadcrumb-item"><a href="./all">bean</a></li> -->
<%-- 		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li> --%>
<!-- 		<li class="breadcrumb-item active" aria-current="page">sub</li> -->
<!-- 	</ol> -->
<!-- </nav> -->

<form action="./quizResult" method="post" >

<div id="beanGram" style="display: none;">

<div>
<p>원하시는 향 또는 맛을 선택해주세요요요요용요요</p>
</div>

<fieldset id="gramField">

<table class="table table-borderless">
<tr>
	<td>
	<span>새콤</span>
	<input type="checkbox" id="cupNoteNoQuiz1" name="cupNoteNoQuiz" value="1">
	<span>달콤</span>
	<input type="checkbox" id="cupNoteNoQuiz2" name="cupNoteNoQuiz" value="2">
	<span>쌉쌀</span>
	<input type="checkbox" id="cupNoteNoQuiz3" name="cupNoteNoQuiz" value="3">
	<span>고소</span>
	<input type="checkbox" id="cupNoteNoQuiz4" name="cupNoteNoQuiz" value="4">
	</td>
</tr>

<tr>
	<td>
	<span>은은한</span>
	<input type="checkbox" id="cupNoteNoQuiz5" name="cupNoteNoQuiz" value="5">
	<span>향긋한</span>
	<input type="checkbox" id="cupNoteNoQuiz6" name="cupNoteNoQuiz" value="6">
	<span>진한</span>
	<input type="checkbox" id="cupNoteNoQuiz7" name="cupNoteNoQuiz" value="7">
	<span>부드러운</span>
	<input type="checkbox" id="cupNoteNoQuiz8" name="cupNoteNoQuiz" value="8">
	</td>
</tr>
</table>

</fieldset>
</div> <!-- <div id="beanGram"> -->


<div id="beanGrind" style="display: none;">

<div>
<p>원하시는 원두의 굵기를 선택해주세요</p>
</div>

<fieldset id="grindField">

	<div class="form-check">
		<input class="form-check-input" type="radio" name="grind" id="grind1" value="1" checked>
		<label class="form-check-label" for="grind1">굵은 분쇄</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grind" id="grind2" value="2">
		<label class="form-check-label" for="grind2">중간 분쇄</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grind" id="grind3" value="3">
		<label class="form-check-label" for="grind3">가는 분쇄</label>
	</div>
	
</fieldset>
</div> <!-- <div id="beanGram"> -->


<div id="beanExtraction" style="display: none;">

<div>
<p>원하시는 추출방법을 선택해주세욧</p>
</div>

<fieldset id="extractionField">

	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction1" value="1" checked>
		<label class="form-check-label" for="extraction1">압력</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction2" value="2">
		<label class="form-check-label" for="extraction2">드립</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction3" value="3">
		<label class="form-check-label" for="extraction3">침출</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extraction" id="extraction4" value="4">
		<label class="form-check-label" for="extraction4">달임</label>
	</div>
	
</fieldset>
</div> <!-- <div id="beanExtraction"> -->

</form>


<div id="beanQuizBtn" class="d-grid gap-2 col-4 mx-auto">
<button id="QuizBtn" type="button" class="btn btn-lg btn-secondary">다 음</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

