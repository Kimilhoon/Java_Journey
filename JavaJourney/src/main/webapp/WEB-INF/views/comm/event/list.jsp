<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/header.jsp" />
<script type="text/javascript">
$(function() {

	$("#btnManagerMenu").click(function () {
		location.href="/manager/menu";
	})

	$("#btnEventWrite").click(function () {
		location.href="/comm/event/write";
	})
	
	$("#btnBack").click(function () {
	 	   history.back();
	});
	
})
</script>


<h1>이벤트 목록</h1>

<div>
<button id="btnManagerMenu">관리자메뉴로가기</button>
<button id="btnEventWrite">이벤트 등록</button>
<button id="btnBack">뒤로가기</button>
</div>


<div class="container">
	
</div>




<c:import url="../../layout/footer.jsp" />
