<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 디버깅용: reviews의 내용을 콘솔에 출력 --%>
<c:out value="${reviews}" default="No reviews found" />

<c:import url="../layout/header.jsp"/>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 카카오주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 카카오 지도 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d&libraries=services"></script>

<script type="text/javascript">
$(function() {

	var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 초기 지도 중심 좌표 (서울)
        level: 3 // 초기 지도 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
	var marker = new kakao.maps.Marker({
	    position: map.getCenter() // 마커 초기 위치 설정
	});
	marker.setMap(map); // 마커 지도에 표시
	
	// 서버에서 전달된 주소 가져오기
    var savedAddress = "${savedAddress}";
    if (savedAddress) {
        updateMapWithAddress(savedAddress);
    } else {
        console.warn("저장된 주소가 없습니다.");
    }

	// 주소를 기반으로 지도 위치를 업데이트하는 함수
	function updateMapWithAddress(address) {
	    var geocoder = new kakao.maps.services.Geocoder();
	    geocoder.addressSearch(address, function (result, status) {
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

//---------------------------------------------------------------------------------------------------

	// cafeupdate 지도API 생성 코드
	// 지도 초기화
//     var mapContainer = document.getElementById('map'),
//         mapOption = {
//             center: new kakao.maps.LatLng(37.5665, 126.9780),
//             level: 3
//         };
//     var map = new kakao.maps.Map(mapContainer, mapOption);
//     var marker = new kakao.maps.Marker({
//         position: map.getCenter()
//     });
//     marker.setMap(map);
    
//  	// 주소가 이미 저장된 경우 지도 위치 업데이트(내가 수정한 코드)
//     $(document).ready(function() {
//         var savedAddress = $("#cafeAdd1").val(); // 저장된 주소 가져오기
//         if (savedAddress) {
//             updateMapWithAddress(savedAddress);
//         }
//     });
    
//  	// 주소를 입력하면 해당 주소로 지도 위치 업데이트하는 함수
//     function updateMapWithAddress(address) {
//         var geocoder = new kakao.maps.services.Geocoder();
//         geocoder.addressSearch(address, function(result, status) {
//             if (status === kakao.maps.services.Status.OK) {
//                 var lat = result[0].y;
//                 var lon = result[0].x;
//                 var moveLatLon = new kakao.maps.LatLng(lat, lon);

//                 // 지도 중심 이동
//                 map.setCenter(moveLatLon);
//                 marker.setPosition(moveLatLon);
//             } else {
//                 console.error("지도 초기화 중 주소 검색 실패:", status);
//             }
//         });
//     }
 	
// //     // 페이지 로드 시 cafeAdd1(주소)에 따른 지도 위치 업데이트
// //     var savedAddress = $("#cafeAdd1").val(); // 저장된 주소 가져오기
// //     if (savedAddress) {
// //         var geocoder = new kakao.maps.services.Geocoder();
// //         geocoder.addressSearch(savedAddress, function(result, status) {
// //             if (status === kakao.maps.services.Status.OK) {
// //                 var lat = result[0].y;
// //                 var lon = result[0].x;
// //                 var moveLatLon = new kakao.maps.LatLng(lat, lon);

// //                 // 지도 중심 이동
// //                 map.setCenter(moveLatLon);
// //                 marker.setPosition(moveLatLon);
// //             } else {
// //                 console.error("지도 초기화 중 주소 검색 실패:", status);
// //             }
// //         });
// //     }    

//     // 우편번호 찾기 버튼 클릭
//     $("#btnPostcode").click(function(e) {
//     	e.preventDefault();
    	
//         // 우편번호 찾기창 초기화
//         $("#postCode").val("");
//         $("#cafeAdd1").val("");
//         $("#cafeAdd2").val("");

//         new daum.Postcode({
//             oncomplete: function(data) {
//                 $("#postCode").val(data.zonecode);
//                 var address = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
//                 $("#cafeAdd1").val(address);                
// //                 if (data.userSelectedType === 'R') {
// //                     $("#cafeAdd1").val(data.roadAddress);
// //                 } else {
// //                     $("#cafeAdd1").val(data.jibunAddress);
// //                 }

//                 // 상세주소 입력 포커스
//                 $("#cafeAdd2").focus();
//                 $("#postcodeWrap").hide();

//                 // 주소로 지도 위치 갱신
//                 updateMapWithAddress(address);
// //                 var geocoder = new kakao.maps.services.Geocoder();
// //                 geocoder.addressSearch(data.roadAddress, function(result, status) {
// //                     if (status === kakao.maps.services.Status.OK) {
// //                         var lat = result[0].y;
// //                         var lon = result[0].x;
// //                         var moveLatLon = new kakao.maps.LatLng(lat, lon);

// //                         // 지도 중심 이동
// //                         map.setCenter(moveLatLon);
// //                         marker.setPosition(moveLatLon);
// //                     }
// //                 });
//             }
//         }); //팝업창 열기 위한 open
//     }); //$("#btnPostcode") end

    
//------------------------------------------------------------------------------

	
		//데이터 객체 생성
		var cafeNo = "${cafeInfo.cafeNo }";
		var userNo = "${userNo }";

// 	$(document).ready(function() {
		
		$("#wish").click(function() {
			
			//현재 버튼의 텍스트 가져오기
			const currentText = $(this).text();
			
			//버트 클릭 시 텍스트 변경(찜 상태 토글)
			if (currentText === "찜 ♡") {
	            $(this).text("찜 ♥"); //찜 추가
	            sendWishData(cafeNo, userNo, 'add'); //데이터 추가 요청
	            
	        } else {
	            $(this).text("찜 ♡"); //찜 취소
	            sendWishData(cafeNo, userNo, 'remove'); //데이터 삭제 요청
	        }
			
		}); // $("#wish").click(function() end
		
		function sendWishData(cafeNo, userNo, action) {
	    	
	        $.ajax({
	            url: './info',  // 요청 URL
	            type: 'POST',
	            contentType: 'application/json',  // JSON 형식
	            data: JSON.stringify({ 
	                cafeNo: cafeNo,
	                userNo: userNo,
	                action: action  // 'add' 또는 'remove'
	            }),
	            dataType: "json",  // 서버에서 JSON 응답을 받을 때
	            success: function(response) {
	                if (action === 'add') {
	                    console.log('찜 상태가 추가되었습니다.');
	                    
	                } else if (action === 'remove') {
	                    console.log('찜 상태가 취소되었습니다.');
	                    
	                }
	            },
	            error: function() {
	                console.error("AJAX 요청에 실패했습니다.");
	            }
	        });
	    }
// 	}); // $(document).ready() End
		
	/* 메뉴바 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */

		$("#cafeInfoBtn").click(function() {
			location.href="#cafeInfo"
		});
		
		$("#cafeLocBtn").click(function() {
			location.href="#cafeLoc"
		});
		
		$("#cafeRevBtn").click(function() {
			location.href="#cafeRev"
		});
		
	/* 버튼 경로 설정 */
	/* -------------------------------------------------------------------------------------------------------------- */
		
		$("#btnAll").click(function() {
			location.href="./all";
		});
		
		$("#btnBest").click(function() {
			location.href="./best";
		});
		
		$("#review").click(function() {
			location.href="/comm/creview/write?cafeNo=${cafeInfo.cafeNo }";
		});
		
		$("#btnUpdate").click(function() {
			location.href="/create/cafeUpdate?cafeNo=${cafeInfo.cafeNo}";
		});
		
		$("#btnDelete").click(function() {
			location.href="/create/cafeDelete?cafeNo=${cafeInfo.cafeNo}";
		});
	
	/* -------------------------------------------------------------------------------------------------------------- */
		
		
// 		$(document).ready(function() {
			
			var tapsTop = $("#cafeMenu").offset().top; 
			console.log(tapsTop)
			
			$(window).scroll(function() {
			   
				var windowTop = $(this).scrollTop();
			    
				if(tapsTop <= windowTop) {
					$("#cafeMenu").addClass("fixed");
				}else{
					$("#cafeMenu").removeClass("fixed");
				} // if(tapsTop <= window) end
				
			}); // $(window).scroll(function() end
					
// 		}); // $(document).ready(function() end

		$(".custom-image img").css({
			width: "400px",
			height: "360px",
	        objectFit: "container",		// 이미지가 썸네일 크기에 맞도록 설정
	        borderRadius: "8px"		// 모서리를 둥글게 (선택 사항)
			 
		});

// 		$(document).ready(function() {
// 		    $.ajax({
// 		        url: '/comm/creview/list', // 서버에서 리뷰 목록을 가져오는 API 엔드포인트
// 		        type: 'GET',
// 		        data: { cafeNo: ${cafeInfo.cafeNo} }, // 해당 카페의 번호를 파라미터로 전달
// 		        success: function(data) {
// 		            // 서버에서 받은 리뷰 데이터를 이용하여 HTML 생성
// 		            let html = '';
// 		            data.forEach(cafeRev => {
// 		                html += `
// 		                    <tr>
// 		                        <td>${cafeRev.userNick}</td>
// 		                        <td>${cafeRev.revContent}</td>
// 		                        </tr>
// 		                `;
// 		            });
// 		            $('#reviewList').html(html);
// 		        }
// 		    });
// 		}); // $(document).ready() : reviewList End
				
}); // $(function() end 
</script>

<style type="text/css">
/* ID 이름에서 공백 제거 */
#wish {
	width: 150px;
}

#imageDiv{
	 width: 399px; 
	 height: 559px;
}

#cafeMenu.fixed{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	background: white;
	z-index: 9999;
}

.map-container {
    position: relative; /* 또는 absolute */
    z-index: 1; /* 낮은 z-index로 설정하여 상단 버튼이 지도 위로 오도록 함 */
}

#cafeComm p{
	width: 840px;
	height: 300px;
}

.custom-image{
	margin-right: 5px;
}


</style>

<div class="container">

<div class="text-center m-5">
<h1>카페 상세보기</h1>
</div>

<nav style="--breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item"><a href="./all">cafe</a></li>
		<li class="breadcrumb-item active" aria-current="page">info</li>
	</ol>
</nav>

<div id="commCafe" class="d-flex mb-3 grid gap-0 column-gap-5">
<div id="imageDiv" style="flex-shrink: 0;" >
<div class="custom-image">${ cafeInfo.cafeImgOriName }</div>
 </div>

<div id="explain p-2" style="text-align: center;  margin: 0 auto;">
<div id="cafeName">
<p class="fw-bold fs-1">${ cafeInfo.cafeName }</p>
</div>

<div id="cafeAdd1" class="mb-2">
<p class="fw-bold fs-4">${ cafeInfo.cafeAdd1 }, ${ cafeInfo.cafeAdd2 }</p>
</div>

<div id="busytime" class="mb-2">
<p>${ cafeInfo.busyTime }</p>
</div>

<div id="cafeComm" class="mb-2">
<p>${ cafeInfo.cafeComm }</p>
<!-- <p> 대충 카페 분위기에 대한 설명임...</p> -->
</div>

<div id="starPoint">
<table class="table table-borderless p-2 text-center">
<tr>
	<th>별점</th>
	<td>
    <c:forEach var="star" begin="1" end="${starPoint.avgRevStarPoint != null ? starPoint.avgRevStarPoint : 0}">
        ★
    </c:forEach>
    <c:if test="${starPoint.avgRevStarPoint != null}">
        ( <c:out value="${starPoint.avgRevStarPoint}" /> )
    </c:if>
</td>
</tr>
</table>
</div> <!-- id="starPoint" End -->

<div id="btn" class="d-flex justify-content-center align-self-end">
	<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
	
<%-- 	<c:if test="${cafe.status == 'Y'}"> --%>
	<button type="button" id="review" class="btn btn-secondary btn-lg m-2">리뷰쓰기</button>
<%-- 	</c:if> --%>
</div>
	
</div> <!-- explain p-2 End -->
</div> <!-- commCafe End -->

<div id="cafeMenu" class="btn-group w-100 nav" role="group" aria-label="Basic radio toggle button group">
	<input type="radio" class="btn-check" name="btnradio" id="cafeInfoBtn" autocomplete="off" checked>
	<label class="btn btn-outline-secondary" for="cafeInfoBtn">카페 상세 안내</label>
	        
	<input type="radio" class="btn-check" name="btnradio" id="cafeLocBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeLocBtn">카페 위치 정보</label>
		
	<input type="radio" class="btn-check" name="btnradio" id="cafeRevBtn" autocomplete="off">
	<label class="btn btn-outline-secondary" for="cafeRevBtn">카페 리뷰</label>
</div>

<div id="cafeInfo" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 상세 정보</p>
	</div>
	<div class="text-center">
		${ cafeInfo.cafeInfo }
<!-- 		<p>카페 안내문</p> -->
	</div>
</div>

<div id="cafeLoc" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 위치 정보</p>
	</div>

	
		<div class="map-container">
			<div id="map" style="width:800px; height:400px; margin: 0 auto;"></div>
			<p class="fw-bold fs-4 text-center">${ cafeInfo.cafeAdd1 }, ${ cafeInfo.cafeAdd2 }</p>
		</div>
</div>

<div id="cafeRev" class="shadow-sm p-3 mb-5 bg-body-tertiary rounded">
	<div>
		<p class="text-bg-secondary p-3 text-center mb-3 w-100">카페 리뷰</p>
	</div>
<!-- 	<div id="reviewList"></div> -->
	
	<table class="table" style="width: 100%">
	<c:forEach var="cafeRev" items="${ list }">
	<tr>
		<td class="text-center" style="width: 10%">${ cafeRev.userNick }</td>
		<td style="width: 60%">${ cafeRev.revContent }</td>
		<td class="text-center"  style="width: 15%">
		<fmt:formatDate value="${ cafeRev.revDate }" pattern="yyyy년 MM월 dd일" />
		</td>
		<td class="text-center"  style="width: 15%">
		    <c:forEach var="star" begin="1" end="${ cafeRev.revsp != null ? cafeRev.revsp : 0 }">
		        ★
		    </c:forEach>
		    <c:if test="${ cafeRev.revsp != null }">
		        (<c:out value="${ cafeRev.revsp }" />)
		    </c:if>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>

</div><!-- id="commCafe" class="clearfix" End -->

</div><!-- container End -->

<div id="btnGroup" class="text-center">
<button type="button" id="btnAll" class="btn btn-secondary">전체 카페</button>
<button type="button" id="btnBest" class="btn btn-secondary">베스트 카페</button>
<!-- 		<a class="btn btn-secondary" href="./all" role="button">전체 카페</a> -->
<!-- 		<a class="btn btn-secondary" href="./best" role="button">베스트 카페</a> -->
<!-- 	<a href="./all"><button id="btnAll" class="btn btn-secondary" type="button">전체 카페</button></a> -->
<!-- 	<a href="./best"><button id="btnBest" class="btn btn-secondary" type="button">베스트 카페</button></a> -->

<c:if test="${ userNick eq 'admin' }">
<button type="button" id="btnUpdate" class="btn btn-warning">수정</button>
<button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
</c:if>
</div>



<c:import url="../layout/footer.jsp"/>


