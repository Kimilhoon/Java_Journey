<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="./layout/header.jsp"/>

<div class="container">

${userNo }
<div id="bestCafe">
<!-- 이달의 베스트카페 -->
<%-- ${cafeBestList } --%>
</div>
<div id="bestBean">
<!-- 이달의 베스트원두 -->
<%-- ${beanBestList } --%>
</div>
</div>


<!-- footer -->
<c:import url="./layout/footer.jsp"/>
