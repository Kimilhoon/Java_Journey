<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="../../layout/header.jsp" />
<script type="text/javascript">
$(function() {

	$("#btnManagerMenu").click(function () {
		location.href="/manager/menu";
	})

	$("#btnEventDelete").click(function () {
		location.href="/comm/event/delete?eventNo=" + ${eventView.eventNo};
	})
	
	$("#btnBack").click(function () {
	 	   history.back();
	});
	
	$(".custom-image img").css({
        width: "600px",
        height: "600px"
    });
})
</script>
<style type="text/css">
</style>

<h1>이벤트 목록</h1>

<div>
<button id="btnManagerMenu">관리자메뉴로가기</button>
<button id="btnEventDelete">이벤트 삭제</button>
<button id="btnBack">뒤로가기</button>
</div>

<div class="d-flex justify-content-center">
<table>
<thead>
<tr>
	<th><span style="margin-right: 205px;">제목</span>
	<span>기간</span></th>
</tr>
</thead>
<tbody>
<tr>
	<td><span style="margin-right: 180px;">${eventView.eveOriName }</span>
	<fmt:formatDate value="${eventView.eveStart}" pattern="yyyy-MM-dd"/>
  ~ <fmt:formatDate value="${eventView.eveEnd}" pattern="yyyy-MM-dd"/></td>
</tr>
</tbody>
	<tr>
		<td><div class="custom-image">${eventView.eveImg }</div></td>
	</tr>
</table>
</div>


<c:import url="../../layout/footer.jsp" />
