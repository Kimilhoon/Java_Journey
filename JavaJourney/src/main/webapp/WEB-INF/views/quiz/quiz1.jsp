<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />


<script type="text/javascript">
$(function() {

$(document).ready(function() {
	// 체크박스 최대 선택 개수 제한
	const maxSelection = 2;

	$("input[name='cupNoteName']").on('change', function() {
		const checkedCount = $("input[name='cupNoteName']:checked").length;

		// 체크된 수가 최대 개수를 초과할 경우
		if (checkedCount > maxSelection) { 
			$(this).prop('checked', false); // 체크를 해제
			alert("최대 " + maxSelection + "개까지만 선택할 수 있습니다.");
		} 
	});

}); // $(document).ready(function() end

$("#QuizBtn").click(function() {
	
	// 체크박스 최대 선택 개수 제한
	const maxSelection = 2;
	const checkedCount = $("input[name='cupNoteName']:checked").length;
	
	if( checkedCount < maxSelection ){
		alert(maxSelection + "개를 선택해 주셔야합니다.");
		return;
	}
	
	// 선택된 체크박스 값들 가져오기
	const selectedValues = [];
	$("input[name='cupNoteName']:checked").each(function() {
		selectedValues.push($(this).val());
	});
	
	// 쿼리 스트링 만들기
	let queryString = "";
	if (selectedValues.length > 0) {
		queryString = "?item=" + selectedValues.join("&item=");
	}

	// 새로운 페이지로 리디렉션 (쿼리 스트링 포함)
	location.href = "./quiz2" + queryString;
	
}); // $("#QuizBtn").click(function() end


}) // $(function() end
</script>

<style type="text/css">


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

<form action="./quiz" method="get">
<div id="beanQuiz" class="d-flex justify-content-center mb-5">

<div id="beanGram" class="mx-auto">
<fieldset class="row mb-3">

<table>
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

</div> <!-- <div id="beanQuiz"> -->
</form>


<div id="beanQuiz" class="d-grid gap-2 col-4 mx-auto">
<button id="QuizBtn" type="button" class="btn btn-lg btn-secondary">다 음</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

