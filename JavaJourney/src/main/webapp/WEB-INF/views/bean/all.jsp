<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />

<div class="container">

<div class="text-center mb-5">
<h1> <전체 원두> </h1>
</div>

<div class="mb-2">
<label for="cupnote">
맛과향 :
</label>
<select id="cupnote" name="cupnote">
	<option value="savory">고소미</option>
	<option value="Fresh">상큼이</option>
	<option value="Sweetness">달달이</option>
	<option value="bitter">쌉쌀이</option>
</select>
</div>

<div>
<input type="text" >
</div>


<div id="List">
<table class="table table-info">
	<thead>
		<tr>
			<th>원두번호</th>
			<th>원두이름</th>
			<th>원산지</th>
			<th>원두설명</th>
			<th>원두가격</th>
		</tr>
	</thead>
<tbody>
<c:forEach var="bean" items="${ list }" varStatus="status">
	<tr>
		<td> <img src="<c:url value='/resources/img/coffeeLogo.jpg' />"
			alt="로고" width="200" height="200" />
		</td>
		<td>${bean.beanNo}</td>
		<td>${bean.beanName}</td>
		<td>${bean.origin}</td>
		<td>${bean.beanComm}</td>
		<td>${bean.beanPrice}</td>
	</tr>
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(list) % 4 != 0}">
	<tr>
	<c:forEach begin="1" end="${4 - (fn:length(list) % 4)}"> 
	</c:forEach>
	</tr>
</c:if>
</tbody>
</table>

</div>

<c:import url="./paging.jsp"/>

</div>

</body>
</html>