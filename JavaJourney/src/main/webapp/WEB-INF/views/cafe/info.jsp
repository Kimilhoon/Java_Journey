<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../layout/header.jsp"/>

<!-- <!-- jQuery --> -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script> -->

<!-- 카카오주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 카카오 지도 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3f3cd365ec1ac0081d50ddb6e680b49d&libraries=services"></script>

<script type="text/javascript">
$(function() {

	//지도 표시하기 항목
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


    
//------------------------------------------------------------------------------

	
		//데이터 객체 생성
		var cafeNo = "${cafeInfo.cafeNo }";
		var userNo = "${userNo }";
		var isWish = "${isWish }";

	$(document).ready(function() {
		// 공통 로그인 확인 함수
	    function checkLogin(callback) {
	        if (!userNo) { // 로그인하지 않은 경우
	            $("#loginModal .modal-body p").text("로그인 후 이용해 주세요.");
	            $('#loginModal').modal('show');
	        } else {
	            callback(); // 로그인한 경우 전달된 동작 실행
	        }
	    }
		
		// 찜 버튼 초기 상태 설정
		if (isWish === "true") {
			$("#wish").text("찜 ♥");  // 찜 상태일 때
		} else {
			$("#wish").text("찜 ♡");  // 찜하지 않은 상태일 때
		}
				
	 	// 로그인한 상태에서만 찜 버튼 클릭 이벤트 설정
		$("#wish").click(function() {
			checkLogin(function () {
				// 로그인한 경우 찜 상태 토글 처리
	// 			const currentText = $(this).text();
				const currentText = $("#wish").text();
	            const cafeNo = "${ cafeInfo.cafeNo }";
	            const userNo = "${ userNo }";
				
	// 			// 데이터 객체 생성
	// 			var cafeNo = "${ cafeInfo.cafeNo }";
	// 			var userNo = "${ userNo }";
				
				//버트 클릭 시 텍스트 변경(찜 상태 토글)
				if (currentText === "찜 ♡") {
	// 	            $(this).text("찜 ♥"); //찜 추가
		            $("#wish").text("찜 ♥"); // 찜 추가
		            sendWishData(cafeNo, userNo, 'add'); //데이터 추가 요청
		            
		         	// 찜 상태에 맞는 모달 내용 변경
					$("#disSubModal .modal-body p").text("해당 카페를 찜 했습니다");
	// 				console.log("모달 열기: 찜 상태 추가");
					$('#disSubModal').modal('show');
		            
		        } else {
	// 	            $(this).text("찜 ♡"); //찜 취소
		            $("#wish").text("찜 ♡"); // 찜 해제
		            sendWishData(cafeNo, userNo, 'remove'); //데이터 삭제 요청
		            
		         	// 찜 해제에 맞는 모달 내용 변경
					$("#subModal .modal-body p").text("해당 카페 찜을 해제합니다");
	// 				console.log("모달 열기: 찜 상태 취소");
					$('#subModal').modal('show');
		        }
			}); // checkLogin(function () end
		}); // $("#wish").click(function() end
		
		// 리뷰쓰기 버튼 클릭 이벤트
	    $("#review").click(function () {
	        checkLogin(function () {
	            // 로그인한 경우 리뷰 작성 페이지로 이동
	            location.href = "/comm/creview/write?cafeNo=${cafeInfo.cafeNo}";
	        });
	    });
		
		// 찜 데이터 서버로 전송
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
	}); // $(document).ready() End
		
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
	
// 		// 리뷰쓰기 버튼 클릭 이벤트 처리(모달) - 70번째 줄 document 쪽으로 포함시킴.
// 		$("#review").click(function() {
// 		    var userId = '${userId}'; // session에서 userId 가져오기
// 		    if (!userNo) { // 로그인하지 않은 경우
// 		        // 모달 표시
//    				$("#loginModal .modal-body p").text("로그인 후 이용해 주세요.");
// 		        $('#loginModal').modal('show');
// 		    } else {
// 		        location.href = "/comm/creview/write?cafeNo=${cafeInfo.cafeNo }"; // 로그인한 경우 리뷰 작성 페이지로 이동
// 		    }
// 		});
		
		
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

.modal-header{
	background: #6f4e37;
}

.modal-title{
	color: white;
}

</style>

<div class="container">

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./best">best</a></li>
		<li class="breadcrumb-item"><a href="./all">cafe</a></li>
		<li class="breadcrumb-item active" aria-current="page">info</li>
	</ol>
</nav>

<div class="text-center m-5">
<h1>카페 상세보기</h1>
</div>

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
<c:choose>
<c:when test="${cafeInfo.status == 'Y' }">
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
</c:when>
</c:choose>
</table>
</div> <!-- id="starPoint" End -->

<div id="btn" class="d-flex justify-content-center align-self-end">
	<c:choose>
		<c:when test="${cafeInfo.status == 'Y' }">
			<button type="button" id="wish" class="btn btn-secondary btn-lg m-2">찜 ♡</button>
			<button type="button" id="review" class="btn btn-secondary btn-lg m-2">리뷰쓰기</button>
		</c:when>
	</c:choose>
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
		<td style="width: 60%">
			<a href="../comm/creview/view?revNo=${ cafeRev.revNo }" 
			   class="link-dark link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover">
<%-- 			${ cafeRev.revContent } --%>
				<c:choose>
			        <c:when test="${fn:length(cafeRev.revContent) gt 26}">
						<c:out value="${fn:substring(cafeRev.revContent, 0, 25)}..."></c:out>
			        </c:when>
			        <c:otherwise>
						<c:out value="${fn:escapeXml(cafeRev.revContent)}"></c:out>
			        </c:otherwise>
				</c:choose>
			</a> 
		</td>
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
	<c:choose>
		<c:when test="${cafeInfo.status == 'Y' }">
			<button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
		</c:when>
		<c:when test="${cafeInfo.status == 'N' }">
			<button type="button" id="btnDelete" class="btn btn-danger">활성화</button>
		</c:when>
	</c:choose>
</c:if>
</div> <!-- container End -->

<!-- 로그인 필요 모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="loginModalLabel">로그인 알림</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='../member/login';">닫기</button>
<!--         <a href="../member/login" class="btn btn-primary"></a> -->
      </div>
    </div>
  </div>
</div>

<!-- 찜 추가 모달 -->
<div id="disSubModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="disSubModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            	<h1 class="modal-title fs-5" id="exampleModalLabel">찜 선택하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
<!--                     <span aria-hidden="true">&times;</span> -->
                </button>
<!--                 <h5 class="modal-title" id="disSubModalLabel">찜 추가</h5> -->
            </div>
            <div class="modal-body">
                <p></p> <!-- 여기서 모달 내용이 바뀐다 -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div> 

<!-- 찜 해제 모달 -->
<div id="subModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="subModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            	<h1 class="modal-title fs-5" id="exampleModalLabel">찜 선택하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
<!--                     <span aria-hidden="true">&times;</span> -->
                </button>
<!--                 <h5 class="modal-title" id="subModalLabel">찜 해제</h5> -->
            </div>
            <div class="modal-body">
                <p></p> <!-- 여기서 모달 내용이 바뀐다 -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>



<c:import url="../layout/footer.jsp"/>


