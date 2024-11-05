<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>

</head>
<body>
<a href="./view?freeBoardNo=${freeBoardView.freeBoardNo }"><button>취소</button></a>
<div>
<form action="./write" method="post">

<label>제목<input type="text" value="${freeBoardView.freeBoardTitle }"></label>
<label>내용<textarea id="summernote" rows="15" cols="50" name="content" required="required" class="form-control" >${freeBoardView.freeBoardContent }</textarea></label>
<button>수정</button>
</form>
</div>
</body>
</html>