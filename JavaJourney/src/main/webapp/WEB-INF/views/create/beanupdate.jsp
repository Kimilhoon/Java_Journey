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
   
    $('#beanOriginName').summernote({ 
    	height: 200
    	, toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ],
    	callbacks: {
        	onImageUpload: function(files) {
            	// 기존 이미지 제거
            	$('#beanOriginName').summernote('code', '');

	            // 새 이미지 업로드 및 삽입
    	        const reader = new FileReader();
        	    reader.onload = function(e) {
            	    const imageBase64 = e.target.result;
                	$('#beanOriginName').summernote('insertImage', imageBase64); // 새 이미지 삽입
	            };
    	        reader.readAsDataURL(files[0]); // 첫 번째 파일만 처리
        	}
    	}
    	
    });
    
    $('#beanOriginName').next('.note-editor').find('.note-editable').attr('contenteditable', false);

    $('#beanInfo').summernote({ //섬머노트 설정
        height: 500  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ],
    	callbacks: {
        	onImageUpload: function(files) {
            	// 기존 이미지 제거
            	$('#beanInfo').summernote('code', '');

	            // 새 이미지 업로드 및 삽입
    	        const reader = new FileReader();
        	    reader.onload = function(e) {
            	    const imageBase64 = e.target.result;
                	$('#beanInfo').summernote('insertImage', imageBase64); // 새 이미지 삽입
	            };
    	        reader.readAsDataURL(files[0]); // 첫 번째 파일만 처리
        	}
    	}
    
    });

    $('#beanInfo').next('.note-editor').find('.note-editable').attr('contenteditable', false);
    
    $("#btnBeanImg").click(function() {
        window.open("/create/selectimage", "popupWindow"
        		, "width=900,height=600");
	})
	
// 	$("#beanName").on("input", function() {
// 		$(this).val($(this).val().replace(/[0-9!@#$%^&*()]/g, ''));
// 	})

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
<style type="text/css">
table {
    margin: 20px auto; /* 페이지 중앙 정렬 */
    border-collapse: collapse; /* 테두리 겹침 제거 */
    width: 100%; /* 너비 조정 */
    max-width: 1500px; /* 최대 너비 설정 */
    background-color: #f9f9f9; /* 테이블 배경색 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    border-radius: 8px; /* 테이블 모서리를 둥글게 */
    overflow: hidden; /* 둥근 테두리 안에 내용 제한 */
    
}
table tr {
/*         border-bottom: 1px solid rgba(0, 0, 0, 0.1); /* 희미한 줄 */ */
}
table td {
        padding-bottom: 10px;
}
input[type="text"],
textarea {
	width: 100%; /* 입력 필드의 너비를 셀에 맞게 조정 */
    padding: 10px; /* 내부 여백 */
    font-size: 14px; /* 폰트 크기 */
    border: 1px solid #ccc; /* 테두리 */
    border-radius: 4px; /* 모서리를 둥글게 */
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
}
#btnUpdate {
    width: 100%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}
</style>
<div class="container">

<div>
<!-- <button id="btnManagerMenu">관리자메뉴로가기</button> -->
<!-- <button id="btnBack">뒤로가기</button> -->
</div>
<%-- ${ListNo[0].cupNoteNo}	 --%>
<%-- ${ListNo[1].cupNoteNo}	 --%>
<%-- ${ListNo.cupNoteNo}	 --%>
<%-- ${cupNote } --%>
<%-- ${cupNote[0] } --%>
<%-- ${cupNote.contains('1') } --%>
<%-- ${cupNote.contains(1) } --%>
<form id="form" action="./beanupdate?beanNo=${ListNo[0].beanNo}&beanImgNo=${ListNo[0].beanImgNo}" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>원두이름</td>
			<td><input required="required" type="text" maxlength="50" id="beanName" name="beanName" value="${ListNo[0].beanName}"></td>
		</tr>
		<tr>
			<td>원두원산지</td>
			<td><input required="required" type="text" maxlength="30" id="origin" name="origin" value="${ListNo[0].beanPrice}"></td>
		</tr>
		<tr>
			<td>원두금액</td>	
			<td><input required="required" type="number" min="1" max="100000" id="beanPrice" name="beanPrice" value="${ListNo[0].origin}"></td>	
		</tr>
		<tr>
			<td>사업자번호</td>	
			<td><input required="required" type="text" id="businessNo" name="businessNo" value="${ListNo[0].businessNo}"></td>	
		</tr>
		<!-- 원두이미지삽입 -->
		<tr>
			<td>원두[이미지삽입]</td>
			<td>
			<textarea required="required" id="beanOriginName" name="beanOriginName" rows="4" cols="4">${ListNo[0].beanOriginName}</textarea>
			</td>
		</tr>
		<tr>	
			<td>
			원두맛[체크박스]
			</td>
			<td> 
			<span>새콤</span>
    		<input type="checkbox" id="cupNoteName1" name="cupNoteName" value="1" 
			<c:if test="${cupNote[0] == '1' or cupNote[1] == '1'}">checked</c:if>>
			<span>달콤</span>  
			<input type="checkbox" id="cupNoteName2" name="cupNoteName" value="2"
			<c:if test="${cupNote[0] == '2' or cupNote[1] == '2'}">checked</c:if>>
			<span>쌉쌀</span>
			<input type="checkbox" id="cupNoteName3" name="cupNoteName" value="3"
			<c:if test="${cupNote[0] == '3' or cupNote[1] == '3'}">checked</c:if>>
			<span>고소</span>
			<input type="checkbox" id="cupNoteName4" name="cupNoteName" value="4"
			<c:if test="${cupNote[0] == '4' or cupNote[1] == '4'}">checked</c:if>>
			<span>은은한</span>
			<input type="checkbox" id="cupNoteName5" name="cupNoteName" value="5"
			<c:if test="${cupNote[0] == '5' or cupNote[1] == '5'}">checked</c:if>>
			<span>향긋한</span>
			<input type="checkbox" id="cupNoteName6" name="cupNoteName" value="6"
			<c:if test="${cupNote[0] == '6' or cupNote[1] == '6'}">checked</c:if>>
			<span>진한</span>
			<input type="checkbox" id="cupNoteName7" name="cupNoteName" value="7"
			<c:if test="${cupNote[0] == '7' or cupNote[1] == '7'}">checked</c:if>>
			<span>부드러운</span>
			<input type="checkbox" id="cupNoteName8" name="cupNoteName" value="8"
			<c:if test="${cupNote[0] == '8' or cupNote[1] == '8'}">checked</c:if>>
			</td>
		</tr>
		<!-- 원두이미지삽입 -->
		<tr>
		<td>원두설명</td>
		<td><textarea required="required" id="beanComm" name="beanComm" rows="3" style="width: 1000px;">${ListNo[0].beanComm}</textarea></td>
		</tr>
		<tr>
			<td>원두상세설명[이미지삽입]</td>
			<td>
			<textarea required="required" id="beanInfo" name="beanInfo" rows="4" cols="2">${ListNo[0].beanInfo}</textarea>
			</td>
		</tr>
	</table>
	<button id="btnUpdate">수정</button>
</form>
</div>

<!-- footer -->
<c:import url="../layout/footer.jsp"/>
