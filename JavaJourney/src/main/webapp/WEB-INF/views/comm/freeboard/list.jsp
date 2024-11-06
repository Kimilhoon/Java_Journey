<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	
	$(".hit").click(function() {
		
		$.ajax({
			url: "./hit?freeBoardNo="+$(this).parent().prev().prev().text(),
			type: "get",
			dataType: "",
			success: function() {
				
			},
			error: function() {
				
			}
			
		});
	});
	$("#btn_search").click(function() {
// 		console.log($("#search").val());
// 		console.log($("#category").val());
		$.ajax({
			url: "./list",
			type: "get",
			data:{
				"search":$("#search").val(),
				"category":$("#category").val()
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

</head>
<body>
<h1>자유게시판 리스트</h1>
<a href="./list"><button>목록</button></a>
<a href="./write"><button>작성</button></a>
<br>

<br>
<div>
	<select id="category">
		<option value="all">전체</option>
		<option value="cafe">카페</option>
		<option value="bean">원두</option>
	</select>
	<input type="text" id="search"><button id="btn_search">검색</button>
</div>

<div>
<table>
<thead>
	<tr>
		<th>보드 넘버</th>
		<th>보드 분류</th>
		<th>추천수</th>
		<th>보드 제목</th>
		<th>보드 조회수</th>
		<th>보드 작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="freeBoardList" items="${freeBoardList }">
	<tr>
		<td>${freeBoardList.freeBoardNo}</td>
		<td>${freeBoardList.freeBoardCategory}</td>
		<td>${freeBoardList.freeBoardRecommendCount}</td>
		<td>
		
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" /> 
			<fmt:formatDate value="${freeBoardList.freeBoardWriteDate}" pattern="yyyyMMdd" var="wDate" /> 
			<c:if test="${nowDate eq wDate }">
				<span>new</span>
			</c:if>
			<a href="./view?freeBoardNo=${freeBoardList.freeBoardNo }"class="hit" >
				${freeBoardList.freeBoardTitle}
			</a>
				[${freeBoardList.freeBoardCommentCount}]
		</td>
		
		<td>${freeBoardList.freeBoardHit}</td>
		<td><fmt:formatDate value="${freeBoardList.freeBoardWriteDate }" pattern="yyyy년 MM월 dd일"/></td>
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