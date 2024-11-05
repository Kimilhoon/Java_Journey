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
<body>
<a href="./list"><button>목록</button></a>

<form action="./write" method="post" enctype="multipart/form-data">

<label>제목<input type="text" name="freeBoardTitle"></label>
<label>카테고리<input type="radio" name="freeBoardCategory" value="bean">원두<input type="radio" name="freeBoardCategory" value="cafe">카페</label>
<label>내용<textarea id="summernote" rows="15" cols="50" name="freeBoardContent" required="required" class="form-control"></textarea></label>
<button>작성</button>
</form>

</body>
</html>