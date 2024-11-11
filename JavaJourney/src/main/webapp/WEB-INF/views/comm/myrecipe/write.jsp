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


	
	$("#select_result").change(function() {
		console.log($("option:selected").text());
		
		$(".cupNote").prop("checked",false);
		$("#beanName").val("");
		$("#extractionName").val("");
		$("#grindName").val("");
		
		
		$("#beanName").val($.trim( $("option:selected").text().split(",")[0]));
		$("#extractionName").val($.trim( $("option:selected").text().split(",")[1]));
		$("#grindName").val($.trim( $("option:selected").text().split(",")[2]));
		
		var c1 = $.trim( $("option:selected").text().split(",")[3] );
		var c2 = $.trim( $("option:selected").text().split(",")[4] );
		var c3 = $.trim( $("option:selected").text().split(",")[5] );
		
		$("#"+c1).prop("checked",true);
		$("#"+c2).prop("checked",true);
		$("#"+c3).prop("checked",true);
	});
	
	$(".cupNote").click(function() {
		if($("input:checkbox[name='cupNoteNo']:checked").length>3){
			alert("3개까지 선택할 수 있습니다");
			$(this).prop("checked",false);
		}
	})
	
	$("#write").click(function() {
		
		 const selectedValues = $(".cupNote:checked")
         .map(function() {
             return $(this).val();
         })
         .get()
         
          const result = selectedValues.join(", ");
        console.log(result);
		
		
// 		console.log($(".cupNote:checked").val());
		
		
		// FormData 객체 생성
		const formData = new FormData();
		
		// 각 입력 값들을 formData에 추가
		formData.append("myRipTitle", $("#myRipTitle").val());
		formData.append("myRipContent", $("#summernote").val());
		formData.append("file", $("#file")[0].files[0]); // 파일 객체로 추가
		formData.append("beanName", $("#beanName").val());
		formData.append("extractionName", $("#extractionName").val());
		formData.append("grindName", $("#grindName").val());
		formData.append("cupNoteName", result); // result는 선택한 값들

// 			data: {
// 				"myRipTitle":$("#myRipTitle").val(),
// 				"myRipContent":$("#summernote").val(),
// 				"file":$("#file").val(),
// 				"beanName":$("#beanName").val(),
// 				"extractionName":$("#extractionName").val(),
// 				"grindName":$("#grindName").val(),
// 				"cupNoteName":result
				
// 			},
		
		$.ajax({
			url: "./write",
			type: "post",
			enctype:'multipart/form-data',
			contentType : false,
			processData : false,
			data: formData,	
			success: function() {
				location.href = "./list";
			},
			error: function() {
				
			}
			
		});
	})
	
	
})


</script>

<div class="container">
<h1 style="color: #ccc">글쓰기</h1>
<a href="./list"><button class="btn btn-secondary">목록</button></a>
<button class="btn btn-secondary" type="button" id="btn_select_quiz">취향조사결과 불러오기</button>


<select id="select_result">
	<c:forEach items="${qList }" var="list">
	<option class="op">
	<c:forEach items="${list }" var="qrList" varStatus="status">
	<c:if test="${status.first}">
	${qrList.beanName },${qrList.extractionName },${qrList.grindName }
	</c:if>
	,${qrList.cupNoteName }
	</c:forEach>
	</option>
	</c:forEach>
</select>


<form action="./write" method="post" enctype="multipart/form-data" >

<div id="select_quiz" >
	<label>원두이름:<input type="text" name="beanName" id="beanName" readonly="readonly"></label>
	<label>추출법:<input type="text" name="extractionName" id="extractionName" readonly="readonly"></label>
	<label>분쇄도:<input type="text" name="grindName" id="grindName" readonly="readonly"></label>
	
	<c:forEach items="${cList }" var="cList">
		<label>${cList.cupNoteName }<input type="checkbox" name="cupNoteNo" value="${cList.cupNoteName }" id="${cList.cupNoteName }"class="cupNote"></label>
	</c:forEach>
</div>


<table>
<tr>
	<td>
		<label class="form-label">제목</label>
	</td>
	<td>
		<input type="text" name="myRipTitle" required="required" class="form-control" id="myRipTitle">
	</td>
</tr>

<tr>
	<td>
		<label class="form-label">내용</label>
	</td>
	<td>
	<textarea id="summernote" rows="15" cols="50" name="myRipContent" required="required" class="form-control" ></textarea>
	</td>
</tr>

<tr>
	<td>
		<label></label>
	</td>
	<td>
		<input type="file" name="file" class="form-control" id="file">
	</td>
</tr>
</table>
<button class="btn btn-secondary" id="write" type="button">글쓰기</button>

</form>




</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>