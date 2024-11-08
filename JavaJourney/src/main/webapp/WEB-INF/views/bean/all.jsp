<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--  -->
<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(function() {
	$("#searchIcon").click(function() {
		$(this).parents("form").submit();
	})
})
</script>

<div class="container">

<div class="text-center m-5">
<h1> <전체 원두> </h1>
</div>

<form action="./all" method="post">
<div id="up" class="mb-4 d-flex flex-row align-items-center">

<div class="me-auto d-flex justify-content-start">
<label for="cupnote" class="col-sm-4 col-form-label">맛과향</label>
<div class="col-sm-10">
<select id="cupnote" name="cupnote" class="form-select">
	<option value="" selected disabled>-- 선택하세요 --</option>
	<option value="savory">고소미</option>
	<option value="Fresh">상큼이</option>
	<option value="Sweetness">달달이</option>
	<option value="bitter">쌉쌀이</option>
</select>
</div>
</div>

<div id="search" class="p-2 d-flex justify-content-between">
<input type="text" id="keyword" name="keyword" class="bi bi-search">
<span id="searchIcon">
	<i class="bi bi-search"></i>
</span>
</div>

</div>
</form>


<div id="List">

<table>
<tbody>

<c:forEach var="bean" items="${ list }" varStatus="status">
   <c:if test="${status.index % 4 == 0}">
      <tr>
   </c:if>
   
      <td class="text-center">
      <a href="./info?beanNo=${ bean.beanNo }" class="img-thumbnail">
<%--           <img src="<c:url value='${bean.beanOriginName}' />" alt="${bean.beanName}" style="width: 100%;"> --%>
			${bean.beanOriginName}
<!--           <img src="../resources/img/y.jpg" alt="윤하" style="width: 20%; height: 20%;"> -->
      </a>
         <p>${bean.beanName}</p>
         <p>${bean.origin}</p>
         <p>맛이요 | ${bean.cupNoteName}</p>
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