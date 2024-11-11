<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<script type="text/javascript">
$(function() {
	$("#summernote").summernote({
		 height: 300

	});
	
	$("#deleteFile").click(()=>{
	   	$("#file").css("display","none");
	   	$("#newFile").css("display","");
     
	});
	$("#noDeleteFile").click(()=>{
	   	$("#file").css("display","");
	   	$("#newFile").css("display","none");
     
	});
	
})
</script>
<h1>업데이트</h1>
<div class="container">
<h1 style="color: #ccc">수정</h1>
<a href="./list"><button class="btn btn-secondary">목록</button></a>

<form action="./write" method="post" enctype="multipart/form-data" >

<div id="select_quiz" >
	<label>원두이름:${myRecipeView.beanName }</label><br>
	<label>추출법:${myRecipeView.extractionName }</label><br>
	<label>분쇄도:${myRecipeView.grindName }</label><br>
	<label>맛:${myRecipeView.cupNoteName }</label><br>
	
</div>


<table>
<tr>
	<td>
		<label class="form-label">제목</label>
	</td>
	<td>
		<input type="text" name="myRipTitle" required="required" class="form-control" id="myRipTitle" value="${myRecipeView.myRipTitle}">
	</td>
</tr>

<tr>
	<td>
		<label class="form-label">내용</label>
	</td>
	<td>
	<textarea id="summernote" rows="15" cols="50" name="myRipContent" required="required" class="form-control">${myRecipeView.myRipContent}</textarea>
	</td>
</tr>

<tr>
	<td>
		<label></label>
	</td>
	<td>
		<c:choose>
		<c:when test="${fn:length(myRecipeView.myRipFileStoredName)>0}">
		<div id="file">
		파일 : 
			<a href="./download?boardNo=${myRecipeView.myRipNo }">${myRecipeView.myRipFileOriginName}</a>
			<button id="deleteFile" type="button">수정</button>
		</div> 
		<div id="newFile" style="display: none;">
		
			<input type="file" name="file" class="form-control">
			<button id="noDeleteFile" type="button">취소</button>
		</div>

		</c:when>
		<c:otherwise>
			<input type="file" name="file" class="form-control">
		</c:otherwise>
		</c:choose>
	
	
	
	</td>
</tr>
</table>
<button class="btn btn-secondary" id="write">수정</button>

</form>




</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>