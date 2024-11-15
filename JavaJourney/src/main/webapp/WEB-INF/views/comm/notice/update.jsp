<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	$("#content").summernote({
		width: 1300, height: 300
	});
	
	$("#btnBack").click(function name() {
		history.back();
	})
	
	$("#btnWrite").click(function () {
		var title = $("#title").val().trim();
		var contentIsEmpty = $('#content').summernote('isEmpty');
		
		if(title === "" || contentIsEmpty) {
	        alert("제목과 본문내용 중 작성하지 않으신 곳이 있습니다");
			return false
		} else {
	        $("#form").submit();
		}
	})
})
</script>
<h1 class=text-center>공지사항 등록</h1>
<div class="container">
<div id="btn">
<button id="btnBack">뒤로가기</button>
</div>
<form id="form" action="/comm/notice/update?noticeNo=${notice.noticeNo }" method="post">
<table class="table table-info">
<tr>
	<td>
	제목
	<input type="text" id="title" name="title" value="${notice.title }" style="width: 300px;">
	</td>
</tr>
<tr>
	<td>
	본문
	<textarea id="content" name="content">${notice.content }</textarea>
	</td>
</tr>
</table>
<button id="btnWrite" type=button>수정</button>
</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>