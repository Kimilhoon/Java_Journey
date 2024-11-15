<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />
 

<script type="text/javascript">
$(function() {

$("#QuizBtn").click(function() {

	// 새로운 페이지로 리디렉션 (쿼리 스트링 포함)
	location.href = "./quiz1";
	
	
});

}) // $(function() end
</script>

<style type="text/css">



</style>

<div class="container">

<div class="text-center m-5">
<h1> <퀴즈 결과> </h1>
</div>

<!-- <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb"> -->
<!-- 	<ol class="breadcrumb"> -->
<!-- 		<li class="breadcrumb-item"><a href="./best">best</a></li> -->
<!-- 		<li class="breadcrumb-item"><a href="./all">bean</a></li> -->
<%-- 		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li> --%>
<!-- 		<li class="breadcrumb-item active" aria-current="page">sub</li> -->
<!-- 	</ol> -->
<!-- </nav> -->



<div id="beanQuiz" class="d-grid gap-2 col-4 mx-auto">
<button id="QuizBtn" type="button" class="btn btn-lg btn-secondary">퀴즈 다시하기</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

