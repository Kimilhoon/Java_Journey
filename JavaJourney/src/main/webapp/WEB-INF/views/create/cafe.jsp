<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<c:import url="../layout/header.jsp"/>


<h2 style="text-align: center; font-weight: bold;">협약 카페 등록</h2>
<hr>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- 카카오주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 지도 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d&libraries=services"></script>
<!-- 썸머노트 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/lang/summernote-ko-KR.min.js"></script> -->
 
<script type="text/javascript">
$(function() {
    
    // 지도 초기화
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.5665, 126.9780), //초기 중심 좌표
            level: 3 //초기 지도 확대 수준
        };
    var map = new kakao.maps.Map(mapContainer, mapOption); //지도 객체 생성
    var marker = new kakao.maps.Marker({ //마커 생성
        position: map.getCenter() // 초기 마커 위치
    });
    marker.setMap(map); //마커를 지도에 표시

    // 우편번호 찾기 버튼 클릭
    $("#btnPostcode").click(function(e) {
       e.preventDefault();
       
        // 우편번호 찾기창 초기화
        $("#postCode").val("");
        $("#cafeAdd1").val("");
        $("#cafeAdd2").val("");

        new daum.Postcode({
            oncomplete: function(data) {
                $("#postCode").val(data.zonecode); // 우편번호 입력
                if (data.userSelectedType === 'R') {
                    $("#cafeAdd1").val(data.roadAddress); // 도로명 주소
                } else {
                    $("#cafeAdd1").val(data.jibunAddress); // 지번 주소
                }

                $("#cafeAdd2").focus(); // 상세주소 입력 포커스
                $("#postcodeWrap").hide(); // 우편번호 찾기 UI 숨김

                // 주소로 지도 위치 갱신
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(data.roadAddress, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var lat = result[0].y; //위도
                        var lon = result[0].x; //경도
                        var moveLatLon = new kakao.maps.LatLng(lat, lon);

                        map.setCenter(moveLatLon); // 지도 중심 이동
                        marker.setPosition(moveLatLon); // 마커 위치 이동
                    }
                });
            }
        }).open(); //팝업창 열기 위한 open
    }); //$("#btnPostcode") end
    
    $('#cafeImgOriName').summernote({ //섬머노트 설정
       width: 500, height: 200  // 에디터 높이를 설정합니다. 필요에 따라 변경 가능합니다.
        , toolbar: [
            ['insert', ['picture']] // 이미지 업로드 버튼만 추가
        ]
    }); // $('#cafeImgOriName') end
    
    $('#cafeInfo').summernote({ 
       width: 500, height: 200 
        , toolbar: [
            ['insert', ['picture']] 
        ]
    }); // $('#cafeInfo') end
    
   $("#btnManagerMenu").click(function () {
      location.href="/manager/menu";
   }) //$("#btnManagerMenu") end
   
   $("#btnWrite").click(function() {
      $(this).parents("form").submit();
   });
    
  }); //$(function() end
</script>
 


<style type="text/css">

/* 주소 */
#postcodeWrap {
/*    position: relative; */
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


#btnWrite {
    width: 70%;
    padding: 10px;
    background-color: #6f4e37;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 17px;
}


</style>

<!-- <button id="btnManagerMenu">관리자메뉴로가기</button> -->
<!-- <hr> -->

<div>
<form action="./cafe" method="post" enctype="multipart/form-data">
<table>
   <tr>
      <td>카페 이름</td>
      <td><input type="text" id="cafeName" name="cafeName"></td>      
   </tr>
   <tr>
      <td>사업자번호</td>
      <td><input type="text" id="businessNo" name="businessNo"></td>      
   </tr>   
   <tr>
      <td>카페 정보</td>
      <td><textarea id="cafeComm" name="cafeComm" rows="5" cols="22" placeholder="간단한 정보를 입력하세요"></textarea></td>      
   </tr>
   <tr>
      <td>카페 전화번호</td>
      <td><input type="text" id="cafePhone" name="cafePhone" ></td>      
   </tr>
   <tr>
      <td>카페 운영시간</td>
      <td><input type="text" id="busyTime" name="busyTime"  placeholder="예: 월-금 09:00 - 18:00"></td>      
   </tr>   
   <tr>
      <td>카페 메인사진[이미지]]</td>
      <td>
      <textarea id="cafeImgOriName" name="cafeImgOriName" class="form-control"
      rows="4" cols="4"></textarea>
      </td>      

	</tr>

   <tr>
      <td>카페 지역</td>
      <td>
      <select id="category" name="cafeLoc">
<!--          <option hidden="none"></option> -->
<!--          <option value="서울">서울</option> -->
<!--          <option value="경기">경기</option> -->
<!--          <option value="인천">인천</option> -->
<!--          <option value="부산">부산</option> -->
<!--          <option value="제주">제주</option> -->
         <option hidden="none"></option>
         <option value="강남구">강남구</option>
         <option value="서초구">서초구</option>
         <option value="송파구">송파구</option>
         <option value="종로구">종로구</option>
         <option value="서대문구">서대문구</option>
         <option value="마포구">마포구</option>         
        </select>
        </td>
   </tr>
   
   <tr>
      <td>카페 상세설명[이미지]</td>
      <td>
      <textarea id="cafeInfo" name="cafeInfo" class="form-control"
      rows="4" cols="4"></textarea>
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
      <input type="text" id="cafeAdd1" name="cafeAdd1" placeholder="주소" readonly="readonly"><br>
      <input type="text" id="cafeAdd2" name="cafeAdd2" placeholder="상세주소"><br>
      </td>
   </tr>


<!--    <tr> -->
<!--       <td>사장 아이디</td> -->
<!--       <td> -->
<!--          <input type="text" id="cafeId" name="cafeId"> -->
<!--          <button id="idCheck" type="button">중복확인</button> -->
<!--       </td>       -->
<!--    </tr> -->
<!--    <tr> -->
<!--       <td>사장 비밀번호</td> -->
<!--       <td><input type="text" id="cafePw" name="cafePw"></td>       -->
<!--    </tr> -->

	<tr>
		<td></td>
      <td>
		<!-- 지도를 표시할 div 입니다 -->
      <div id="map" style="width:500px; height:400px;"></div>
      </td>
	</tr>

</table>

<button id="btnWrite">등록</button>

</form>
</div>


<!-- footer -->
<c:import url="../layout/footer.jsp"/>