<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="../layout/header.jsp"/>


<h1>협약 카페 수정 페이지</h1>
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
    
  }); //$(function() end
</script>
 


<style type="text/css">
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
	
	border: 1px solid skyblue;
	padding: 3px;
	
	cursor: pointer;
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
	      <option hidden="none"></option>
	      <option value="서울" ${cafe.cafeLoc == '서울' ? 'selected' : ''}>서울</option>
	      <option value="경기" ${cafe.cafeLoc == '경기' ? 'selected' : ''}>경기</option>
	      <option value="인천" ${cafe.cafeLoc == '인천' ? 'selected' : ''}>인천</option>
	      <option value="부산" ${cafe.cafeLoc == '부산' ? 'selected' : ''}>부산</option>
	      <option value="제주" ${cafe.cafeLoc == '제주' ? 'selected' : ''}>제주</option>  
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


</table>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:500px; height:400px;"></div>


<button id="btnUpdate">수정</button>
<button id="btnCancel" type="reset">취소</button>

</form>
</div>


<!-- footer -->
<c:import url="../layout/footer.jsp"/>