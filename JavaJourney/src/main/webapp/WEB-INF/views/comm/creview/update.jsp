<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<!-- <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.9.0/lang/summernote-ko-KR.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<c:import url="/WEB-INF/views/layout/header.jsp"/>


<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote();
	});
	
$.ajax({
    url: '/save',
    type: 'POST',
    contentType: 'application/json; charset=UTF-8',
    data: JSON.stringify({ content: $('#summernote').val() })
});

$("select[name=revsp] option[value=${cafeRev.revsp}]").prop("selected", true);

</script>

</head>
<body>

<a href="./list"><button>목록</button></a>

<form action="./update" method="post">

<input type="text" name="revNo" value="${cafeRev.revNo }" hidden="none">

<div id="write-area">
<label>제목 ${cafeRev.cafeName}<input type="text" readonly="readonly"></label><br>
<label>
<textarea id="summernote" name="revContent" rows="30" cols="50" name="content" required="required" class="form-control">
${cafeRev.revContent }
</textarea>
</label><br>
<label>별점
<select name="revsp">
	<option value="5">★★★★★</option>
	<option value="4">★★★★☆</option>
	<option value="3">★★★☆☆</option>
	<option value="2">★★☆☆☆</option>
	<option value="1">★☆☆☆☆</option>
</select>
</label>
<button class="btn btn-primary">작성</button>
</div>

</form>
</body>
</html>











