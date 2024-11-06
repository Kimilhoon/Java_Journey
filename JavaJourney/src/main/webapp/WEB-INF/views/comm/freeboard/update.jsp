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
	
	$("#update").click(function() {
		$.ajax({
			url: "./update",
			type: "post",
			data: {
				"freeBoardTitle":$("#t").val(),
				"freeBoardContent":$("#summernote").val(),
				"freeBoardNo":${freeBoardView.freeBoardNo }
			},
			dataType: "text",
			success: function() {
				location.href = "./view?freeBoardNo="+${freeBoardView.freeBoardNo };
			},
			error: function() {
				
			}
			
		});
	})
	
	
})	
	
</script>

</head>
<body>
<a href="./view?freeBoardNo=${freeBoardView.freeBoardNo }"><button>취소</button></a>
<div>
<label>제목<input type="text" value="${freeBoardView.freeBoardTitle }" name="freeBoardTitle" id="t"></label>
<label>내용<textarea id="summernote" rows="15" cols="50" name="freeBoardContent" required="required" class="form-control" >${freeBoardView.freeBoardContent }</textarea></label>
<button id="update">수정</button>
</div>
</body>
</html>