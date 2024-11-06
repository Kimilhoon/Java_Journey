<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote();
	});
	
$(function() {
	
	$("#write").click(function() {
		console.log($("#t").val());
		console.log($("input:radio[name=freeBoardCategory]:checked").val());
		console.log($("#summernote").val());
		$.ajax({
			url: "./write",
			type: "post",
			data: {
				"freeBoardTitle":$("#t").val(),
				"freeBoardCategory" :$("input:radio[name=freeBoardCategory]:checked").val(),
				"freeBoardContent":$("#summernote").val()
			},
			dataType: "text",
			success: function() {
				location.href = "./list";
			},
			error: function() {
				
			}
			
		});
	})
	
	
})
</script>
<body>
<a href="./list"><button>목록</button></a>

<!-- <form action="./write" method="post" accept-charset="utf-8"> -->

<label>제목<input type="text" name="freeBoardTitle" id="t"></label>
<label>카테고리<input type="radio" name="freeBoardCategory" value="bean">원두<input type="radio" name="freeBoardCategory" value="cafe">카페</label>
<label>내용<textarea id="summernote" rows="15" cols="50" name="freeBoardContent" required="required" class="form-control" ></textarea></label>
<button id="write">작성</button>
<!-- </form> -->

</body>
</html>