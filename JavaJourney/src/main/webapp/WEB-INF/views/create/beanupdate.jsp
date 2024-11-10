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
    
	$("#form").submit(function(e) {
	    e.preventDefault();  // 폼이 실제로 전송되는 것을 방지하고
	    const checkedValues = $('input[name="cupNoteName"]:checked')
	        .map(function() {
	            return this.value;
	        }).get();  // jQuery를 사용하여 선택된 체크박스 값들을 배열로 수집

	    console.log("선택된 값:", checkedValues); // 선택된 체크박스 값 출력
	    // 실제 전송
	    this.submit();
	});
	
})
</script>

<div class="container">

<div>
<button id="btnManagerMenu">관리자메뉴로가기</button>
<button id="btnBack">뒤로가기</button>
</div>
	
<form id="form" action="./beanupdate?beanNo=${ListNo[0].beanNo}&beanImgNo=${ListNo[0].beanImgNo}" method="post" enctype="multipart/form-data">
	<table class="table table-info">
		<tr>
			<td>
			원두이름
			</td>
			<td>
			<input type="text" id="beanName" name="beanName">
			원두금액
			<input type="text" id="beanPrice" name="beanPrice">
			원두원산지
			<input type="text" id="origin" name="origin">
			사업자번호
			<input type="text" id="businessNo" name="businessNo">
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
			</td>
		</tr>
		<tr>	
			<td>
			원두맛[체크박스]
			</td>
			<td>
			<span>새콤</span>
			<input type="checkbox" id="cupNoteName1" name="cupNoteName" value="1">
			<span>달콤</span>
			<input type="checkbox" id="cupNoteName2" name="cupNoteName" value="2">
			<span>쌉쌀</span>
			<input type="checkbox" id="cupNoteName3" name="cupNoteName" value="3">
			<span>고소</span>
			<input type="checkbox" id="cupNoteName4" name="cupNoteName" value="4">
			<span>은은한</span>
			<input type="checkbox" id="cupNoteName5" name="cupNoteName" value="5">
			<span>향긋한</span>
			<input type="checkbox" id="cupNoteName6" name="cupNoteName" value="6">
			<span>진한</span>
			<input type="checkbox" id="cupNoteName7" name="cupNoteName" value="7">
			<span>부드러운</span>
			<input type="checkbox" id="cupNoteName8" name="cupNoteName" value="8">
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
	<div id="btnUpdate">
	<button class="btn btn-primary">수정</button>
	</div>
</form>
</div>

<!-- footer -->
<c:import url="../layout/footer.jsp"/>