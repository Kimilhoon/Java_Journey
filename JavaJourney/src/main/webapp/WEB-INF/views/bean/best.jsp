<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp" />


<div class="container">

<div class="text-center m-5">
<h1> <BEST 원두> </h1>
</div>


<div id="List">

<table>
<tbody>

<c:forEach var="bean" items="${ list }" varStatus="status">
	<c:if test="${status.index % 4 == 0}">
		<tr>
	</c:if>
	
	<td class="text-center" style="flex-shrink: 0;">
	<a href="./info?beanNo=${ bean.beanNo }">
			${bean.beanOriginName}
	</a>
		<p class="fw-bold fs-4">${bean.beanName}(${ bean.gram }g)</p>
		<p>${bean.origin}</p>
		<p>리뷰 : ${ bean.reviewCount }</p>
		<p>★( ${ bean.avgRevStarPoint } )</p>
	</td>
   
		<c:if test="${status.index % 4 == 3 || status.last}">
		</tr> <!-- 4개의 열이 끝날 때 또는 마지막 항목 후 행 종료 -->
		</c:if>	
</c:forEach>

<!-- 마지막 행에 남은 빈 셀이 있을 경우 채우기 -->
<c:if test="${fn:length(list) % 4 != 0}">
	<c:forEach begin="1" end="${4 - (fn:length(list) % 4)}"> 
		<td></td>
	</c:forEach>
</tr>
</c:if>


<%-- <c:forEach var="bean" items="${ list }"> --%>
<!-- <tr class="d-inline"> -->
<!--    <td style="width: 200px;"> -->
<!--    <img src="../resources/img/y.jpg" alt="윤하" style="width: 20%; height: 20%;"> -->
<%--    <p>${ bean.beanNo }</p> --%>
<%--    <p>${ bean.beanName }</p> --%>
<%--    <p>${ bean.origin }</p> --%>
<!--    </td> -->
<!-- </tr> -->
<%-- </c:forEach> --%>

</tbody>
</table>

</div>

<c:import url="./paging.jsp"/>

</div>

<c:import url="../layout/footer.jsp" />

</body>
</html>