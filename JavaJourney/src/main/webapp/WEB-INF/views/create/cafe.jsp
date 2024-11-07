<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="../layout/header.jsp"/>


협약 카페 등록 페이지
<hr>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 카카오주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 지도 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d&libraries=services"></script>
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

    // 우편번호 찾기 버튼 클릭
    $("#btnPostcode").click(function() {
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
    
    $('#cafeInfo').summernote({ //섬머노트 설정
        height: 400  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
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


<div>
<form action="./cafe" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>카페 이름</td>
		<td><input type="text" id="cafeName" name="cafeName"></td>		
	</tr>
	<tr>
		<td>카페 정보</td>
		<td><textarea id="cafeComm" name="cafeComm" rows="5" cols="22"></textarea></td>		
	</tr>
	<tr>
		<td>카페 전화번호</td>
		<td><input type="tel" id="cafePhone" name="cafePhone" ></td>		
	</tr>
	<tr>
		<td>카페 운영시간</td>
		<td><input type="text" id="busyTime" name="busyTime"  placeholder="예: 월-금 09:00 - 18:00"></td>		
	</tr>	
	<tr>
		<td>카페사진 첨부파일</td>
		<td><input type="text" id="imgNo" name="imgNo"></td>		

	</tr>
	<tr>
		<td>카페 지역</td>
		<td>
		<select id="category">
	      <option hidden="none"></option>
	      <option value="서울">서울</option>
	      <option value="경기">경기</option>
	      <option value="인천">인천</option>
	      <option value="부산">부산</option>
	      <option value="제주">제주</option>
  		 </select>
   </td>
	</tr>
	<tr>
		<td>카페 상세설명</td>
		<td>
		<textarea id="cafeInfo" name="cafeInfo" class="form-control"
		rows="4" cols="2"></textarea>
		</td>		
	</tr>
	<tr>
		<td>카페 주소</td>
		<td>
		<button id="btnPostcode" type="button">우편번호 찾기</button>
		<div id="postcodeWrap"> <!-- 우편닫기버튼기능 -->
			<img alt="x" src="../resources/img/close.png" class="closeIcon">
		</div>
		<input type="text" id="postCode" placeholder="우편번호" readonly="readonly"><br>
		<input type="text" id="cafeAdd1" placeholder="주소" readonly="readonly"><br>
		<input type="text" id="cafeAdd2" placeholder="상세주소"><br>
		</td>
	</tr>


<!-- 	<tr> -->
<!-- 		<td>사장 아이디</td> -->
<!-- 		<td> -->
<!-- 			<input type="text" id="cafeId" name="cafeId"> -->
<!-- 			<button id="idCheck" type="button">중복확인</button> -->
<!-- 		</td>		 -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>사장 비밀번호</td> -->
<!-- 		<td><input type="text" id="cafePw" name="cafePw"></td>		 -->
<!-- 	</tr> -->

</table>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:500px; height:400px;"></div>


<div id="btnWrite">
	<button>등록</button>
</div>

</form>
</div>


<!-- footer -->
<c:import url="../layout/footer.jsp"/>