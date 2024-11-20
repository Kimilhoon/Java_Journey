<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	$("#beanName").on("input", function() {
		$(this).val($(this).val().replace(/[0-9!@#$%^&*()]/g, ''));
	})

	$("#origin").on("input", function() {
		$(this).val($(this).val().replace(/[0-9!@#$%^&*()]/g, ''));
	})

	$("#beanPrice").on("input", function() {
		$(this).val($(this).val().replace(/[A-Za-z가-힣!@#$%^&*()]/g, ''));
	})

	$("#businessNo").on("input", function() {
		$(this).val($(this).val().replace(/[^0-9-]/g, ''));
	})
    
    $("input[type='checkbox'][name='cupNoteName']").on("click", function() {
        // 체크된 체크박스의 개수를 확인
        let checkedCount = $("input[type='checkbox'][name='cupNoteName']:checked").length;

        if (checkedCount > 2) {
            // 2개 초과일 경우 체크를 해제하고 경고 메시지 표시
            $(this).prop("checked", false);
            alert("최대 2개까지만 선택할 수 있습니다.");
        }
    });
    
    $("#form").submit(function(e) {
	    e.preventDefault();  // 폼이 실제로 전송되는 것을 방지하고
        let checkedCount = $("input[type='checkbox'][name='cupNoteName']:checked").length;
	    const checkedValues = $('input[name="cupNoteName"]:checked')
	        .map(function() {
	            return this.value;
	        }).get();  // jQuery를 사용하여 선택된 체크박스 값들을 배열로 수집

	    console.log("선택된 값:", checkedValues); // 선택된 체크박스 값 출력
	    if( checkedCount == 1 ) {
	    	alert("원두맛은 2개를 선택해야 합니다.");
	    	return false;
	    }
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
	
<form id="form" action="./bean" method="post" enctype="multipart/form-data">
	<table class="table table-info">
		<tr>
			<td class="mx-3">
			원두이름
			<input type="text" maxlength="50" id="beanName" name="beanName">
			</td>
			<td class="mx-3">
			원두원산지
			<input class="mx-3" type="text" maxlength="30" id="origin" name="origin">
			원두금액
			<input class="mx-3" type="number" min="1" max="100000" id="beanPrice" name="beanPrice">
			사업자번호
			<input class="mx-3" type="text" id="businessNo" name="businessNo">
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
	<div id="btnWrite">
	<button class="btn btn-primary">완료</button>
	</div>
</form>
</div>

<!-- footer -->
<c:import url="../layout/footer.jsp"/>