<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(function() {

	
	$("#btn_search").click(function() {
// 		console.log($("#search").val());
// 		console.log($("#category").val());
		$.ajax({
			url: "./list",
			type: "get",
			data:{
				"search":$("#search").val(),
			},
			dataType: "html",
			success: function(res) {
// 				console.log(res);
				$("body").children().remove();
				$("body").html(res); 
			},
			error: function() {
				
			}
			
		});
		
	});
})
</script>



<h1>나만의 레시피</h1>
<a href="./list"><button>목록</button></a>
<a href="./write"><button>작성</button></a>
<input type="text" id="search"><button id="btn_search">검색</button>

<div>
<table>
<thead>
	<tr>
		<th>보드 넘버</th>
		<th>추천수</th>
		<th>보드 제목</th>
		<th>작성자</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="myRecipeList" items="${myRecipeList }">
	<tr>
		<td>${myRecipeList.myRipNo}</td>
		<td>0</td>
		<td>
		
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
			<fmt:formatDate value="${myRecipeList.myRipWriteDate}" pattern="yyyyMMdd" var="wDate" /> 
			<c:if test="${nowDate eq wDate }">
				<span>new</span>
			</c:if>
			<a href="./view?freeBoardNo=${myRecipeList.myRipNo}"class="hit" >
				${myRecipeList.myRipTitle}
			</a>
				[0]
		</td>
		
		<td>${myRecipeList.userNick}</td>
		<td>${myRecipeList.myRipHit}</td>
		<td><fmt:formatDate value="${myRecipeList.myRipWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>

	</c:forEach>
</tbody>
</table>
</div>
<div>
	<a href="./list?curPage=${paging.curPage-1  }&search=${search}&category=${category}">이전</a>
	<a href="./list?curPage=${paging.curPage+1  }&search=${search}&category=${category}">다음</a>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>