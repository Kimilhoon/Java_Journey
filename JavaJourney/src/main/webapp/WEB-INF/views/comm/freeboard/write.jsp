<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8fbebe3028eb8e4ca3a2c1633eec190&libraries=services"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote({
		  placeholder:"내용을 입력하세요."
	  });
	  
	});
	
$(function() {
	
	$("#write").click(function() {
		
// 		console.log($("#t").val());
// 		console.log($("input:radio[name=freeBoardCategory]:checked").val());
// 		console.log($("#summernote").val());
		$.ajax({
			url: "./write",
			type: "post",
			data: {
				"freeBoardTitle":$("#t").val(),
				"freeBoardCategory" :$("input:radio[name=freeBoardCategory]:checked").val(),
				"freeBoardContent":$("#summernote").val(),
				"freeBoardMapX":$("#x").text(),
				"freeBoardMapY":$("#y").text()
				
			},
			dataType: "text",
			success: function() {
				location.href = "./list";
			},
			error: function() {
				
			}
			
		});
	})

	$("#add_map").click(function() {
		
		$("#api_all_wrap").toggle();
		
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 키워드로 장소를 검색합니다
	

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = $('#keyword').val();
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
// 		console.log(places);
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
// 	    var geocoder = new kakao.maps.services.Geocoder();
//         geocoder.addressSearch(data.roadAddress, function(result, status) {
//             if (status === kakao.maps.services.Status.OK) {
//                 var lat = result[0].y;
//                 var lon = result[0].x;

//                 // 지도 중심 이동
//                 map.setCenter(moveLatLon);
//                 marker.setPosition(moveLatLon);
//             }
//         });
// 	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
// 	    mapOption = {
// 	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
// 	        level: 3 // 지도의 확대 레벨
// 	    };  
	
// 		// 지도를 생성합니다    
// 		var map = new kakao.maps.Map(mapContainer, mapOption); 
	    
	    
	    
	    kakao.maps.event.addListener(marker, 'click', function() {
	        var lat = position.getLat();
	        var lng = position.getLng();
// 	        $("#choose").text("마커의 좌표는 위도: " + lat + ", 경도: " + lng);
	        $("#x").text(lat);
	        $("#y").text(lng);
	        $("#choose").css("display","");
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            map.setCenter(moveLatLon);
            map.setLevel(3);
            marker.setPosition(moveLatLon);
	        
	    });
	    
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	$("#api_search").click(function() {
		searchPlaces();	
	})
	 
	//--------------------------------------------------------------
	
		
	})
	
	
})
</script>
<style>
.map_wrap, .map_wrap * {margin:0 auto;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0px;bottom:0;width:250px; height:500px; margin:0 auto;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
 #placesList .item .marker_1 {background-position: 0 -10px;} 
 #placesList .item .marker_2 {background-position: 0 -56px;} 
 #placesList .item .marker_3 {background-position: 0 -102px} 
 #placesList .item .marker_4 {background-position: 0 -148px;} 
 #placesList .item .marker_5 {background-position: 0 -194px;} 
 #placesList .item .marker_6 {background-position: 0 -240px;} 
 #placesList .item .marker_7 {background-position: 0 -286px;} 
 #placesList .item .marker_8 {background-position: 0 -332px;} 
 #placesList .item .marker_9 {background-position: 0 -378px;} 
 #placesList .item .marker_10 {background-position: 0 -423px;} 
 #placesList .item .marker_11 {background-position: 0 -470px;} 
 #placesList .item .marker_12 {background-position: 0 -516px;} 
 #placesList .item .marker_13 {background-position: 0 -562px;} 
 #placesList .item .marker_14 {background-position: 0 -608px;} 
 #placesList .item .marker_15 {background-position: 0 -654px;} 
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

#content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 50px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
}

.container{
	display: inline-block;
	width: -webkit-fill-available;
	margin: 0 auto;
}

.btn{
	background: transparent;
	border: 1px solid #6f4e37;
	color: black;
}

.btn:hover{
	background: #6f4e37;
	color: white;
}

</style>
<body>


<!-- <form action="./write" method="post" accept-charset="utf-8"> -->
<div id="content">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="./list">freeboard</a></li>
		<li class="breadcrumb-item active" aria-current="page">write</li>
	</ol>
</nav>
<div class="container">
<table  class="table table-bordered">
<tr>
	
	<td>
		카테고리
	<input type="radio" name="freeBoardCategory" value="bean" checked="checked" class="form-check-input">원두
	<input type="radio" name="freeBoardCategory" value="cafe" class="form-check-input">카페
	</td>
	<td>
	</td>
	<td>
	</td>
</tr>
<tr>
	
	<td colspan="3">
		<input type="text" name="freeBoardTitle" required="required" id="t" class="form-control" placeholder="제목을 입력하세요.">
	</td>
</tr>

<tr>
	
	<td colspan="3">
	<textarea id="summernote" rows="15" cols="50" name="freeBoardContent" required="required" class="form-control" ></textarea>
	</td>
</tr>

<tr>
	<td colspan="3">
		<button id="add_map" class="btn">지도추가</button>
	</td>
</tr>
<tr>
<td colspan="3">
<div id="api_all_wrap" style="display: none;">

<div class="map_wrap" >
    <div id="map" style="width:-webkit-fill-available;height: 500px; position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                    키워드 : <input type="text" value="" id="keyword" size="15"> 
                    <button id="api_search" class="btn"><small>검색하기</small></button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<div id="clickLatlng" ></div>

<div id="choose" style="display: none;">
선택결과<br>
좌표: 
<span id="x"></span>,<span id="y"></span>
</div>

</div>

</td>
</tr>
</table>

<div style="float: right;">
	<a href="./list"><button class="btn">목록</button></a>
	<button id="write" class="btn">작성</button>
</div>
<!-- </form> -->
</div><!-- container -->

</div><!-- content -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>