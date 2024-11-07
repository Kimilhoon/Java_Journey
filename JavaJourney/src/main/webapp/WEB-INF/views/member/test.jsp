<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"></c:import>



<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:500px; height:400px;"></div>

<!-- 카카오 지도 SDK 불러오기 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d&libraries=services"></script>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 좌표
        level: 4
    };

    // 지도 생성
    var map = new kakao.maps.Map(container, options);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('서울특별시 강남구 강남구 테헤란로14길 6', function(result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);

            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 결과 좌표를 콘솔에 출력합니다 (디버깅 용도)
            console.log(result);
        }
    });
});
</script>
