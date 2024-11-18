<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/header.jsp" />
<script type="text/javascript">
$(function() {

	$("#btnManagerMenu").click(function () {
		location.href="/manager/menu";
	})
	
	$("#btnBack").click(function () {
	 	   history.back();
	});
	
	$('#eventInfo').summernote({ //섬머노트 설정
        height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
      });
	$('#evantBanner').summernote({ //섬머노트 설정
        height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
      });
	
})


</script>


<h1>이벤트 글작성</h1>

<div>
<button id="btnManagerMenu">관리자메뉴로가기</button>
<button id="btnBack">뒤로가기</button>
</div>

<div class="container">	
<form id="form" action="./write" method="post" enctype="multipart/form-data">
	<table class="table table-info">
		<tr>
			<td class="mx-3">
			이벤트 이름
			<input type="text" name="eventName">
			</td>
		</tr>
		<tr>
			<td>
			
			<div>이벤트 배너</div>
			<textarea id="evantBanner" name="eventBanner" class="eveImg"
			rows="4" cols="2"></textarea>
			<span class="mx-5"></span>
			<span class="mx-3">이벤트 날짜 설정</span>
			시작
			<input type="date" id="eveStart" name="eveStart">
			종료
			<input type="datetime-local" id="eveEnd" name="eveEnd">
			</td>
		</tr>
		<tr>
			<td>이벤트이미지[이미지삽입]
			<textarea id="eventInfo" name="eveImg" class="eveImg"
			rows="4" cols="2"></textarea>
			</td>
		</tr>
	</table>
	<div id="btnWrite">
	<button class="btn btn-primary">완료</button>
	</div>
</form>
</div>





<c:import url="../../layout/footer.jsp" />
