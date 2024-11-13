<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../layout/header.jsp" />


<h1>< 작성 글 확인 ></h1>
<hr>


<div id="category-list">
    <label>카테고리</label>
    <select id="category" onchange="filterByCategory()">
        <option value="전체" ${category == '전체' ? 'selected' : ''}>전체</option>
        <option value="카페리뷰" ${category == '카페리뷰' ? 'selected' : ''}>카페리뷰</option>
        <option value="원두리뷰" ${category == '원두리뷰' ? 'selected' : ''}>원두리뷰</option>
        <option value="자유게시판" ${category == '자유게시판' ? 'selected' : ''}>자유게시판</option>
        <option value="나만의레시피" ${category == '나만의레시피' ? 'selected' : ''}>나만의레시피</option>
    </select>
</div>

<script>
function filterByCategory() {
    const selectedCategory = document.getElementById("category").value;
    location.href = "/mypage/myview?userNo=" + ${userNo} + "&category=" + encodeURIComponent(selectedCategory);

}
</script>

<table>
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">테마</th>
	<th class="col-1" scope="col">제목</th>
	<th class="col-1" scope="col">작성일</th>
</tr>

<c:forEach var="myView" items="${myView}" varStatus="status">
<tr>
    <td>${myView.rownum}</td> <!-- 글번호 출력 -->
 
    <td> <!-- 카테고리 -->
        <c:choose>
            <c:when test="${myView.type == 'CafeRev'}">
              	카페리뷰
            </c:when>
            <c:when test="${myView.type == 'BeanRev'}">
                원두리뷰
            </c:when>
            <c:when test="${myView.type == 'FreeBoard'}">
               	자유게시판
            </c:when>
            <c:when test="${myView.type == 'MyRecipe'}">
               	나만의레시피
            </c:when>
        </c:choose>		
	</td>
  
    <td> <!-- 제목 -->
        <c:choose>
            <c:when test="${myView.type == 'CafeRev'}">
               <a href="/comm/creview/view?revNo=${myView.data.revNo}">
              	${myView.data.cafeName}
                </a>
            </c:when>
            <c:when test="${myView.type == 'BeanRev'}">
                <a href="/comm/breview/view?revNo=${myView.data.revNo}">
                ${myView.data.beanName}
                </a>
            </c:when>
            <c:when test="${myView.type == 'FreeBoard'}">
                <a href="/comm/freeboard/view?freeBoardNo=${myView.data.freeBoardNo}">
                ${myView.data.freeBoardTitle}
                </a>
            </c:when>
            <c:when test="${myView.type == 'MyRecipe'}">
            	<a href="/comm/myrecipe/view?myRipNo=${myView.data.myRipNo}">
               	${myView.data.myRipTitle} 
                </a>
            </c:when>
        </c:choose>
    </td>
   
    <td> <!-- 작성일 출력 -->
        <c:choose>
            <c:when test="${myView.type == 'CafeRev'}">
                <fmt:formatDate value="${myView.data.revDate}" pattern="yyyy-MM-dd"/>
            </c:when>
            <c:when test="${myView.type == 'BeanRev'}">
                 <fmt:formatDate value="${myView.data.revDate}" pattern="yyyy-MM-dd"/>            
            </c:when>
            <c:when test="${myView.type == 'FreeBoard'}">
                <fmt:formatDate value="${myView.data.freeBoardWriteDate}" pattern="yyyy-MM-dd"/>
            </c:when>
            <c:when test="${myView.type == 'MyRecipe'}">
                <fmt:formatDate value="${myView.data.myRipWriteDate}" pattern="yyyy-MM-dd"/>
            </c:when>
        </c:choose>  		
    </td>
</tr>
</c:forEach>

</table>



<c:import url="../layout/footer.jsp" />