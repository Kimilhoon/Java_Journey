<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="../layout/header.jsp"/>

<h1 class="text-center">구독원두 작성</h1>
<script>
$(function () {
	
	$("#btnManagerMenu").click(function () {
		location.href="/manager/menu";
	})
	
	$("#btnBack").click(function () {
 	   history.back();
	});
	
    $('#beanInfo').summernote({ //섬머노트 설정
        height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
      });
    $('#beanOriginName').summernote({ 
    	width: 400, height: 200
    	, toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
      });
   
    $("#btnBeanImg").click(function() {
        window.open("/create/selectimage", "popupWindow"
        		, "width=900,height=600");
	})
    
})
</script>

<div class="container">

<div>
<button id="btnManagerMenu">관리자메뉴로가기</button>
<button id="btnBack">뒤로가기</button>
</div>
	
<form id="form" action="./bean" method="post" enctype="multipart/form-data">
	<table class="table table-info">
		<tr>
			<td>
			원두이름
			</td>
			<td>
			<input type="text" id="beanName" name="beanName" value="Test1">
			원두금액
			<input type="text" id="beanPrice" name="beanPrice" value="1">
			원두원산지
			<input type="text" id="origin" name="origin" value="Test1">
			사업자번호
			<input type="text" id="businessNo" name="businessNo" value="1">
			</td> 
		</tr>
		<tr>
		</tr>
		<!-- 원두이미지삽입 -->
		<tr>
			<td>원두[이미지삽입]</td>
			<td>
			<textarea id="beanOriginName" name="beanOriginName" class="form-control"
			rows="4" cols="4"></textarea>
			원두맛
			<input type="text" id="cupNoteName" name="cupNoteName" value="">
			</td>
		</tr>
		<!-- 원두이미지삽입 -->
		<tr>
		<td>원두설명</td>
		<td><textarea id="beanComm" name="beanComm" rows="3" style="width: 1000px;"></textarea></td>
		</tr>
		<tr>
			<td>원두상세설명[이미지삽입]</td>
			<td>
			<textarea id="beanInfo" name="beanInfo" class="form-control"
			rows="4" cols="2"></textarea>
			</td>
		</tr>
	</table>
	<div id="btnWrite">
	<button class="btn btn-primary">완료</button>
	</div>
</form>
</div>

<!-- footer -->
<c:import url="../layout/footer.jsp"/>