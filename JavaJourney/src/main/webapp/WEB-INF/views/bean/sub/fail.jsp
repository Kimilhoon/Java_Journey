<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../../layout/header.jsp" />
 

<script type="text/javascript">
$(function() {

$("#beanFail").click(function() {

	// 새로운 페이지로 리디렉션 (쿼리 스트링 포함)
	location.href = "../sub?beanNo=${ bean.beanNo }";
	
	
});

}) // $(function() end
</script>

<style type="text/css">

.text-danger {
	margin-top: 200px;
}

</style>

<div class="container">

<!-- <nav class="mb-5" style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb"> -->
<!-- 	<ol class="breadcrumb"> -->
<!-- 		<li class="breadcrumb-item"><a href="./best">best</a></li> -->
<!-- 		<li class="breadcrumb-item"><a href="./all">bean</a></li> -->
<%-- 		<li class="breadcrumb-item"><a href="./info?beanNo=${ bean.beanNo }">info</a></li> --%>
<!-- 		<li class="breadcrumb-item active" aria-current="page">sub</li> -->
<!-- 	</ol> -->
<!-- </nav> -->
<div>
<p class="text-danger fs-1 text-center mb-5">알수 없는 이유로 구독을 실패 했습니다.</p>
</div>


<div id="beanSubFail" class="d-grid gap-2 col-4 mx-auto">
<button id="beanFail" type="button" class="btn btn-lg btn-secondary">되돌아가기</button>
</div>

</div> <!-- <div class="container custom-container"> -->

<c:import url="../../layout/footer.jsp" />

</body>
</html>

