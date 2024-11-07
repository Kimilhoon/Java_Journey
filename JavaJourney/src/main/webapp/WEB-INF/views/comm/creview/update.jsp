<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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








<c:import url="../../layout/footer.jsp" />









