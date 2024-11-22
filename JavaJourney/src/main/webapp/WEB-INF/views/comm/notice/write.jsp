<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(function() {
	$("#content").summernote({
		width: 1300, height: 300
	});
	
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
<style type="text/css">
table {
    margin: 20px auto; /* 페이지 중앙 정렬 */
    border-collapse: collapse; /* 테두리 겹침 제거 */
    width: 100%; /* 너비 조정 */
    max-width: 1500px; /* 최대 너비 설정 */
    background-color: #f9f9f9; /* 테이블 배경색 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    border-radius: 8px; /* 테이블 모서리를 둥글게 */
    overflow: hidden; /* 둥근 테두리 안에 내용 제한 */
    
}
table tr {
/*         border-bottom: 1px solid rgba(0, 0, 0, 0.1); /* 희미한 줄 */ */
}
table td {
        padding-bottom: 10px;
}
input[type="text"],
textarea {
	width: 100%; /* 입력 필드의 너비를 셀에 맞게 조정 */
    padding: 10px; /* 내부 여백 */
    font-size: 14px; /* 폰트 크기 */
    border: 1px solid #ccc; /* 테두리 */
    border-radius: 4px; /* 모서리를 둥글게 */
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
}
#btnWrite {
    width: 100%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}
</style>
<h1 class=text-center>공지사항 등록</h1>
<div class="container">
<form id="form" action="/comm/notice/write" method="post">
<table>
<tr>
	<td>
	제목
	<input type="text" id="title" name="title" style="width: 300px;">
	</td>
</tr>
<tr>
	<td>
	본문
	<textarea id="content" name="content"></textarea>
	</td>
</tr>
</table>
<button id="btnWrite" type=button>완료</button>
</form>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>