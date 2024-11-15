<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />


<script type="text/javascript">
$(function() {

$(document).ready(function() {
	// 체크박스 최대 선택 개수 제한
	const maxSelection = 1;

	$("input[name='extractionName']").on('change', function() {
		const checkedCount = $("input[name='extractionName']:checked").length;

		// 체크된 수가 최대 개수를 초과할 경우
		if (checkedCount > maxSelection) {
			$(this).prop('checked', false); // 체크를 해제
			alert("최대 " + maxSelection + "개까지만 선택할 수 있습니다.");
		}
	});
});

$("#QuizBtn").click(function() {
	// 선택된 체크박스 값들 가져오기
	const selectedValues = [];
	$("input[name='extractionName']:checked").each(function() {
		selectedValues.push($(this).val());
	});
	
	// 쿼리 스트링 만들기
	let queryString = "";
	if (selectedValues.length > 0) {
		queryString = "?item=" + selectedValues.join("&item=");
	}

	// 새로운 페이지로 리디렉션 (쿼리 스트링 포함)
	location.href = "./quiz" + queryString;
	
});

}) // $(function() end
</script>

<style type="text/css">


</style>

<div class="container">

<div class="text-center m-5">
<h1> <퀴즈 시간> </h1>
</div>

${ userId }

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
	<span>압력</span>
	<input type="checkbox" id="extractionName1" name="extractionName" value="압력">
	<span>드립</span>
	<input type="checkbox" id="extractionName2" name="extractionName" value="드립">
	<span>침출</span>
	<input type="checkbox" id="extractionName3" name="extractionName" value="침출">
	<span>달임</span>
	<input type="checkbox" id="extractionName4" name="extractionName" value="달임">
	</td>
</tr>

</table>

</fieldset>
</div> <!-- <div id="beanGram"> -->

</div> <!-- <div id="beanQuiz"> -->
</form>


<div id="beanQuiz" class="d-grid gap-2 col-4 mx-auto">
<button id="QuizBtn" type="button" class="btn btn-lg btn-secondary">결과보기</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

