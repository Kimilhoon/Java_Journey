<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<script type="text/javascript">
$(function() {
	$("#summernote").summernote({
		 height: 300

	});
})
</script>

<div class="container">
<h1 style="color: #ccc">글쓰기</h1>
<a href="./list"><button class="btn btn-secondary">목록</button></a>

<!-- + View : /src/main/webapp/WEB-INF/views/board/write.jsp -->
<!--   - 글쓰기 페이지 -->
<!-- 	입력 데이터 Form -->

<!-- 	BOARDNO - 자동생성, 입력X -->
<!-- 	TITLE - 입력 O -->
<!-- 	USERID - 세션에서 가져옴, 입력X -->
<!-- 	CONTENT - 입력 O -->
<!-- 	HIT - 입력X, 이후 자동으로 0으로 입력될 것 -->
<!-- 	WRITE_DATE - 입력X, 자동으로 default값으로 입력될 것 -->

<!--   - 글쓰기(or 작성 or 업로드) 버튼 - #btnWrite -->

<form action="./write" method="post" enctype="multipart/form-data" >

<table>
<!-- **************************************** -->
<!-- 서블릿에서 세션으로 데이터 얻어서 해야댐 -->
<!-- **************************************** -->


<tr>
	<td>
		<label class="form-label">제목</label>
	</td>
	<td>
		<input type="text" name="myRipTitle" required="required" class="form-control">
	</td>
</tr>

<tr>
	<td>
		<label class="form-label">내용</label>
	</td>
	<td>
	<textarea id="summernote" rows="15" cols="50" name="myRipContent" required="required" class="form-control"></textarea>
	</td>
</tr>

<tr>
	<td>
		<label></label>
	</td>
	<td>
		<input type="file" name="file" class="form-control">
	</td>
</tr>
</table>
<button class="btn btn-secondary" id="write">글쓰기</button>

</form>




</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>