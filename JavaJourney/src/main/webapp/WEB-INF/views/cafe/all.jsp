<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<div>
<h1>Cafe All List TestPage</h1>
<h2>화면 나오는지 보기 위함.</h2>
</div>

<div>
<table>

<thead>
	<tr>
		<th>cafeNo</th>
		<th>cafeName</th>
		<th>cafeComm</th>
		<th>cafeAdd1</th>
	</tr>
</thead>

<tbody>
	<c:forEach var="cafe" items="${AllCafeList }">
	<tr>
		<td>${cafe.cafeNo }</td>
		<td>${cafe.cafeName }</td>
		<td>${cafe.cafeComm }</td>
		<td>${cafe.cafeAdd1 }</td>
	<tr>
	</c:forEach>
</tbody>

</table>
</div>

<c:import url="../layout/page.jsp"/>


<c:import url="../layout/footer.jsp"/>