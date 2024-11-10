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

</script>


<a href="./list"><button>목록</button></a>

<form action="./write" method="post">

<div id="write-area">
<table>

<tr>
<td>
<input type="text" name="cafeNo" value="${cafeNo.cafeNo }" hidden="none">
</td>
</tr>

<tr>
<td>
<label class="bordered"> <small>카페명</small> | ${cafeName } </label>
</td>

<td>
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
<td colspan="3">
<label>
<textarea id="summernote" name="revContent" rows="30" cols="50" name="content" required="required" class="form-control"></textarea>
</label>
</td>
</tr>
<br>

</table>

<button class="btn btn-primary">작성</button>
</div>

</form>










<c:import url="../../layout/footer.jsp" />











