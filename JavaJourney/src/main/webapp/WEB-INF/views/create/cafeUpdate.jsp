<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="../layout/header.jsp"/>


<h2 style="text-align: center; font-weight: bold;">협약 카페 수정</h2>
<hr>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 카카오주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 지도 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d&libraries=services"></script>
<!-- 썸머노트 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>
 
<script type="text/javascript">
$(function() {
    
    // 지도 초기화
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.5665, 126.9780),
            level: 3
        };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var marker = new kakao.maps.Marker({
        position: map.getCenter()
    });
    marker.setMap(map);
    
    // 페이지 로드 시 cafeAdd1(주소)에 따른 지도 위치 업데이트
    var savedAddress = $("#cafeAdd1").val(); // 저장된 주소 가져오기
    if (savedAddress) {
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(savedAddress, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var lat = result[0].y;
                var lon = result[0].x;
                var moveLatLon = new kakao.maps.LatLng(lat, lon);

                // 지도 중심 이동
                map.setCenter(moveLatLon);
                marker.setPosition(moveLatLon);
            } else {
                console.error("지도 초기화 중 주소 검색 실패:", status);
            }
        });
    }    

    // 우편번호 찾기 버튼 클릭
    $("#btnPostcode").click(function(e) {
    	e.preventDefault();
    	
        // 우편번호 찾기창 초기화
        $("#postCode").val("");
        $("#cafeAdd1").val("");
        $("#cafeAdd2").val("");

        new daum.Postcode({
            oncomplete: function(data) {
                $("#postCode").val(data.zonecode);
                if (data.userSelectedType === 'R') {
                    $("#cafeAdd1").val(data.roadAddress);
                } else {
                    $("#cafeAdd1").val(data.jibunAddress);
                }

                // 상세주소 입력 포커스
                $("#cafeAdd2").focus();
                $("#postcodeWrap").hide();

                // 주소로 지도 위치 갱신
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(data.roadAddress, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var lat = result[0].y;
                        var lon = result[0].x;
                        var moveLatLon = new kakao.maps.LatLng(lat, lon);

                        // 지도 중심 이동
                        map.setCenter(moveLatLon);
                        marker.setPosition(moveLatLon);
                    }
                });
            }
        }).open(); //팝업창 열기 위한 open
    }); //$("#btnPostcode") end

    
//------------------------------------------------------------------------------

    $('#cafeImgOriName').summernote({ //섬머노트 설정
    	width: 500, height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
    }); // $('#cafeInfo') end
    
    $('#cafeInfo').summernote({ //섬머노트 설정
    	width: 500, height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
    }); // $('#cafeInfo') end
    
	$("#btnManagerMenu").click(function () {
		location.href="/manager/menu";
	}) //$("#btnManagerMenu") end
	
	$("#btnUpdate").click(function() {
		$(this).parents("form").submit();
	});
    
	$("#btnCancel").click(function () {
		location.href="/cafe/all";
	}) 
    
  }); //$(function() end
		  	  
</script>
 


<style type="text/css">

/* 주소 */
#postcodeWrap {
/* 	position: relative; */
	position: absolute;
	
	
	width: 500px;
	height: 500px;
	
	border: 1px solid #ccc;
	
	display: none;
	
}
#postcodeWrap .closeIcon{

	position: absolute;
	
	width: 30px;
	z-index: 9999;
	
	top: 0.5px;
	right: -38px;
	
	padding: 3px;
	
	cursor: pointer;
}
	
#btnManagerMenu {
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;	
    margin-left: 300px;
}


/* 테이블 전체를 중앙 정렬 */
form {
    display: flex; 
    flex-direction: column; 
    align-items: center; /* 테이블과 버튼을 중앙으로 정렬 */
}

/* 테이블 스타일 */
table {
    margin: 20px auto; /* 페이지 중앙 정렬 */
    border-collapse: collapse; /* 테두리 겹침 제거 */
    width: 70%; /* 너비 조정 */
    max-width: 1500px; /* 최대 너비 설정 */
    background-color: #f9f9f9; /* 테이블 배경색 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    border-radius: 8px; /* 테이블 모서리를 둥글게 */
    overflow: hidden; /* 둥근 테두리 안에 내용 제한 */
}

/* 테이블 행 스타일 */
table tr {
    border-bottom: 1px solid #ddd; /* 행 구분선 */
}

table tr:last-child {
    border-bottom: none; /* 마지막 행 구분선 제거 */
}

/* 테이블 헤더와 셀 스타일 */
table td {
    padding: 12px 15px; /* 셀 내부 여백 */
    text-align: left; /* 텍스트 정렬 */
    font-size: 16px; /* 폰트 크기 */
}

/* 입력 필드 스타일 */
input[type="text"], 
textarea, 
select {
    width: 100%; /* 입력 필드의 너비를 셀에 맞게 조정 */
    padding: 10px; /* 내부 여백 */
    font-size: 14px; /* 폰트 크기 */
    border: 1px solid #ccc; /* 테두리 */
    border-radius: 4px; /* 모서리를 둥글게 */
    box-sizing: border-box; /* 패딩 포함 크기 계산 */
}

#btnPostcode {
    padding: 8px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;	
}

#btnCancel, #btnUpdate {
    flex: 1;                     /* 각 버튼이 동일한 비율로 공간을 차지 */
    padding: 10px 20px;          /* 버튼 높이 */
    background-color: #6f4e37;   /* 기본 배경색 */
    color: white;                /* 텍스트 색상 */
    border: none;                /* 테두리 제거 */
    border-radius: 4px;          /* 둥근 모서리 */
    cursor: pointer;             /* 클릭 가능 커서 */
    font-size: 17px;             /* 글꼴 크기 */
    text-align: center;          /* 텍스트 중앙 정렬 */
}

/* 버튼 별도 색상 설정 */
#btnCancel {
    background-color: #e3cab8;
}

.buttonGroup {
    display: flex;          /* 플렉스박스로 정렬 */
    justify-content: center; /* 중앙 정렬 */
    gap: 10px;              /* 버튼 간 간격 */
}

</style>


<button id="btnManagerMenu">관리자메뉴로가기</button>
<hr>
<div>
<form action="./cafeUpdate" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td><input type="hidden" name="cafeNo" value="${cafe.cafeNo }" readonly="readonly"></td>
	</tr>
	<tr>
		<td>카페 이름</td>
		<td><input type="text" id="cafeName" name="cafeName" value="${cafe.cafeName }"></td>		
	</tr>
	<tr>
		<td>카페 정보</td>
		<td><textarea id="cafeComm" name="cafeComm" rows="5" cols="22" >${cafe.cafeComm}</textarea></td>		
	</tr>
	<tr>
		<td>카페 전화번호</td>
		<td><input type="tel" id="cafePhone" name="cafePhone" value="${cafe.cafePhone }"></td>		
	</tr>
	<tr>
		<td>카페 운영시간</td>
		<td><input type="text" id="busyTime" name="busyTime"  placeholder="예: 월-금 09:00 - 18:00" value="${cafe.busyTime }"></td>		
	</tr>	
	<tr>
		<td>카페 메인사진[이미지]]</td>
		<td>
		<textarea id="cafeImgOriName" name="cafeImgOriName" class="form-control" rows="4" cols="4">${cafe.cafeImgOriName}</textarea>
		</td>		

	</tr>
	
	<tr>
		<td>카페 지역</td>
		<td>
		<select id="category" name="cafeLoc">
<!-- 	      <option hidden="none"></option> -->
<%-- 	      <option value="서울" ${cafe.cafeLoc == '서울' ? 'selected' : ''}>서울</option> --%>
<%-- 	      <option value="경기" ${cafe.cafeLoc == '경기' ? 'selected' : ''}>경기</option> --%>
<%-- 	      <option value="인천" ${cafe.cafeLoc == '인천' ? 'selected' : ''}>인천</option> --%>
<%-- 	      <option value="부산" ${cafe.cafeLoc == '부산' ? 'selected' : ''}>부산</option> --%>
<%-- 	      <option value="제주" ${cafe.cafeLoc == '제주' ? 'selected' : ''}>제주</option>   --%>
         <option hidden="none"></option>
         <option value="강남구" ${cafe.cafeLoc == '강남구' ? 'selected' : ''}>강남구</option>
         <option value="서초구" ${cafe.cafeLoc == '서초구' ? 'selected' : ''}>서초구</option>
         <option value="송파구" ${cafe.cafeLoc == '송파구' ? 'selected' : ''}>송파구</option>
         <option value="종로구" ${cafe.cafeLoc == '종로구' ? 'selected' : ''}>종로구</option>
         <option value="서대문구" ${cafe.cafeLoc == '서대문구' ? 'selected' : ''}>서대문구</option>
         <option value="마포구" ${cafe.cafeLoc == '마포구' ? 'selected' : ''}>마포구</option>    	
  		 </select>
  		</td>
	</tr>
	
	<tr>
		<td>카페 상세설명</td>
		<td>
		<textarea id="cafeInfo" name="cafeInfo" class="form-control"
		rows="4" cols="4">${cafe.cafeInfo }</textarea>
		</td>		
	</tr>
	<tr>
		<td>카페 주소</td>
		<td>
		<button id="btnPostcode" type="button">우편번호 찾기</button>
		<div id="postcodeWrap"> <!-- 우편닫기버튼기능 -->
			<img alt="x" src="../resources/img/close.png" class="closeIcon">
		</div>
		<input type="text" id="postCode" name="postCode" placeholder="우편번호" readonly="readonly"><br>
		<input type="text" id="cafeAdd1" name="cafeAdd1" placeholder="주소" readonly="readonly" value="${cafe.cafeAdd1 }"><br>
		<input type="text" id="cafeAdd2" name="cafeAdd2" placeholder="상세주소" value="${cafe.cafeAdd2 }"><br>
		</td>
	</tr>
	<tr>
		<td></td>
      <td>
		<!-- 지도를 표시할 div 입니다 -->
      <div id="map" style="width:500px; height:400px;"></div>
      </td>
	</tr>


</table>

<div class="buttonGroup">
<button id="btnCancel" type="reset">취소</button>
<button id="btnUpdate" >수정</button>
</div>

</form>
</div>


<!-- footer -->
<c:import url="../layout/footer.jsp"/>