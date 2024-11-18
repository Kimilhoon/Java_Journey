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
#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
<div id="content">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./list">myrecipe</a></li>
		<li class="breadcrumb-item"><a href="./list">list</a></li>
		<li class="breadcrumb-item"><a href="./view?myRipNo=${myRecipeView.myRipNo }">view</a></li>
		<li class="breadcrumb-item active" aria-current="page">update</li>
	</ol>
</nav>
<div class="container">


<form action="./update?myRipNo=${myRecipeView.myRipNo }" method="post" enctype="multipart/form-data" >




<table  class="table table-bordered">
<tr>
	<td>원두이름</td>
	<td>${myRecipeView.beanName }<input type="text" name="beanNo" value="${myRecipeView.beanNo }" style="display: none;"></td>
	<td>추출법</td>
	<td>${myRecipeView.extractionName }<input type="text" name="extractionName" value="${myRecipeView.extractionName }" style="display: none;"></td>
	<td>분쇄도</td>
	<td>${myRecipeView.grindName }<input type="text" name="grindName" value="${myRecipeView.grindName }" style="display: none;"></td>
	<td>맛</td>
	<td>${myRecipeView.cupNoteName }<input type="text" name="cupNoteName" value="${myRecipeView.cupNoteName }" style="display: none;"></td>
</tr>
<tr>
	<td colspan="8">
		<input type="text" name="myRipTitle" required="required" class="form-control" id="myRipTitle" value="${myRecipeView.myRipTitle}">
	</td>
</tr>

<tr>
	<td colspan="8">
	<textarea id="summernote" rows="15" cols="50" name="myRipContent" required="required" class="form-control">${myRecipeView.myRipContent}</textarea>
	</td>
</tr>

<tr>
	
	<td colspan="8">
		<c:choose>
		<c:when test="${fn:length(myRecipeView.myRipFileStoredName)>0}">
		<div id="file">
		파일 : 
			<a href="./download?myRipNo=${myRecipeView.myRipNo }">${myRecipeView.myRipFileOriginName}</a>
			<button id="deleteFile" type="button" class="btn">수정</button>
		</div> 
		<div id="newFile" style="display: none;">
		
			<input type="file" name="file" class="form-control">
			<button id="noDeleteFile" type="button"class="btn">취소</button>
		</div>

		</c:when>
		<c:otherwise>
			<input type="file" name="file" class="form-control">
		</c:otherwise>
		</c:choose>
	
	
	
	</td>
</tr>
</table>

<div style="float: right;">
<a href="./list"><button class="btn " type="button">목록</button></a>
<button class="btn " id="write">수정</button>
</div>

</form>

</div>
</div><!-- content -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>