<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- <script type="text/javascript"
 src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d">
</script> -->

<script type="text/javascript">
$(function() {
	$("#goJoin").click(function() {	
		location.href = "./join";
	});
	$("#goIdFind").click(function() {	
		location.href = "./idfind";
	});
	$("#goPwFind").click(function() {	
		location.href = "./pwfind";
	});
});
</script>

<style>
    #goJoin {
    	cursor: pointer; /* 클릭 가능한 모양으로 커서 변경 */
   	 	text-decoration: none; /* 밑줄 제거 */
    }
    #goJoin:hover {
    	text-decoration: underline; /* 마우스 오버 시 밑줄 추가 */
    }
    a {
    	text-decoration: none;
    	color: black;
    }
    a:hover {
    	text-decoration: underline;
    }
</style>

</head>

<body>

로그인 페이지
<hr>

<form action="./login" method="post">

<div>
	<label for="userId">아이디</label>
	<input type="text" name="userId" id="userId">
</div>

<div>
	<label for="userPw">비밀번호</label>
	<input type="text" name="userPw" id="userPw">
</div>

<div>
	<a href="./idfind">아이디찾기</a>
	|
	<a href="./pwfind">비밀번호찾기</a>
</div>

<div id="goJoin">회원가입</div>


<div>
	<button id="btnLogin" class="btn btn-primary">로그인</button>
</div>




<!-- -------------------------------------------------------------------------- -->
<!-- 지도api -->
<!-- <div id="map" style="width:500px; height:400px;"></div> -->

<!-- <script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 초기 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options);
	 //지도를 생성하여 지정된 위치와 옵션으로 표시
	
	 // 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	 
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('서울특별시 강남구 강남구 테헤란로14길 6', function(result, status) {		
		if (status === kakao.maps.services.Status.OK) { 	// 정상적으로 검색이 완료됐으면
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			// 검색결과에서 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
	
			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
			map: map,
			position: coords
			});
	
			// 결과 좌표를 콘솔에 출력합니다 (디버깅 용도)
			//console.log(result);
		}
	});
	 
</script> -->


</form>

</body>
</html>