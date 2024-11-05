<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>+ + Java Journey + +</title>
</head>
<body>

<div>
<h1>전체 원두</h1>
</div>

<!-- <img src="../resources/img/y.jpg" alt="윤하" style="width: 20%; height: 20%;"> -->

<div>

<table>
<!-- <tbody> -->
<%-- 	<c:forEach var="bean" items="${ list }" varStatus="status"> --%>
<%-- 		<c:if test="${status.index % 4 == 0}"> --%>
<!-- 			<tr> 4개의 열이 시작될 때마다 새로운 행 시작 -->
<%-- 		</c:if> --%>
<!-- 		<td> -->
<%-- 			<img src="../resources/img/y.jpg" alt="${bean.beanName}" style="width: 20%; height: 20%;"> --%>
<%-- 			<p>${bean.beanName}</p> --%>
<%-- 			<p>${bean.origin}</p> --%>
<%-- 			<p>${bean.beanComm}</p> --%>
<!-- 		</td> -->
<%-- 		<c:if test="${status.index % 4 == 3 || status.last}"> --%>
<!-- 			</tr> 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
<%-- 		</c:if> --%>
<%-- 	</c:forEach> --%>
<!-- </tbody> -->
    
<thead>
<tr>
	<th>beanNo</th>
<!-- 	<th>beanImgNo</th> -->
	<th>beanName</th>
	<th>origin</th>
	<th>beanComm</th>
</tr>
</thead>

<tbody>
<c:forEach var="bean" items="${ list }">
<tr>
	<td>${ bean.beanNo }</td>
	<td><img src="../resources/img/y.jpg" alt="윤하" style="width: 20%; height: 20%;"></td>
	<td>${ bean.beanName }</td>
	<td>${ bean.origin }</td>
	<td>${ bean.beanComm }</td>
</tr>
</c:forEach>
</tbody>

</table>

</div>

<c:import url="./paging.jsp"/>

</body>
</html>