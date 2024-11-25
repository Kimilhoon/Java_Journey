<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../../layout/header.jsp" />


<script type="text/javascript">
$(function() {
	
	$("#beanSubInfoBtn").click(function() {
		location.href="../mypage/subscribe?userNo=${ beanSub.userNo }"
	})
	
	$("#beanAllBtn").click(function() {
		location.href="../all"
	})
	

}) // $(function() end
</script>

<style type="text/css">
#subText{
	font-size: 40px;
}

#subText p span{
	font-size: 55px;
	font-weight: bold;
	color: #6f4e37;
}

</style>

<div class="container">

<div class="text-center m-5">
<h1> <구독결과!!> </h1>
</div>

<!-- <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb"> -->
<!-- 	<ol class="breadcrumb"> -->
<!-- 		<li class="breadcrumb-item"><a href="./best">best</a></li> -->
<!-- 		<li class="breadcrumb-item"><a href="./all">bean</a></li> -->
<%-- 		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li> --%>
<!-- 		<li class="breadcrumb-item active" aria-current="page">sub</li> -->
<!-- 	</ol> -->
<!-- </nav> -->

<div id="subText" class="text-center mb-5">
	<p>
		<span>${ beanSub.userName }</span>님이
	</p>
	<p>
		<span>${ beanSub.beanName }</span>의&nbsp;구독을
	</p>
	<p>성공하였습니다</p>
</div>



<div id="beanSub" class="d-grid gap-2 col-4 mx-auto">
<button id="beanSubInfoBtn" type="button" class="btn btn-lg btn-secondary">구독 정보 보러가기</button>
<button id="beanAllBtn" type="button" class="btn btn-lg btn-secondary">원두더 사러 가자 쓩~</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../../layout/footer.jsp" />

</body>
</html>

