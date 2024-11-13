<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<!-- 포트원 SDK -->

<script type="text/javascript">
$(function() {
	

}) // $(function() end



</script>

<style type="text/css">

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

<form action="./quiz" method="get">
<div id="beanQuiz" class="d-flex justify-content-center mb-5">


</div> <!-- <div id="beanSubscribe"> -->
</form>


<div id="Subscribe" class="d-grid gap-2 col-4 mx-auto">
<button id="subBtn" type="button" class="btn btn-lg btn-secondary">구 독</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../layout/footer.jsp" />

</body>
</html>

