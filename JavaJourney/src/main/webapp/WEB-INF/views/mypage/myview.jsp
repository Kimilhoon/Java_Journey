<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../layout/header.jsp" />



<div class="container col-12">
    <div class="d-flex justify-content-between mb-3">
		<div id="category-list">
		    <label>카테고리 </label>
		    <select id="category" onchange="filterByCategory()">
		        <option value="전체" ${category == '전체' ? 'selected' : ''}>전체</option>
		        <option value="카페리뷰" ${category == '카페리뷰' ? 'selected' : ''}>카페리뷰</option>
		        <option value="원두리뷰" ${category == '원두리뷰' ? 'selected' : ''}>원두리뷰</option>
		        <option value="자유게시판" ${category == '자유게시판' ? 'selected' : ''}>자유게시판</option>
		        <option value="나만의레시피" ${category == '나만의레시피' ? 'selected' : ''}>나만의레시피</option>
		    </select>
		</div> <!-- id="category-list" end -->



		<div class="d-flex align-items-center"> <!-- 오른쪽 끝 정렬이라는 뜻 -->
		    <input id="searchText" class="form-control me-2" type="search" placeholder="검색어 입력" aria-label="Search">
		    <button id="btnSearch" >검색</button>
		</div> <!-- class="d-flex align-items-center" end -->
	
	</div><!-- <div class="d-flex justify-content-between mb-3"> -->


<script>

	function filterByCategory() {
	    const selectedCategory = document.getElementById("category").value || '전체';  // 카테고리가 선택되지 않으면 기본값 '전체'
	    const searchText = document.getElementById("searchText").value;  // 검색어를 가져옴
	    const currentSearch = searchText ? "&search=" + encodeURIComponent(searchText) : "";  // 검색어가 있을 때만 추가
	    location.href = "/mypage/myview?userNo=" + ${userNo} +"&curPage=1" + "&category=" + encodeURIComponent(selectedCategory) + currentSearch;
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


<style>
#category-list {
    flex: 1;
}

#searchText {
    width: 200px; /* Adjust the width as needed */
}

#btnSearch {
    width: 27%;
    padding: 7px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}

</style>


<table class="table text-center" >
<tr>
	<th class="col-1" scope="col">글번호</th>
	<th class="col-1" scope="col">카테고리</th>
	<th class="col-1" scope="col">제목</th>
	<th class="col-1" scope="col">작성일</th>
</tr>

<c:if test="${empty myView}">
<tr>
<td>
    <p>검색 결과가 없습니다.</p>
</td>
</tr>
</c:if>

<c:forEach var="myView" items="${myView}" varStatus="status">
<tr>
    <td class="col-1" scope="row">${myView.rownum}</td> <!-- 글번호 출력 -->
 
    <td class="col-1"> <!-- 카테고리 -->
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
  
    <td class="col-4"> <!-- 제목 -->
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
   
    <td class="col-1"> <!-- 작성일 출력 -->
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
</div> <!-- class="container" end -->



<!-- 페이징 처리 -->
<div>
<ul class="pagination justify-content-center" > <!-- pagination: bootstrap 페이징 스타일 -->

	<!-- 이전페이지이동 -->
    <c:if test="${paging.curPage > 1}" > 
    	<li class="page-item">
        <a class="page-link" href="/mypage/myview?userNo=${userNo}&curPage=1&category=${category}&search=${search}" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;"><<</a>
    	</li>
    	<li class="page-item">
        <a class="page-link" href="/mypage/myview?userNo=${userNo}&curPage=${paging.curPage - 10}&category=${category}&search=${search}" style="color: black; border: 1px solid #ebddcc;"><</a>
		</li>
    </c:if>

    <!-- 페이지 번호 출력 -->
    <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}"> <!-- 1~10페이지까지 보임 -->
        <c:if test="${i == paging.curPage}">
			<li class="page-item">   
			<!-- 현재페이지는 클릭하지 못하도록 span -->        
            <span class="page-link" style="background: #6f4e37; color: white; border: 1px solid #6f4e37; font-weight: bold; ">${i}</span>
        	</li>
        </c:if>
        <c:if test="${i != paging.curPage}">
        	<li class="page-item">
            <a class="page-link" href="/mypage/myview?userNo=${userNo}&curPage=${i}&category=${category}&search=${search}" style="color: black; border: 1px solid #ebddcc; text-decoration: none;">${i}</a>
        	</li>
        </c:if>
    </c:forEach>

	<!-- 다음페이지이동 -->
    <c:if test="${paging.curPage < paging.totalPage}">
    	<li class="page-item">
        <a class="page-link" href="/mypage/myview?userNo=${userNo}&curPage=${paging.curPage + 10}&category=${category}&search=${search}" style=" color: black; border: 1px solid #ebddcc;">></a>
        </li>
        <li class="page-item">
        <a class="page-link" href="/mypage/myview?userNo=${userNo}&curPage=${paging.totalPage}&category=${category}&search=${search}" style="background: #ebddcc; color: black; border: 1px solid #ebddcc;">>></a>
   		</li>
    </c:if>
</ul>
</div>




<c:import url="../layout/footer.jsp" />