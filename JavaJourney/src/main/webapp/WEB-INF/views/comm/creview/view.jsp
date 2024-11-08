<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:import url="../../layout/header.jsp" />

<script>

$(comm-update-btn).click(function() {
	$.ajax {
		type: "post"
		, url: "./comm/update=revNo=${cafeRev.revNo }"
		, data: {
			
		}
	}
})

</script>

<h1>카페리뷰상세보기</h1>
<br>

<div id="content">

<div id="table">
<table class="table table-bordered text-center">
	<tr>
		<td>카페명</td>
		<td colspan="3">${cafeRev.cafeName }</td>
		<td>작성자</td>
		<td colspan="2">${writerId }</td>
	</tr>
	<tr>
		<td>지역</td>
		<td>${cafeRev.cafeLoc }</td>
		<td>별점</td>
		<td>${cafeRev.revsp }</td>
		<td>작성일</td>
		<td><fmt:formatDate value="${cafeRev.revDate }" pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<td colspan="9">${cafeRev.revContent }</td>
	</tr>
</table>
</div> <!-- table -->

<div id="bottom">
	<i class="bi bi-share"></i>
	
	<c:if test="${userId eq writerId }">
		<span><a href="./update?revNo=${cafeRev.revNo }">수정</a></span>
		<span><a href="./delete?revNo=${cafeRev.revNo }">삭제</a></span>
	</c:if>

</div>



<div id="comment">

<table>

<c:forEach var="comm" items="${crevcommList }">

<tr>
	<td>유저닉네임 : ${comm.userNo }</td>
	<td> | </td>
	<td> <fmt:formatDate value="${comm.cafeCommDate }" pattern="yyyy-MM-dd"/></td>
</tr>
<tr>
	<td>댓글내용 : ${comm.cafeCommCont }</td>
</tr>

<c:if test="${userId eq writerId }">

<td>
	<span><a href="./comm/update?revNo=${comm.cafeRevCommNo }">수정</a></span>
	<span><a href="./comm/delete?revNo=${cafeRev.cafeRevCommNo }">삭제</a></span>
</td>
</c:if>

</c:forEach>

</table>

<form action="./comm?revNo=${cafeRev.revNo }" method="post">

<label>
<input type="text" name="cafeCommCont">
</label>
<button class="btn btn-primary">댓글작성</button>


</form>

</div>

<a href="./list"><button class="btn btn-light">목록</button></a>

<a href="./view?revNo=${cafeRev.revNo - 1}"><button class="btn btn-light">이전</button></a>
<a href="./view?revNo=${cafeRev.revNo + 1}"><button class="btn btn-light">다음</button></a>

</div> <!-- content -->









<c:import url="../../layout/footer.jsp" />






















