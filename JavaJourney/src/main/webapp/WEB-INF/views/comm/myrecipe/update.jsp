<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<script type="text/javascript">
$(function() {
	$("#summernote").summernote({
		 height: 300,
		 required:true

	});
	
	$("#deleteFile").click(()=>{
	   	$("#file").css("display","none");
	   	$("#newFile").css("display","");
     
	});
	$("#noDeleteFile").click(()=>{
	   	$("#file").css("display","");
	   	$("#newFile").css("display","none");
     
	});
	
	$("#updateForm").submit(function() {
		
		if($('#summernote').val().length <= 0){
			alert("본문 내용을 입력하세요.");
			return false;
		}
		
		if($('#myRipTitle').val().length <= 0){
			alert("제목을 입력하세요.");
			return false;
		}
	})
})
$(document).ready(function() {
    let isSubmitting = false;  // 플래그 변수 추가

    // Summernote가 비어있는지 확인하는 함수
    function hasContent() {
        return !$('#summernote').summernote('isEmpty');
    }

    // 페이지를 벗어날 때 경고창 표시
    function beforeUnloadHandler(e) {
        if (hasContent() && !isSubmitting) {  // 플래그를 확인하여 submit 상태에서는 경고창 표시하지 않음
            e.preventDefault();
            e.returnValue = ''; // 브라우저에 따라 메시지를 표시하기 위한 설정
        }
    }

    // beforeunload 이벤트 등록
    window.addEventListener('beforeunload', beforeUnloadHandler);

    // submit 버튼 클릭 시 플래그 설정 및 beforeunload 이벤트 무시
    $('#write').on('click', function() {
        isSubmitting = true;  // submit 이벤트가 발생했음을 표시
    });
});
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


<form id="updateForm" action="./update?myRipNo=${myRecipeView.myRipNo }" method="post" enctype="multipart/form-data" >




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

<div style="text-align: right;	">
	<a href="./view?myRipNo=${myRecipeView.myRipNo }"><button class="btn " type="button" >취소</button></a>
	<button class="btn " id="write">수정</button>
</div>

</form>

</div>
</div><!-- content -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>