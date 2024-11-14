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

<!-- <script>
function filterByCategory() {
    const selectedCategory = document.getElementById("category").value;
    location.href = "/mypage/myview?userNo=" + ${userNo} + "&category=" + encodeURIComponent(selectedCategory);

}
</script> -->


<div class="d-flex justify-content-end"> <!-- 오른쪽 끝 정렬이라는 뜻 -->
    <div class="col-2">
        <input id="searchText" class="form-control me-2" type="search" placeholder="검색어 입력" aria-label="Search">
    </div>
    <button id="btnSearch" class="btn btn-primary">검색</button>
</div>
<script>

function filterByCategory() {
    const selectedCategory = document.getElementById("category").value || '전체';  // 카테고리가 선택되지 않으면 기본값 '전체'
    const searchText = document.getElementById("searchText").value;  // 검색어를 가져옴
    const currentSearch = searchText ? "&search=" + encodeURIComponent(searchText) : "";  // 검색어가 있을 때만 추가
    location.href = "/mypage/myview?userNo=" + ${userNo} + "&category=" + encodeURIComponent(selectedCategory) + currentSearch;
}

// 검색 버튼 클릭 이벤트 처리
document.getElementById("btnSearch").onclick = function() {
    filterByCategory(); // 카테고리와 검색어를 함께 처리
};

//Enter key 이벤트로 검색 처리
document.getElementById("searchText").addEventListener("keypress", function(event) {
    if (event.key === "Enter") {
        filterByCategory();  // Enter 키를 누르면 검색 실행
    }
});

// 페이지 로드 시, 카테고리 값이 없을 경우 '전체'로 처리
onload = function() {
    const category = document.getElementById("category").value || '전체';
    document.getElementById("category").value = category;
};
</script>



<table>
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">카테고리</th>
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
<%--                 [${myView.data.cafeRevCommentCount}] --%>
            </c:when>
            <c:when test="${myView.type == 'BeanRev'}">
                <a href="/comm/breview/view?revNo=${myView.data.revNo}">
                ${myView.data.beanName}
                </a>
<%--                 [${myView.data.beanRevCommentCount}]  --%>
            </c:when>
            <c:when test="${myView.type == 'FreeBoard'}">
                <a href="/comm/freeboard/view?freeBoardNo=${myView.data.freeBoardNo}">
                ${myView.data.freeBoardTitle}
                </a>
<%--                 [${myView.data.freeBoardCommentCount}]  --%>
            </c:when>
            <c:when test="${myView.type == 'MyRecipe'}">
            	<a href="/comm/myrecipe/view?myRipNo=${myView.data.myRipNo}">
               	${myView.data.myRipTitle} 
                </a>
<%--                 [${myView.data.myRecipeCommentCount}] --%>
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

<!-- 페이징 처리 -->
<div class="pagination">
    <c:if test="${paging.curPage > 1}">
        <a href="/mypage/myview?userNo=1&curPage=${paging.curPage - 1}" class="prev">Prev</a>
    </c:if>

    <!-- 페이지 번호 출력 -->
    <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
        <c:if test="${i == paging.curPage}">
            <span class="current">${i}</span>
        </c:if>
        <c:if test="${i != paging.curPage}">
            <a href="/mypage/myview?userNo=1&curPage=${i}" class="page">${i}</a>
        </c:if>
    </c:forEach>

    <c:if test="${paging.curPage < paging.endPage}">
        <a href="/mypage/myview?userNo=1&curPage=${paging.curPage + 1}" class="next">Next </a>
    </c:if>
</div>

<c:import url="../layout/footer.jsp" />