<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

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

/* 전체적인 레이아웃 */
#write-area {
    max-width: 1100px; /* 최대 너비 설정 */
    margin: 0 auto; /* 수평 가운데 정렬 */
    padding: 20px;
    background-color: #f9f9f9; /* 배경색 */
    border-radius: 8px; /* 둥근 모서리 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 테이블 레이아웃 스타일 */
.table {
    width: 100%;
    table-layout: fixed;
    margin-bottom: 20px;
}

/* 카페명과 별점이 양쪽 끝에 정렬되도록 설정 */
.tr-header {
    display: flex;
    justify-content: space-between; /* 양쪽 끝에 배치 */
    align-items: center; /* 수직 정렬 */
    padding-bottom: 10px;
    margin-top: 10px;
    margin: 0 auto;
    border-bottom: 1px solid #ddd;
}

/* 카페명 스타일 */
.cafe-name {
    font-size: 2em;
    font-weight: bold;
    color: #333; /* 글자 색상 */
}

/* 작은 글씨 크기 */
small {
    font-size: 0.9em;
    color: #777;
}

/* 별점 셀 스타일 */
select {
	display: flex;
    font-size: 1em;
    padding: 5px;
    border-radius: 4px;
    border: 1px solid #ccc;
    background-color: #fff;
    align-self: flex-end;
}

/* Summernote 에디터 스타일 */
textarea.form-control {
    resize: vertical; /* 수직 크기 조정 가능 */
    height: 200px; /* 높이 설정 */
    margin-top: 20px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1.1em;
    background-color: #f4f4f4; /* 배경 색 */
}

/* 버튼 스타일 */
form button {
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 1.1em;
    border-radius: 4px;
    border: none;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

form button:hover {
    background-color: #0056b3; /* 버튼 hover 시 색상 변경 */
}

/* 목록 버튼을 우측 정렬 */
form a button {
    margin-left: 10px;
}

/* 테이블과 버튼 간의 여백 */
td, button {
    padding-left: 20px;
    padding-right: 20px;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
    $('#summernote').summernote({
        width: 1000,
        height: 400,
        callbacks: {
            onInit: function() {
                // 에디터 초기화 후 텍스트 왼쪽 정렬
                $('#summernote').summernote('editor.formatBlock', 'div');
                $('#summernote').summernote('editor.style', 'text-align: left');
            }
        }
    });
});

	
$.ajax({
    url: '/save',
    type: 'POST',
    contentType: 'application/json; charset=UTF-8',
    data: JSON.stringify({ content: $('#summernote').val() })
});

$(document).ready(function() {
    // Summernote가 비어있는지 확인하는 함수
    function hasContent() {
        return !$('#summernote').summernote('isEmpty');
    }

    // 페이지를 벗어날 때 경고창 표시
    function beforeUnloadHandler(e) {
        if (hasContent()) {  // Summernote에 내용이 있을 경우
            e.preventDefault();
            e.returnValue = ''; // 브라우저에 따라 메시지를 표시하기 위한 설정
        }
    }

    // beforeunload 이벤트 등록
    window.addEventListener('beforeunload', beforeUnloadHandler);

    // submit 버튼 클릭 시 beforeunload 이벤트를 일시적으로 제거
    $('form').on('submit', function() {
        window.removeEventListener('beforeunload', beforeUnloadHandler);
    });
});

</script>

<form action="./write" method="post">

<input type="text" name="cafeNo" value="${cafeNo.cafeNo }" hidden="none">

<div id="write-area">

<table class="table table-borderless">

<tr>
</tr>

<tr>
<td class="text-center">
<small>카페명</small> | <span class="cafe-name">&nbsp;&nbsp;${cafeName}</span>
</td>

<td class="text-center">
<label>별점
<select name="revsp">
	<option value="5">★★★★★</option>
	<option value="4">★★★★☆</option>
	<option value="3">★★★☆☆</option>
	<option value="2">★★☆☆☆</option>
	<option value="1">★☆☆☆☆</option>
</select>
</label>
</td>
</tr>

<tr>
<td colspan="2" class='text-center'>
<label>
<textarea id="summernote" name="revContent" required="required" class="form-control"></textarea>
</label>
</td>
</tr>

</table>

<button class="btn btn-primary">작성</button>
<a href="./list"><button type="button" class="btn btn-primary">목록</button></a>

</div><!-- write-area -->

</form>

<c:import url="../../layout/footer.jsp" />











