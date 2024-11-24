<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<h1>Mypage Nodata</h1>
<%-- ${message } --%>
<img src="<c:url value='/resources/img/nodata.jpg' />" alt="로고" width="1200" height="600" id="nodata"
class="position-relative top-50 start-50 translate-middle" />
<c:import url="../layout/footer.jsp"/>