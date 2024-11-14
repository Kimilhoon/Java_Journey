<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
$(function () {
	$(".custom-image img").css({
        width: "200px",
        height: "200px",
        "margin-right": "-160px"
    });
  
})
</script>
<style type="text/css">
</style>
<h1 class="text-center">구독정보</h1>
<div class="container">
<%-- ${beanSubList } --%>
<c:forEach var="sub" items="${beanSubList }">
<div>
<table class="table">
<tr>
	<td>
	<div class="custom-image">
	<a href="/bean/info?beanNo=${sub.beanNo}">
	${sub.beanOriginName }
	</a>
	</div>
	</td>
	<td>
		<ul>
			<li>${sub.beanName }</li>
			<li>
			<fmt:formatDate value="${sub.subStartDate }" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${sub.subEndDate }" pattern="yyyy-MM-dd"/>
			</li>
			<li>${sub.subTime }</li>
			<li>${sub.price }</li>
		</ul>
	</td>
<%-- 	<td>${sub.beanName }</td> --%>
<!-- 	<td> -->
<%-- 	<fmt:formatDate value="${sub.subStartDate }" pattern="yyyy-MM-dd"/> --%>
<%-- 	<fmt:formatDate value="${sub.subEndDate }" pattern="yyyy-MM-dd"/> --%>
<!-- 	</td> -->
<%-- 	<td>${sub.price }</td> --%>
</tr>
</table>
</div>
<div id="beanRev">
</div>
</c:forEach>
</div>
<c:import url="../layout/footer.jsp"/>