<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<!-- 내용 -->
<script type="text/javascript">
$(function() {
	$("#summernote").summernote({
		 height: 300,
		 placeholder:"내용을 입력하세요."
	});


	
	$("#select_result").change(function() {
		
		$(".cupNote").prop("checked",false);

		var c0 = $.trim( $("#select_result option:selected").text().split(",")[0] );
		var c1 = $.trim( $("#select_result option:selected").text().split(",")[1] );
		var c2 = $.trim( $("#select_result option:selected").text().split(",")[2] );
		var c3 = $.trim( $("#select_result option:selected").text().split(",")[3] );
		var c4 = $.trim( $("#select_result option:selected").text().split(",")[4] );
		var c5 = $.trim( $("#select_result option:selected").text().split(",")[5] );
		
		$("#"+c0).prop("selected",true);
		$("#"+c1).prop("selected",true);
		$("#"+c2).prop("selected",true);
		$("#"+c3).prop("checked",true);
		$("#"+c4).prop("checked",true);
		$("#"+c5).prop("checked",true);
		
		$("input:checkbox[name='cupNoteNo']").prev().css("background","");
		$("input:checkbox[name='cupNoteNo']").prev().css("color","black");
		$("input:checkbox[name='cupNoteNo']:checked").prev().css("background","#6f4e37");
		$("input:checkbox[name='cupNoteNo']:checked").prev().css("color","white");
	});
	
	$(".cupNote").click(function() {
		if($("input:checkbox[name='cupNoteNo']:checked").length>2){
			alert("2개까지 선택할 수 있습니다");
			$(this).prop("checked",false);
		}
		
		$("input:checkbox[name='cupNoteNo']").prev().css("background","");
		$("input:checkbox[name='cupNoteNo']").prev().css("color","black");
		$("input:checkbox[name='cupNoteNo']:checked").prev().css("background","#6f4e37");
		$("input:checkbox[name='cupNoteNo']:checked").prev().css("color","white");
		
		
	})
	
	$("#write").click(function() {
		
		if($('#beanNameSel').val() == 'N'){
			alert("원두를 선택하세요.");
			return false;
		}
		if($('#grindNameSel').val() == 'N'){
			alert("분쇄도를 선택하세요.");
			return false;
		}
		if($('#extractionNameSel').val() == 'N'){
			alert("추출방식을 선택하세요.");
			return false;
		}
		if($('#summernote').val().length <= 0){
			alert("본문 내용을 입력하세요.");
			return false;
		}
		if($(".cupNote:checked").length <= 1){
			alert("맛을 2개 선택하세요.");
			return false;
		}
		
		if($('#myRipTitle').val().length <= 0){
			alert("제목을 입력하세요.");
			return false;
		}
		
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
		if($("#file")[0].files[0] != null){
			
		formData.append("file", $("#file")[0].files[0]); // 파일 객체로 추가
		}
		formData.append("beanNo", $("#beanNameSel").val());
		formData.append("extractionName", $("#extractionNameSel").val());
		formData.append("grindName", $("#grindNameSel").val());
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
	
	$("#beanNameSel").change(function() {
		//체크항목 초기화
		
		
		
		$(".cupNote").prop("checked",false);
		
		$.ajax({
			url: "./getcupnote?beanNo="+$(this).val(),
			type: "get",
			dataType:"json",
			success: function(res) {
				$("#"+res.cupList[0].cupNoteName).prop("checked",true);
				$("#"+res.cupList[1].cupNoteName).prop("checked",true);
				$("#"+res.cupList[2].cupNoteName).prop("checked",true);
				$("input:checkbox[name='cupNoteNo']").prev().css("background","");
				$("input:checkbox[name='cupNoteNo']").prev().css("color","black");
				$("input:checkbox[name='cupNoteNo']:checked").prev().css("background","#6f4e37");
				$("input:checkbox[name='cupNoteNo']:checked").prev().css("color","white");
				
			},
			error: function() {
				
			}
			
		});
		
	});
	
	$("#btn_select_quiz").click(function() {
		
		$("#select_result").css("display","");
		$("#select_quiz").css("display","none");
		
		
	});
	$("#btn_select_self").click(function() {
		
		$("#select_result").css("display","none");
		$("#select_quiz").css("display","");
		
		
	})
	
})/* j */

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
input:focus, select:focus {
    outline: none;  /* 기본 파란색 테두리 제거 */
    box-shadow: 0 0 5px #6f4e37;  /* 원하는 색상으로 그림자 설정 */
    border-color: #6f4e37;  /* 테두리 색상 변경 (선택 사항) */
}


#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.container{
	display: inline-block;
	width: -webkit-fill-available;
	margin: 0 auto;
}
table{
	width: -webkit-fill-available;
	margin: 0 auto;
}
.btn{
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}
.btn:hover{
	background: #6f4e37;
	color: white;
}
.container *{
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>
<div id="content">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./list">myrecipe</a></li>
		<li class="breadcrumb-item active" aria-current="page">write</li>
	</ol>
</nav>
<div class="container">


<button class="btn " type="button" id="btn_select_quiz"><small>취향조사결과 불러오기</small></button>
<button class="btn " type="button" id="btn_select_self"><small>직접 선택하기</small></button>


<select id="select_result"  class="form-select" style="display: none;">
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
	<select id="beanNameSel" name="beanNo"  class="form-select" style="width: 30%; display: inline-block;">
	
		<option value="N" id="bn">- 원두 선택 -</option>
	
	<c:forEach var="bList" items="${bList }">
		<option value="${bList.beanNo }" id="${bList.beanName }">${bList.beanName }</option>
	</c:forEach>
	</select>
	
	<select id="extractionNameSel" name="extractionName"  class="form-select" style="width: 30%;display: inline-block;">
		<option value="N" id="en">- 추출방식 선택 -</option>
	<c:forEach var="eList" items="${eList }">
		<option value="${eList.extractionName }" id="${eList.extractionName }">${eList.extractionName }</option>
	
	</c:forEach>
	</select>
	<select id="grindNameSel" name="grindName"  class="form-select" style="width: 30%;display: inline-block;">
	<option value="N" id="gn">- 분쇄도 선택 -</option>
	<c:forEach var="gList" items="${gList }">
		<option value="${gList.grindName }" id="${gList.grindName }">${gList.grindName }</option>
	
	</c:forEach>
	</select>

<!-- 	<label>원두이름:<input type="text" name="beanName" id="beanName" readonly="readonly"></label> -->
<!-- 	<label>추출법:<input type="text" name="extractionName" id="extractionName" readonly="readonly"></label> -->
<!-- 	<label>분쇄도:<input type="text" name="grindName" id="grindName" readonly="readonly"></label> -->
	<br>
	
	
	<c:forEach items="${cList }" var="cList" varStatus="idx">
		<label class="btn " for="${cList.cupNoteName }">${cList.cupNoteName }</label>
		<input type="checkbox" name="cupNoteNo" value="${cList.cupNoteName }" id="${cList.cupNoteName }"class="cupNote" style="display: none;">

	</c:forEach>
</div>


<table>
<tr>
	
	<td>
		<input type="text" name="myRipTitle" required="required" class="form-control" id="myRipTitle" placeholder="제목을 입력하세요.">
	</td>
</tr>

<tr>
	
	<td>
	<textarea id="summernote" rows="15" cols="50" name="myRipContent" required="required" class="form-control" placeholder="내용을 입력하세요"></textarea>
	</td>
</tr>

<tr>
	
	<td>
		<input type="file" name="file" class="form-control" id="file">
	</td>
</tr>
</table>

<div style="float: right;">
<a href="./list"><button class="btn " type="button"><small>목록</small></button></a>
<button class="btn " id="write" type="button"><small>글쓰기</small></button>
</div>

</form>




</div>
</div><!-- content -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>