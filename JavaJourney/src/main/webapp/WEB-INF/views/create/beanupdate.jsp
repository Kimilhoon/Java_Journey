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
<%-- ${ListNo[0].cupNoteNo}	 --%>
<%-- ${ListNo[1].cupNoteNo}	 --%>
<%-- ${ListNo.cupNoteNo}	 --%>
<%-- ${cupNote } --%>
<%-- ${cupNote[0] } --%>
<%-- ${cupNote.contains('1') } --%>
<%-- ${cupNote.contains(1) } --%>
<form id="form" action="./beanupdate?beanNo=${ListNo[0].beanNo}&beanImgNo=${ListNo[0].beanImgNo}" method="post" enctype="multipart/form-data">
	<table class="table table-info">
		<tr>
			<td>
			원두이름
			</td>
			<td>
			<input type="text" id="beanName" name="beanName" value="${ListNo[0].beanName}">
			원두금액
			<input type="text" id="beanPrice" name="beanPrice" value="${ListNo[0].beanPrice}">
			원두원산지
			<input type="text" id="origin" name="origin" value="${ListNo[0].origin}">
			사업자번호
			<input type="text" id="businessNo" name="businessNo"  value="${ListNo[0].businessNo}">
			</td> 
		</tr>
		<tr>
		</tr>
		<!-- 원두이미지삽입 -->
		<tr>
			<td>원두[이미지삽입]</td>
			<td>
			<textarea id="beanOriginName" name="beanOriginName" class="form-control"
			rows="4" cols="4">${ListNo[0].beanOriginName}</textarea>
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
		<td><textarea id="beanComm" name="beanComm" rows="3" style="width: 1000px;">${ListNo[0].beanComm}</textarea></td>
		</tr>
		<tr>
			<td>원두상세설명[이미지삽입]</td>
			<td>
			<textarea id="beanInfo" name="beanInfo" class="form-control"
			rows="4" cols="2">${ListNo[0].beanInfo}</textarea>
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
