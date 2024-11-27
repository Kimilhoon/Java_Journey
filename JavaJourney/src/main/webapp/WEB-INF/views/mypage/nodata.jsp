<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>
<style type="text/css">
#btn {
    width: 50%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}
</style>
<div class="container" style="position: relative; width: 900px; height: 400px; background-color: #f8f5f0;
border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); text-align: center;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	<c:choose>
	<c:when test="${nodata == 'quizres'}">
	<h4 style="margin-bottom: 15px; width: 900px;">${message1}</h4>
	<p style="margin-bottom: 15px;">${message2}</p>
	<a href="/quiz/quizForm"><button id="btn">취향조사 하기</button></a>
	</c:when>
	<c:when test="${nodata == 'subscribe'}">
	<h4 style="margin-bottom: 15px; width: 900px;">${message1}</h4>
	<p style="margin-bottom: 15px;">${message2}</p>
	<a href="/bean/all"><button id="btn">원두 둘러보기</button></a>
	</c:when>
	<c:when test="${nodata == 'like'}">
	<h4 style="margin-bottom: 15px; width: 900px;">${message1}</h4>
	<p style="margin-bottom: 15px;">${message2}</p>
	<a href="/cafe/all"><button id="btn" style="margin-bottom: 15px;">카페찜 하기</button></a>
	<a href="/bean/all"><button id="btn">원두찜 하기</button></a>
	</c:when>
	</c:choose>
    </div>
</div>

<c:import url="../layout/footer.jsp"/>


