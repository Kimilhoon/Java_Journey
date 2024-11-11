<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../../layout/header.jsp" />

<div style="padding-left: 50px; padding-right: 50px;">

<script>

function clip(){
	
	var url = '';
	var textarea = document.createElement("textarea");
	
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

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

<div id="bottom" class="d-flex justify-content-between align-items-center">
    <i class="bi bi-share" onclick="clip()" style="cursor: pointer"></i>

    <c:if test="${userId eq writerId }">
        <span>
            <a href="./update?revNo=${cafeRev.revNo }">수정</a>
            <a href="./delete?revNo=${cafeRev.revNo }">삭제</a>
        </span>
    </c:if>
</div> <!-- bottom -->


</div> <!-- 여백 -->

<br>

<div style="padding-left: 65px; padding-right: 65px;">

<div id="comment">

<table>

<tr>
	<td colspan="2"><hr></td>
</tr>

<c:forEach var="comm" items="${crevcommList }">

<tr class="fw-light">
	<td><small>${comm.userNick }</small></td>
	<td class="text-end"><small><fmt:formatDate value="${comm.cafeCommDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/></small></td>
</tr>
<tr class="fw-normal">
	<td colspan="2">${comm.cafeCommCont }</td>
</tr>
<tr>
	<td colspan="2"><hr></td>
</tr>

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

<!-- 이전 게시글로 이동 -->
<c:if test="${not empty prevRevNo}">
    <a href="./view?revNo=${prevRevNo}" style="text-decoration: none;">
        <button class="btn btn-light">이전</button>
    </a>
</c:if>

<!-- 다음 게시글로 이동 -->
<c:if test="${not empty nextRevNo}">
    <a href="./view?revNo=${nextRevNo}" style="text-decoration: none;">
        <button class="btn btn-light">다음</button>
    </a>
</c:if>

</div> <!-- content -->

</div> <!-- 여백 -->

<c:import url="../../layout/footer.jsp" />






















