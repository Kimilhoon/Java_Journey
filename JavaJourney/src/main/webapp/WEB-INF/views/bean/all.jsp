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

<table>
<tbody>

<c:forEach var="bean" items="${ list }" varStatus="status">
   <c:if test="${status.index % 4 == 0}">
      <tr>
   </c:if>
   
      <td class="text-center">
      <a href="./info?beanNo=${ bean.beanNo }">
          <img src="../resources/img/y.jpg" alt="${bean.beanName}" style="width: 70%;">
      </a>   
         <p>${bean.beanName}</p>
         <p>${bean.origin}</p>
         <p>${bean.beanComm}</p>
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

</body>
</html>