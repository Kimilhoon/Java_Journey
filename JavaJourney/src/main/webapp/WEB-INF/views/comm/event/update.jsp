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
#btnWrite {
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
<h1 class="text-center">이벤트 업데이트</h1>
<!-- <div> -->
<!-- <button id="btnManagerMenu">관리자메뉴로가기</button> -->
<!-- <button id="btnBack">뒤로가기</button> -->
<!-- </div> -->
<div class="container">	
<form id="form" action="./update?eventNo=${eventView.eventNo }" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
			이벤트 이름
			<input type="text" name="eventName" value="${eventView.eventName }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td>
			
			<div>이벤트 배너</div>
			<textarea id="evantBanner" name="eventBanner" class="eveImg"
			rows="4" cols="2">${eventView.eventBanner }</textarea>
			<span class="mx-5"></span>
			<span class="mx-3">이벤트 날짜 설정</span>
			시작
			<input type="date" id="eveStart" name="eveStart" value="${eventView.eveStart }">
			종료
			<input type="datetime-local" id="eveEnd" name="eveEnd" value="${eventView.eveEnd }">
			</td>
		</tr>
		<tr>
			<td>이벤트이미지[이미지삽입]
			<textarea id="eventInfo" name="eveImg" class="eveImg"
			rows="4" cols="2">${eventView.eveImg }</textarea>
			</td>
		</tr>
	</table>
	<button id="btnWrite">수정</button>
</form>
</div>





<c:import url="../../layout/footer.jsp" />
