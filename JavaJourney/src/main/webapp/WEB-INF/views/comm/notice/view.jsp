<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(function () {
	$("#btnUpate").click(function name() {
		location.href="/comm/notice/update?noticeNo=" + ${notice.noticeNo};
	})
	$("#btnCancle").click(function name() {
		location.href="/comm/notice/cancel?noticeNo=" + ${notice.noticeNo};
	})
})
</script>

<style>
.btn{
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}
.btn:hover{
	background: #6f4e37;
	color: white;
}

#search_div{
	
	float: right;
}
a {
	color: #6f4e37;
}
#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
#btnCancle,
#btnUpate{
    padding: 7px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}     
</style>
<div id="content">
<c:if test="${userNick eq 'admin' }">
<div id="btn" class="mb-2">
<button id="btnUpate">수정</button>
<button id="btnCancle">삭제</button>
</div>
</c:if>
<div class="table">

<table class="table table-bordered">

	<tr>
		<td colspan="1">제목</td>
		<td colspan="1"> ${notice.title}</td>
		<td colspan="1">작성일</td>
		<td colspan="1"><fmt:formatDate value="${notice.wirteDate }" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
	<tr id="boardContent">
		<td colspan="4">${notice.content }</td>
	</tr>
</table>
<div style="text-align: right;">
	<a href="./list" ><button class="btn" style=" display: inline-block;">목록</button></a>
</div>

</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
