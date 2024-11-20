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

	$("input[name='cupNoteName']").on('change', function() {
		const checkedCount = $("input[name='cupNoteName']:checked").length;

		// 체크된 수가 최대 개수를 초과할 경우
		if (checkedCount > maxSelection) { 
			$(this).prop('checked', false); // 체크를 해제
			alert("최대 " + maxSelection + "개까지만 선택할 수 있습니다.");
		} 
	}); // $("input[name='cupNoteName']") end
	
	
$("#QuizBtn").click(function() {
	
	// 체크박스 최대 선택 개수 제한
	const maxSelection = 2;
	const checkedCount = $("input[name='cupNoteName']:checked").length;
	
	if( checkedCount < maxSelection ) {
		alert(maxSelection + "개를 선택해 주셔야합니다.");
		return;
	}
	
	if ( currentStep < steps.length -1 ) {
		// 현재 단계를 숨기고 다음 단계를 표시
		$("#QuizBtn").prop("disabled", true); // 버튼 비활성화
		
		$(steps[currentStep]).fadeOut(500, function () {
			
				currentStep++;
				
			$(steps[currentStep]).fadeIn(500, function () {
				
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
	const formData = form.serializeArray(); // 폼데이터를 쿼리스트링 형식으로 직렬화

	const 
	
	$.ajax({
		url: form.attr("action"), // form의 action 속성에서 URL 가져옴
		type: form.attr("method"), // form의 method 속성에서 전송 방식 가져옴
		data: JSON.stringify( formData.reduce((result, item) => {result[item.name]=item.value; return result;}, {}) ),
		dataType: "json",
		contentType : 'application/json',
		success: function(res) {
			
			console.log(res);
			 
			if( res.success) {
				window.location.href="./quizResult"; // 결과 페이지로 이동
			} else {
				alert("서버 처리중 문제가 발생했습니다." + res.message);
			}
		},
		error: function(res) {
			console.error("AJAX 요청에 실패했습니다.");
			alert("퀴즈 데이터를 전송하는 중 오류가 발생했습니다." + res.message);
		}
	});
	
} // function submitForm() end

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

<form action="./quizForm" method="post" >

<div id="beanGram" style="display: none;">

<div>
<p>원하시는 향 또는 맛을 선택해주세요요요요용요요</p>
</div>

<fieldset id="gramField">

<table class="table table-borderless">
<tr>
	<td>
	<span>새콤</span>
	<input type="checkbox" id="cupNoteName1" name="cupNoteName" value="새콤">
	<span>달콤</span>
	<input type="checkbox" id="cupNoteName2" name="cupNoteName" value="달콤">
	<span>쌉쌀</span>
	<input type="checkbox" id="cupNoteName3" name="cupNoteName" value="쌉쌀">
	<span>고소</span>
	<input type="checkbox" id="cupNoteName4" name="cupNoteName" value="고소">
	</td>
</tr>

<tr>
	<td>
	<span>은은한</span>
	<input type="checkbox" id="cupNoteName5" name="cupNoteName" value="은은한">
	<span>향긋한</span>
	<input type="checkbox" id="cupNoteName6" name="cupNoteName" value="향긋한">
	<span>진한</span>
	<input type="checkbox" id="cupNoteName7" name="cupNoteName" value="진한">
	<span>부드러운</span>
	<input type="checkbox" id="cupNoteName8" name="cupNoteName" value="부드러운">
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
		<input class="form-check-input" type="radio" name="grindName" id="grindName1" value="굵은 분쇄" checked>
		<label class="form-check-label" for="grindName1">굵은 분쇄</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grindName" id="grindName2" value="중간 분쇄">
		<label class="form-check-label" for="grindName2">중간 분쇄</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="grindName" id="grindName3" value="가는 분쇄">
		<label class="form-check-label" for="grindName3">가는 분쇄</label>
	</div>
	
</fieldset>
</div> <!-- <div id="beanGram"> -->


<div id="beanExtraction" style="display: none;">

<div>
<p>원하시는 추출방법을 선택해주세욧</p>
</div>

<fieldset id="extractionField">

	<div class="form-check">
		<input class="form-check-input" type="radio" name="extractionName" id="extractionName1" value="압력" checked>
		<label class="form-check-label" for="extractionName1">압력</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extractionName" id="extractionName2" value="드립">
		<label class="form-check-label" for="extractionName2">드립</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extractionName" id="extractionName3" value="침출">
		<label class="form-check-label" for="extractionName3">침출</label>
	</div>
	
	<div class="form-check">
		<input class="form-check-input" type="radio" name="extractionName" id="extractionName4" value="달임">
		<label class="form-check-label" for="extractionName4">달임</label>
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

