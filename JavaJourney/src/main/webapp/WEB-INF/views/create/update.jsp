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
        height: 400  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
      });
    
    $("#btnBeanImg").click(function() {
        window.open("/create/selectimage", "popupWindow"
        		, "width=900,height=600");
	});
    
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
			<td>원두이름</td>
			<td><input type="text" id="beanName" name="beanName" value=""></td>
		</tr>
		<tr>
			<td>원두원산지</td>
			<td><input type="text" id="origin" name="origin" value=""></td>
		</tr>
		<tr>
			<td>원두이미지[TEST]</td>
			<td><button id="btnBeanImg" type="button">[TEST 버튼]</button></td>
		</tr>
		<tr> 
			<td><input type="text" id="beanImgNo" name="beanImgNo" readonly="readonly"></td>
		</tr>
		<tr>
			<td>원두금액</td>
			<td><input type="text" id="beanPrice" name="beanPrice" value=""></td>
		</tr>
		<tr>
			<td>사업자번호</td>
			<td><input type="text" id="businessNo" name="businessNo" value=""></td>
		</tr>
		<tr>
		<td>원두설명</td>
		<td><textarea id="beanComm" name="beanComm" rows="3" style="width: 1000px;"></textarea></td>
		</tr>
		<tr>
			<td>원두상세설명</td>
			<td>
			<textarea id="beanInfo" name="beanInfo" class="form-control"
			rows="4" cols="2"></textarea>
			</td>
		</tr>
	</table>
	
<div id="btnUpdate">
	<button class="btn btn-primary">수정</button>
</div>
</form>
</div>

<!-- footer -->
<c:import url="../layout/footer.jsp"/>